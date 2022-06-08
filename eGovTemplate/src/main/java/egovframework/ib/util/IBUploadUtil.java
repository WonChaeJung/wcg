package egovframework.ib.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;



public class IBUploadUtil {
	

	//================================================================================
	// ① [필수변경요소] 업로드 루트 경로 지정 - 실제로 파일이 업로드 되어 저장되는 경로
	//================================================================================
	// ※ 보안상의 이유로 UploadRootDir 가 webRoot 아래로 노출되는 것 보다는 오픈되지 않은 별도의 시스템 내부 폴더로 저장하는 것을 권장합니다.
	//================================================================================
	static final String UploadRootDir = "D:/file_uploaded/";
	static final String DownloadRootDir = "D:/file_uploaded/";	
	//================================================================================
	// ② [필수변경요소] 업로드 된 대용량 파일의 임시 경로 지정 - 가용 메모리를 초과하는 대용량 파일의 경우 임시 경로에 일시적으로 파일이 기록되었다가 자동 제거됨
	//================================================================================
	// 예) "D:/tempDir/";  "/usr/temp/";
	//================================================================================
	static final String TempDir = "D:/file_uploaded/temp";
	
	//================================================================================
	// ③ [옵션][기본값:16MB] 가용 메모리 용량 1MB 로 지정할 경우 1MB 이하의 파일들은 모두 메모리 내에서 직접 처리되며, 초과하는 파일들만 임시적으로 파일 처리됨
	//================================================================================
	// 메모리 사용량 설정 (클수록 디스크 기록 부담율이 적어짐 - 16 MB
	//================================================================================
	static final int AvailableMemory = 16 * 1024 * 1024 ;
	
	//================================================================================
	// ④ [옵션][기본값:2GB] 최대 파일 크기 제한 - UI 에서 통과된 파일 크기라고 하더라도, 여기서 최종적으로 다시 한번 걸러짐. 되도록 여유있게 잡아야 됨.
	//================================================================================
	// 파일별 최대 용량 제한 - 2 GB
	//================================================================================
	static final long MaxFileSize = 2*1024*1024*1024 ; //최대 용량 2.04 GB 를 초과할 수 없음.
	
	//================================================================================
	// ⑤ [옵션][기본값:utf-8] 업로드 엔코딩 - 업로드 과정에서 웹페이지의 UploadEncoding 값과 서버쪽 수신시 한글 엔코딩 방식이 무엇인지 설정한다. 둘다 반드시 일치해야 됨.
	//================================================================================
	// 브라우저에서 $(sel).IBUpload("UploadEncoding","utf-8") 로 설정했다면 utf-8 로 설정해야 한다.
	// 브라우저에서 $(sel).IBUpload("UploadEncoding","euc-kr") 로 설정했다면 euc-kr 로 설정해야 한다.
	// ( 한글 깨짐 주의 ★★★ ) 브라우저에서 설정한 값과 아래의 값은 반드시 일치해야 됨.
	//================================================================================
	static final String UploadEncoding = "utf-8";

	
	
	
	
	public HashMap IBUpload_DoUpload(HttpServletRequest request, HttpServletResponse response,String SubDir) throws Exception{
		return IBUpload_DoUpload(request, response,	SubDir, UploadRootDir, TempDir, AvailableMemory, MaxFileSize, UploadEncoding);
	}
	
	
	
	
	
	
	/*
	 * 실제 파일 저장 부분
	 */
	public HashMap IBUpload_DoUpload (HttpServletRequest request, HttpServletResponse response,
			String SubDir,String UploadRootDir, String TempDir, int AvailableMemory, long MaxFileSize, String UploadEncoding) throws Exception
	{
		
		HashMap ibuploadMap = new HashMap();
		
		File file;
		DiskFileItemFactory factory;
		ServletFileUpload upload;
		List<FileItem> fileItems = null;
		
		
		

		String RequestUrl = request.getRequestURL().toString();
		String ContentType = "" + request.getContentType();
		String CommandType = "";
		String FileID = ""; // 클릭해 줄 ID (IE 6 ~ IE 9)
		String DeleteFileList = ""; // 제거할 파일 목록(\n 엔터구분자 조합 문자열)
		String files = ""; // DB 에 저장할 최종 files 값  (예) {name: "관심과집중.mp4", size:"11417124", date:"20160101125959", url: "20160126_180337_82754651"},{name:"오렌지.jpg", size:"1075761", date:"20160101125959", url:"20160126_180801"},
		String files_id = ""; // DB 에 저장할 최종 files 값에 IBUpload Client 에서 부여한 파일 id 도 포함됨  (예) {id:"file1_1", name:"관심과집중.mp4", size:"11417124", date:"20160101125959", url:"20160126_180337_82754651"},{name:"오렌지.jpg", size:"1075761", date:"20160101125959", url: "20160126_180801"},
		boolean isUTF_force = false; // Win10 IE11 버그체크

		String FormNo = ""; // 업로드 요청해 온 폼 번호 (응답시 "formX_Y" 형태로 응답해야 한다. X 가 폼번호, Y 는 파일 순번)
		String TestValue = ""; // ExtendParam 한글 깨짐 실험
		String ParentID = "";
		request.setCharacterEncoding(UploadEncoding);

		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		response.setHeader("Access-Control-Allow-Origin", "*"); // CrossDomain 보안 설정 옵션

		//--------------------------------------------------------------------------------
		// [IE 6 ~ IE 9 파일 오픈 창 지원 & 파일 업로드 처리]
		//--------------------------------------------------------------------------------
		if (ContentType.indexOf("multipart/form-data") == -1) {

			//================================================================================
			// IE9 이하의 파일 업로드를 지원하려면 이 부분이 반드시 있어야 됨.
			//================================================================================
			if (request.getParameter("cmd") != null) {
				CommandType = request.getParameter("cmd");
			}
			// FileOpen 에 대한 처리 ( IE9 이하 )
			if (CommandType.equals("FileOpen")) {
				if (request.getParameter("id") != null) {
					FileID = request.getParameter("id");
				}
				ParentID = request.getParameter("parentid");
				java.io.PrintWriter out = response.getWriter();
				out.println("<html><head><script>try{ parent.document.getElementById('" + ParentID + "_IBUpload_Add"+ FileID + "').click(); }catch(e){}</script></head></html>");
				return null;
			}

			Enumeration<String> e = request.getParameterNames();

			while (e.hasMoreElements()) {
				String name = e.nextElement();
				String fieldValue = "";
				String[] data = request.getParameterValues(name);
				if (data != null) {
					for (String fieldName : data) {
						fieldValue = "";
						if (request.getParameter(fieldName) != null) {
							fieldValue = request.getParameter(fieldName);
						}
						ibuploadMap.put(fieldName, fieldValue);
					}
				}
			}
		} else {

			//저장할 디렉토리 생성
			if( (!new File(UploadRootDir).exists())&&(!new File(UploadRootDir).isDirectory())  ){
				File saveDir = new File(UploadRootDir);
				saveDir.mkdir();
			}
			if( (!new File(TempDir).exists())&&(!new File(TempDir).isDirectory())  ){
				File saveDir = new File(TempDir);
				saveDir.mkdir();
			}
			if( (!new File(UploadRootDir+SubDir).exists())&&(!new File(UploadRootDir+SubDir).isDirectory())  ){
				File saveDir = new File(UploadRootDir+SubDir);
				saveDir.mkdir();
			}



			factory = new DiskFileItemFactory();
			factory.setSizeThreshold(AvailableMemory);
			factory.setRepository(new File(TempDir));
			upload = new ServletFileUpload(factory);
			
			upload.setSizeMax(MaxFileSize);
			

			Map jsonServerResponse = new HashMap(); // 서버에서 응답하는 JSON
			List jsonFileList = new ArrayList(); //클라이언트로 전송해야 할 파일 저장 결과 목록
			List jsonFiles = new ArrayList(); // 서버쪽에서 수신하여 정리한 파일객체들의 목록
			List jsonFilesID = new ArrayList(); // 서버쪽에서 수신하여 정리한 파일객체들의 목록 ( Client 에서 제공한 ID 포함 )

			request.setCharacterEncoding(UploadEncoding);
			fileItems = upload.parseRequest(request);
			//--------------------------------------------------------------------------------
			// Win10 IE11 오류 대응
			//--------------------------------------------------------------------------------
			for (FileItem item : fileItems) {
				if (item.isFormField()) {
					String fieldName = item.getFieldName();
					String fieldValue = item.getString(UploadEncoding);

					if ("_ibupload_ie11_han_check".equals(item.getFieldName())) {

						// Windows10,IE11,10240 에서는 무조건 utf-8 로 전송되는 버그가 있다.
						// Windows8 IE11 은 잘됨
						// 갑자기 패치될 가능성 있음..
						// 10547 해결되었다는 소문이 있으나 10586 에서 안됨.
						// UTF-8 로 보내는 IE11 의 버그라고 한다면 여기서 대응처리
						if ("ea".equals(String.format("%02x", item.getString(UploadEncoding).getBytes()[0]))) {
							UploadEncoding = "utf-8";
							isUTF_force = true;
						}
					} else if ("__formNo".equals(fieldName)) {
						FormNo = fieldValue;
					} else if ("__delList".equals(fieldName)) {
						DeleteFileList = fieldValue; // 서버에서 삭제해야할 파일들
					} else if ("__files".equals(fieldName)) {
						files = fieldValue; // IBUpload 가 갖고 있었던 최근 files 목록
					} else {
						fieldValue = URLDecoder.decode((String) fieldValue, UploadEncoding);
						//====================================================================================================
						// ♣1 : client 에서 보낸 파라메터 값들에 대한 처리 로직
						//====================================================================================================
						// client 의 extendParamUpload 에서 보낸 parameter 들의 처리
						// client 쪽에서 아래와 같이 dataA 라는 파라메터와 dataB 라는 파라메터를 업무상 값을 정의하여 보낸 경우 그 값들을 얻을 수 있습니다.
						//
						// 예) $("#myUpload").extendParamUpload("dataA=1&dataB=2");
						//====================================================================================================
						ibuploadMap.put(fieldName, fieldValue);
					}
				}
			} // end of form data




			//--------------------------------------------------------------------------------
			// 파일 업로드 처리 ( type = file 인 경우의 처리 )
			//--------------------------------------------------------------------------------
			// 저장되는 파일 위치 : UploadRootDir / 업로드 파일명
			//--------------------------------------------------------------------------------
			String createFilePath = "";
			String newFileSavePath = "";

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			Random rand = new Random();
			String TodayString = sdf.format(Calendar.getInstance().getTime());

			int UploadCount = 0;
			String oldFieldName = "";

			boolean isFirstComma = true;
			for (FileItem item : fileItems) {
				if (!item.isFormField()) {
					String fieldName = item.getFieldName();
					String fileName = ("" + item.getName()).trim();

					// WIN10-IE11 의 UTF8 한글깨짐에 의한 파일깨짐방지
					if (isUTF_force) {
						fileName = new String(fileName.getBytes("EUC-KR"), "iso-8859-1");
					}
					if (!oldFieldName.equals(fieldName)) {
						UploadCount = 0;
					}
					oldFieldName = item.getFieldName();

					//====================================================================================================
					// ♣2 : 보안상 위험한 업로드 확장자 파일의 제한 처리
					//====================================================================================================
					// 보안상 IBUpload 의 limitFileExt 속성을 참고하여 아래와 동일한 파일 목록들을 차단하는 것을 권장한다.
					//====================================================================================================
					boolean isExecFile = true;
					if (" html htm php php2 php3 php4 php5 phtml pwml inc asp aspx ascx jsp cfm cfc pl bat exe com dll vbs js reg cgi htaccess asis sh shtml shtm phtm "
							.indexOf(" " + fileName.substring(fileName.lastIndexOf(".") + 1) + " ") == -1) {
						isExecFile = false;
					}

					boolean isUploadCancel = false; // 첨부중에 업로드 취소한 항목들
					if ((DeleteFileList + "\r\n").indexOf(fieldName + FormNo + "_" + (UploadCount) + "\r\n") > -1) {
						isUploadCancel = true;
					}

					if (!"".equals(fileName)) {

						//====================================================================================================
						// ♣3 : 수신 받은 파일들을 한 폴더내에서 고유한 파일명으로 바꿔주고 client 에 그 결과를 응답한다.
						//====================================================================================================
						// 기본적으로 수신받은 파일명은 아래와 같은 형식으로 저장되고 있습니다.
						// 업무상 파일관리 정책에 따라 바꾸셔도 됩니다.
						//
						// 1. 기존적으로 현재날짜와 시간으로 저장됨.
						// 2. 날짜와 시간까지 동일하게 겹친 파일에 한하여 중복시고유번호를 붙임
						//
						// 파일명 형식 : yyyyMMdd_HHmmss_##### (##### 은 중복시 랜덤 고유번호)
						//
						//====================================================================================================
						if (isExecFile == true) {
							newFileSavePath = "_REJECT_";
						} else {
							newFileSavePath = TodayString;
							createFilePath = UploadRootDir+SubDir+ TodayString;

							if (new File(createFilePath).isFile()) { // 중복체크
								for (int i = 1; i < 99999; i++) {
									newFileSavePath = TodayString + "_"
											+ String.format("%08d", rand.nextInt(100000000));
									createFilePath = UploadRootDir+SubDir+ newFileSavePath;
									if (!new File(createFilePath).isFile())
										break;
								}
							}

							if (isUploadCancel == false) {
								file = new File(createFilePath);
								item.write(file);
							}
						}

						if (isUploadCancel == false) {
							String item_getName = "";
							item_getName = item.getName();
							if (item_getName.indexOf("\\") > -1) {
								item_getName = item_getName.substring(item_getName.lastIndexOf("\\") + 1,
										item_getName.length());
							}

							//--------------------------------------------------------------------------------
							// Client 로 응답할 JSON 작성
							//--------------------------------------------------------------------------------
							Map jsonFile = new HashMap();
//								jsonFile.put(fieldName + FormNo + "_" + UploadCount, newFileSavePath);
							jsonFile.put("id",fieldName);
							jsonFile.put("url", SubDir+ newFileSavePath);
							jsonFile.put("size", item.getSize());
							jsonFileList.add(jsonFile);

							//--------------------------------------------------------------------------------
							// ibuploadMap.get("files") 속성을 위한 준비
							//--------------------------------------------------------------------------------
							Map jsonFile1 = new HashMap();
							jsonFile1.put("name", item_getName);
							jsonFile1.put("size", item.getSize());
							jsonFile1.put("date", TodayString);
							jsonFile1.put("url", SubDir+ newFileSavePath);
							jsonFiles.add(jsonFile1);

							//--------------------------------------------------------------------------------
							// ibuploadMap.get("files_id") 속성을 위한 준비
							//--------------------------------------------------------------------------------
							Map jsonFile2 = new HashMap();
//								jsonFile2.put("id", item.getFieldName() + FormNo + "_" + UploadCount);
							jsonFile2.put("id", item.getFieldName());
							jsonFile2.put("name", item_getName);
							jsonFile2.put("size", item.getSize());
							jsonFile2.put("date", TodayString);
							jsonFile2.put("url", SubDir+ newFileSavePath);
							jsonFilesID.add(jsonFile2);

							isFirstComma = false;
						}
						UploadCount++;
					} // filename is not null
				} // end of if form file
			} // end of for

			//--------------------------------------------------------------------------------
			// 파일 삭제 처리
			//--------------------------------------------------------------------------------
			List<String> deleteItem = Arrays.asList(DeleteFileList.split("\n"));
			ibuploadMap.put("DeleteFileList", deleteItem);
			for (String item : deleteItem) {
				item = item.trim();
				if (!"".equals(item)) {
					System.out.println("delete:"+IBUpload_RealFilePath(UploadRootDir, item));
					File delFile = new File(IBUpload_RealFilePath(UploadRootDir, item));
					if (delFile.isFile()) { // 존재할 경우 제거
						delFile.delete();
					}
				}
			}

			//====================================================================================================
			// files 결과문을 최종 준비한다.
			//====================================================================================================
			// ㆍ files 의 값 (JSON string): [{"name":"공지사항.hwp", "size":"13259", "date":"20160401161015", "url":"20160401105"},{"name":"사진.jpg", "size":"1577166", "date":"20160410161335", "url":"20160410161335"}]
			// ㆍ files_id 의 값(List<Map>) : [{"id":"file0_0", "name": "공지사항.hwp", "size":"13259", "date": "20160401161015", "url": "20160401105"},{"id":"file0_1", "name":"사진.jpg", "size":"1577166", "date":"20160410161335", "url":"20160410161335"}]
			//====================================================================================================
			ibuploadMap.put("files", org.json.simple.JSONValue.toJSONString(jsonFiles));
			ibuploadMap.put("files_id", jsonFilesID);


			
			//======================================================================================================
			// 디비에 저장할 json string을 만든다.
			//======================================================================================================
			List db_save_data = new ArrayList();
			//새로 추가된 파일 정보
			db_save_data.addAll(jsonFiles);
			
			//기존 파일 정보
			if(!"".equals(files)){
				JSONParser parser = new JSONParser();
				JSONArray existFiles = (JSONArray)parser.parse(files);
				db_save_data.addAll(existFiles);
			}
			ibuploadMap.put("db_save_data", org.json.simple.JSONValue.toJSONString(db_save_data) );

			
			//====================================================================================================
			// JSON 결과문을 IBUpload Client 로 응답한다.
			//====================================================================================================
			jsonServerResponse.put("ibupload", jsonFileList);
			ibuploadMap.put("resultJSON",jsonServerResponse);  //최종 client로 전달될 메세지


		}
		

		
		return ibuploadMap;
	}


	
	
	
	//====================================================================================================
	// Client 에서 받은 files 속성값 형태를 파일저장 후, Server 의 files 속성값 형태로 리턴한다.
	//====================================================================================================
	// Client 의 files 속성값 : {name : "공지사항.hwp", id : "file0_0"}   (string)
	// Server 의 files 속성값 : [{name : "공지사항.hwp", id : "fiel0_0", size : "12000", date : "19851231125959", url : "19851231125959"},{...}] (list)
	//====================================================================================================
	String IBUpload_Update_Files(Map ibuploadMap, String client_filedata) {

		List rtnArr = new ArrayList();
		if("".equals(client_filedata)){return "";}
		if(ibuploadMap.get("files_id")!=null&&((List)ibuploadMap.get("files_id")).size()>0){
			//업로드 상의 전체 파일 정보
		    List<Map> files_id = (List<Map>)ibuploadMap.get("files_id");
		    List<Map> li;
			//화면에서 넘어온 파일 ID (단일인지 복수개 인지 확인)
		    if(client_filedata.startsWith("[")){
		    	li = (List<Map>)org.json.simple.JSONValue.parse(client_filedata);
		    }else{
		    	li = (List<Map>)org.json.simple.JSONValue.parse("["+client_filedata+"]");
		    }
			for(int ar=0;ar<li.size();ar++){
				Map jo = li.get(ar);
				if(jo.get("id")!=null){
					//새로 추가된 파일
					String id = jo.get("id")+"";
					for(int i=0;i<files_id.size();i++){
						Map tMap = files_id.get(i);
						if(id.equals((String)tMap.get("id"))){
							tMap.remove("id");
							rtnArr.add(tMap);
						}
					}
				}else{
					//기존 파일
					rtnArr.add(jo);
				}
			}
		}
	    return org.json.simple.JSONValue.toJSONString(rtnArr);
	}

	//====================================================================================================
	// ♣5 : client 에서 요청하는 URL KEY 값을 실제로 저장된 디스크의 물리적 전체경로를 리턴함
	//====================================================================================================
	// ㆍ입력값(UrlKey)의 예 : 20161231_235959_000001
	// ㆍ리턴값의 예 : D:/file_uploaded/20161231_235959_000001
	//
	// ※ 업로드 폴더에 실제로 고유 파일을 저장하는 경우에는 변경할 필요가 없습니다.
	// ※ DB 에 저장하거나 별도의 디스크에 저장되어 관리되는 경우 실제 저장된 파일 경로를 리턴해 주시면 됩니다.
	//
	//====================================================================================================
	String IBUpload_RealFilePath(String UploadRootDir, String UrlKey) {
		return UploadRootDir + UrlKey;
	}
	
	
	public void DownloadFiles(HttpServletRequest request,HttpServletResponse response) throws Exception{
		DownloadFiles( request, response,  DownloadRootDir);
	}
	public void DownloadFiles(HttpServletRequest request,HttpServletResponse response, String DownloadRootDir) throws IllegalArgumentException,NullPointerException,IOException,FileNotFoundException,Exception{
		//====================================================================================================
		// ③ [추후 추가 개발 요소] IBUpload 설치가 성공적으로 완료된 이후에 현업 업무 로직을 추가할 수 있습니다.
		//====================================================================================================
		// ♣ 가 표시된 부분은 개발자가 직접 현업의 파일관리 정책과 DB 처리 등에 따라 소스 코드를 수정 / 변경 / 응용해야 할 부분입니다.
		//
		// ♣1 : GetRealFilePathFromURLKey 함수의 수정
		//	※ 업로드 폴더에서 직접 다운로드 할 경우에는 변경할 필요가 없습니다. (☞ 소스코드 맨 아래 함수 참조.)
		//
		//	- DB 에 파일을 저장하는 경우 : DB 로부터 파일을 얻어서 임시 폴더에 저장하고 해당 파일의 전체 경로를 리턴해주면 됩니다.
		//	- 별도의 디스크 경로로 관리하는 경우 : 요청된 UrlKey 에 해당되는 실제 존재하는 파일 경로를 리턴해주면 됩니다.
		//====================================================================================================

		//====================================================================================================
		// 아래의 코드는 수정하지 마십시오.
		//====================================================================================================
		File file;

		String ContentType = "" + request.getContentType();
		String DownloadFiles = ""; // 다운로드 할 파일들
		String ParentID = "";
		String FileDownloadNo = "";
		//--------------------------------------------------------------------------------
		// [요청자 검증]
		//--------------------------------------------------------------------------------
		if (ContentType.indexOf("multipart/form-data") == -1) {

			request.setCharacterEncoding("utf-8");

			String DownloadFileName = "";
			String DownloadFileURL = "";
			String UserAgent = request.getHeader("User-Agent");
			String DownloadToken = "";

			if (request.getParameter("token") != null) {
				DownloadToken = request.getParameter("token");
			}
			if (request.getParameter("file") != null) {
				DownloadFiles = "" + request.getParameter("file");
			}
			ParentID = request.getParameter("parentid");
			FileDownloadNo = request.getParameter("filedownloadno");

			if (request.getParameter(ParentID + "_downloadFileName" + FileDownloadNo) != null) {
				DownloadFileName = "" + request.getParameter(ParentID + "_downloadFileName" + FileDownloadNo)
						+ ".zip";
			} else {
				DownloadFileName = "download.zip";
			}

			response.setHeader("Content-Transfer-Encoding", "binary;");
			response.setHeader("Pragma", "no-cache;");
			response.setHeader("Expires", "-1;");

			response.setContentType("application/octet-stream");

			Cookie cookie = new Cookie("token", DownloadToken);
			cookie.setPath("/");
			response.addCookie(cookie);

			String[] items = DownloadFiles.split("\n");
			if (items.length <= 1) {
				DownloadFileURL = DownloadFiles.substring(0, DownloadFiles.indexOf(" "));
				DownloadFileName = DownloadFiles.substring(DownloadFiles.indexOf(" ") + 1, DownloadFiles.length());
				DownloadFileName = DownloadFileName.trim();
				if(!new File(DownloadRootDir+ DownloadFileURL).exists()){
					System.out.println(DownloadFileName+":[실제 파일] "+DownloadFileURL+"\n 파일이 존재하지 않습니다.");
					throw new FileNotFoundException(DownloadFileName+"\n파일이 존재하지 않습니다.");
				}
			}

			List<String> downItem = Arrays.asList(items);

			int bytesRead;
			byte bytes[] = new byte[8192];

			if (items.length == 1) {
				response.setContentType("application/octet-stream");

				String item = DownloadFileURL;
				item = item.trim();
				item = item.replaceFirst("(http|https|ftp)://", "");
//				item = item.substring(item.indexOf("/") + 1, item.length());

				try {

					if (new File(GetRealFilePathFromURLKey(DownloadRootDir, item)).isFile()) {
						if (UserAgent.contains("MSIE") || UserAgent.contains("Trident")
								|| UserAgent.contains("Edge")) {
							DownloadFileName = URLEncoder.encode(DownloadFileName, "utf-8").replaceAll("\\+",
									"%20");
							response.setHeader("Content-Disposition",
									"attachment;filename=" + DownloadFileName + ";");
						} else {
							DownloadFileName = new String(DownloadFileName.getBytes("utf-8"), "ISO-8859-1");
							response.setHeader("Content-Disposition",
									"attachment;filename=\"" + DownloadFileName + "\"");
						}

						FileInputStream fis = new FileInputStream(DownloadRootDir + item);
						BufferedInputStream bis = new BufferedInputStream(fis);
						ServletOutputStream outFile1 = response.getOutputStream();

						while ((bytesRead = fis.read(bytes, 0, 8192)) != -1) {
							outFile1.write(bytes, 0, bytesRead);
						}
						bis.close();
						fis.close();
						outFile1.flush();
						outFile1.close();
					} 
			
					
				} catch (IllegalArgumentException ex){
					throw new IllegalArgumentException("DownloadFiles:"+ex.getMessage());
				} catch (NullPointerException ex){
					throw new NullPointerException("DownloadFiles:"+ex.getMessage());
				} catch (FileNotFoundException ex){
					throw new FileNotFoundException("DownloadFiles:"+ex.getMessage());
				} catch (IOException ex){
					throw new IOException("DownloadFiles:"+ex.getMessage());
				}

			} else if (items.length > 1) {
				response.setContentType("application/zip");

				try {

					if (UserAgent.contains("MSIE") || UserAgent.contains("Trident") || UserAgent.contains("Edge")) {
						DownloadFileName = URLEncoder.encode(DownloadFileName, "utf-8").replaceAll("\\+", "%20");
						response.setHeader("Content-Disposition", "attachment;filename=" + DownloadFileName + ";");
					} else {
						DownloadFileName = new String(DownloadFileName.getBytes("utf-8"), "ISO-8859-1");
						response.setHeader("Content-Disposition",
								"attachment;filename=\"" + DownloadFileName + "\"");
					}

					ServletOutputStream sos = response.getOutputStream();
					ZipOutputStream zos = new ZipOutputStream(sos);
					zos.setEncoding("euc-kr");
					for (String item : downItem) {
						item = item.trim();
						item = item.replaceFirst("(http|https|ftp)://", "");
//						item = item.substring(item.indexOf("/") + 1, item.length());

						DownloadFileURL = item.substring(0, item.indexOf(" "));
						DownloadFileName = item.substring(item.indexOf(" ") + 1, item.length());
						if(!new File(DownloadRootDir + DownloadFileURL).exists()){
							System.out.println(DownloadFileName+":[실제 파일] "+DownloadFileURL+"\n 파일이 존재하지 않습니다.");
							throw new FileNotFoundException(DownloadFileName+"\n파일이 존재하지 않습니다.");
						}
						//====================================================================================================
						// 실제 다운로드 받을 파일이 존재하는 경우에만 압축 파일에 넣어준다.
						//====================================================================================================
						if (new File(GetRealFilePathFromURLKey(DownloadRootDir, DownloadFileURL)).isFile()) {
							
							FileInputStream fis = new FileInputStream(DownloadRootDir + DownloadFileURL);
							BufferedInputStream bis = new BufferedInputStream(fis);

							ZipEntry zipEntry = new ZipEntry(DownloadFileName);
							zos.putNextEntry(zipEntry);
							while ((bytesRead = bis.read(bytes)) != -1) {
								zos.write(bytes, 0, bytesRead);
							}
							bis.close();
							fis.close();
							zos.flush();
							zos.closeEntry();
						}
					}

					zos.close();
					sos.close();
				} catch (IllegalArgumentException ex){
					throw new IllegalArgumentException("DownloadFiles:"+ex.getMessage());
				} catch (NullPointerException ex){
					throw new NullPointerException("DownloadFiles:"+ex.getMessage());
				} catch (FileNotFoundException ex){
					throw new FileNotFoundException("DownloadFiles:"+ex.getMessage());
				} catch (IOException ex){
					throw new IOException("DownloadFiles:"+ex.getMessage());
				} catch (Exception ex) {
					ex.printStackTrace();
					throw ex;
				}
			}
		}
	}
	//====================================================================================================
	// ♣1 : client 에서 요청하는 URL KEY 값을 실제로 저장된 디스크의 물리적 전체경로를 리턴함
	//====================================================================================================
	// ㆍ입력값(UrlKey)의 예 : 20161231_235959_000001
	// ㆍ리턴값의 예 : D:/file_uploaded/20161231_235959_000001
	//
	// ※ 업로드 폴더에 실제로 고유 파일을 저장하는 경우에는 변경할 필요가 없습니다.
	// ※ DB 에 저장하거나 별도의 디스크에 저장되어 관리되는 경우 실제 저장된 파일 경로를 리턴해 주시면 됩니다.
	//
	//====================================================================================================
	String GetRealFilePathFromURLKey(String UploadRootDir, String UrlKey) {
		return UploadRootDir + UrlKey;
	}

}

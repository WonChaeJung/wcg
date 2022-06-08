package egovframework.ibsheetTemplate.web;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.common.service.CommonService;
import egovframework.ib.util.IBSheetUtil;
import egovframework.ib.util.IBUploadUtil;
import egovframework.ibsheetTemplate.service.UploadService;

/**
 * @Class Name : UploadController.java
 * @Description : UploadController  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2017.03.06  shkim         최초생성
 *
 * @author ibleaders 기술지원팀
 * @since 2017. 03.06
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
@Controller
public class UploadController {

	private static final Logger LOGGER = LoggerFactory.getLogger(UploadController.class);
	
	@Resource(name="commonService")
	protected CommonService commonServ;
	
	
	@Resource(name="uploadService")
	protected UploadService tservice;
	
	

	
	@RequestMapping(value = "upload/board/boardlist.do")
	public ModelAndView showBoardList2(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/upload/board/basicBoard");
		return mv;
	}
	
	@RequestMapping(value = "upload/board/uploadInSheet.do")
	public ModelAndView showBoardList3(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/upload/board/uploadInSheet");
		return mv;
	}
	
	
	@RequestMapping(value = "upload/board/boardcontents.do")
	public ModelAndView showBoardContents(ModelMap model,@RequestParam Map<String,Object> map) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/upload/board/contents");
		mv.addAllObjects(map);
		return mv;
	}
	@RequestMapping(value = "upload/board/uploadPopup.do")
	public ModelAndView showUploadPopup(ModelMap model,@RequestParam Map<String,Object> map) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/upload/board/uploadPopup");
		mv.addAllObjects(map);
		return mv;
	}
	
	
	
	
	@RequestMapping(value = "upload/basic/bbs_search.do")
	public ModelAndView selectBoard(@RequestParam Map<String,Object> map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
		//데이터 조회
		List data = tservice.boardSelect(map);
		//JSON 
        ibUtil.setCodeMessage("mySheet","정상적으로 처리되었습니다."); 
        ibUtil.setData("mySheet",data);  //<--시트 데이터
        
        ModelAndView model = new ModelAndView("jsonView",ibUtil.getSearchJSON());
        //JSON 반환 
        return model; 
	}
	

	

	 private String getToday() {
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        format.setTimeZone(TimeZone.getTimeZone("UTC"));
        return format.format(Calendar.getInstance().getTime());
    }
	
	@RequestMapping(value = "upload/basic/bbs_save.do")
	public ModelAndView saveBoard(@RequestParam Map<String,String> map,HttpServletRequest request,HttpServletResponse response,HttpSession hs) throws Exception  {
		
		// 게시판 관련 변수들 준비
		String bbs_no = "";
		//업로드 후 넘어온 문자 확인
		IBUploadUtil iu = new IBUploadUtil();
		IBSheetUtil ibu = new IBSheetUtil();
		Calendar c = Calendar.getInstance();
		
		String today = getToday();
		
		PreparedStatement pstmt = null;
			
		HashMap ibuploadMap = iu.IBUpload_DoUpload(request, response,today+"/");
		
		ibu.mapPrint(ibuploadMap);
		
		String msg = tservice.saveBoard(ibuploadMap);

		Map resultMap = (Map)ibuploadMap.get("resultJSON"); 
		
		//etcdata에 내 맘대로 넣는다.
		Map etcData = new HashMap();
		etcData.put("code","1");
		etcData.put("msg", msg);
		resultMap.put("etcdata",etcData);
		
		ModelAndView model = new ModelAndView("jsonView",resultMap);;	
		return model;
	}
//	
//	
//	@RequestMapping(value = "upload/basic/bbs_search2.do")
//	public @ResponseBody ModelMap selectBoard2(@RequestParam Map<String,Object> map) throws Exception {
//		IBSheetUtil ibUtil = new IBSheetUtil();
//		//데이터 조회
//		List data = tservice.board2Select(map);
//		ibUtil.setData(data);
//        return ibUtil.getSearchJSON(); 
//	}
//	
//	@RequestMapping(value = "upload/basic/bbs_save2.do")
//	public void saveBoard2(@RequestParam Map<String,Object> map,HttpServletRequest request,HttpServletResponse response)  {
//		// 게시판 관련 변수들 준비
//		String bbs_no = "";
//
//		IBUploadUtil iu = new IBUploadUtil();
//		IBSheetUtil ibUtil = new IBSheetUtil();
//		try{
//			HashMap ibuploadMap = iu.IBUpload_DoUpload(request, response, UploadRootDir, TempDir, AvailableMemory, MaxFileSize, UploadEncoding, isServerResponse);
//			
//			
//			ibUtil.mapPrint(ibuploadMap);
//			
//			if(ibuploadMap!=null){
//				//ibsheet에서 넘어온 데이터를 추출한다.
//				List<Map> mySheet = ibUtil.getSheetData("mySheet",ibuploadMap);
//				
//				String msg = "";
//				for(int i=0;i<mySheet.size();i++){
//					Map<String,Object> record = mySheet.get(i);
//					
//					String fileInfo = (String)record.get("filedata");
//					
//					System.out.println(i+"=>"+record.get("status")+":"+fileInfo);
//					
//					Map oneFileInfo = iu.IBUpload_Update_Files(ibuploadMap,fileInfo);
//					
//					//IBSheet 상태 컬럼의 값에 따른 작업 설정
//					switch((record.get("status")+"").charAt(0)){
//					case 'I':
//						if(oneFileInfo!=null){
//							record.put("ThisFileName",oneFileInfo.get("name"));
//							record.put("FileInfo", JSONValue.toJSONString(oneFileInfo));
//						}else{
//							record.put("ThisFileName","");
//							record.put("FileInfo", "");
//						}
//						tservice.board2Insert(record);
//						msg = "저장 되었습니다.";
//						
//						break;
//					case 'U':
//						if(oneFileInfo!=null){
//							record.put("ThisFileName",oneFileInfo.get("name"));
//							record.put("FileInfo", JSONValue.toJSONString(oneFileInfo));
//						}else{
//							record.put("ThisFileName","");
//							record.put("FileInfo", "");
//						}
//						tservice.board2Update(record);
//						msg = "수정 되었습니다.";
//						break;
//					case 'D':
//						tservice.board2Delete(record);
//						msg = "삭제 되었습니다.";
//						break;
//					}
//				}
//				
//				
//				//실제 화면에 리턴할 데이터
//				Map resultMap = (Map)ibuploadMap.get("ResultJSON"); 
//				
//				response.setContentType("text/html;charset=utf-8");
//				PrintWriter out = response.getWriter();
//				//etcdata를 통해 부수적인 내용을 좀더 추가한다.
//				Map etcData = new HashMap();
//				etcData.put("msg",msg);
//				resultMap.put("etcdata",etcData);
//				out.println( JSONValue.toJSONString(resultMap) );	
//			}
//		}catch(Exception e){
//			try{
//				e.printStackTrace();
//				response.setCharacterEncoding("utf-8");
//				PrintWriter out =  response.getWriter();
//				out.print(e.getMessage());
//				out.close();
//			}catch(Exception ex){}
//		}
//	}
	
}

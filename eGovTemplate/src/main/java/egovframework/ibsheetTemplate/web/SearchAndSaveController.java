package egovframework.ibsheetTemplate.web;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//import com.ibleaders.ibsheet.IBSheetDown;
//import com.ibleaders.ibsheet.IBSheetDown;
//import com.ibleaders.ibsheet7.ibsheet.excel.DirectDown2Excel;
//import com.ibleaders.ibsheet7.util.DirectDown2ExcelCallbackInterface;
import egovframework.common.service.CommonService;
import egovframework.ib.util.IBSheetUtil;
import egovframework.ibsheetTemplate.service.IBSheetService;




/**
 * @Class Name : IBSheetTempController.java
 * @Description : IBSheetTempController  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2014.08.06  shkim         최초생성
 *
 * @author ibleaders 기술지원팀
 * @since 2014. 08.06
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
@Controller
public class SearchAndSaveController {

private static final Logger LOGGER = LoggerFactory.getLogger(SearchAndSaveController.class);	
	
@Resource(name="commonService")
protected CommonService commonServ;


@Resource(name="ibsheetService")
protected IBSheetService tservice;

@Resource(name="txManager")
PlatformTransactionManager txManager;





	@RequestMapping(value = "sheet/SearchSave/basic.do")
	public ModelAndView showBasic(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/sheet/SearchAndSave/basic");
		
		//콤보 내용 넣기.
		Map param = new HashMap();
		Map mp = commonServ.selectCommonCode(param);
		mv.addObject("DNAME", mp.get("text"));
		mv.addObject("DEPTNO", mp.get("code"));
		return mv;
	}
	@RequestMapping(value = "sheet/SearchSave/sheet2Form.do")
	public ModelAndView showSheet2Form(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/sheet/SearchAndSave/sheet2Form");
		
		//콤보 내용 넣기.
		Map param = new HashMap();
		Map mp = commonServ.selectCommonCode(param);
		Map select = commonServ.selectCommonCode(param,"dname","deptno","select");
		mv.addObject("DNAME", mp.get("text"));
		mv.addObject("DEPTNO", mp.get("code"));
		mv.addObject("DEPT",select.get("select"));
		return mv;
	}
	
	
	@RequestMapping(value = "sheet/SearchSave/largeScroll.do")
	public ModelAndView showPageScroll(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/sheet/SearchAndSave/largeScroll");
		return mv;
	}
	
	
	@RequestMapping(value = "/common/IBSheet7/sheet/jsp/LoadExcel.do")
	public ModelAndView loadexcel(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/common/jsp/LoadExcel");
		return mv;
	}
	
	
	
	
	
	@RequestMapping(value = "sheet/SearchSave/largeIndex.do")
	public ModelAndView showPageIndex(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/sheet/SearchAndSave/largeIndex");
		return mv;
	}
	
	@RequestMapping(value = "sheet/SearchSave/pageIndex.do")
	public ModelAndView showPageIndex2(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/sheet/SearchAndSave/pageIndex");
		return mv;
	}
	
	@RequestMapping(value = "sheet/SearchSave/largeScrollAppend.do")
	public ModelAndView showPageScrollAppend(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/sheet/SearchAndSave/largeScrollAppend");
		return mv;
	}
	
	
	@RequestMapping(value = "sheet/SearchSave/masterDetail.do")
	public ModelAndView showMasterDeail(ModelMap model) throws Exception {
		
		ModelAndView mv = new ModelAndView("/ibsheet_template/sheet/SearchAndSave/masterdetail");
		//콤보 내용 넣기.
		Map param = new HashMap();
		Map mp = commonServ.selectCommonCode(param);
		mv.addObject("DNAME", mp.get("text"));
		mv.addObject("DEPTNO", mp.get("code"));
		return mv;
	}
	

	
	@RequestMapping(value = "sheet/SearchSave/double.do")
	public ModelAndView showDouble(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/sheet/SearchAndSave/double");
		//콤보 내용 넣기.
		Map param = new HashMap();
		Map mp = commonServ.selectCommonCode(param);
		mv.addObject("DNAME", mp.get("text"));
		mv.addObject("DEPTNO", mp.get("code"));
		return mv;
	}
	
	
	@RequestMapping(value = "sheet/SearchSave/empSearch.do")
	public ModelAndView selectEmp(@RequestParam Map<String,String> map,HttpSession hs) throws Exception {
		
		IBSheetUtil ibUtil = new IBSheetUtil();
		//데이터 조회
		List data = tservice.empSelect(map);
	
        //JSON 
        ibUtil.setCodeMessage("SHEETDATA1","정상적으로 처리되었습니다."); 
        ibUtil.setData("SHEETDATA1",data);  //<--시트 데이터
        ibUtil.setEtc("SHEETDATA1","Name", "Park Han-kyu");
        ibUtil.setEtc("SHEETDATA1","Age", "51");
//        Map mp = ibUtil.getSearchJSON();
        ModelAndView model = new ModelAndView("jsonView",ibUtil.getSearchJSON());
        
        //JSON 반환 
        return model; 
	}
	
	@RequestMapping(value = "sheet/SearchSave/deptSearch.do")
	public ModelAndView selectDept(@RequestParam Map<String,String> map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
		//데이터 조회
		List data = tservice.deptSelect(map);
	
        //JSON 
        ibUtil.setCodeMessage("sheet1","정상적으로 처리되었습니다."); 
        ibUtil.setData("sheet1",data); 

        //JSON 반환 
        ModelAndView mv = new ModelAndView("jsonView",ibUtil.getSearchJSON());
        return mv;
	}
	
	
//	@RequestMapping(value = "sheet/SearchSave/largeScrollSearchDirectDownExcel.do")
//	public void selectLargePostNoExcel(HttpServletRequest req ,HttpServletResponse res,@RequestParam Map<String,String> map) throws Exception {
//		ModelMap mp = selectLargePostNo(map);
//		List li = (List)mp.get("Data");
//		IBSheetDown down = new IBSheetDown(req, res);
//		down.appendMultiData(li);
//		down.downToBrowser();
//		
//		
//	}
	@RequestMapping(value = "sheet/SearchSave/largeScrollSearch.do")
	public ModelAndView selectLargePostNo(@RequestParam Map<String,String> map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();

		//서버페이징 필수 조건
		int rowidx = Integer.parseInt((String)map.get("ibpage"));  //현재가 몇번째 페이지
		int onepagerow = Integer.parseInt((String)map.get("onepagerow")); //한번에 몇건씩 가져올 것인지
		String iborderby = "";
		if(map.get("iborderby")!=null){
			iborderby = (String)map.get("iborderby"); //헤더 클릭시 몇번째 컬럼인지와 ASC/DESC 정보
		}

		//전체 조회 건수
		
		if(rowidx==1){
			//최초 조회시 전체 데이터 건수 확인
			int totalcount = tservice.postNoCount(map);
			ibUtil.setTotal(totalcount);
		}
		else{
			//이후에는 최초 조회때 얻은 전체 건수를 사용한다.
			ibUtil.setTotal(   map.get("mySheet_total_rows") );	
		}
		
		
		
		Map searchCnd = new HashMap();
		
		
		/***********************  이 부분이 제일 중요 ***************************************/
		int startrow,endrow;
		startrow = rowidx==1?1:((rowidx-1) * onepagerow)+1;;
		endrow = startrow + (onepagerow-1);
		/***********************  이 부분이 제일 중요 ***************************************/
		System.out.println(startrow + ", " + endrow);
		searchCnd.put("start",startrow); //시작 row num
		searchCnd.put("end",endrow); //마지막 row num
		if(!"".equals(iborderby)){
			searchCnd.put("orderByPostNo", ibUtil.makeOrderBy(iborderby));
		}
		
        
        List data =  tservice.postNoPage(searchCnd);
        ibUtil.setData(data); 
         
         
        ModelAndView mav = new ModelAndView("jsonView",ibUtil.getSearchJSON());
        return mav;
	}
	
	@RequestMapping(value = "sheet/SearchSave/pageIndexSearch.do")
	public ModelAndView selectPageIndexPostNo(@RequestParam Map<String,String> map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
        //서버페이징 필수 조건
		int rowidx = Integer.parseInt((String)map.get("ibpage"));  //현재가 몇번째 페이지 (자동으로 시트가 전달해 준다.)
		int onepagerow = Integer.parseInt((String)map.get("OnePageRow")); //한번에 몇건씩 가져올 것인지

		//최초 조회시에만 전체 건수를 얻고 이후로는 재활용한다.
		if(rowidx==1){
			//최초 조회시 전체 데이터 건수 확인
			int totalcount = tservice.postNoCount(map);
			ibUtil.setTotal(totalcount);
		}
		
		
		Map searchCnd = new HashMap();
		
		/***********************  이 부분이 제일 중요 ***************************************/
		int startrow,endrow;
		startrow = rowidx==1?1:((rowidx-1) * onepagerow)+1;;
		endrow = startrow + (onepagerow-1);
		/***********************  이 부분이 제일 중요 ***************************************/
		
		searchCnd.put("start",startrow);
		searchCnd.put("end",endrow);
		
        
        List data =  tservice.postNoPage(searchCnd);
        
        ibUtil.setData(data); 
//        ibUtil.setEtc("Name", "Park Han-kyu");
//        ibUtil.setEtc("Age", "51");
        //JSON 반환 
        ModelAndView mv = new ModelAndView("jsonView",ibUtil.getSearchJSON());
        return mv;

	}
	
	

//	@RequestMapping(value = "sheet/SearchSave/postNoDirectLoadExcel.do")
//	public void directloadexcelPostNo(@RequestParam Map<String,String> map,HttpServletRequest req,HttpServletResponse res) throws Exception {
//		List li = (List)req.getAttribute("SHEETDATA");
//		
//		IBSheetUtil u = new IBSheetUtil();
//		Enumeration<String> en =  req.getAttributeNames();
//		
//		
//		//넘어온 데이터 확인
//		
////		u.mapPrint((Map)li.get(0));
//		
//		
//		PrintWriter out = null;
//		try{
//		//엑셀에서 넘어온 데이터는 모두 Insert 임
//			for(int i=0;i<li.size();i++){
//				Map record = (Map)li.get(i);
//				tservice.postNoInsert(record);
//			}
//			out = res.getWriter();
//			out.println("<script>var targetWnd = null; if(opener!=null) {targetWnd = opener;} else {targetWnd = parent;} targetWnd.thisIsCallBack4DLEW(); </script>");
//			out.flush();
//			out.close();
//		}catch(Exception ex){
//			try{
//			out = res.getWriter();
//			out.println("<script>alert('엑셀 파일을 저장하는 중에 오류가 발생하였습니다.');</script>");
//			out.flush();
//			out.close();
//			}catch(Exception ee){}
//		}
//	}
//	
	
	
//	@RequestMapping(value = "sheet/SearchSave/largeScrollSave.do")
//	public ModelAndView saveLargePostNo(@RequestParam Map map ) throws Exception {
//		IBSheetUtil ibUtil = new IBSheetUtil();
//		//IBSheet 에서 넘어온 내용을 추출
//		List<Map> mySheet = ibUtil.getSheetData("mySheet",map);
//		
//			for(int i=0;i<mySheet.size();i++){
//				Map<String,Object> record = mySheet.get(i);
//				//IBSheet 상태 컬럼의 값에 따른 작업 설정
//				switch((record.get("sStatus")+"").charAt(0)){
//				case 'I':
//					tservice.postNoInsert(record);
//					break;
//				case 'U':
//					tservice.postNoUpdate(record);
//					break;
//				case 'D':
//					tservice.postNoDelete(record);
//					break;
//				}
//			}
//	        //JSON
//			ibUtil.setEtc("age", "51");
//	        ibUtil.setCode(0); 
//	        ibUtil.setCodeMessage("저장 되었습니다."); 
//		
//
//      //JSON 반환 
//        ModelAndView mv = new ModelAndView("jsonView",ibUtil.getSaveJSON());
//        return mv;
//	}
	
	
	
	
	
	
	@RequestMapping(value = "sheet/SearchSave/05doubleSearch.do")
	public ModelAndView selectDouble(@RequestParam Map<String,String> map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
		//데이터 조회
		try{
			//첫번째 시트 조회
			List data = tservice.empSelect(map);
	        ibUtil.setData("sheet1",data);
	        
	        //두번째 시트 조회
	        data = tservice.deptSelect(map);
	        ibUtil.setData("sheet2",data);
		}catch(Exception ex){
			ex.printStackTrace();
		}
        
        //JSON 반환 
        ModelAndView mv = new ModelAndView("jsonView",ibUtil.getSearchJSON());
        return mv;
	}
	
	
	@RequestMapping(value = "sheet/SearchSave/empSave.do")
	public ModelAndView saveEmp(@RequestParam Map map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
		
		//IBSheet 에서 넘어온 내용을 추출
		List<Map> mySheet = ibUtil.getSheetData("mySheet",map);
		
		try{
			tservice.empModify(mySheet);
			ibUtil.setCode("mySheet",0);
			ibUtil.setCodeMessage("mySheet","저장 되었습니다.");
		}catch(Exception ex){
			ibUtil.setCode("mySheet",-10);
			ibUtil.setCodeMessage("mySheet","오류가 발생하였습니다.");

		}

        //JSON
		ibUtil.setEtc("mySheet","age", "51");
        ModelAndView model = new ModelAndView("jsonView",ibUtil.getSaveJSON());
        
        
        //JSON 반환 
        return model; 

	}
	
	
	
	@RequestMapping(value = "sheet/SearchSave/empSave2.do")
	public ModelAndView saveEmp2(@RequestParam Map map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
	    
		//IBSheet 에서 넘어온 내용을 추출
		List<Map> mySheet = ibUtil.getSheetData("sheet2",map);
		
		
		try{
			tservice.empModify(mySheet);
			ibUtil.setCode("mySheet",0);
			ibUtil.setCodeMessage("mySheet","저장 되었습니다.");
		}catch(Exception ex){
			ibUtil.setCode("mySheet",-10);
			ibUtil.setCodeMessage("mySheet","오류가 발생하였습니다.");
		}
        //JSON
		ibUtil.setEtc("mySheet","age", "51");
        ModelAndView model = new ModelAndView("jsonView",ibUtil.getSaveJSON());
        //JSON 반환 
        ModelAndView mv = new ModelAndView("jsonView",ibUtil.getSaveJSON());
        return mv;
	}
	
	
	
	
	@RequestMapping(value = "sheet/SearchSave/05doubleSave.do")
	public ModelAndView saveDouble(@RequestParam Map map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
			
		//IBSheet 에서 넘어온 내용을 추출
		List<Map> sheet1 = ibUtil.getSheetData("sheet1",map);
		List<Map> sheet2 = ibUtil.getSheetData("sheet2",map);
		
		try{
			tservice.doubleModify(sheet2,sheet1);
			ibUtil.setCode("sheet1",0);
			ibUtil.setCode("sheet2",0);
			ibUtil.setCodeMessage("sheet1","저장 되었습니다.");
		}catch(Exception ex){
			ex.printStackTrace();
			ibUtil.setCode("sheet1",-10);
			ibUtil.setCode("sheet2",-10);
			ibUtil.setCodeMessage("sheet1","오류가 발생하였습니다."); //<-- 오류메세지는 두개중 하나에만 전달하자.
			
		}
		
        //JSON 반환 
        ModelAndView mv = new ModelAndView("jsonView",ibUtil.getSaveJSON());
        return mv;
	}
	
	
	
	@RequestMapping(value = "sheet/SearchSave/masterdetailSave.do")
	public void masterdetailSave(@RequestParam Map<String,String> map,HttpServletRequest request,HttpServletResponse response)  {

//        DefaultTransactionDefinition txDefinition = new DefaultTransactionDefinition();
//        TransactionStatus txStatus =txManager.getTransaction(txDefinition);
//		
//		IBUploadUtil iu = new IBUploadUtil();
//		IBSheetUtil ibUtil = new IBSheetUtil();
//		try{
//			HashMap<String , Object> ibuploadMap = iu.IBUpload_DoUpload(request, response, UploadRootDir, TempDir, AvailableMemory, MaxFileSize, UploadEncoding, isServerResponse);
//			
//			
//			ibUtil.mapPrint(ibuploadMap);
//			
//			if(ibuploadMap!=null){
//				//ibsheet에서 넘어온 데이터를 추출한다.
//				List<Map<String,String>> sheet1 = ibUtil.getSheetData("sheet1",ibuploadMap);
//				List<Map<String,String>> sheet2 = ibUtil.getSheetData("sheet2",ibuploadMap);
//				
//				
//				
//				
//				//dept table 저장
//				String msg = "";
//				for(int i=0;i<sheet1.size();i++){
//					Map<String,String> record = sheet1.get(i);
//					String fileInfo = (String)record.get("filedata");
//				
//					Map oneFileInfo = iu.IBUpload_Update_Files(ibuploadMap,fileInfo);
//					
//					//IBSheet 상태 컬럼의 값에 따른 작업 설정
//					switch((record.get("sStatus")+"").charAt(0)){
//					case 'I':
//						if(oneFileInfo!=null){
//							record.put("ThisFileName",oneFileInfo.get("name"));  //파일명
//							record.put("FileInfo", JSONValue.toJSONString(oneFileInfo)); //파일정보 json string
//						}else{
//							record.put("ThisFileName","");
//							record.put("FileInfo", "");
//						}
//						tservice.deptInsert2(record);
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
//						tservice.deptUpdate2(record);
//						msg = "수정 되었습니다.";
//						break;
//					case 'D':
//						tservice.deptDelete(record);
//						msg = "삭제 되었습니다.";
//						break;
//					}
//				}
//				
//				
//				//emp table 저장
//				for(int i=0;i<sheet2.size();i++){
//					Map<String,String> record = sheet2.get(i);		
//					//IBSheet 상태 컬럼의 값에 따른 작업 설정
//					switch((record.get("sStatus")+"").charAt(0)){
//					case 'I':
//						tservice.empInsert(record);
//						break;
//					case 'U':
//						tservice.empUpdate(record);
//						break;
//					case 'D':
//						tservice.empDelete(record);
//						break;
//					}
//				}
//				
//				
//				
//				
//				
//				
//				
//				
//				
//				
//				
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
//			    txManager.commit(txStatus);
//			}
//		}catch(Exception e){
//			txManager.rollback(txStatus);
//			try{
//				e.printStackTrace();
//				response.setCharacterEncoding("utf-8");
//				PrintWriter out =  response.getWriter();
//				out.print(e.getMessage());
//				out.close();
//			}catch(Exception ex){}
//		}
	}
	
	
}

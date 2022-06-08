package egovframework.ibsheetTemplate.web;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.common.service.CommonService;
import egovframework.ib.util.IBSheetUtil;
import egovframework.ibsheetTemplate.service.IBSheetService;


/**
 * @Class Name : ChartSearchController.java
 * @Description : ChartSearchController  Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2014.10.02  shkim         최초생성
 *
 * @author ibleaders 기술지원팀
 * @since 2014. 10.02
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
@Controller
public class ChartSearchController {
	/**
	 * 일반 조회/저장 화면. 
	 * @return "/sample/egovSampleList"
	 * @exception Exception
	 */
	
@Resource(name="commonService")
protected CommonService commonServ;


@Resource(name="ibsheetService")
protected IBSheetService tservice;


	@RequestMapping(value = "chart/basic/01basicchart.do")
	public ModelAndView showBasic(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/chart/basic/01basicchart");
		
		//콤보 내용 넣기.
		Map param = new HashMap();
		Map mp = commonServ.selectCommonCode2(param);
		mv.addObject("DEPT_OPTION", mp.get("select"));
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value = "chart/basic/02multiseries")
	public ModelAndView showMulti(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/chart/basic/02multichart");
		return mv;
	}
	
	
	
	
	@RequestMapping(value = "chart/basic/chartDataSearch.do")
	public ModelAndView selectEmpChart(@RequestParam Map<String,String> map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
		//데이터 조회
		List data = tservice.empSelect(map);
	
        //JSON 
        ibUtil.setCodeMessage("정상적으로 처리되었습니다."); 
        ibUtil.setData(data); 
        
        Map mp = new HashMap();
        mp.put("value", "sal");
        mp.put("axislabel", "ename");
        mp.put("seriesname", "salary");
        
        ModelAndView mv = new ModelAndView("jsonView",ibUtil.getChartJSON(mp));
        return mv;
	}
	
	
	
	
	@RequestMapping(value = "chart/basic/chartDataSearch2.do")
	public ModelAndView selectProfitChart(@RequestParam Map<String,String> map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
		//데이터 조회
		List data = tservice.profitSelect(map);
	
        //JSON 
        ibUtil.setCodeMessage("정상적으로 처리되었습니다."); 
        ibUtil.setData(data); 
        
        Map mp = new HashMap();
        mp.put("value", "10|20|30|40");
        mp.put("axislabel", "term");
        mp.put("seriesname", "ACCOUNT|RESEARCH|SALES|OPERATIONS");
        
        mp.put("guidelineValue", 5000);
        mp.put("guidelineUnderPointColor", "#FFAA00");
        
        ModelAndView mv = new ModelAndView("jsonView",ibUtil.getChartJSON(mp));
        return mv;
	}
	
}

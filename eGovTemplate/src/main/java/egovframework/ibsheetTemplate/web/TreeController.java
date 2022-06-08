package egovframework.ibsheetTemplate.web;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.impl.SimpleLog;
import org.apache.log4j.Logger;
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
public class TreeController {
	/**
	 * 일반 조회/저장 화면. 
	 * @return "/sample/egovSampleList"
	 * @exception Exception
	 */
	
@Resource(name="commonService")
protected CommonService commonServ;


@Resource(name="ibsheetService")
protected IBSheetService tservice;


	@RequestMapping(value = "sheet/Tree/01tree.do")
	public ModelAndView showTree(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/sheet/Tree/tree");
		//콤보 내용 넣기.
		Map param = new HashMap();
		Map mp = commonServ.selectCommonCode(param);
		mv.addObject("DNAME", mp.get("text"));
		mv.addObject("DEPTNO", mp.get("code"));
		return mv;
	}


	@RequestMapping(value = "sheet/Tree/02dynamic.do")
	public ModelAndView showTreeDynamic(ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("/ibsheet_template/sheet/Tree/dynamic");
		//콤보 내용 넣기.
		Map param = new HashMap();
		Map mp = commonServ.selectCommonCode(param);
		mv.addObject("DNAME", mp.get("text"));
		mv.addObject("DEPTNO", mp.get("code"));
		return mv;
	}
	
	
	
	
	
	
	@RequestMapping(value = "sheet/Tree/treeSearch.do")
	public ModelAndView selectTree(@RequestParam Map<String,String> map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
		//데이터 조회
		List data = tservice.empSelectTree(map);
	
        //JSON 
        ibUtil.setCodeMessage("TREEDATA","정상적으로 처리되었습니다."); 
        ibUtil.setData("TREEDATA",data); 
        //JSON 반환 
        ModelAndView mv = new ModelAndView("jsonView",ibUtil.getSearchJSON());
        return mv;

	}
	
	
	@RequestMapping(value = "sheet/Tree/treeRootSearch.do")
	public ModelAndView selectTreeRoot(@RequestParam Map<String,String> map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
		//데이터 조회
		List data = tservice.empSelectTreeRoot(map);
        //JSON 
        ibUtil.setData(data); 
     
      //JSON 반환 
        ModelAndView mv = new ModelAndView("jsonView",ibUtil.getSearchJSON());
        return mv;
	}
	
	
	
	@RequestMapping(value = "sheet/Tree/treeChildSearch.do")
	public ModelAndView selectTreeChild(@RequestParam Map<String,String> map) throws Exception {
		IBSheetUtil ibUtil = new IBSheetUtil();
		//데이터 조회
		List data = tservice.empSelectTreeChild(map);
        //JSON 
        ibUtil.setData(data); 

      //JSON 반환 
        ModelAndView mv = new ModelAndView("jsonView",ibUtil.getSearchJSON());
        return mv;
	}
	
}

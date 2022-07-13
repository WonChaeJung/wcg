package com.ytcares.service.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ytcares.common.YTCaresException;
import com.ytcares.dao.TAccmDAO;
import com.ytcares.dao.TPrchsDAO;
import com.ytcares.dao.VPrchsAccmDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class AdAccmServiceImpl extends YTCaresService{

	Logger logger = Logger.getLogger(AdAccmServiceImpl.class);
	
	@Autowired
	TPrchsDAO tPrchsDAO;
	@Autowired
	VPrchsAccmDAO vPrchsAccmDAO;
	@Autowired
	TAccmDAO tAccmDAO;
	
	
	@RequestMapping(value={"/AdAccmService/adminSelectAccmPnt.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectAccmPnt(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adAccmPntR");
		String sessionUserId = getLoggedUserId();
		
		Map<String, Object> statSumm =  vPrchsAccmDAO.selectStatSummaryCount(null);
		mav.addObject("statSumm", statSumm);
		
		Map<String, Object> param = request2ParamMap(request);
		int count = vPrchsAccmDAO.selectAccmPntCount(param);
		mav.addObject("count", count);
		
		if (count > 0) {
			List<Map<String, Object>> accmPntList = vPrchsAccmDAO.selectAccmPntList(param);
			mav.addObject("accmPntList", accmPntList);
		}
		return mav;
	}
	
	@RequestMapping(value={"/AdAccmService/adminSearchStatList.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSearchStatList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adPrchsStatListR");
		Map<String, Object> param = request2ParamMap(request);
		
		List<String> agencySearchRlt = tPrchsDAO.selectAgencyName();
		int countResult = tPrchsDAO.selectSearchStatDetCount(param);
		if(countResult != 0){
			List<Map<String, Object>> ststListRlt = tPrchsDAO.selectSearchStatDetList(param);
			mav.addObject("count",countResult);
			mav.addObject("statListRlt",ststListRlt);
		}else{
			saveMessage("error.undefind.search.result");
		}
		mav.addObject("agencyList", agencySearchRlt);
		logger.info(" parameter : "+ request.getParameter("prchs_stat_cd"));
		logger.info(" parameter : "+ request.getParameter("agency_name"));
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdAccmService/adminUpdateAccmPntStlmnt.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminUpdateAccmPntStlmnt(HttpServletRequest request, HttpServletResponse response){
		//Map<String, Object> param = request2ParamMap(request);
		
		//하나가 넘어와도 배열로 처리하기 위하여 서비스의 request2ParamMap을 사용하지 않음.
		try {
			int[] result = tAccmDAO.updateAccmPntStlmnt(request.getParameterMap());
			saveMessage("msg.success.insert");
		} catch (YTCaresException e) {
			saveMessage(e);
		}
		return adminSelectAccmPnt(request, response);
	}
}

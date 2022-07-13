package com.ytcares.service.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ytcares.bean.TLectureAppBean;
import com.ytcares.bean.TLectureBean;
import com.ytcares.bean.TUserBean;
import com.ytcares.bean.VPrchsAccmBean;
import com.ytcares.common.YTCaresException;
import com.ytcares.dao.TLectureDAO;
import com.ytcares.dao.TUserDAO;
import com.ytcares.dao.VPrchsAccmDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class MbMyPageServiceImpl extends YTCaresService{

	@Autowired
	TUserDAO tUserDAO;
	@Autowired
	VPrchsAccmDAO vPrchsAccmDAO;
	@Autowired
	TLectureDAO tLectureDAO;
	
	public MbMyPageServiceImpl(){}
	
	@RequestMapping(value={"/MbMyPageService/userSelectMyInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userSelectMyInfo(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/member/mbMyInfoU");
		String user_id = getLoggedUserId(); 
		try {
			TUserBean userInfo = tUserDAO.selectUserInfo(user_id);
			String email = userInfo.getEmail();
			String[] arr = email.split("@");
			String email1 = arr[0]; 
			String email2 = arr[1];
			request.setAttribute("email1", email1);
			request.setAttribute("email2", email2);
			mav.addObject("userInfo",userInfo);
		} catch (YTCaresException e) {
			e.printStackTrace();
			saveMessage(e);
		}
		return mav;
	}
	@RequestMapping(value={"/MbMyPageService/userUpdateMyinfo.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView userUpdateMyinfo(HttpServletRequest request, HttpServletResponse response){
		if (!getLoggedUserId().equals(request.getParameter("user_id"))) {
			//로그인한 유저와 파라미터의 유저아이디가 일치하지 않는 경우
			return userSelectMyInfo(request, response);
		}
		
		Map<String, Object> param = request2ParamMap(request);
		param.put("email", request.getParameter("email1")+"@"+request.getParameter("email2"));
		try {
			int result = tUserDAO.updateUserInfo(param);
			if (result == 1) {
				//가입성공메세지
				saveMessage("msg.success.update");
				
			} else {
				//가입실패메세지
				saveMessage("error.fail.update");
			}
		} catch (YTCaresException e) {
			e.printStackTrace();
			saveMessage(e);
		}
		
		return userSelectMyInfo(request, response);
	}
	
	@RequestMapping(value={"/MbMyPageService/userSelectPrchsList.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView userSelectPrchsList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/member/mbPrchsListR");
		Map<String, Object> param = request2ParamMap(request);
		//유저아이디를 세션에 바인딩된 유저아이디로 세팅
		param.put("user_id", getLoggedUserId());
		param.put("family_id", getLoggedFamilyId());
		
		int count = vPrchsAccmDAO.selectPrchsAccmCount(param);
		mav.addObject("count", count);
		if (count > 0) {
			List<VPrchsAccmBean> prchsAccmList = vPrchsAccmDAO.selectPrchsAccmList(param);
			mav.addObject("prchsAccmList", prchsAccmList);
		}
		return mav;
	}
	
	@RequestMapping(value={"/MbMyPageService/userSelectAccmPntList.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView userSelectAccmPntList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/member/mbAccmPntR");
		String sessionUserId = getLoggedUserId();
		
		Map<String, Object> statSumm =  vPrchsAccmDAO.selectStatSummaryCount(sessionUserId);
		mav.addObject("statSumm", statSumm);
		
		Map<String, Object> param = request2ParamMap(request);
		param.put("user_id", sessionUserId);
		int count = vPrchsAccmDAO.selectAccmPntCount(param);
		mav.addObject("count", count);
		
		if (count > 0) {
			List<Map<String, Object>> accmPntList = vPrchsAccmDAO.selectAccmPntList(param);
			mav.addObject("accmPntList", accmPntList);
		}
		return mav;
	}
	
	@RequestMapping(value={"/MbMyPageService/userSelectLecList.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView userSelectLecList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/member/mbLecListR");
		int count = tLectureDAO.agencySelectLectureCount(getLoggedAgency_name());
		mav.addObject("count", count);
		if (count > 0) {
			Map<String, Object> param = request2ParamMap(request);
			//유저아이디를 세션에 바인딩된 유저아이디로 세팅
			param.put("user_id",	getLoggedUserId());
			param.put("lec_host",	getLoggedAgency_name());
			List<TLectureBean> userLecList = tLectureDAO.agencySelectLectureList(param);
			mav.addObject("userLecList", userLecList);
		}
		return mav;
	}
	@RequestMapping(value={"/MbMyPageService/userSelectLecAppList.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView userSelectLecAppList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/member/mbLecAppListRU_i");
		if ("".equals(getLoggedUserId()) || "".equals(getLoggedAgency_name())) return mav;
		
		Map<String, Object> param = request2ParamMap(request);
		//유저아이디를 세션에 바인딩된 유저아이디로 세팅
		param.put("user_id",	getLoggedUserId());
		param.put("lec_host",	getLoggedAgency_name());
		
		
		
		int count = tLectureDAO.agencySelectLecAppCount(param);
		mav.addObject("count", count);
		if (count > 0) {

			List<TLectureAppBean> lecAppList = tLectureDAO.agencySelectLecAppList(param);
			mav.addObject("lecAppList", lecAppList);
		}
		return mav;
	}
	
	@RequestMapping(value={"/MbMyPageService/userLecAppUpdate.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView userLecAppUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/member/mbLecAppListRU_i");
		Map<String, Object> param = request2ParamMap(request);
		//유저아이디를 세션에 바인딩된 유저아이디로 세팅
		param.put("lec_host",	getLoggedAgency_name());
		param.put("user_id",	request.getParameterValues("user_id"));
		param.put("app_stat_cd",request.getParameterValues("app_stat_cd"));
		param.put("rmrks",		request.getParameterValues("rmrks"));
		tLectureDAO.agencyUpdateLecApp(param);
		return userSelectLecAppList(request, response);
	}
	
}

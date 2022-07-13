package com.ytcares.service.common;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ytcares.bean.TUserBean;
import com.ytcares.bean.TUserLogBean;
import com.ytcares.bean.VPrchsAccmBean;
import com.ytcares.common.Base64Util;
import com.ytcares.common.YTCaresConstants.AcssType;
import com.ytcares.common.YTCaresConstants.Common;
import com.ytcares.common.YTCaresConstants.Grade;
import com.ytcares.common.YTCaresConstants.MsgType;
import com.ytcares.common.YTCaresException;
import com.ytcares.common.YTCaresSessionListener;
import com.ytcares.dao.TUserDAO;
import com.ytcares.dao.TUserLogDAO;
import com.ytcares.dao.VPrchsAccmDAO;
import com.ytcares.service.YTCaresService;
import com.ytcares.service.admin.AdLssServiceImpl;

@Controller
public class CmUserServiceImpl extends YTCaresService {
	@Autowired
	CmYTCaresServiceImpl cmYTCaresServiceImpl;
	@Autowired
	AdLssServiceImpl adLssServiceImpl;
	@Autowired
	private TUserDAO tUserDAO;
	@Autowired
	private TUserLogDAO tUserLogDAO;
	@Autowired
	private VPrchsAccmDAO vPrchsAccmDAO;
	private Logger logger = Logger.getLogger(CmUserServiceImpl.class);
	
	public CmUserServiceImpl() {}
	
	@RequestMapping(value="/CmUserService/callUserLogin.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callUserLogin(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/common/cmUserLogin");
	}
	
	@RequestMapping(value={"/CmUserService/login.do", "/CmUserService/disconnUser.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		YTCaresSessionListener sessionListener = YTCaresSessionListener.getInstance();
	    String id 	= request.getParameter("user_id");
		String pw  	= request.getParameter("user_pass");
		try {
			
			TUserBean userBean = tUserDAO.selectUserInfo(id);
			
			if (request.getRequestURI().equals("/CmUserService/login.do")) {
				//최초로그인 시도인 경우
				if (userBean == null) {
					throw new YTCaresException(getMessage("error.invalid.srch.id"));
				}
				
				if (!userBean.getUser_pass().equals(pw)) {
					throw new YTCaresException(getMessage("error.invalid.srch.pw"));
				}
			
				//중복로그인 체크
				if (sessionListener.isAlreadLoggedOn(id)) {
					//해당 아이디로 이미 로그인 되어 있을 경우
					YTCaresException e = new YTCaresException(getMessage("confirm.disconn.logged.user"));
					e.setMsgType(MsgType.confirm);
					e.setAction("/CmUserService/disconnUser.do?user_id="+id);
					throw e;
				}
			} else {
				//이미 로그인되어있는 사용자의 세션을 무효화하는 경우
				
				//로그인리스트로부터 해당 아이디 삭제
				sessionListener.deleteUser(id);

			}
			
			//세션에 유저정보 바인드
			HttpSession session = request.getSession();
			userBean.setLogon_dttm(new Timestamp(System.currentTimeMillis()));
	        session.setAttribute(Common.session_user_bean, userBean);
	        
	        session.setMaxInactiveInterval(20*60);
			
	        //로그인 정보 등록
			TUserLogBean userLog = new TUserLogBean();
			userLog.setUser_id(id);
			userLog.setAcss_type_cd(AcssType.login);
			userLog.setAcss_trg(request.getRequestURI());
			userLog.setAcss_ip(request.getRemoteAddr());
			
			tUserLogDAO.insertUserLog(userLog);
			String redirect = request.getParameter("redirect"); 
			if (redirect != null && !"".equals(redirect)) {
				ModelAndView mav = new ModelAndView("redirect:"+redirect);
				Map<String, Object> map = new HashMap<String, Object>();
				for(Enumeration<?> e = request.getParameterNames(); e.hasMoreElements();) {
					String paramName = String.valueOf(e.nextElement());
					if (!"user_id".equals(paramName) && !"user_pass".equals(paramName) && !"redirect".equals(paramName)) {
						map.put(paramName, request.getParameterValues(paramName));
					}
				}
				mav.addAllObjects(map);
				return mav;
			} else {
				return cmYTCaresServiceImpl.selectMainInfo(request, response);
			}
		} catch (YTCaresException e) {
			e.printStackTrace();
			saveMessage(e);
		}
		
		return new ModelAndView("/common/cmUserLogin");
	}
	
	@RequestMapping(value={"/CmUserService/logout.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			//로그아웃정보 등록
			TUserLogBean userLog = new TUserLogBean();
			userLog.setUser_id(getLoggedUserId());
			userLog.setAcss_type_cd(AcssType.logout);
			userLog.setAcss_trg(request.getRequestURI());
			userLog.setAcss_ip(request.getRemoteAddr());
			tUserLogDAO.insertUserLog(userLog);
		} catch (YTCaresException e) {
			e.printStackTrace();
			saveMessage(e);
		}
		
		request.getSession().invalidate();
		
		return new ModelAndView("redirect:/main.do");
	}
	@RequestMapping(value={"/CmUserService/callUserAgree.do"},method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView callUserAgree(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/common/cmUserAgree");
		HttpSession session = request.getSession();
		if(session.getAttribute("com.ytcares.user.bean")==null){
			return mav;
		}else{
			return new ModelAndView("redirect:/main.do");
		}
	}
	
	@RequestMapping(value={"/CmUserService/callUserJoin.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callUserJoin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/common/cmUserJoinC");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("com.ytcares.user.bean")==null){
			try {
				Object srchrlt = new HashMap<String, String>();
				srchrlt = tUserDAO.selectAgencyIdSrch();
				mav.addObject("srchInfo",srchrlt);
			} catch (YTCaresException e) {
				e.printStackTrace();
				saveMessage(e);
			}	
			return mav;
		}else{
			return new ModelAndView("redirect:/main.do");
		}
	}
	
	@RequestMapping(value={"/CmUserService/callSrchIdpw.do"},method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callSrchIdpw(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("common/cmSrchIdpwR");
	}
	
	@RequestMapping(value={"/CmUserService/insertUserInfo.do"}, method=RequestMethod.POST)
	public ModelAndView insertUserInfo(HttpServletRequest request, HttpServletResponse response) {
			try {
				Map<String, Object> param = new HashMap<String, Object>();
				param = request2ParamMap(request);
				param.put("email", request.getParameter("email1")+"@"+request.getParameter("email2"));
				
				//계층아이디취득
				int result = tUserDAO.insertUserInfo(param);
				if (result == 1) {
					//가입성공메세지
					//saveMessage("");
					return new ModelAndView("/common/cmUserJoinR");
				} else {
					//가입실패메세지
					saveMessage("error.fail.insert");
				}
			} catch (YTCaresException e) {
				e.printStackTrace();
				saveMessage(e);
			}
		return new ModelAndView("/common/cmUserJoinC");
	}

	@RequestMapping(value={"/CmUserService/searchUserId.do"},method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchUserId(HttpServletRequest requst, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/common/cmIdFind_p");
		try {
			String rlt = tUserDAO.selectIdSrch(request2ParamMap(requst));
			mav.addObject("srchRlt",rlt);
		} catch (YTCaresException e) {
			e.printStackTrace();
			saveMessage(e);
		}
		return mav;
	}
	@RequestMapping(value={"/CmUserService/searchUserPass.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchUserPass(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/common/cmPwFind_p");
		try {
			String rlt = tUserDAO.selectPwSrch(request2ParamMap(request));
			mav.addObject("srchRlt", rlt);
		} catch (YTCaresException e) {
			e.printStackTrace();
			saveMessage(e);
		}
		return mav;
	}
	
	@RequestMapping(value={"/CmUserService/userLaunchLss.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView userLauchLss(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/common/cmLssLauncher_p");
		mav.addObject("UserName", Base64Util.encode(request.getParameter("UserName")));
		mav.addObject("Dept", Base64Util.encode(request.getParameter("Dept")));
		mav.addObject("Position", Base64Util.encode(request.getParameter("Position")));
		mav.addObject("RoomTitle", Base64Util.encode(request.getParameter("RoomTitle")));
		return mav;
	}
	@RequestMapping(value={"/CmUserService/userLssRoomChoice.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView userLssRoomChoice(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/common/cmLssRoomChoice_p");
		HttpSession session = request.getSession();
		TUserBean bean = (TUserBean)session.getAttribute(Common.session_user_bean);
		Map<String, List<TUserBean>> userLssTable = adLssServiceImpl.getUserLssTable(bean);
		mav.addObject("userLssTable", userLssTable);
		
		return mav;
	}
	
	@RequestMapping(value={"/CmUserService/userSelectPrchsDetail.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userSelectPrchsDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/common/cmPrchsDetail_p");
		
		String prchs_seq_no = request.getParameter("prchs_seq_no");
		VPrchsAccmBean prchsDetail = vPrchsAccmDAO.selectPrchsDetailInfo(prchs_seq_no);
		if (Grade.admin.equals(getLoggedUserGrade()) || prchsDetail.getFamily_id().startsWith(getLoggedFamilyId())) {
			mav.addObject("prchsDetail", prchsDetail);
			return mav;
		} else {
			try {
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
	}
	@RequestMapping(value={"/CmUserService/callCstmrCenter.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callCstmrCenter(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/common/cmCustomerCenter");
		return mav;
	}
}
	
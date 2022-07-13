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

import com.ytcares.bean.TLectureBean;
import com.ytcares.bean.TUserBean;
import com.ytcares.dao.TLectureDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class AdLectureServiceImpl extends YTCaresService {
	
	@SuppressWarnings("unused")
	private Logger logger = Logger.getLogger(AdLectureServiceImpl.class);

	@Autowired
	private TLectureDAO tlecBoardDAO;
	
	public AdLectureServiceImpl() {}
	
	@RequestMapping(value={"/AdLectureService/adminSelectLecList.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectLecList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adLecListR");
		Map<String, Object> param = request2ParamMap(request);
		int count = tlecBoardDAO.adminSelectLectureListCount(param);
		mav.addObject("count", count);
		if(count > 0){
			List<TLectureBean> LectureList = tlecBoardDAO.adminSelectLectureList(param);
			mav.addObject("LectureList", LectureList);
		}
		return mav;
	}
	
	@RequestMapping(value={"/AdLectureService/adminSelectLecInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectLecInfo(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adLecInfoCUD");
		Map<String, Object> param = request2ParamMap(request);
		List<TLectureBean> LectureList = null;
		List<TUserBean> UserList = null;
		if(param.get("lec_seq_no") == null){
			UserList = tlecBoardDAO.adminSelectUserInfo(param);
			mav.addObject("UserList", UserList);
		}else{
			LectureList = tlecBoardDAO.adminSelectLecInfo(param);
			UserList = tlecBoardDAO.adminSelectUserInfo(param);
			mav.addObject("LectureList", LectureList);
			mav.addObject("UserList", UserList);
		}
		return mav;
	}
	
	@RequestMapping(value={"/AdLectureService/adminInsertLecInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminInsertLecInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = request2ParamMap(request);
		int result = 0;
		result = tlecBoardDAO.adminInsertLecInfo(param);
		if(result == 1){
			saveMessage("msg.success.insert");
		}
		return adminSelectLecList(request, response);
	}
	
	@RequestMapping(value={"/AdLectureService/adminUpdateLecInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminUpdateLecInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = request2ParamMap(request);
		int result = 0;
		result = tlecBoardDAO.adminUpdateLecInfo(param);
		if(result == 1){
			saveMessage("msg.success.update");
		}
		return adminSelectLecList(request, response);
	}
	
	@RequestMapping(value={"/AdLectureService/adminDeleteLecInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminDeleteLecInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = request2ParamMap(request);
		int result = 0;
		result = tlecBoardDAO.adminDeleteLecInfo(param);
		if(result == 1){
			saveMessage("msg.success.delete");
		}
		return adminSelectLecList(request, response);
	}
	
	@RequestMapping(value={"/AdLectureService/adminSelectAppList.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectAppList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adLecAppListRU");
		Map<String, Object> param = request2ParamMap(request);
		int count = 0;
		List<TLectureBean> LectureList = null;
		count = tlecBoardDAO.adminSelectLectureListCount(param);
		mav.addObject("count", count);
		if(count > 0){
			LectureList = tlecBoardDAO.adminSelectLectureList(param);
			mav.addObject("LectureList", LectureList);
		}
		return mav;
	}
	@RequestMapping(value={"/AdLectureService/adminCallAppList.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminCallAppList(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("/admin/adLecAppListRU_i");
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdLectureService/adminSelectLecAppList.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectLecAppList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adLecAppListRU_i");
		Map<String, Object> param = request2ParamMap(request);
		int count = 0;
		count = tlecBoardDAO.adminSelectLecAppListCount(param);
		mav.addObject("count", count);
		if(count > 0){
			List LecAppList = tlecBoardDAO.adminSelectLecAppList(param);
			mav.addObject("LecAppList", LecAppList);
		}
		return mav;
	}
	
	@RequestMapping(value={"/AdLectureService/adminUpdateLecAppInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminUpdateLecAppInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = request2ParamMap(request);
		param.put("user_id",	request.getParameterValues("user_id"));
		param.put("app_stat_cd",request.getParameterValues("app_stat_cd"));
		param.put("rmrks",		request.getParameterValues("rmrks"));
		
		tlecBoardDAO.adminUpdateLecAppInfo(param);
		
		return adminSelectLecAppList(request, response);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdLectureService/adminSelectLecReqList.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectLecReqList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adLecReqListR");
		Map<String, Object> param = request2ParamMap(request);
		int count = 0;
		count = tlecBoardDAO.selectLectureReqListCount(param);
		mav.addObject("count", count);
		if(count > 0){
			List LecReqList = tlecBoardDAO.selectLectureReqList(param);
			mav.addObject("LecReqList", LecReqList);
		}
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdLectureService/adminSelectLecReq.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectLecReq(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adLecReqRD");
		Map<String, Object> param = request2ParamMap(request);
		List LecReqInfo = tlecBoardDAO.adminSelectLecReqInfo(param);
		mav.addObject("LecReqInfo", LecReqInfo);
		return mav;
	}
	
	@RequestMapping(value={"/AdLectureService/adminDeleteLecReq.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminDeleteLecReq(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = request2ParamMap(request);
		int result = 0;
		result = tlecBoardDAO.adminDeleteLecReq(param);
		if(result == 1){
			saveMessage("msg.success.delete");
		}
		return adminSelectLecReqList(request, response);
	}
	
}

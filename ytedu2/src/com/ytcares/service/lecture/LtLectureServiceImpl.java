package com.ytcares.service.lecture;

import java.io.File;
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

import com.ytcares.bean.TLectureAppBean;
import com.ytcares.bean.TLectureBean;
import com.ytcares.bean.TLectureReqBean;
import com.ytcares.dao.TLectureDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class LtLectureServiceImpl extends YTCaresService {

	@Autowired
	private TLectureDAO tlecBoardDAO;

	@SuppressWarnings("unused")
	private Logger logger = Logger.getLogger(LtLectureServiceImpl.class);
	public LtLectureServiceImpl() {}
	
	@RequestMapping(value={"/LtLectureService/selectLecList.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectLecList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/lecture/ltLecListR");
		Map<String, Object> param = request2ParamMap(request);
		int count = tlecBoardDAO.selectLecListCount(param);
		mav.addObject("count", count);
		if(count > 0){
			List<TLectureBean> LectureList = tlecBoardDAO.selectLecList(param);
			mav.addObject("LectureList", LectureList);
		}else{
			//메세지는 출력안하게 처리함.
			//saveMessage("lbl.search.result.zero.lec.info");
		}
		
		return mav;
	}
	
	@RequestMapping(value={"/LtLectureService/userSelectLecInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userSelectLecInfo(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/lecture/ltLecInfoR");
		Map<String, Object> param = request2ParamMap(request);

		int result = 0;
		result = tlecBoardDAO.updateLecListReadCount(param);
		if(result == 1){
			List<TLectureBean> LecList = tlecBoardDAO.userSelectLectureInfo(param);
			mav.addObject("LecList", LecList);
		}
		return mav;
	}
	
	@RequestMapping(value={"/LtLectureService/memberInsertLecApp.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberInsertLecApp(HttpServletRequest request, HttpServletResponse response){
		String user_id	= getLoggedUserId();
		Map<String, Object> param = request2ParamMap(request);
		param.put("user_id", user_id);

		List<TLectureAppBean> LectureAppList = tlecBoardDAO.selectLectureAppInfo(param);
		if(LectureAppList.size()==0){
			tlecBoardDAO.memberInsertLecApp(param);
		}
		return selectLecList(request, response);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/LtLectureService/userSelectLectureReq.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userSelectLectureReq(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/lecture/ltLecReqListR");
		String user_id = getLoggedUserId();
		Map<String, Object> param = request2ParamMap(request);
		param.put("lec_req_id", user_id);

		int cnt = tlecBoardDAO.selectLectureReqListCount(param);
		mav.addObject("cnt", cnt);
		if(cnt > 0){
			List LectureReqList = tlecBoardDAO.selectLectureReqList(param);
			mav.addObject("LectureReqList", LectureReqList);
		}
		return mav;
	}
	
	@RequestMapping(value={"/LtLectureService/callReqLecture.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reqLecture(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/lecture/ltLecReqC");
		return mav;
	}
	
	@RequestMapping(value={"/LtLectureService/userInsertLecReq.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userInsertLecReq(HttpServletRequest request, HttpServletResponse response){
		String user_id	= getLoggedUserId();
		Map<String, Object> param = request2ParamMap(request);
		param.put("lec_req_id", user_id);
		
		tlecBoardDAO.userInsertLecReq(param);
		
		return userSelectLectureReq(request, response);
	}
	
	@RequestMapping(value={"/LtLectureService/selectLectureReqInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectLectureReqInfo(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/lecture/ltLecReqR");
		Map<String, Object> param = request2ParamMap(request);
		List<TLectureReqBean> LectureReqList = tlecBoardDAO.selectLectureReqInfo(param);
		mav.addObject("LectureReqList", LectureReqList);
		return mav;
	}
	
}

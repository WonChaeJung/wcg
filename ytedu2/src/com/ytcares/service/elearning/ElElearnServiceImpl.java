package com.ytcares.service.elearning;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ytcares.bean.TBoardBean;
import com.ytcares.common.YTCaresException;
import com.ytcares.common.YTCaresConstants.BCategory;
import com.ytcares.common.YTCaresConstants.Grade;
import com.ytcares.dao.TBoardDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class ElElearnServiceImpl extends YTCaresService {
	private Logger logger = Logger.getLogger(ElElearnServiceImpl.class);
	
	@Autowired
	private TBoardDAO tBoardDAO;
	
	//게시판 리스트 조회
	@RequestMapping(value={"/ElElearnService/selectMovList.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectMovList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/elearning/elMovListR");
		
		Map<String, Object> param = request2ParamMap(request);
		//카테고리는 강제로 02로 설정, 화면에서 넘어오는 카테고리는 화면전환등에 사용하고
		//서비스에서는 서비스성격에 맞는 카테고리만 검색되도록 강제 설정
		param.put("category", BCategory.elearning);
		
		int count = tBoardDAO.selectBoardListCount(param);
		mav.addObject("boardListCount", count);
		if (count > 0) {
			List<TBoardBean> boardList = tBoardDAO.selectBoardList(param);
			mav.addObject("boardList", boardList);
		}
		return mav;

	}
	
	//동영상 보기
	@RequestMapping(value={"/ElElearnService/userSelectMovPop.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userSelectMovPop(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/elearning/elMovView_p");
		
		Map<String, Object> param = request2ParamMap(request);
		mav.addObject("appnd_data2", param.get("fname"));
		
		return mav;
	}
	
	//게시판 글 조회성공 시 조회수 카운트
	@RequestMapping(value={"/ElElearnService/updateReadCount.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateReadCount(@ModelAttribute TBoardBean count, HttpServletRequest request, HttpServletResponse response) {
		
		String category = request.getParameter("category");
		
		if (!BCategory.site.equals(category)) {
			//카테고리가 온라인강의게시판이 아닌 경우 리스트화면으로 리턴
			return selectMovList(request, response);
		}
		
		int result = tBoardDAO.updateReadCount(count);
		if (result == 0) {
			//TODO: 조회에 실패했습니다.
			saveMessage("error.fail.check");
		}
		return userSelectMovPop(request, response);
	}
	
}
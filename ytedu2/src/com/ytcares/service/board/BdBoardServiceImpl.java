package com.ytcares.service.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ytcares.bean.TBoardBean;
import com.ytcares.common.YTCaresConstants.BCategory;
import com.ytcares.common.YTCaresConstants.Grade;
import com.ytcares.common.YTCaresException;
import com.ytcares.dao.TBoardDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class BdBoardServiceImpl extends YTCaresService {
	private Logger logger = Logger.getLogger(BdBoardServiceImpl.class);
	
	@Autowired
	private TBoardDAO tBoardDAO;
	
	//게시판 리스트 조회
	@RequestMapping(value={"/BdBoardService/selectBoardList.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectBoardList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/board/bdBoardListR");
		
		Map<String, Object> param = request2ParamMap(request);
		//카테고리는 강제로 01로 설정, 화면에서 넘어오는 카테고리는 화면전환등에 사용하고
		//서비스에서는 서비스성격에 맞는 카테고리만 검색되도록 강제 설정
		param.put("category", BCategory.site);
		
		int count = tBoardDAO.selectBoardListCount(param);
		mav.addObject("boardListCount", count);
		if (count > 0) {
			List<TBoardBean> boardList = tBoardDAO.selectBoardList(param);
			mav.addObject("boardList", boardList);
		}
		return mav;

	}
	
	//게시판 글 입력페이지 연결
	@RequestMapping(value={"/BdBoardService/userInsertPage.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userInsertPage(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("/board/bdBoardC");
	}
	
	//게시판 글 입력
	@RequestMapping(value={"/BdBoardService/userCallBoard.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userCallBoard(@ModelAttribute TBoardBean boardBean, HttpServletRequest request, HttpServletResponse response) {
		
		boardBean.setReg_id(getLoggedUserId());
		
		int result = tBoardDAO.userCallBoard(boardBean);
		if (result == 1) {
			saveMessage("msg.success.insert");
		} else {
			//글쓰기 실패 메세지
			saveMessage("error.fail.insert");
		}
		return selectBoardList(request, response);
	}
	
	//게시판  글 상세보기
	//직접적으로 게시판 내용을 확인하는 경우는 없으므로 private 로 선언
	//외부의 요청에도 응답하지 않기 때문에 요청매핑도 불필요
	private ModelAndView selectBoardInfo(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/board/bdBoardR");
		
		Map<String, Object> param = request2ParamMap(request);
		
		TBoardBean boardInfo = tBoardDAO.selectBoardInfo(param);
		mav.addObject("boardInfo", boardInfo);
		
		return mav;
	}
	
	//게시판 글 조회성공 시 조회수 카운트
	@RequestMapping(value={"/BdBoardService/updateReadCount.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateReadCount(@ModelAttribute TBoardBean count, HttpServletRequest request, HttpServletResponse response) {
		String category 	= request.getParameter("category");
		String sub_category = request.getParameter("sub_category");
		//요청한 사용자아이디(FAQ본인인지 확인용)
		String ref_user_id 		= request.getParameter("ref_user_id");
		if (!BCategory.site.equals(category)) {
			//카테고리가 게시판이 아닌 경우 리스트화면으로 리턴
			return selectBoardList(request, response);
		}
		if (BCategory.Site.faq.equals(sub_category)) {
			//서브카테고리가 faq인 경우
			if (!Grade.admin.equals(getLoggedUserGrade())) {
				//요청한 유저아이디와 현재로그인한 유저정보가 일치하는지 확인
				if (ref_user_id == null || "".equals(ref_user_id)) {
					return selectBoardList(request, response);
				} else if ("".equals(getLoggedUserId())) {
					return selectBoardList(request, response);
				} else if (!ref_user_id.equals(getLoggedUserId())) {
					return selectBoardList(request, response);
				}
			}
		}
		int result = tBoardDAO.updateReadCount(count);
		if (result == 0) {
			//TODO: 조회에 실패했습니다.
			saveMessage("error.fail.check");
		}
		return selectBoardInfo(request, response);
	}
}

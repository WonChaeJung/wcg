package com.ytcares.service.admin;

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
import com.ytcares.bean.TUserBean;
import com.ytcares.common.YTCaresException;
import com.ytcares.common.YTCaresConstants.Grade;
import com.ytcares.dao.TBoardDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class AdBoardServiceImpl extends YTCaresService {
	private Logger logger = Logger.getLogger(AdBoardServiceImpl.class);
	
	@Autowired
	private TBoardDAO tBoardDAO;
	
	//공지 게시판 리스트 조회
	@RequestMapping(value={"/AdBoardService/adminSelectBoard.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectBoard(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/admin/adNoticeListR");
		
		HttpSession session = request.getSession();
		String grade = getLoggedUserGrade();
		String category = "01";
		String sub_category = "01";
		
		@SuppressWarnings("unused")
		String user_id	= "";
		if (!Grade.admin.equals(grade)) {
			user_id	= String.valueOf(session.getAttribute("user_id"));
		}

		Map<String, Object> param = request2ParamMap(request);

		int count = tBoardDAO.selectBoardListCount(param);
		mav.addObject("boardListCount", count);
		mav.addObject("category", category);
		mav.addObject("sub_category", sub_category);
		if (count > 0) {
			List<TBoardBean> boardInfo = tBoardDAO.selectBoardList(param);
			mav.addObject("boardInfo", boardInfo);
			mav.addObject("category", category);
			mav.addObject("sub_category", sub_category);
		}
		return mav;
	}
	
	//게시판 글 입력페이지 연결
	@RequestMapping(value={"/AdBoardService/noticeInsertPage.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView noticeInsertPage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adNoticeCUD");
		return mav;
	}
	
	//게시판 글 입력
	@RequestMapping(value={"/AdBoardService/adminInsertBoard.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminInsertBoard(@ModelAttribute TBoardBean boardBean, HttpServletRequest request, HttpServletResponse response) {
		boardBean.setReg_id(getLoggedUserId());
		
		int result = tBoardDAO.adminInsertBoard(boardBean);
		if (result == 0) {
			//등록에 실패했습니다.
			saveMessage("error.fail.insert");
		}
		return adminSelectBoard(request, response);
	}
	
	//게시판 글 조회성공 시 조회수 카운트
	@RequestMapping(value={"/AdBoardService/updateReadCount.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateReadCount(@ModelAttribute TBoardBean count, HttpServletRequest request, HttpServletResponse response) {
		int result = tBoardDAO.updateReadCount(count);
		if (result == 0) {
			//TODO: 조회에 실패했습니다.
			saveMessage("error.fail.check");
		}
		return adminUpdateBoardInfo(request, response);
	}
	
	//공지 게시판 글 수정하기 위해 기존의 정보 표시
	@RequestMapping(value={"/AdBoardService/adminUpdateBoardInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminUpdateBoardInfo(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/admin/adNoticeCUD");
		Map<String, Object> param = request2ParamMap(request);
		
		String category = "01";
		String sub_category = "01";

		TBoardBean boardInfo = tBoardDAO.selectBoardInfo(param);
		mav.addObject("boardInfo", boardInfo);
		mav.addObject("category", category);
		mav.addObject("sub_category", sub_category);

		return mav;
	}
	
	//게시판 글 수정
	@RequestMapping(value={"/AdBoardService/adminUpdateBoard.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminUpdateBoard(@ModelAttribute TBoardBean boardInfo, HttpServletRequest request, HttpServletResponse response) {
		int result = tBoardDAO.adminUpdateBoard(boardInfo);
		if (result == 0) {
			//TODO: 수정에 실패하였습니다.
			saveMessage("error.fail.update");
		}
		return adminSelectBoard(request, response);
	}
	
	
	//게시판 글 삭제
	@RequestMapping(value={"/AdBoardService/adminDeleteBoard.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminDeleteBoard(HttpServletRequest request, HttpServletResponse response) {
		String id = getLoggedUserId();
		String no = request.getParameter("seq_no");
		String category = "01";
		String sub_category = "01";
		
		int result = tBoardDAO.adminDeleteBoard(no, id, category, sub_category);
		if (result == 0) {
			//TODO: 삭제에 실패하였습니다.
			saveMessage("error.fail.delete");
		}
		return adminSelectBoard(request, response);
	}
	
	//FAQ 게시판 리스트 조회
	@RequestMapping(value={"/AdBoardService/adminSelectFaq.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSelectFaq(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/admin/adFAQListR");
		
		HttpSession session = request.getSession();
		String grade = getLoggedUserGrade();
		String category = "01";
		String sub_category = "02";

		@SuppressWarnings("unused")
		String user_id	= "";
		if (!Grade.admin.equals(grade)) {
			user_id	= String.valueOf(session.getAttribute("user_id"));
		}
		Map<String, Object> param = request2ParamMap(request);
		
		int count = tBoardDAO.selectBoardListCount(param);
		mav.addObject("boardListCount", count);
		mav.addObject("category", category);
		mav.addObject("sub_category", sub_category);
		if (count > 0) {
			List<TBoardBean> boardInfo = tBoardDAO.selectBoardList(param);
			mav.addObject("boardInfo", boardInfo);
			mav.addObject("category", category);
			mav.addObject("sub_category", sub_category);
		}
		return mav;

	}
	
	//FAQ 게시판 글 입력페이지 연결
	@RequestMapping(value={"/AdBoardService/adminFaqInsertPage.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView faqInsertPage(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adFAQCUD");
		return mav;
	}
	
	
	//FAQ 게시판 글 입력
	@RequestMapping(value={"/AdBoardService/adminInsertFaq.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminInsertFaq(@ModelAttribute TBoardBean boardBean, HttpServletRequest request, HttpServletResponse response) {
		
		boardBean.setReg_id(getLoggedUserId());

		int result = tBoardDAO.adminInsertBoard(boardBean);
		if (result == 0){
			//TODO: 등록에 실패했습니다.
			saveMessage("error.fail.insert");
		}
		
		return adminSelectFaq(request, response);
	}
	
	//게시판 답글 입력
	@RequestMapping(value={"/AdBoardService/adminInsertReple.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminInsertReple(@ModelAttribute TBoardBean boardBean, HttpServletRequest request, HttpServletResponse response) {
		
		boardBean.setReg_id(getLoggedUserId());

		String seq_no = request.getParameter("seq_no");
		String step = request.getParameter("re_step");
		String level = request.getParameter("re_level");
		
		int re_step = (Integer.parseInt(step));
		int re_level = (Integer.parseInt(level));
		
		//답글달기 전 세팅
		if(seq_no != null){
			int set = tBoardDAO.adminUpdateReple(boardBean);
			if (set == 0) {
				//TODO: 조회에 실패했습니다
				saveMessage("error.fail.check");
			}
			re_step = re_step + 1;
			re_level = re_level + 1;
		}else{
			re_step = 0;
			re_level = 0;
		}
		boardBean.setRe_step(re_step);
		boardBean.setRe_level(re_level);

		int result = tBoardDAO.adminInsertReple(boardBean);

		if (result == 0) {
			//TODO: 등록에 실패했습니다.
			saveMessage("error.fail.insert");
		}				

		return adminSelectFaq(request, response);
	}
	
	//FAQ 게시판 글 조회성공 시 조회수 카운트
	@RequestMapping(value={"/AdBoardService/updateReadCountFaq.do"} , method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateReadCountFaq(@ModelAttribute TBoardBean count, HttpServletRequest request, HttpServletResponse response) {

		int result = tBoardDAO.updateReadCount(count);
		if (result == 0) {
			//TODO: 조회에 실패했습니다.
			saveMessage("error.fail.check");
		} 		
		return adminUpdateFaqInfo(request, response);
	}
	
	//FAQ 게시판 글 수정하기 위해 기존의 정보 표시
	@RequestMapping(value={"/AdBoardService/adminUpdateFaqInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminUpdateFaqInfo(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/admin/adFAQCUD");
		Map<String, Object> param = request2ParamMap(request);
		
		String category = "01";
		String sub_category = "02";
		
		TBoardBean boardInfo = tBoardDAO.selectBoardInfo(param);
		mav.addObject("boardInfo", boardInfo);
		mav.addObject("category", category);
		mav.addObject("sub_category", sub_category);
		
		return mav;
	}
	
	
	//FAQ 게시판 글 수정
	@RequestMapping(value={"/AdBoardService/adminUpdateFaq.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminUpdateFaq(@ModelAttribute TBoardBean boardInfo, HttpServletRequest request, HttpServletResponse response) {
		int result = tBoardDAO.adminUpdateBoard(boardInfo);
		if (result == 0) {
			//TODO: 수정에 실패하였습니다.
			saveMessage("error.fail.update");
		} 
		return adminSelectFaq(request, response);
	}
	
	//FAQ 게시판 글 삭제
	@RequestMapping(value={"/AdBoardService/adminDeleteFaq.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminDeleteFaq(HttpServletRequest request, HttpServletResponse response) {
		String id = getLoggedUserId();
		String no = request.getParameter("seq_no");
		String category = "01";
		String sub_category = "02";
			int result = tBoardDAO.adminDeleteBoard(no, id, category, sub_category);
			if (result == 0) {
				//TODO: 삭제에 실패했습니다.
				saveMessage("error.fail.delete");
			}
		return adminSelectFaq(request, response);
	}
}

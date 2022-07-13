package com.ytcares.service.common;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.ytcares.bean.TBoardBean;
import com.ytcares.bean.TUserBean;
import com.ytcares.common.YTCaresConstants.BCategory;
import com.ytcares.common.YTCaresConstants.Common;
import com.ytcares.common.YTCaresConstants.Sql;
import com.ytcares.dao.TBoardDAO;
import com.ytcares.dao.TCsmtDAO;
import com.ytcares.service.YTCaresService;
import com.ytcares.service.admin.AdLssServiceImpl;


@Controller
public class CmYTCaresServiceImpl extends YTCaresService {
	@Autowired
	private TBoardDAO tBoardDAO;
	@Autowired
	private TCsmtDAO tCsmtDAO;
	@Autowired
	AdLssServiceImpl adLssServiceImpl;
	@Autowired
	LocaleResolver localeResolver;
	
	private Logger logger = Logger.getLogger(CmYTCaresServiceImpl.class);
	
	public CmYTCaresServiceImpl() {}
	
	@RequestMapping(value={"/changeLocal.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView changeLocal(HttpServletRequest request, HttpServletResponse response) {
		Locale locale = new Locale(request.getParameter("locale"));
		localeResolver.setLocale(request, response, locale);
		
		logger.info("CURRENT LOCALE :" + localeResolver.resolveLocale(request));
		
		return selectMainInfo(request, response);
	}
	
	@RequestMapping(value={"/main.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectMainInfo(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/common/cmSiteMain");

		Map<String, Object> param = new HashMap<String, Object>();
		param.put(Sql.start, 1);
		param.put(Sql.end, 5);
		
//		param.put("category", BCategory.elearning);
//		List<TBoardBean> movList = tBoardDAO.selectBoardList(param);
//		mav.addObject("movList", 	movList);
		
		param.put("category", 		BCategory.site);
		param.put("sub_category", 	BCategory.Site.notice);
		List<TBoardBean> noticeList = tBoardDAO.selectBoardList(param);
		mav.addObject("noticeList", noticeList);
		
		List<Map<String, Object>> rlt = tCsmtDAO.selectMainCsmtList();
		mav.addObject("csmtList",rlt);
		
		HttpSession session = request.getSession();
		if (!session.isNew() && session.getAttribute(Common.session_user_bean) != null) {
			TUserBean userBean = (TUserBean)session.getAttribute(Common.session_user_bean);
			if(adLssServiceImpl.isLssSubj(userBean)) {
				mav.addObject("lssRoomTitle", adLssServiceImpl.getLssRoomTitle(userBean));
			}
		}

		return mav;
	}

}


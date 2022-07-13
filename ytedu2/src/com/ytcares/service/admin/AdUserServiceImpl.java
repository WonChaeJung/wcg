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
import com.ytcares.dao.TUserDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class AdUserServiceImpl extends YTCaresService{

	public AdUserServiceImpl() {}
	Logger logger = Logger.getLogger(AdUserServiceImpl.class);
	
	@Autowired
	TUserDAO tUserDAO;
	
	/*가맹점검색페이지 : 리스트검색 메소드*/
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdUserService/adminSearchUserList.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminSearchUserList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adUserListR");
		Map<String, Object> param = request2ParamMap(request);
		try {
			int countRlt = tUserDAO.selectSearchAgencyTotCnt(param);
				mav.addObject("count",countRlt);
			if(countRlt != 0){
				List<Map<String, Object>> agencyInfo = (List<Map<String, Object>>) tUserDAO.selectSearchAgency(param);
				mav.addObject("agencyInfo", agencyInfo);
			}
		} catch (YTCaresException e) {
			saveMessage(e);
		}
		return mav;
	}
	/*가맹점정보수정  : 리스트검색메소드 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdUserService/adminSearchAgencyInfo.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminSearchAgencyInfo(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adUserListRU");
		Map<String, Object> param = request2ParamMap(request);
		try {
			int count = tUserDAO.selectSearchAgencyTotCnt(param);
			mav.addObject("count",count);
			if(count != 0){
				List<Map<String,Object>> agencyInfo = (List<Map<String, Object>>) tUserDAO.selectSearchAgency(param);
				mav.addObject("agencyInfo", agencyInfo);
			}
		} catch (YTCaresException e){
			saveMessage(e);
		}
		return mav;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/CmUserService/updateAgencyInfo.do"}, method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updateAgencyInfo(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adUserListRU");
		try {
			Map<String, Object>param = request2ParamMap(request);
			int rlt = tUserDAO.updateAgencyInfo(param);
			if(rlt==1){
				int count = tUserDAO.selectSearchAgencyTotCnt(param);
				if(count != 0){
					List<Map<String, Object>> agencyInfo = (List<Map<String, Object>>) tUserDAO.selectSearchAgency(param);
					mav.addObject("agencyInfo",agencyInfo);
					return mav;
				}
			}else{
				throw new YTCaresException();
				}
		} catch (YTCaresException e) {
			saveMessage(e);
		}
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdUserService/adminSelectUserTree.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminSelectUserTree(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adUserTreeR");
		List<Map> userTreeList = tUserDAO.adminSelectChildTree(request.getParameter("user_id"));
		mav.addObject("userTreeList",userTreeList);
		return mav;
	}
}

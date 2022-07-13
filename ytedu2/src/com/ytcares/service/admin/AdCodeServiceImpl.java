package com.ytcares.service.admin;

import java.util.ArrayList;
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

import com.ytcares.bean.TMcodeBean;
import com.ytcares.common.YTCaresException;
import com.ytcares.dao.TCodeDAO;
import com.ytcares.dao.TMcodeDAO;
import com.ytcares.service.YTCaresService;

@Controller
public class AdCodeServiceImpl extends YTCaresService{

	public AdCodeServiceImpl() {}
	Logger logger = Logger.getLogger(AdCodeServiceImpl.class);
	
	@Autowired
	TMcodeDAO tMcodeDAO;
	@Autowired
	TCodeDAO tCodeDAO;
	
	@RequestMapping(value={"/AdCodeService/adminSelectMCodeList.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminSelectMCodeList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/admin/adCodeListCRUD");
		List<TMcodeBean> mcodeList = new ArrayList<TMcodeBean>();
		try {
			mcodeList = tMcodeDAO.selectMCodeList("isAll");
		} catch (YTCaresException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("mcodeList", mcodeList);
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/AdCodeService/adminUpdateDCodeList.do"}, method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView adminUpdateDCodeList(HttpServletRequest request, HttpServletResponse response){
		//전 파라미터에 대하여 배열형태로 사용하기 위하여 request의 메소드 사용
		Map<String, Object> param = request.getParameterMap();
		tCodeDAO.updateDCodeList(param);
		saveMessage("msg.success.insert");
		
		return adminSelectMCodeList(request, response);
	}

}

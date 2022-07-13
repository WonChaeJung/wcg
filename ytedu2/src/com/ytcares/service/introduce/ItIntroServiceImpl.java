package com.ytcares.service.introduce;

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
public class ItIntroServiceImpl extends YTCaresService {

	
	public ItIntroServiceImpl() {}

	@RequestMapping(value={"/ItIntroService/viewIntroduce.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView callCstmrCenter(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("/introduce/itIntroduceR");
		return mav;
	}
}
	
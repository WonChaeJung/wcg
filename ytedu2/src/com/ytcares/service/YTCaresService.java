package com.ytcares.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;

import com.ytcares.bean.TUserBean;
import com.ytcares.common.YTCaresConstants.Common;
import com.ytcares.common.YTCaresConstants.Sql;

@Controller
public abstract class YTCaresService {
	@Autowired
	protected ApplicationContext context;
	@Autowired
	protected ResourceBundleMessageSource messageSource;
	@Autowired
	protected HttpServletRequest request;
	
	public String getMessage(String key) {
		return getMessage(key, null);
	}
	
	public String getMessage(String key, Object[] args) {
		return messageSource.getMessage(key, args, "", Locale.getDefault());
	}
	
	public void saveMessage(String key) {
		saveMessage(key, null);
	}
	
	public void saveMessage(String key, Object[] args) {
		if (key != null && !"".equals(key)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put(Common.ytcares_msg, messageSource.getMessage(key, args, key, Locale.getDefault()));
			request.setAttribute(Common.ytcares_msg_obj, map);
		}
	}
	
	public void saveMessage(Throwable throwable) {
		if (throwable != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put(Common.ytcares_msg,		throwable.getMessage());
			map.put(Common.ytcares_throwable,	throwable);
			
			request.setAttribute(Common.ytcares_msg_obj, map);
		}
	}

	public String getLoggedAgency_name() {
		HttpSession session = request.getSession();
		if (session.isNew()) {
			return "";
		} else {
			Object obj = session.getAttribute(Common.session_user_bean);
			if (obj == null) {
				return "";
			} else {
				return ((TUserBean)obj).getAgency_name();
			}
		}
	}
	public String getLoggedUserId() {
		HttpSession session = request.getSession();
		if (session.isNew()) {
			return "";
		} else {
			Object obj = session.getAttribute(Common.session_user_bean);
			if (obj == null) {
				return "";
			} else {
				return ((TUserBean)obj).getUser_id();
			}
		}
	}
	public String getLoggedFamilyId() {
		HttpSession session = request.getSession();
		if (session.isNew()) {
			return "";
		} else {
			Object obj = session.getAttribute(Common.session_user_bean);
			if (obj == null) {
				return "";
			} else {
				return ((TUserBean)obj).getFamily_id();
			}
		}
	}
	
	public String getLoggedUserGrade() {
		HttpSession session = request.getSession();
		if (session.isNew()) {
			return "";
		} else {
			Object obj = session.getAttribute(Common.session_user_bean);
			if (obj == null) {
				return "";
			} else {
				return ((TUserBean)obj).getGrade();
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> request2ParamMap(HttpServletRequest request) {
		Map<String, String[]> reqParam 	= request.getParameterMap();
		Map<String, Object> param 		= new HashMap<String, Object>();
		for (Iterator<String> iter 		= reqParam.keySet().iterator();iter.hasNext();) {
			String paramName 	= iter.next();
			Object obj			= reqParam.get(paramName);
			if (obj == null || "".equals(obj.toString())) {
				param.put(paramName, "");
			} else if (obj.getClass().isArray()) {
				String[] paramValues = (String[])reqParam.get(paramName);
				if (paramValues == null || paramValues.length == 0) {
					param.put(paramName, "");
				} else if (paramValues.length == 1) {
					param.put(paramName, paramValues[0]);
				} else {
					param.put(paramName, paramValues);
				}
			} else {
				param.put(paramName, obj);
			}
		}
		param.put("loggedUserId", 	getLoggedUserId());
		param.put("acssIp",			request.getRemoteAddr());
		
		int pageNum = 1;
		if (request.getParameter(Sql.pageNum) != null && request.getParameter(Sql.pageNum) !=""){
			try {
				pageNum = Integer.parseInt(request.getParameter(Sql.pageNum));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		int pageSize = 10;
		if (request.getParameter(Sql.pageSize) != null) {
			try {
				pageSize = Integer.parseInt(request.getParameter(Sql.pageSize));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		setStartEndRn(param, pageNum, pageSize);
		return param;
	}
	
	@SuppressWarnings("unchecked")
	public void setStartEndRn(Map param, int pageNum, int pageSize) {

		int start 	= (pageNum - 1) * pageSize + 1;
		int end		= start + pageSize - 1;
		
		param.put(Sql.start,start);
		param.put(Sql.end,	end);
	}
}

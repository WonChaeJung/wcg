package com.ytcares.service.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ytcares.bean.YTCaresBean;
import com.ytcares.common.YTCaresException;
import com.ytcares.common.YTCaresConstants.Grade;
import com.ytcares.service.YTCaresService;

@Controller
public class CmYTCaresAjaxServiceImpl extends YTCaresService {
	private Logger logger = Logger.getLogger(CmYTCaresAjaxServiceImpl.class);
	
	public CmYTCaresAjaxServiceImpl() {
		super();
	}
	
	@RequestMapping(value={"/YTCaresAccmPntGraph.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public void handleAccmPntGraph(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			response.setContentType("text/plain; charset=UTF-8");
			response.setHeader("Cache-control", "no-cache");
			pw = response.getWriter();
			
			String loggedUserId			= getLoggedUserId();
			if ("".equals(loggedUserId)) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			}
			
			String queryId = request.getParameter("queryId");
			if (queryId == null || "".equals(queryId)) {
				//쿼리아이디값이 널 혹은 공백문자열인 경우
				pw.write("[]");
				pw.flush();
				return;
			}
			
			Map<String, Object> param	= request2ParamMap(request);
			if (!Grade.admin.equals(getLoggedUserGrade())) {
				param.put("user_id", loggedUserId);
			}
			SqlMapClientTemplate sqlMapClientTemplate = context.getBean(SqlMapClientTemplate.class);
			List result = sqlMapClientTemplate.queryForList(queryId, param);
			
			
			
			String json = makeJsonString(result);
			pw.write(json);
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (YTCaresException e) {
			e.printStackTrace();
			try {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "부적절한 결과셋(맵이나 빈을 요소로 가지는 리스를 결과셋으로 사용하세요.)");
			} catch (IOException ioe) {
				e.printStackTrace();
			}
		} finally {
			if (pw != null) pw.close();
		}
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/YTCaresAjax.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public void handleRequestYTCaresAjax(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			response.setContentType("text/plain; charset=UTF-8");
			response.setHeader("Cache-control", "no-cache");
			pw = response.getWriter();
			
			String queryId = request.getParameter("queryId");
			if (queryId == null || "".equals(queryId)) {
				//쿼리아이디값이 널 혹은 공백문자열인 경우
				pw.write("[]");
				pw.flush();
				return;
			}
			
			SqlMapClientTemplate sqlMapClientTemplate = context.getBean(SqlMapClientTemplate.class);
			List result = sqlMapClientTemplate.queryForList(queryId, request2ParamMap(request));
			
			String json = makeJsonString(result);
			pw.write(json);
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (YTCaresException e) {
			e.printStackTrace();
			try {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "부적절한 결과셋(맵이나 빈을 요소로 가지는 리스를 결과셋으로 사용하세요.)");
			} catch (IOException ioe) {
				e.printStackTrace();
			}
		} finally {
			if (pw != null) pw.close();
		}
	}
	@RequestMapping(value={"/YTCaresAjaxUpdate.do"}, method={RequestMethod.GET, RequestMethod.POST})
	public void handleRequestYTCaresAjaxUpdate(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter pw = null;
		try {
			response.setContentType("text/plain; charset=UTF-8");
			response.setHeader("Cache-control", "no-cache");
			pw = response.getWriter();
			
			String queryId = request.getParameter("queryId");
			if (queryId == null || "".equals(queryId)) {
				//쿼리아이디값이 널 혹은 공백문자열인 경우
				pw.write("[]");
				pw.flush();
				return;
			}
			
			SqlMapClientTemplate sqlMapClientTemplate = context.getBean(SqlMapClientTemplate.class);
			int result = sqlMapClientTemplate.update(queryId, request2ParamMap(request));
			pw.write("[{\"result\":"+result+"}]");
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (pw != null) pw.close();
		}
	}
	@SuppressWarnings("unchecked")
	public String makeJsonString(final List src) throws YTCaresException {
		if (src == null || src.isEmpty()) return "[]";
		StringBuilder buf = new StringBuilder("[");
		for (int i = 0; i < src.size(); i++) {
			Object ele = src.get(i);
			buf.append((i == 0)?"":",");
			buf.append(parse2Json(ele));
		}
		buf.append("]");
		return buf.toString();
	}
	
	@SuppressWarnings("unchecked")
	private String parse2Json(Object obj) throws YTCaresException {
		if (obj == null) return "";
		
		if (obj instanceof Map) {
			Map<String, Object> map = (Map<String, Object>)obj;
			StringBuilder buf = new StringBuilder("{");

			Iterator<String> iter = map.keySet().iterator();
			for (int j = 0; iter.hasNext(); j++) {
				String key = iter.next();
				buf.append((j==0)?"":",");
				buf.append("\"").append(key).append("\":\"");
				buf.append((map.get(key) != null)?map.get(key).toString().replace("'", "\\'").replace("\"", "\\\"").replace("\r", "").replace("\n", " "):"").append("\"");
			}
			buf.append("}");

			return buf.toString();
		} else if (obj instanceof YTCaresBean) {
			return ((YTCaresBean)obj).bean2Json();
		} else if (obj instanceof List) {
			return makeJsonString((List)obj);
		} else {
			throw new YTCaresException();
		}
	}
}

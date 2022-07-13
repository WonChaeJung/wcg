package com.ytcares.common;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.ytcares.bean.TUserBean;
import com.ytcares.common.YTCaresConstants.AcssType;
import com.ytcares.common.YTCaresConstants.Common;

public class YTCaresCommonFilter implements Filter {
	private FilterConfig config;
	private DataSource ds; 
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
			HttpServletRequest req = (HttpServletRequest)request;
			req.setCharacterEncoding("UTF-8");
			
			HttpServletResponse res = (HttpServletResponse)response;
			res.setCharacterEncoding("UTF-8");
			
			HttpSession session = req.getSession(false);
			if (session != null) {
				Object userInfo = session.getAttribute(Common.session_user_bean);
				if (userInfo != null) {
					String userid = YTCaresSessionListener.getInstance().getUserID(session.getId());
					if (userid == null || "".equals(userid)) {
						String uri	= req.getRequestURI();
						String id	= ((TUserBean)userInfo).getUser_id();
						//TODO: 중복로그인에 의한 로그아웃 기록
						insertUserLog(id, AcssType.logout_by_dup, uri, req.getRemoteAddr());

						//중복로그인에 의하여 현재세션이 무효화된 경우, 자신의 세션을 invalidate
						session.invalidate();
						
						if (!"".equals(uri) && !"/".equals(uri) && !"/index.html".equals(uri) && !"/main.do".equals(uri)) {
							
							res.sendRedirect("/CmUserService/callUserLogin.do");
							return;
						} else {
							res.sendRedirect("/main.do");
							return;
						}
					}
				}
			}
		chain.doFilter(req, res);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
		
		Context initCtx;
		try {
			initCtx = new InitialContext();
			this.ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/ytedu");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	private void insertUserLog(String userId, String acssTypeCd, String reqURI, String ip) {
		try {
			Connection conn = ds.getConnection();
			
			//TODO: 중복로그인에 의한 로그아웃 기록
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO TUSER_LOG (USER_ID, ACSS_DATE, ACSS_TYPE_CD, ACSS_TRG, ACSS_IP) VALUES (?, SYSDATE, ?, ?, ?)");
			pstmt.setString(1, userId);
			pstmt.setString(2, acssTypeCd);
			pstmt.setString(3, reqURI);
			pstmt.setString(4, ip);
			
			pstmt.executeUpdate();
			
			if (pstmt != null) {pstmt.close();}
			if (conn != null) {conn.close();}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

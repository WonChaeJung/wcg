package com.ytcares.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.ytcares.common.YTCaresConstants.Common;
import com.ytcares.common.YTCaresConstants.MsgType;

public class YTCaresMessageTag extends TagSupport {
	private static final long serialVersionUID 		= 1L;
	private String scope;
	
	public YTCaresMessageTag() {
		super();
	}
	
	public void setScope(String scope) {
		this.scope = scope;
	}
	@SuppressWarnings("unchecked")
	@Override
	public int doEndTag() throws javax.servlet.jsp.JspTagException {
		try {
			JspWriter out 				= pageContext.getOut();
			StringBuffer buf 			= new StringBuffer();
			HttpServletRequest request 	= (HttpServletRequest)pageContext.getRequest();
			HttpSession session			= request.getSession(false);
			
			Object obj = null;
			if (scope == null || "".equals(scope) || scope.equalsIgnoreCase("request")) {
				obj = request.getAttribute(Common.ytcares_msg_obj);
				request.removeAttribute(Common.ytcares_msg_obj);
			} else if (scope.equalsIgnoreCase("session")) {
				if (session != null) {
					obj = session.getAttribute(Common.ytcares_msg_obj);
					session.removeAttribute(Common.ytcares_msg_obj);
				}
			} else if (scope.equalsIgnoreCase("application")) {
				obj = pageContext.getServletContext().getAttribute(Common.ytcares_msg_obj);
				pageContext.getServletContext().removeAttribute(Common.ytcares_msg_obj);
			}
			Map<String, Object> message = null;
			if (obj != null && obj instanceof Map) {
				message = (Map)obj;
			}
			
			String msgStr 	= null;
			String msgType 	= null;
			String action	= null;
			buf.append("<script>\n");
			buf.append("var val = 0;");
			if (message != null && !message.isEmpty()) {
				msgStr = String.valueOf(message.get(Common.ytcares_msg)).replace("null", "").replace("\n", "").replace("\r", "").replace("'","\"");
				Object throwable = message.get(Common.ytcares_throwable);
				if (throwable != null && throwable instanceof YTCaresException) {
					YTCaresException e = (YTCaresException)throwable;
					msgType = String.valueOf(e.getMsgType()).replace("null", "");
					action	= String.valueOf(e.getAction()).replace("null", "");
				}
				
				
				if (!"".equals(msgStr)) {
					if (MsgType.confirm.equalsIgnoreCase(msgType)) {
						
						buf.append("val = confirm('");
						buf.append(msgStr);
						buf.append("');");
					} else {
						buf.append("alert('");
						buf.append(msgStr);
						buf.append("');\n");
					}
				}
			}

			if (action != null && !"".equals(action)) {
				if (MsgType.confirm.equalsIgnoreCase(msgType)) {
					buf.append("if (val == 1) {");
					buf.append("\tlocation.href = '");
					buf.append(action);
					buf.append("';\n");
					buf.append("}\n");
				} else {
					buf.append("location.href = '");
					buf.append(action);
					buf.append("';\n");
				}
			}
			
			buf.append("</script>\n");
			out.write(buf.toString());
			out.flush();
		} catch (java.io.IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
}

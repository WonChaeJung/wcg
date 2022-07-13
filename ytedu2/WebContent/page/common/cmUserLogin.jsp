<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.ytcares.common.YTCaresConstants.Common,java.util.Map,java.util.Iterator" %>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<%
	if (session.getAttribute(Common.session_user_bean) != null) {
		response.sendRedirect("/main.do");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link href="${ctxPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script src="${ctxPath}/js/commonValidation.js"></script>
<script src="${ctxpath}/js/commonUtil.js"></script>
<script type="text/javascript">
if (opener) {
	self.close();
	opener.location.href = '/CmUserService/callUserLogin.do';
} else if (!parent.mainFrame && parent != window) {
	parent.location.href = '/CmUserService/callUserLogin.do';
}


function init(){
	cmYTCaresInit();
	document.loginform.user_id.focus();
	document.loginform.user_id.value = "";
	document.loginform.user_pass.value = "";
}

function submitCheck(){
	var loginform = document.loginform;
	if(loginform.user_id.value == ""){
		alert('<spring:message code="error.require.id" text="" javaScriptEscape="true"/>');
		loginform.user_id.focus();
		return false;
	}
	if(loginform.user_pass.value == ""){
		alert('<spring:message code="error.require.pw" text="" javaScriptEscape="true"/>');
		loginform.user_pass.focus();
		return false;
	}
	loginform.submit();
}

function loginOnKeydown(e) {
	var keyCode=(window.netscape)?e.which:event.keyCode;
	if (keyCode == 13) {
		submitCheck();
	}
}

function submitChk(str){
	var frm = eval("document."+str);
	frm.submit();
}
</script>
</head>
<body onLoad="init();">
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td>
			<img src='<spring:message code="img.member.bg" text="타이틀이미지"/>'/>
		</td>
	</tr>
	<tr valign="top">
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr valign="top">
					<td width="200">
						<jsp:include page="/page/common/cmUserLeftMenu_f.jsp"/>
					</td>
					<td width="700" align="center" valign="top" >
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
								<img src="/images/cn/login_title_c.gif"/>
							</td>
						</tr>
						<tr>
							<td>
								<img src="/images/cn/login_info_c.gif"/>
							</td>
						</tr>
						<tr><td><img src="/images/cn/login_sub_info_c.gif"/></td></tr>
						<tr valign="top">
							<td width="100%">
								<form name="loginform" method="post" action="/CmUserService/login.do" onSubmit="return submitCheck()">
								<c:forEach var="reqParam" items="${pageContext.request.parameterMap}">
									<c:forEach var="paramValue" items="${reqParam.value}">
										<c:if test="${reqParam.key ne 'user_id' and reqParam.key ne 'user_pass'}">
										<input type="hidden" name="${reqParam.key}" value="${paramValue}"/>
										</c:if>
									</c:forEach>
								</c:forEach>
								<!-- main content -->
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr valign="top">
											<td>
												<table border="0">
													<tr>
														<td width="175"></td>
														<td width="610">
															<table border="0">
																<tr>
																	<td align="center">
																		<table cellpadding="0" cellspacing="0" border="0">
																			<tr>
																				<td valign="top" style="padding-top:8px;">
																					<table cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td align="right"><img src="/images/login_id_tit.gif"></td>
																						</tr>
																						<tr>
																							<td style="padding-top:16px;" align="right"><img src="/images/login_pass_tit.gif"></td>
																						</tr>
																					</table>
																				</td>
																				<td style="padding-left:10px;" valign="top">
																					<table width="350" cellpadding="0" cellspacing="0" border="0">
																						<tr>
																							<td>
																								<table cellpadding="0" cellspacing="0" border="0">
																									<tr>
																										<td>
																											<table cellpadding="0" cellspacing="0" border="0">
																												<tr>
																													<td>
																														<input type="text" id="user_id" name="user_id" value="${param.user_id}" maxlength="12" onkeydown="loginOnKeydown()">
																													</td>
																												</tr>
																												<tr>
																													<td style="padding-top:7px;"><input type="password" id="user_pass" name="user_pass" value="${param.user_pass}" maxlength="16" onkeydown="loginOnKeydown()"></td>
																												</tr>
																											</table>
																										</td>
																										<td style="padding-left:8px; padding-top:4px;">
																											<img src="/images/cn/login_btn_c.gif" onclick="submitCheck()" style="cursor: pointer;">
																										</td>
																									</tr>
																								</table>
																							</td>
																						</tr>
																						<tr>
																							<td align="left">
																								<img src="/images/cn/login_reg_c.gif" border="0" onclick="submitChk('pageMv')" style="cursor: pointer;">
																								<img src="/images/cn/login_find_c.gif" border="0" onclick="submitChk('userIdpwdMv')" style="cursor: pointer;">
																							</td>
																						</tr>
																						<tr>
																							<td style="padding-top:15px;">
																								<table width="239" cellpadding="0" cellspacing="0" border="0">
																									<tr height="150">
																										<td ></td>
																									</tr>
																								</table>
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr>
											
									  </tr>
								   </table>
								<!-- main content end -->
								</form>
							</td>
						</tr>
						</table>
						<form name="pageMv" action="/CmUserService/callUserJoin.do"></form>
						<form name="userIdpwdMv" action="/CmUserService/callSrchIdpw.do"></form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
</body>
</html>
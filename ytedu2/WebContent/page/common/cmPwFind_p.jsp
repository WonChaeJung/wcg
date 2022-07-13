<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<!--
file name : cmPwfind_p.jsp
title     : 패스워드 찾기 체크
date      : 2012/04/05
author    : 
revisions : 
-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pw_find</title>
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr height="200" align="center" valign="middle">
		<c:if test="${!empty srchRlt}">
			<td style="padding-top: 16px;">
				<spring:message code='lbl.search.pw' text='찾으시는  비밀번호는 XXX입니다.'/> ${srchRlt}
			</td>
		</c:if>
		<c:if test="${empty srchRlt}">
			<td style="padding-top: 16px;">
				<spring:message code='error.invalid.srch.pw' text='검색조건에 해당하는 아이디가 없거나  검색조건이 잘못되었습니다 .'/>
			</td>
		</c:if>
	</tr>
	<tr align="center" height="15">
		<td>
			<img src="<spring:message code='img.board.close' />" border="0" style="cursor: pointer;" onClick="JavaScript:window.close()" />
		</td>
	</tr>
</table>
</body>
</html>
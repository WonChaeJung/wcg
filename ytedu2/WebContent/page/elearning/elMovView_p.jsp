<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--
file name : elMovView_p.jsp
title     : 온라인강좌 보기(팝업)
date      : 2012/05/11
author    : 정원채
-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동영상보기</title>
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<input type="hidden" name="seq_no" value="${param.seq_no}"/>
<input type="hidden" name="category" value="${param.category}"/>
<input type="hidden" name="sub_category" value="${param.sub_category}"/>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<c:if test="${!empty appnd_data2}">
		<td>
			<embed src="mms://${pageContext.request.localName}/ytcares/${appnd_data2}" style="width: 640px;height: 480px;" enablecontextmenu="0">
		</td>
		</c:if>
	</tr>
</table>
</body>
</html>
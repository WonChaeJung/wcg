<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<!--
file name : cmCsvOutput_p.jsp
title     : CSV출력
date      : 
author    : 
revisions : 
-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>CSV_OutPut</title>
	<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
	function csvDown(){
		document.csvForm.submit();
	}
</script>	
</head>
<body>
<form name="csvForm" action="/AdPrchsService/adminPrchsCsvDown.do" target="" method="post">
	<input type="hidden" name="fileName" value="${fileName}"/>
</form>
<table width="100%" border="2" cellpadding="0" cellspacing="0">
	<tr height="35">
		<td class="order_bar_bg">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td style="padding-left: 16px;"><img src="/images/find_id_pass_bar_tit.gif"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr height="110" align="center" valign="middle">
		<c:if test="${!empty fileName}">
			<td align="center">
				<table border="0">
					<tr>
						<td align="center" style="padding-top: 16px;">
							<spring:message code='lbl.create.file' text='파일이 생성되었습니다.'/>
						</td>
					</tr>
					<tr>
						<td style="padding-top: 3px;">
							<spring:message code='lbl.file.name' text='파일명'/> :<a href="/ytcares/csv/${fileName}">${fileName}</a><br>
							<spring:message code='lbl.create.date' text='생성일'/> : <fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>
						</td>
					</tr>
				</table>
			</td>
		</c:if>
		<c:if test="${empty fileName}">
			<td style="padding-top: 16px;">
				<spring:message code='error.not.create.file' text='생성된 파일이 없습니다.'/>
			</td>
		</c:if>
	</tr>
	<tr align="center" height="15">
		<td>
			<table>
				<tr>
					<td><input type="button" value="<spring:message code='btn.download' text='다운로드 '/>" onClick="csvDown()" style="cursor: pointer;"/>&nbsp;&nbsp;</td>
					<td><input type="button" value="<spring:message code='btn.close' text='닫기'/>"	onClick="JavaScript:window.close()" style="cursor: pointer;"/></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
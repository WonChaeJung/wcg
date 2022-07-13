<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<!--
file name : ltLecInfoR.jsp
title     : 교육상세
date      : 2012/05/11
author    : Kim.S.D
revisions : 2012/05/11 – 최종작성 (revised by Kim.S.D)
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//화면초기화
	cmYTCaresInit();
});
</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<img src='<spring:message code="img.lecture.bg" text="상단이미지"/>'/>
<form method="post" name="frm" action="/LtLectureService/memberInsertLecApp.do">
<c:forEach var="lecList" items="${LecList}">
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center" style="padding-top: 20px;">
	<tr class="header-lecture">
		<td>${lecList.lec_title}</td>
	</tr>
	<tr>
		<td valign="top">
			<table cellpadding="0" cellspacing="0" border="0" style="padding-top: 3px;">
				<tr height="1" bgcolor="#d8d8d8"><td colspan="6"></td></tr>
				<tr height="30" style="border-top: 1px solid; border-top-color: #787878; border-bottom: 1px solid #787878;">
					<td width="120" class="silver"><spring:message code="lbl.lec.agent" text="교육주체"/></td>
					<td align="left" colspan="5" class="gray">&nbsp;${lecList.lec_host}</td>
				</tr>
				<tr height="1" bgcolor="#d8d8d8"><td colspan="6"></td></tr>
				<tr height="30" style="border-top: 1px solid; border-top-color: #787878; border-bottom: 1px solid; border-bottom-color: #787878;">
					<td width="120" class="silver"><spring:message code="lbl.lec.day" text="교육일"/></td>
					<fmt:parseDate var="st_date" value="${lecList.lec_st_date}" pattern="yyyyMMdd"/>
					<fmt:parseDate var="ed_date" value="${lecList.lec_ed_date}" pattern="yyyyMMdd"/>
					<td width="180" align="left"  class="gray">&nbsp;<fmt:formatDate value="${st_date}" pattern="yyyy.MM.dd"/>~<fmt:formatDate value="${ed_date}" pattern="yyyy.MM.dd"/></td>
					<td width="120" class="silver"><spring:message code="lbl.lec.time" text="교육시간"/></td>
					<td width="140" class="gray">${lecList.lec_time}</td>
					<td width="120" class="silver"><spring:message code="lbl.lec.place" text="교육장소"/></td>
					<td width="220" class="gray">${lecList.lec_loc}</td>
				</tr>
				<tr height="1" bgcolor="#d8d8d8"><td colspan="6"></td></tr>
				<tr>
					<td colspan="6" align='center' style="padding: 20px; 0 20px; 0;">
					<input type="hidden" name="lec_desc" value='${lecList.lec_desc}'>
					${lecList.lec_desc}
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td align='center' style="padding-top: 20px;">
		<c:if test="${lecList.lec_stat_cd eq 1 and loggedUserId ne 'admin'}">
			<img src="<spring:message code='img.lecture.app'/>" style='cursor:pointer;' onclick="location.href='/LtLectureService/memberInsertLecApp.do?lec_seq_no=${lecList.lec_seq_no}'"/>
		</c:if>
			<img src="<spring:message code='img.board.list'/>" style='cursor:pointer;' onclick="location.href='/LtLectureService/selectLecList.do'"/>
		</td>
	</tr>
</table>
</c:forEach>
</form>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<!-- 공통메세지처리 -->
<ytcares:msg/>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<!--
file name : adLecReqListR.jsp
title     : 교육요청관리(관리자)
date      : 2012/05/17
author    : Kim.S.D
revisions : 2012/05/17 – 최종작성 (revised by Kim.S.D)
-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery-ui.min.css"/>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jquery-ui-1.8.2.min.js"></script>
<script src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//화면초기화
	cmYTCaresInit();
});
/* paging */
function goPage(pageNo) {
	var f = document.page;
	f.pageNum.value = pageNo;
	f.submit();
}

function lecReqDetail(lec_req_no) {
	location.href = '/AdLectureService/adminSelectLecReq.do?lec_req_no='+lec_req_no;
}
</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="frm" method="post">
<input type="hidden" name="pageNum" value="">
<table class="ytcares-content" width="900" cellpadding="0" cellspacing="0" border="0" align="center" style="padding-top: 20px;">
<tr>
	<td width="150" valign="top"><jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"/></td>
	<td width="750" valign="top">
		<table class="board-list" style="width:750px;margin-left:2px;table-layout: fixed;" cellpadding="0" cellspacing="0" border="0">
			<tr class="header-admin">
				<td width="50"><spring:message code='lbl.number' text='순번'/></td>
				<td width="*"><spring:message code='lbl.title' text='제목'/></td>
				<td width="120"><spring:message code='lbl.agency.name' text='가맹점'/></td>
				<td width="160"><spring:message code='lbl.phone' text='연락처'/></td>
				<td width="160"><spring:message code='lbl.email' text='E-mail'/></td>
				<td width="100"><spring:message code='lbl.req.date' text='요청일'/></td>
			</tr>
			<c:if test="${count eq 0}">
			<tr height="260" class="gray">
				<td colspan="6" align='center'>
				<spring:message code='lbl.search.result.zero.req.info' text='요청 정보가 없습니다.'/></td>
			</tr>
			</c:if>
			<c:if test="${count gt 0}">
			<c:forEach var="lecReq" items="${LecReqList}">
			<tr height="30" onclick="lecReqDetail('${lecReq.lec_req_no}')" style="cursor:pointer;" class="gray">
				<td>${lecReq.lec_req_no+1}</td>
				<td align='left'>${lecReq.lec_req_title}</td>
				<td align='left'>${lecReq.agency_name}</td>
				<td>${lecReq.cell_phone}</td>
				<td align='left'>${lecReq.email}</td>
				<td><fmt:formatDate value="${lecReq.lec_req_date}" pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:forEach>
			<c:if test="${fn:length(LecReqList) < 10}">
			<c:forEach var="i" begin="1" end="${10 - fn:length(LecReqList)}">
				<tr height="30">
					<td colspan="6">&nbsp;</td>
				</tr>
			</c:forEach>
			</c:if>
			</c:if>
		</table>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
				<ytcares:page count="${count}" pageNum="${param.pageNum}" onclick="goPage"/>
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</form>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<!-- 공통메세지처리 -->
<ytcares:msg/>
</body>
</html>
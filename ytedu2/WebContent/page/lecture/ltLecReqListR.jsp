<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<!--
file name : ltLecReqListR.jsp
title     : 교육요청 게시판
date      : 2012/05/11
author    : Kim.S.D
revisions : 2012/05/14 – 최종작성 (revised by Kim.S.D)
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<script src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
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
</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<img src='<spring:message code="img.lecture.bg" text="상단이미지"/>'/>
<form name="page" method="post" action="/LtLectureService/userSelectLectureReq.do">
<input type="hidden" name="pageNum" value=""/>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center" style="padding-top: 10px">
<tr>
	<td>
		<table class="board-list" width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td colspan="6">
					<table class="header-lecture" width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td width="70"><spring:message code="lbl.num" text="번호"/></td>
							<td width="250"><spring:message code="lbl.title" text="제목"/></td>
							<td width="120"><spring:message code="lbl.board.id" text="등록자"/></td>
							<td width="120"><spring:message code="lbl.agency.name" text="가맹점"/></td>
							<td width="200"><spring:message code="lbl.email" text="E-mail"/></td>
							<td width="140"><spring:message code="lbl.phone" text="연락처"/></td>
						</tr>
					</table>
				</td>
			</tr>
			<c:choose>
			<c:when test="${cnt eq 0}">
			<tr height="260" >
				<td colspan="6" align='center'><spring:message code="lbl.search.result.zero.req.info" text="요청 정보가 없습니다."/></td>
			</tr>
			</c:when>
			<c:otherwise>
			<c:forEach var="lecReq" items="${LectureReqList}">
			<tr height="30" onclick="location.href='/LtLectureService/selectLectureReqInfo.do?lec_req_no=${lecReq.lec_req_no}'" style="cursor: pointer;">
				<td align='center' width="70">${lecReq.lec_req_no+1}</td>
					<c:choose>
					<c:when test="${(loggedUserId eq lecReq.lec_req_id) or ('admin' eq loggedUserId)}">
						<td align='left' width="250" class="gray">
						${lecReq.lec_req_title}
						</td>
					</c:when>
					<c:otherwise>
						<td align='left' width="250">${lecReq.lec_req_title}</td>
					</c:otherwise>
					</c:choose>
				<td align='center' width="120">${lecReq.lec_req_id}</td>
				<td align='center' width="120">${lecReq.agency_name}</td>
				<td align='center' width="200">${lecReq.email}</td>
				<td align='center' width="140">${lecReq.cell_phone}</td>
			</tr>
			</c:forEach>
			<c:if test="${fn:length(LectureReqList) < 10}">
				<c:forEach var="i" begin="1" end="${10 - fn:length(LectureReqList)}">
					<tr height="30"><td align='center' colspan="6">&nbsp;</tr>
				</c:forEach>
			</c:if>
			</c:otherwise>
			</c:choose>
		</table>
	</td>
</tr>
<tr>
	<td>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td align="center"><ytcares:page count="${cnt}" pageNum="${param.pageNum}" onclick="goPage"/></td>
			</tr>
			<c:if test="${loggedUserGrade eq (ytcaresSupAgency or ytcaresSubAgency or ytcaresAgency) and loggedUserGrade ne ytcaresAdmin}">
			<tr>
				<td align='center'>
				<img src="<spring:message code="img.lecture.req"/>" onclick="javascript:location.href='/LtLectureService/callReqLecture.do';" style="cursor: pointer"/>
					<img src="<spring:message code="img.board.list"/>" onclick="javascript:location.href='/LtLectureService/selectLecList.do'" style="cursor: pointer"/>
				</td>
			</tr>
			</c:if>
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
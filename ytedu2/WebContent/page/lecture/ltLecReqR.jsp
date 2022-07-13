<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<!--
file name : ltLecReqR.jsp
title     : 교육요청 상세보기
date      : 2012/05/14
author    : Kim.S.D
revisions : 2012/05/14 – 최종작성 (revised by Kim.S.D)
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/ytcares-calendar.css" />
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/ytcares-calendar.js"></script>
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
<img src='<spring:message code="img.lecture.bg" text="상단이미지"/>' style="padding-bottom: 10px"/>
<table class="border-list" width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td valign="top">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<c:forEach var="lecReq" items="${LectureReqList}">
				<tr>
					<td width="120" class="silver" align='center'><spring:message code="lbl.title" text="제목"/></td>
					<td width="760" align='center' class="gray">
						${lecReq.lec_req_title}
					</td>
				</tr>
				<tr height="1" bgcolor="#d8d8d8"><td colspan="2"></td></tr>
				<tr height="28">
					<td width="120" class="silver" height="28" align='center'><spring:message code="lbl.lec.req.content" text="교육요청내용"/></td>
					<td align='left' class="gray">
						<input type="hidden" name="lec_req_desc" value='${lecReq.lec_req_desc}'>
						${lecReq.lec_req_desc}
					</td>
				</tr>
				<tr height="1" bgcolor="#d8d8d8"><td colspan="2"></td></tr>
			</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center"><img src="<spring:message code="img.board.list"/>" style='cursor:pointer;padding-top: 10px;' onclick="javascript:location.href='/LtLectureService/userSelectLectureReq.do'"></td>
	</tr>
</table>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp" />
<!-- 공통메세지처리 -->
<ytcares:msg/>
</body>
</html>
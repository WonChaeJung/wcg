<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<!--
file name : adLecListR.jsp
title     : 교육등록관리(관리자)
date      : 2012/05/15
author    : Kim.S.D
revisions : 2012/05/15 – 최종작성 (revised by Kim.S.D)
-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//화면초기화
	cmYTCaresInit();
});
function strToDate(date, delim){
	if (date == null || date == undefined) return null;
	if (delim == null || delim == undefined) {
		delim = '-';
	}
	if (typeof date == 'string') {
		if(date.match(/^[0-9]{4}[^0-9][0-9]{2}[^0-9][0-9]{2}$/)) {
			date = date.replace(/[^0-9]/gi, delim);
			return date;
		} else if (date.match(/^[0-9]{2}[^0-9][0-9]{2}[^0-9][0-9]{4}$/)) {
			date = date.replace(/[^0-9]/gi, delim);
			date = date.split(delim);
			return date[2] + delim + date[0] + delim + date[1];
		} else if (date.match(/^[0-9]{8}$/)) {
			var yy = parseInt(date.substr(0,4), 10);
			var mm = parseInt(date.substr(4,2), 10);
			var dd = parseInt(date.substr(6,2), 10);
			return yy + delim + ((mm < 10)?'0':'') + mm + delim + ((dd < 10)?'0':'') + dd;
		} else {
			return null;
		}
	} else if (date instanceof Date) {
		var yy = date.getFullYear();
		var mm = date.getMonth() + 1;
		var dd = date.getDate();
		return yy + delim + ((mm < 10)?'0':'') + mm + delim + ((dd < 10)?'0':'') + dd;
	}
	return null;
}

/* paging */
function goPage(pageNo) {
	var f = document.page;
	f.pageNum.value = pageNo;
	f.submit();
}

function lecDetail(lecSeqNo) {
	location.href="/AdLectureService/adminSelectLecInfo.do?lec_seq_no="+lecSeqNo;
}
</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="page" method="post" action="/AdLectureService/adminSelectLecList.do">
<input type="hidden" name="pageNum" value=""/>

<table class="ytcares-content" width="900" cellpadding="0" cellspacing="0" border="0" align="center" style="padding-top: 20px;">
<tr>
	<td width="150" valign="top"><jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"/></td>
	<td width="750" valign="top">
		<table class="board-list" style="width:750px;margin-left:2px; table-layout: fixed;" cellpadding="0" cellspacing="0" border="0">
			<colgroup>
				<col width="60"/>
				<col width="100"/>
				<col width="130"/>
				<col width="120"/>
				<col width="100"/>
				<col width="100"/>
				<col width="80"/>
				<col width="60"/>
			</colgroup>
			<tr class="header-admin">
				<td><spring:message code='lbl.number' text='순번'/></td>
				<td><spring:message code='lbl.lec.name' text='교육이름'/></td>
				<td><spring:message code='lbl.lec.day' text='교육일'/></td>
				<td><spring:message code='lbl.lec.time' text='교육시간'/></td>
				<td><spring:message code='lbl.lec.place' text='교육장소'/></td>
				<td><spring:message code='lbl.lec.agent' text='교육주체'/></td>
				<td><spring:message code='lbl.status' text='상태'/></td>
				<td><spring:message code='lbl.count' text='조회수'/></td>
			</tr>
			<c:if test="${count eq 0}">
			<tr height="260" class="gray">
				<td colspan="8">
					<spring:message code='lbl.search.result.zero.lec.info' text='교육 정보가 없습니다.'/>
				</td>
			</tr>
			</c:if>
			
			<c:if test="${count gt 0}">
			<c:forEach var="lecList" items="${LectureList}">
			<tr height="30" onclick="lecDetail('${lecList.lec_seq_no}')" style="cursor:pointer;" class="gray">
				<td>${lecList.lec_seq_no+1}</td>
				<td align='left' title="${lecList.lec_title}">${lecList.lec_title}</td>
				<td title="${lecList.lec_st_date}~${lecList.lec_ed_date}">
				<fmt:parseDate var="st_date" value="${lecList.lec_st_date}" pattern="yyyyMMdd" />
				<fmt:formatDate value="${st_date}" pattern="yyyy-MM-dd"/>
				~
				<fmt:parseDate var="ed_date" value="${lecList.lec_ed_date}" pattern="yyyyMMdd" />
				<fmt:formatDate value="${ed_date}" pattern="yyyy-MM-dd"/>
				</td>
				<td>${lecList.lec_time}</td>
				<td class="left" title="${lecList.lec_loc}">${lecList.lec_loc}</td>
				<td align='left'>${lecList.lec_host}</td>
				<td>${lecList.lec_stat_cd}</td>
				<td>${lecList.read_cnt}</td>
			</tr>
			</c:forEach>
			<c:if test="${fn:length(LectureList) < 10}">
			<c:forEach var="i" begin="1" end="${10 - fn:length(LectureList)}">
				<tr height="30">
					<td colspan="8">&nbsp;</td>
				</tr>
			</c:forEach>
			</c:if>
			</c:if>
		</table>
		<table class="paging" width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
					<ytcares:page count="${count}" pageNum="${param.pageNum}" onclick="goPage"/>
				</td>
			</tr>
		</table>
		<img src="<spring:message code='img.btn.insert' text='등록'/>" onclick="location.href='/AdLectureService/adminSelectLecInfo.do'" style="float:right;padding-right: 20px;cursor: pointer;">
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
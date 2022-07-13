<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%> 
<%@taglib prefix="ytcares"	uri="http://www.backsaninfo.com/jsp/core"%>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form"%>
<!--
file name : adElearnListR.jsp
title     : 온라인강의 리스트
date      : 2012/05/11
author    : Jung.W.C
revisions : 2012/05/16 – 최종작성 (revised by Jung.B.R)
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
<link rel="stylesheet" type="text/css" href="/css/ytcares-calendar.css"/>
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="/js/commonUtil.js"></script>
<script type="text/javascript">
/* paging */
function goPage(pageNo) {
	var f = document.frm;
	f.pageNum.value = pageNo;
	f.submit();
}
/* 온라인강의 수정 화면으로 */
function updateChk(RN, pageNum){
	var frm = document.frm;
	frm.seq_no.value = eval("frm.SEQ_NO"+RN).value;
	frm.sub_category.value = eval("frm.SUB_CATEGORY"+RN).value;
	frm.pageNum.value = pageNum;
	document.frm.chkKbn.value = "update";
	if(pageNum == 0){
	document.frm.pageNumTemp.value =1;
	}else{
		document.frm.pageNumTemp.value = pageNum;
	}
	document.frm.action = "/AdElearnService/adminSelectElearn.do";
	document.frm.submit();
}
</script>
</head>
<body onload="cmYTCaresInit()">
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="frm" method="post" action="/AdElearnService/adminSelectElearnList.do">
<input type="hidden" name="admin_menu" 	 value="${param.admin_menu}"/>
<input type="hidden" name="sub_category" value="${param.sub_category}"/>
<input type="hidden" name="seq_no" 		 value=""/>
<input type="hidden" name="chkKbn" 		 value=""/>
<input type="hidden" name="pageNum" 	 value=""/>
<input type="hidden" name="pageNumTemp"  value=""/>
<table class="ytcares-content" width="970" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="150" align="center" valign="top" >
			<jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include>
		</td>
		<td width="820" valign="top">
			
			<table style="margin-left:2px;width:818px" border="0">
				<colgroup>
					<col width="50"/>
					<col width="40"/>
					<col width="*"/>
					<col width="150"/>
					<col width="150"/>
					<col width="100"/>
					<col width="60"/>
				</colgroup>
				<tr class="header">
					<td><spring:message code="lbl.number" text="순번"/></td>
					<td><spring:message code="lbl.section" text="구분"/></td>
					<td><spring:message code="lbl.title" text="제목"/></td>
					<td><spring:message code="lbl.img.file" text="이미지파일"/></td>
					<td><spring:message code="lbl.movie.file" text="동영상파일"/></td>
					<td><spring:message code="lbl.add.date" text="등록일"/></td>
					<td><spring:message code="lbl.count" text="조회수"/></td>
				</tr>
				<c:choose>
				<c:when test="${empty srchRlt}">
				<tr height="260">
					<td colspan="7" align="center"><spring:message code="lbl.search.result.zero.board" text="게시판에저장된글이없습니다" javaScriptEscape="true"/></td>
				</tr>
				</c:when>
				<c:otherwise>
				<c:forEach var="srchRlt" items="${srchRlt}">
				<tr>
					<td>${srchRlt.RN}</td>
					<td>${srchRlt.SUB_CATEGORY}</td>
					<td align="left" onclick="updateChk('${srchRlt.RN}','${param.pageNum}')" style="cursor: pointer;">${srchRlt.TITLE}</td>
					<td align="left">${srchRlt.APPND_DATA1}</td>
					<td align="left">${srchRlt.APPND_DATA2}</td>
					<td>${srchRlt.REG_DATE}</td>
					<td>${srchRlt.READ_CNT}
						<input type="hidden" name="SEQ_NO${srchRlt.RN}" value="${srchRlt.SEQ_NO}"/>
						<input type="hidden" name="SUB_CATEGORY${srchRlt.RN}" value="${srchRlt.SUB_CATEGORY}"/>
					</td>
				</tr>
				</c:forEach>
				<c:if test="${fn:length(srchRlt) < 10}">
					<c:forEach var="i" begin="1" end="${10 - fn:length(srchRlt)}">
						<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
					</c:forEach>
				</c:if>
				</c:otherwise>
				</c:choose>
			</table>
			<table border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">
						<ytcares:page count="${count}" pageNum="${param.pageNum}" onclick="goPage"/>
					</td>
				</tr>
			</table>
			<table border="0" align="right" cellpadding="0" cellspacing="0">
				<tr>
					<td><input type="button" value="<spring:message code="btn.insert.lec" text="강의등록"/>" onclick="window.location='/AdElearnService/adminSelectElearn.do?category=${param.category}&sub_category=${param.sub_category}&chkKbn=insert'"/></td>
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
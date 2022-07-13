<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<!--
file name : elMovListR.jsp
title     : 온라인강좌 리스트
date      : 2012/05/11
author    : Jung.B.R
revisions : 2012/05/14 – 최종작성 (revised by Jung.B.R)
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<title>온라인 강좌 리스트</title>
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/commonUtil.js"></script>
<script type="text/javascript">

/* 동영상 보기 팝업*/
function elView(fname){

	cmOpenPopup("","test","640","480","auto");
	document.page.fname.value = fname;
	document.page.action = "/ElElearnService/userSelectMovPop.do";
	document.page.target = "test";
	document.page.submit();

}

/* paging */
function goPage(pageNo) {
	var f = document.page;
	f.pageNum.value = pageNo;
	f.pageSize.value = 5;
	f.action="/ElElearnService/selectMovList.do";
	f.target = "_self";
	f.submit();
}

</script>
</head>
<body onload="cmYTCaresInit()">
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="page" method="post" action="/ElElearnService/selectMovList.do">
<input type="hidden" name="fname" value="" />
<input type="hidden" name="seq_no" 	 	 value=""/>
<input type="hidden" name="category" 	 value="${empty param.category?'02':param.category}"/>
<input type="hidden" name="sub_category" value="${param.sub_category}"/>
<input type="hidden" name="loggedUserId" value="${loggedUserId}" />
<input type="hidden" name="pageSize" 	 value="${param.pageSize}"/>
<input type="hidden" name="pageNum" 	 value="${param.pageNum}"/>
<img src='<spring:message code="img.elearning.bg" text="상단이미지"/>'/>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr valign="top">
		<td>
			<table width="900" cellpadding="0" cellspacing="0" border="0" align="center" >
				<tr height="29">
					<td width="100%"><img src="<spring:message code='img.elearning.tab' text='전체'/>" align="left" style="padding-left: 24px;padding-top: 14px;"/></td>
				</tr>
				<tr height="1" valign="top" align="left">
					<td align="left" width="100%"><img src="/images/elearning_line.gif" style="padding-bottom: 10px;"/></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr valign="top">
		<td><img src="/images/elearning_img.gif" style="padding-left: 24px" height="130">
		</td>
		<td width="666">
			<table width="666" cellpadding="0" cellspacing="0" border="0" align="center" height="130">
				<tr>
					<td><img src="/images/elearning_ex1_title.gif"/></td>
				</tr>
				<tr>
					<td><img src="/images/elearning_ex1_content.gif"/></td>
				</tr>
				<tr>
					<td><img src="/images/elearning_line2.gif"/></td>
				</tr>
				<tr>
					<td align="left"><img src="/images/elearning_play.gif" onclick="elView('ch1.wmv')" style="padding-left: 15px;cursor: pointer;"/>&nbsp;&nbsp;<img src="/images/elearning_download.gif"/></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><img src="/images/elearning_line3.gif"/></td>
	</tr>
	<tr valign="top">
		<td><img src="/images/elearning_img.gif" style="padding-left: 24px" height="130">
		</td>
		<td width="666">
			<table width="666" cellpadding="0" cellspacing="0" border="0" align="center" height="130">
				<tr>
					<td><img src="/images/el_title2.gif"/></td>
				</tr>
				<tr>
					<td><img src="/images/el_blank.gif"/></td>
				</tr>
				<tr>
					<td><img src="/images/elearning_line2.gif"/></td>
				</tr>
				<tr>
					<td align="left"><img src="/images/elearning_play.gif" onclick="elView('ch2.wmv')" style="padding-left: 15px;cursor: pointer;"/>&nbsp;&nbsp;<img src="/images/elearning_download.gif"/></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><img src="/images/elearning_line3.gif"/></td>
	</tr>
	<tr valign="top">
		<td><img src="/images/elearning_img.gif" style="padding-left: 24px" height="130">
		</td>
		<td width="666">
			<table width="666" cellpadding="0" cellspacing="0" border="0" align="center" height="130">
				<tr>
					<td><img src="/images/el_title3.gif"/></td>
				</tr>
				<tr>
					<td><img src="/images/el_blank.gif"/></td>
				</tr>
				<tr>
					<td><img src="/images/elearning_line2.gif"/></td>
				</tr>
				<tr>
					<td align="left"><img src="/images/elearning_play.gif" onclick="elView('ch3.wmv')" style="padding-left: 15px;cursor: pointer;"/>&nbsp;&nbsp;<img src="/images/elearning_download.gif"/></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><img src="/images/elearning_line3.gif"/></td>
	</tr>
	<tr valign="top">
		<td><img src="/images/elearning_img.gif" style="padding-left: 24px" height="130">
		</td>
		<td width="666">
			<table width="666" cellpadding="0" cellspacing="0" border="0" align="center" height="130">
				<tr>
					<td><img src="/images/el_title4.gif"/></td>
				</tr>
				<tr>
					<td><img src="/images/el_blank.gif"/></td>
				</tr>
				<tr>
					<td><img src="/images/elearning_line2.gif"/></td>
				</tr>
				<tr>
					<td align="left"><img src="/images/elearning_play.gif" onclick="elView('ch14.wmv')" style="padding-left: 15px;cursor: pointer;"/>&nbsp;&nbsp;<img src="/images/elearning_download.gif"/></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><img src="/images/elearning_line3.gif"/></td>
	</tr>
	<tr valign="top">
		<td><img src="/images/elearning_img.gif" style="padding-left: 24px" height="130">
		</td>
		<td width="666">
			<table width="666" cellpadding="0" cellspacing="0" border="0" align="center" height="130">
				<tr>
					<td><img src="/images/el_title5.gif"/></td>
				</tr>
				<tr>
					<td><img src="/images/el_blank.gif"/></td>
				</tr>
				<tr>
					<td><img src="/images/elearning_line2.gif"/></td>
				</tr>
				<tr>
					<td align="left"><img src="/images/elearning_play.gif" onclick="elView('ch5.wmv')" style="padding-left: 15px;cursor: pointer;"/>&nbsp;&nbsp;<img src="/images/elearning_download.gif"/></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><img src="/images/elearning_line3.gif"/></td>
	</tr>
</table>
</form>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<!-- 공통메세지처리 -->
<ytcares:msg/>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<!--
file name : bdBoardC.jsp
title     : 사용자 게시판 글등록
date      : 2012/05/11
author    : Jung.B.R
revisions : 2012/05/14 – 최종작성 (revised by Jung.B.R)
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 게시판 글등록</title>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<script type="text/javascript" src="/js/commonUtil.js"></script>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
/* Editor Read */
$(document).ready(function(){
	CKEDITOR.replace('content', {height:300});
	cmYTCaresInit();
});


/* validation check */
function checkVal(){
	//CKEDITOR 동기화
	CKEDITOR.instances.content.updateElement();
	
	if(!cmChkForm2("frm"))return false;
	
	/* chrome에서 등록불가로 submit버튼을 input으로 교체 */
	document.frm.submit();
}
</script>
</head>
<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<jsp:useBean id="boardBean" class="com.ytcares.bean.TBoardBean" scope="request" />
<form:form commandName="boardBean" name="frm" method="post" action="/BdBoardService/userCallBoard.do">
<input type="hidden" name="category" 	 value="${empty boardInfo.category?'01':boardInfo.category}"/>
<input type="hidden" name="sub_category" value="${param.sub_category}"/>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr valign="top">
		<td colspan="2"><img src="/images/kr/top_bg_board.gif" /></td>
	</tr>
	<tr>
		<td width="184" valign="top" >
			<jsp:include page="/page/board/bdBoardMenu_f.jsp"/>
		</td>
		<td width="716">
			<table class="ytcares-detail" width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<c:choose>
					<c:when test="${(param.category eq '01' and  param.sub_category eq '01')}">
						<td><img src='<spring:message code="img.board.title.notice" text="Notice타이틀"/>'/></td>
					</c:when>
					<c:otherwise>
						<td><img src="/images/board_title_faq.gif"/></td>
					</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td align="left"><form:input path="title" cssStyle="width:710px" required="required" maxbyte="100"/></td>
				</tr>
				<tr>
					<td>
						<form:textarea path="content" id="content" rows="10" cssStyle="width:900px;" required="required" maxbyte="4000"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="padding-top: 20px; padding-bottom: 100px;" colspan="2">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="right">
						<img src='<spring:message code="img.board.list" text="목록"/>' onclick="window.location='/BdBoardService/selectBoardList.do?category=01&sub_category=${param.sub_category}&pageNum=${param.pageNum}&pageSize=15'" style="cursor: pointer;">
						<img src='<spring:message code="img.board.confirm" text="확인"/>' onclick="checkVal()" style="cursor: pointer;"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form:form>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<!-- 공통메세지처리 -->
<ytcares:msg/>
</body>
</html>
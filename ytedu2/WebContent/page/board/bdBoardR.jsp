<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<!--
file name : bdBoardR.jsp
title     : 사용자 게시판 상세보기
date      : 2012/05/11
author    : Jung.B.R
revisions : 2012/05/14 – 최종작성 (revised by Jung.B.R)
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 게시판 상세보기</title>
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/js/commonUtil.js"></script>
<script type="text/javascript">
/* Editor Read */
$(document).ready(function(){
	//화면초기화
	cmYTCaresInit();
});
</script>
</head>
<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="page" method="post" action="">
<input type="hidden" name="seq_no" 		 value="${boardInfo.seq_no}"/>
<input type="hidden" name="category" 	 value="${empty boardInfo.category?'01':boardInfo.category}"/>
<input type="hidden" name="sub_category" value="${param.sub_category}"/>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr valign="top">
		<td colspan="2"><img src="/images/kr/top_bg_board.gif" /></td>
	</tr>
	<tr valign="top">
		<td>
			<jsp:include page="/page/board/bdBoardMenu_f.jsp"/>
		</td>
		<td width="716">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<c:choose>
					<c:when test="${(param.category eq '01' and  param.sub_category eq '01')}">
						<td colspan="4"><img src='<spring:message code="img.board.title.notice" text="Notice타이틀"/>'/></td>
					</c:when>
					<c:otherwise>
						<td colspan="4"><img src="/images/board_title_faq.gif"/></td>
					</c:otherwise>
					</c:choose>
				</tr>
				<tr height="1" bgcolor="#F0B1FE"><td colspan="4"></td></tr>
				<tr height="29" class="silver">
					<td width="550" align="left" colspan="2" style="padding-left: 10px;">${boardInfo.title}</td>
					<td width="150" colspan="2"><fmt:formatDate value="${boardInfo.reg_date}" type="date" pattern="yyyy.MM.dd hh:mm:ss"/></td>
				</tr>
				<tr height="1" bgcolor="#F0D9ED"><td colspan="4"></td></tr>
				<tr height="28" class="gray">
					<td width="50" align="left" style="padding-left: 10px;"><spring:message code="lbl.board.id" text="작성자"/>: </td>
					<c:choose>
						<c:when test="${(param.category eq '01' and  param.sub_category eq '01')}">
							<td width="500" align="left">YTCares</td>
						</c:when>
						<c:when test="${(param.category eq '01' and  param.sub_category eq '02' and board.reg_id eq 'admin')}">
							<td width="500" align="left">YTCares</td>
						</c:when>
						<c:otherwise>
							<td width="500" align="left">${boardInfo.reg_id}</td>
						</c:otherwise>
					</c:choose>
					<td width="70"><spring:message code="lbl.count" text="조회수"/>: </td>
					<td width="80" align="left">${boardInfo.read_cnt}</td>
				</tr>
				<tr height="1" bgcolor="#E5E5E5"><td colspan="4"></td></tr>
				<tr>
					<td colspan="4" style="padding: 10px 10px 10px 10px;">
						${boardInfo.content}
					</td>
				</tr>	
			</table>
		</td>
	</tr>
	<tr>
		<td style="padding-top: 20px;padding-bottom: 100px;" colspan="2">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="right">
						<img src='<spring:message code="img.board.list" text="목록"/>' onclick="window.location='/BdBoardService/selectBoardList.do?category=${param.category}&sub_category=${param.sub_category}&pageNum=${param.pageNum}&pageSize=15'" style="cursor: pointer;"/>
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
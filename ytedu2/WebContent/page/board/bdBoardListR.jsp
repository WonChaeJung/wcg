<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<!--
file name : bdBoardListR.jsp
title     : 사용자 게시판 리스트
date      : 2012/05/11
author    : Jung.B.R
revisions : 2012/05/14 – 최종작성 (revised by Jung.B.R)
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<title>사용자 게시판 리스트</title>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<script type="text/javascript" src="/js/commonUtil.js"></script>
<script type="text/javascript">

/* paging */
function goPage(pageNo) {
	var f = document.page;
	f.pageNum.value = pageNo;
	f.submit();
}
</script>
</head>
<body onload="cmYTCaresInit()">
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="page" method="post" action="/BdBoardService/selectBoardList.do">
<input type="hidden" name="category" 	 value="${empty param.category?'01':param.category}"/>
<input type="hidden" name="sub_category" value="${param.sub_category}"/>
<input type="hidden" name="loggedUserId" value="${loggedUserId}" />
<input type="hidden" name="ytcaresAdmin" value="${ytcaresAdmin}" />
<input type="hidden" name="pageNum" 	 value=""/>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr valign="top">
		<td colspan="2"><img src='<spring:message code="img.board.bg" text="상단이미지"/>'/></td>
	</tr>
	<tr valign="top" style="margin:0;padding:0;">
		<td>
			<jsp:include page="/page/board/bdBoardMenu_f.jsp"/>
		</td>
		<td width="716">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
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
					<td>
						<table class="board-list" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom-color:#F5C7F0;table-layout: fixed;">
						<colgroup>
							<col width="70"/>
							<col width="420"/>
							<col width="100"/>
							<col width="100"/>
						</colgroup>
							<tr>
								<td colspan="4">
									<table class="header-board" width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td width="70"><spring:message code="lbl.num" text="번호"/></td>
											<td width="*"><spring:message code="lbl.title" text="제목"/></td>
											<td width="100"><spring:message code="lbl.board.id" text="작성자"/></td>
											<td width="100"><spring:message code="lbl.date" text="작성일"/></td>
										</tr>
									</table>
								</td>
							</tr>
							<c:choose>
							<c:when test="${empty boardList}">
							<tr>
								<td>&nbsp;</td>
								<td rowspan="10" colspan="3" align="center"><spring:message code="lbl.search.result.zero.board" text="게시판에저장된글이없습니다" javaScriptEscape="true"/></td>
							</tr>
								<c:forEach var="i" begin="1" end="9">
								<tr><td colspan="4">&nbsp;</td></tr>
								</c:forEach> 
							</c:when>
							<c:otherwise>
							<c:forEach var="board" items="${boardList}">
							<tr height="30px;">
								<td>${board.seq_no} </td>
								<c:choose>
								<c:when test="${param.sub_category eq '01'}">
								<td align="center">
									<div style="float:left;max-width:405px;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;">
										<a href="/BdBoardService/updateReadCount.do?ref_user_id=${board.ref_user_id}&seq_no=${board.seq_no}&category=${param.category}&sub_category=${param.sub_category}&pageNum=${param.pageNum}" class="gray">${board.title}</a>
									</div>
									<div style="float:left;max-width:15px;">
										<c:if test="${(today.time - board.reg_date.time)/(24*60*60*1000) le 3}">
										&nbsp;<img src="<spring:message code='img.new'/>" style="vertical-align:baseline;"/>
										</c:if>
									</div>	
								</td>
								</c:when>
								<c:otherwise>
									<c:choose>
									<c:when test="${(param.category eq '01' and  param.sub_category eq '01') or (board.reg_id eq loggedUserId) or ('admin' eq loggedUserId) or (board.ref_user_id eq loggedUserId)}">
										<td align="left">
										<a href="/BdBoardService/updateReadCount.do?ref_user_id=${board.ref_user_id}&seq_no=${board.seq_no}&category=${param.category}&sub_category=${param.sub_category}&pageNum=${param.pageNum}" class="gray">
										<c:set var="wid" value="${10 * (board.re_level-1)}" scope="page"></c:set>
											<c:choose>
											<c:when test="${board.re_level > 0}">
												<!-- 
												<img src="/images/level.gif" width="${wid}" border="0">
												 -->
												<img src="/images/icon_reply.gif" border="0" style="margin-left:${wid}px;" width="21" height="11" alt="re" /> ${board.title}
											</c:when>
											<c:otherwise>
												<div style="float:left;max-width:405px;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;">
													${board.title}
												</div>
												<div style="float:left;max-width:15px;">
													<c:if test="${(today.time - board.reg_date.time)/(24*60*60*1000) le 3}">
													&nbsp;<img src="<spring:message code='img.new'/>" style="vertical-align:baseline;"/>
													</c:if>
												</div>	
											</c:otherwise>
											</c:choose>
										</a>
										</td>
									</c:when>
									<c:otherwise>
										<td align="left">
										<c:set var="wid" value="${10* (board.re_level-1)}" scope="page"></c:set>
										<c:choose>
										<c:when test="${board.re_level > 0}">
											<!-- 
											<img src="/images/level.gif" width="${wid}" border="0">
											 -->
											<img src="/images/icon_reply.gif" border="0" style="margin-left:${wid}px;" width="21" height="11" alt="re"> ${board.title}
										</c:when>
										<c:otherwise>
											<div style="float:left;max-width:405px;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;">
												${board.title}
											</div>
											<div style="float:left;max-width:15px;">
												<c:if test="${(today.time - board.reg_date.time)/(24*60*60*1000) le 3}">
												&nbsp;<img src="<spring:message code='img.new'/>" style="vertical-align:baseline;"/>
												</c:if>
											</div>	
										</c:otherwise>
										</c:choose>
										</td>
									</c:otherwise>
									</c:choose>
								</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${(param.category eq '01' and  param.sub_category eq '01')}">
										<td>YTCares</td>
									</c:when>
									<c:when test="${(param.category eq '01' and  param.sub_category eq '02' and board.reg_id eq 'admin')}">
										<td>YTCares</td>
									</c:when>
									<c:otherwise>
										<td>${board.reg_id}</td>
									</c:otherwise>
								</c:choose>
								<td><fmt:formatDate value="${board.reg_date}" type="date" pattern="yyyy.MM.dd"/></td>
							</tr>
							</c:forEach>
							<c:if test="${fn:length(boardList) < 10}">
							<c:forEach var="i" begin="1" end="${10 - fn:length(boardList)}">
								<tr height="30px;"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
							</c:forEach>
							</c:if>
							</c:otherwise>
							</c:choose>
							<tr><td colspan="4" height="1" bgcolor="#F5C7F0"></td></tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td align="center" width="650"><ytcares:page count="${boardListCount}" pageNum="${param.pageNum}" onclick="goPage"/></td>
								<td align="right" valign="top" style="padding-top: 15px;">
								<c:choose>
								<c:when test="${'admin' eq loggedUserId}">
									<c:if test="${param.category eq '01' and param.sub_category eq '01'}">
										<a href="/AdBoardService/noticeInsertPage.do?category=${param.category}&sub_category=${param.sub_category}&pageNum=${param.pageNum}&chkKbn=insert">
										<img src='<spring:message code="img.board.add" text="등록"/>'></a>
									</c:if>
									<c:if test="${param.category eq '01' and param.sub_category eq '02'}">
									<a href="/AdBoardService/adminFaqInsertPage.do?category=${param.category}&sub_category=${param.sub_category}&pageNum=${param.pageNum}&chkKbn=insert">
									<img src='<spring:message code="img.board.add" text="등록"/>'></a>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${param.category eq '01' and param.sub_category eq '02'}">
										<a href="/BdBoardService/userInsertPage.do?category=${param.category}&sub_category=${param.sub_category}">
										<img src='<spring:message code="img.board.add" text="등록"/>'></a>
									</c:if>
								</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</table>
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
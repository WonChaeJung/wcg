<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<!--
file name : adNoticeListR.jsp
title     : 공지사항 게시물 리스트
date      : 2012/05/11
author    : Jung.B.R
revisions : 2012/05/14 – 최종작성 (revised by Jung.B.R)
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>
<script type="text/javascript" src="/js/commonUtil.js"></script>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript">

/* paging */
function goPage(pageNo) {
	var f = document.frm;
	f.pageNum.value = pageNo;
	f.submit();
}

/* 공지사항 수정*/
function bdUpdate(seq_no, category, sub_category, chkKbn, pageNum){

	document.frm.seq_no.value = seq_no;
	document.frm.category.value = category;
	document.frm.sub_category.value = sub_category;
	document.frm.pageNum.value = pageNum;
	document.frm.chkKbn.value = "update";
	document.frm.action = "/AdBoardService/updateReadCount.do";
	document.frm.submit();

}
</script>
</head>
<body onload="cmYTCaresInit()">
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="frm" method="post" action="/AdBoardService/adminSelectBoard.do">
<input type="hidden" name="chkKbn" 		 value=""/>
<input type="hidden" name="pageNum" 	 value=""/>
<input type="hidden" name="pageNumTemp"  value=""/>
<input type="hidden" name="seq_no" 		 value="${param.seq_no}"/>
<input type="hidden" name="category" 	 value="${empty param.category?'01':param.category}"/>
<input type="hidden" name="sub_category" value="${param.sub_category}"/>
<input type="hidden" name="loggedUserId" value="${loggedUserId}" />
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center" style="padding-top: 20px;">
	<tr valign="top">
		<td width="150" valign="top"><jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"/></td>
		<td width="750" style="padding-left: 2px;">
			<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0">
							<tr class="header-admin" height="34">
								<td width="70" class=""><spring:message code="lbl.num" text="번호"/></td>
								<td width="480" class=""><spring:message code="lbl.title" text="제목"/></td>
								<td width="100" class=""><spring:message code="lbl.date" text="작성일"/></td>
								<td width="100" class=""><spring:message code="lbl.count" text="조회수"/></td>
							</tr>
							<c:choose>
							<c:when test="${empty boardInfo}">
							<tr>
								<td>&nbsp;</td>
								<td class="board-line" rowspan="10" colspan="3" align="center"><spring:message code="lbl.search.result.zero.board" text="게시판에저장된글이없습니다" javaScriptEscape="true"/></td>
							</tr>
								<c:forEach var="i" begin="1" end="9">
								<tr><td colspan="4">&nbsp;</td></tr>
								</c:forEach> 
							</c:when>
							<c:otherwise>
							<c:forEach var="board" items="${boardInfo}">
							<tr height="30">
								<td class="board-line" width="70">${board.seq_no}</td>
								<td class="board-line" width="480" align="left" onclick="bdUpdate('${board.seq_no}','${category}','${sub_category}','${chkKbn}','${param.pageNum}')" style="cursor: pointer;">
									<div style="float:left;max-width:450px;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;">
										${board.title}
									</div>
									<div style="float:left;width: 30px;">
										<c:if test="${(today.time - board.reg_date.time)/(24*60*60*1000) le 3}">
										&nbsp;<img src="<spring:message code='img.new'/>" style="vertical-align:baseline;"/>
										</c:if>
									</div>	
								</td>
								<td class="board-line" width="100"><fmt:formatDate value="${board.reg_date}" type="date" pattern="yyyy-MM-dd"/></td>
								<td class="board-line" width="100">${board.read_cnt}</font></td>
							</tr>
							</c:forEach>
							<c:if test="${fn:length(boardInfo) < 10}">
							<c:forEach var="i" begin="1" end="${10 - fn:length(boardInfo)}">
								<tr height="30"><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
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
								<td align="center"><ytcares:page count="${boardListCount}" pageNum="${param.pageNum}" onclick="goPage"/></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="right">
						<img src='<spring:message code="img.board.add" text="글쓰기"/>' onclick="window.location='/AdBoardService/noticeInsertPage.do?category=${category}&sub_category=${sub_category}&chkKbn=insert'" style="cursor: pointer;"/>
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
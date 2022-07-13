<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<!--
file name : cmSiteTopMenu_f.jsp
title     : 탑메뉴
date      : 2012/04/05
author    : Jung.B.R
revisions : 2012/05/29 최종작성 (revised by Jung.B.R)
-->
<style type="text/css"> 
table.top_menu a {font-family:"verdana", "tahoma"; font-size:10.5px; color: #666666;}
<c:choose>
	<c:when test="${fn:startsWith(pageContext.request.requestURI, '/page/lecture/')}">
		table.top_menu {background:url(/images/top_bg_lecture.gif) no-repeat; height:92;}
	</c:when>
	<c:when test="${fn:startsWith(pageContext.request.requestURI, '/page/elearning/')}">
		table.top_menu {background:url(/images/top_bg_elearning.gif) no-repeat; height:92; }
	</c:when>
	<c:when test="${fn:startsWith(pageContext.request.requestURI, '/page/eshop/')}">
		table.top_menu {background:url(/images/top_bg_eshop.gif) no-repeat; height:92; }
	</c:when>
	<c:when test="${fn:startsWith(pageContext.request.requestURI, '/page/board/')}">
		table.top_menu {background:url(/images/top_bg_board.gif) no-repeat; height:92; }
	</c:when>
	<c:when test="${fn:startsWith(pageContext.request.requestURI, '/page/common/cmSiteMain.jsp')}">
		table.top_menu {height:92; }
	</c:when>
	<c:when test="${fn:startsWith(pageContext.request.requestURI, '/page/common/')}">
		table.top_menu {background:url(/images/top_bg_center.gif) no-repeat; height:92; }
	</c:when>
	<c:when test="${fn:startsWith(pageContext.request.requestURI, '/page/member/')}">
		table.top_menu {background:url(/images/top_bg_center.gif) no-repeat; height:92; }
	</c:when>
	<c:when test="${fn:startsWith(pageContext.request.requestURI, '/page/introduce/')}">
		table.top_menu {background:url(/images/top_bg_intro.gif) no-repeat; height:92; }
	</c:when>
</c:choose>
</style>
<script type="text/javascript">
function scrollByDown() {
	window.scrollBy(0, screen.height);
}
function submitChk(formName){
	var frm = eval('document.'+formName);
	frm.submit();
}
</script>
<table class="top_menu" width="900" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td style="padding-top: 5px;" colspan="8"></td>
	</tr>
	<tr height="24">
		<td colspan="2">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<c:choose>
					<c:when test="${empty loggedUserId}">
						<%-- 로그인 하지 않았을 경우 --%>
						<td align="right" width="563"><a href="/CmUserService/callUserLogin.do"><img src='<spring:message code="img.btn.login" text="로그인"/>'></a></td>
						<td><a href="/CmUserService/callUserAgree.do"><img src='<spring:message code="img.top.menu.join" text="회원가입"/>'/></a></td>
					</c:when>
					<c:otherwise>
						<%-- 로그인 했을 경우 --%>
						<td align="right" width="563"><a href="/CmUserService/logout.do"><img src='<spring:message code="img.btn.logout" text="로그아웃"/>'></a></td>
						<c:choose>
							<c:when test="${loggedUserGrade eq ytcaresAdmin}">
								<td width=""><a href="/AdLectureService/adminSelectLecList.do?admin_menu=0"><img src='<spring:message code="img.top.menu.mypage" text="마이페이지"/>'/></a></td>
							</c:when>
							<c:otherwise>
								<td width=""><a href="/MbMyPageService/userSelectMyInfo.do"><img src='<spring:message code="img.top.menu.mypage" text="마이페이지"/>'/></a></td>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				<td width="1"><img src="/images/top_menu_bar.gif"></td>
				<td width=""><a href="/EsCsmtOrderService/callCsmtCart.do"><img src='<spring:message code="img.top.menu.cart" text="장바구니"/>'/></a></td>
				<td width="1"><img src="/images/top_menu_bar.gif"></td>
				<td width=""><a href="/MbMyPageService/userSelectPrchsList.do"><img src='<spring:message code="img.top.menu.order" text="주문배송조회"/>'/></a></td>
				<td width="22" align="center"><a href="/changeLocal.do?locale=ko"><img src="/images/top_menu_icon_ko.jpg"></a></td>
				<td width="22" style="padding-right: 7px;"><a href="/changeLocal.do?locale"><img src="/images/top_menu_icon_zh.gif"></a></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr height="56">
		<td align="left" colspan="2">
			<a href="/main.do"><img src="/images/top_menu_logo.gif"></a>
		</td>
	</tr>
	<tr height="31" valign="top">
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td onclick="javascript:location.href='/LtLectureService/selectLecList.do';">
						<img src='<spring:message code="img.menu.lecture" text="교육"/>' onmouseover="this.src='<spring:message code="img.menu.over.lecture"/>'" onmouseout="this.src='<spring:message code="img.menu.lecture"/>'" width="123" height="31" style="cursor: pointer;"/>
					</td>
					<td><img src="/images/top_menu_line.gif" width="1" height="31"/></td>
					<td onclick="javascript:location.href='/ElElearnService/selectMovList.do?category=02&sub_category=01&pageSize=5';">
						<img src='<spring:message code="img.menu.elearning" text="온라인강의"/>' onmouseover="this.src='<spring:message code="img.menu.over.elearning"/>'" onmouseout="this.src='<spring:message code="img.menu.elearning"/>'" width="141" height="31" style="cursor: pointer;">
					</td>
					<td><img src="/images/top_menu_line.gif" width="1" height="31"/></td>
					<td onclick="javascript:location.href='/EsCsmtService/selectCsmtList.do?csmt_kind_cd=ALL&pageSize=6';">
						<img src='<spring:message code="img.menu.eshop" text="쇼핑몰"/>' onmouseover="this.src='<spring:message code="img.menu.over.eshop"/>'" onmouseout="this.src='<spring:message code="img.menu.eshop"/>'" width="124" height="31" style="cursor: pointer;">
					</td>
					<td><img src="/images/top_menu_line.gif" width="1" height="31"/></td>
					<td onclick="javascript:location.href='/BdBoardService/selectBoardList.do?category=01&sub_category=01';">
						<img src='<spring:message code="img.menu.board" text="게시판"/>' onmouseover="this.src='<spring:message code="img.menu.over.board"/>'" onmouseout="this.src='<spring:message code="img.menu.board"/>'" width="115" height="31" style="cursor: pointer;">
					</td>
					<td><img src="/images/top_menu_space.gif" width="35" height="31"></td>
					<td onclick="javasctipt:location.href='/ItIntroService/viewIntroduce.do';"><img src='<spring:message code="img.menu.intro" text="회사소개" />' onmouseover="this.src='<spring:message code="img.menu.over.intro"/>'" onmouseout="this.src='<spring:message code="img.menu.intro"/>'" width="119" height="31" style="cursor: pointer;"></td>
					<td><img src='<spring:message code="img.menu.advice" text="구매상담신청"/>'" width="124" height="31"></td>
					<td><a href="/CmUserService/callCstmrCenter.do"><img src='<spring:message code="img.menu.center" text="고객센터"/>' onmouseover="this.src='<spring:message code="img.menu.over.center"/>'" onmouseout="this.src='<spring:message code="img.menu.center"/>'" width="116" height="31" style="cursor: pointer;"></a></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<form name="callMyInfo" action="/MbMyPageService/userSelectMyInfo.do" method="post"></form>
<!-- top end -->
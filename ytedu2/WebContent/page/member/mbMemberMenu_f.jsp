<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags"%>
<c:set var="uri" value="${pageContext.request.requestURI}"/>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="left">
	<tr>
		<td>
			<img src='<spring:message code="img.member.bg"/>'/>
		</td>
	</tr>	
	<tr valign="top">
		<td style="padding-top: 20px;">
			<table class="tab-menu2" width="100%" height="30" cellpadding="0" cellspacing="0" border="0">
				<colgroup>
					<col width="85"/>
					<col width="85"/>
					<col width="85"/>
					<c:if test="${loggedUserGrade eq 2 or loggedUserGrade eq 3}">
					<col width="120"/>
					</c:if>
					<col width="*"/>
				</colgroup>
				<tr>
					<td onclick="location.href='/MbMyPageService/userSelectMyInfo.do'"><a href="javascript:void(0)"><img src='<spring:message code="img.menu.my.info" text="내정보"/>' /></a></td>
					<td onclick="location.href='/MbMyPageService/userSelectPrchsList.do'"><a href="javascript:void(0)"><img src='<spring:message code="img.menu.buy.list" text="구매이력"/>'/></a></td>
					<td onclick="location.href='/MbMyPageService/userSelectAccmPntList.do'"><a href="javascript:void(0)"><img src='<spring:message code="img.menu.point.status" text="적립금현황"/>'/></a></td>
					<c:if test="${loggedUserGrade eq 2 or loggedUserGrade eq 3}">
						<td onclick="location.href='/MbMyPageService/userSelectLecList.do?pageSize=5'"><a href="javascript:void(0)"><spring:message code="menu.lec.app.user" text="교육신청자관리"/></a></td>
					</c:if>
				<!--  
					<td class="tab ${fn:contains(uri, 'mbMyInfoU.jsp')?'select':'deselect'}" onclick="location.href='/MbMyPageService/userSelectMyInfo.do'"><a href="javascript:void(0)"><spring:message code="menu.my.info" text="내정보"/></a></td>
					<td class="tab ${fn:contains(uri, 'mbPrchsListR.jsp')?'select':'deselect'}" onclick="location.href='/MbMyPageService/userSelectPrchsList.do'"><a href="javascript:void(0)"><spring:message code="menu.buy.list" text="구매이력"/></a></td>
					<td class="tab ${fn:contains(uri, 'mbAccmPntR.jsp')?'select':'deselect'}" onclick="location.href='/MbMyPageService/userSelectAccmPntList.do'"><a href="javascript:void(0)"><spring:message code="menu.point.status" text="적립금현황"/></a></td>
					<c:if test="${loggedUserGrade eq 2 or loggedUserGrade eq 3}">
					<td class="tab ${fn:contains(uri, 'mbLecListR.jsp')?'select':'deselect'}" onclick="location.href='/MbMyPageService/userSelectLecList.do?pageSize=5'"><a href="javascript:void(0)"><spring:message code="menu.lec.app.user" text="교육신청자관리"/></a></td>
					</c:if>
				-->
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
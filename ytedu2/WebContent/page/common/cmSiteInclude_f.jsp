<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- JSP화면 공통변수 선언 --%>

<%@page import="java.sql.Timestamp"%><c:set var="ctxPath"			value="${pageContext.request.contextPath}" scope="request"/>
<%-- 유저정보 --%>
<c:set var="loggedUserId"		value="${sessionScope['com.ytcares.user.bean'].user_id}" scope="request"/>
<c:set var="loggedUserName"		value="${sessionScope['com.ytcares.user.bean'].user_name}" scope="request"/>
<c:set var="loggedUserAgency"	value="${sessionScope['com.ytcares.user.bean'].agency_name}" scope="request"/>
<c:set var="loggedUserRcmmdId"	value="${sessionScope['com.ytcares.user.bean'].rcmmd_id}" scope="request"/>
<c:set var="loggedUserFamilyId"	value="${sessionScope['com.ytcares.user.bean'].family_id}" scope="request"/>
<c:set var="loggedUserCellPhone" value="${sessionScope['com.ytcares.user.bean'].cell_phone}" scope="request"/>
<c:set var="loggedUserPhone" 	value="${sessionScope['com.ytcares.user.bean'].phone}" scope="request"/>
<c:set var="loggedUserEmail"	value="${sessionScope['com.ytcares.user.bean'].email}" scope="request"/>
<c:set var="loggedUserZipcode"	value="${sessionScope['com.ytcares.user.bean'].zipcode}" scope="request"/>
<c:set var="loggedUserAddr"		value="${sessionScope['com.ytcares.user.bean'].addr}" scope="request"/>
<c:set var="loggedUserGrade"	value="${sessionScope['com.ytcares.user.bean'].grade}" scope="request"/>
<c:set var="loggedUserRegDate"	value="${sessionScope['com.ytcares.user.bean'].reg_date}" scope="request"/>
<%-- 사용자등급 --%>
<c:set var="ytcaresAdmin"		value="1" scope="request"/>
<c:set var="ytcaresSupAgency"	value="2" scope="request"/>
<c:set var="ytcaresSubAgency"	value="3" scope="request"/>
<c:set var="ytcaresAgency"		value="4" scope="request"/>
<c:set var="ytcaresMember"		value="8" scope="request"/>
<c:set var="ytcaresUser"		value="9" scope="request"/>

<% 
	Timestamp time = new Timestamp(System.currentTimeMillis());
	request.setAttribute("today", time);
%>



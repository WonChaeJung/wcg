<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//화면초기화
	cmYTCaresInit();
});

function goPage(pageNum) {
	var srchFrm = lecForm;
	srchFrm.pageNum.value = pageNum;
	srchFrm.lec_seq_no.value = '';
	srchFrm.action = '/MbMyPageService/userSelectLecList.do';
	srchFrm.target = '_self';
	srchFrm.submit();
}

function searchLecAppList(lecSeqNo) {
	var srchFrm = lecForm;
	srchFrm.pageNum.value = 1;
	srchFrm.lec_seq_no.value = lecSeqNo;
	srchFrm.action = '/MbMyPageService/userSelectLecAppList.do';
	srchFrm.target = 'lecAppFrame';
	srchFrm.submit();
}
</script>
</head>

<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp" />
<form name="lecForm" method="post" action="">
	<input type="hidden" name="pageSize" value="5"/>
	<input type="hidden" name="pageNum" value=""/>
	<input type="hidden" name="lec_seq_no" value=""/>
</form>
<table width="900" class="ytcares-content" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td>
			<jsp:include page="/page/member/mbMemberMenu_f.jsp"/>
		</td>
	</tr>
	<tr>
		<td valign="top">
			<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
				<colgroup>
					<col width="45"/>
					<col width="150"/>
					<col width="200"/>
					<col width="130"/>
					<col width="*"/>
					<col width="120"/>
					<col width="50"/>
				</colgroup>
				<tr class="header">
					<td><spring:message code='lbl.number' text='순번'/></td>
					<td><spring:message code='lbl.lec.name' text='교육이름'/></td>
					<td><spring:message code='lbl.lec.day' text='교육일'/></td>
					<td><spring:message code='lbl.lec.time' text='교육시간'/></td>
					<td><spring:message code='lbl.lec.place' text='교육장소'/></td>
					<td><spring:message code='lbl.lec.agent' text='교육주체'/></td>
					<td><spring:message code='lbl.check' text='조회'/></td>
				</tr>
				<c:if test="${empty userLecList}">
					<tr height="130">
						<td colspan="7"><spring:message code='lbl.undefind.data' text='데이터가 존재하지 않습니다.'/></td>
					</tr>
				</c:if>
				<c:if test="${!empty userLecList}">
					<c:forEach var="userLec" items="${userLecList}">
					<tr>
						<td>${userLec.lec_seq_no}</td>
						<td align="left">${userLec.lec_title}</td>
						<td>${userLec.lec_st_date} ~ ${userLec.lec_ed_date}</td>
						<td>${userLec.lec_time}</td>
						<td align="left">${userLec.lec_loc}</td>
						<td align="left">${userLec.lec_host}</td>
						<td><input type="button" value="<spring:message code='lbl.check' text='조회'/>" style='cursor:pointer;' onclick="searchLecAppList('${userLec.lec_seq_no}')"/></td>
					</tr>
					</c:forEach>
					<c:if test="${fn:length(userLecList) < 5}">
						<c:forEach var="i" begin="1" end="${5 - fn:length(userLecList)}">
							<tr><td colspan="7">&nbsp;</td></tr>
						</c:forEach>
					</c:if>
				</c:if>
			</table>
			<table class="paging" cellpadding="0" cellspacing="0" border="0" align="center">
				<tr>
					<td><ytcares:page count="${count}" pageSize="5" pageNum="${param.pageNum}" onclick="goPage"/></td>
				</tr>
			</table>
			<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
				<tr>
					<td width="100%" align="center">
						<iframe width="100%" height="215" scrolling="no" name="lecAppFrame" src="/MbMyPageService/userSelectLecAppList.do" frameborder="0"></iframe>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp" />
<!-- 공통메세지처리 -->
<ytcares:msg/>
</body>
</html>
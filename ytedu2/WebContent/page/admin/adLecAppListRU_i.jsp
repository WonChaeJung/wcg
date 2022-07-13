<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<!--
file name : adLecAppListRU_i.jsp
title     : 교육신청관리_iframe(관리자)
date      : 2012/05/16
author    : Kim.S.D
revisions : 2012/05/17 – 최종작성 (revised by Kim.S.D)
-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//화면초기화
	cmYTCaresInit();

	$(':checkbox[name=user_id]').click(function(){
		$(this).parent().parent().find('select[name=app_stat_cd],input[name=rmrks]').prop('disabled', !this.checked);
	});	
});

/* paging */
function goPage(pageNo) {
	var f = document.page;
	f.pageNum.value = pageNo;
	f.action = "/AdLectureService/adminSelectLecAppList.do";
	f.submit();
}

function updAppData() {
	if ($(':checked[name=user_id]').length == 0) {
		alert("<spring:message code='error.require.select.user' text='대상자를 선택해 주십시오.'/>");
		return false;
	} else {
		if (confirm("<spring:message code='confirm.update' text='수정하시겠습니까?'/>")) {
			document.page.action = '/AdLectureService/adminUpdateLecAppInfo.do';
			document.page.submit();
		}
	}
}

function checkAll(isCheck) {
	$(':checkbox[name=user_id]').prop('checked', isCheck);
	if (isCheck) {
		$('select[name=app_stat_cd]').prop('disabled', false);
		$('input[name=rmrks]').prop('disabled', false);
	} else {
		$('select[name=app_stat_cd]').prop('disabled', true);
		$('input[name=rmrks]').prop('disabled', true);
	}
}
</script>
</head>
<body>
<form name="page" method="post" action="/AdLectureService/adminUpdateLecAppInfo.do">
<input type="hidden" name="pageNum" value="${param.pageNum}"/>
<input type="hidden" name="pageSize" value="5"/>
<input type="hidden" name="lec_seq_no" value="${param.lec_seq_no}"/>

<table style="width:750px; padding-top: 5px" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td width="100%" bgcolor="#ffffff" valign="top" align="center">
			<table class="board-list" style="width:750px;table-layout: fixed;" cellpadding="0" cellspacing="0" border="0">
				<tr class="header-admin">
					<td width="40" align="center"><input type="checkbox" value="1" onclick="checkAll(this.checked)" style="background-color: #f5f5f5"/></td>
					<td width="40"><spring:message code='lbl.number' text='순번'/></td>
					<td width="120"><spring:message code='lbl.agency.name' text='가맹점'/></td>
					<td width="150"><spring:message code='lbl.phone' text='연락처'/></td>
					<td width="170"><spring:message code='lbl.email' text='E-mail'/></td>
					<td width="80"><spring:message code='lbl.app.status' text='신청상태'/></td>
					<td width="150"><spring:message code='lbl.etc' text='비고'/></td>
				</tr>
				<c:if test="${empty LecAppList}">
				<tr height="130">
					<td colspan="7" align='center'><spring:message code='lbl.undefind.data' text='데이터가 없습니다.'/></td>
				</tr>
				</c:if>
				<c:if test="${count gt 0}">
				<c:forEach var="lecApp" items="${LecAppList}">
				<tr height="30">
					<td align="center"><input type="checkbox" name="user_id" value="${lecApp.user_id}"/></td>
					<td>${lecApp.rn}</td>
					<td align='left'>${lecApp.agency_name}</td>
					<td>${lecApp.cell_phone}</td>
					<td align='left'>${lecApp.email}</td>
					<td>
						<ytcares:code name="app_stat_cd" mcodeCd="LT002" lblCol="CODE_NM1" valCol="DCODE_CD" selected="${lecApp.app_stat_cd}" disabled="disabled"/>
					</td>
					<td align="left"><input type="text" name="rmrks" value="${lecApp.rmrks}" maxlength="500" maxbyte="500" disabled="disabled" style="width:140px;"/></td>
				</tr>
				</c:forEach>
				<c:if test="${fn:length(LecAppList) < 5}">
				<c:forEach var="i" begin="1" end="${5 - fn:length(LecAppList)}">
					<tr height="30">
						<td colspan="7">&nbsp;</td>
					</tr>
				</c:forEach>
				</c:if>
				</c:if>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<ytcares:page count="${count}" pageSize="5" pageNum="${param.pageNum}" onclick="goPage"/>
			<img src="<spring:message code='img.board.modify' text='수정'/>" onclick="updAppData()" style="padding-top: 20px;cursor: pointer;">
		</td>
	</tr>
</table>
</form>
<ytcares:msg/>
</body>
</html>
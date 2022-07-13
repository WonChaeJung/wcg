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

	$(':checkbox[name=user_id]').click(function(){
		$(this).parent().parent().find('select[name=app_stat_cd],input[name=rmrks]').prop('disabled', !this.checked);
	});	
});
function goPage(pageNum) {
	document.lecAppForm.pageNum.value = pageNum;
	document.lecAppForm.action = '/MbMyPageService/userSelectLecAppList.do';
	document.lecAppForm.submit();
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

function lecAppUpdate() {
	if ($(':checked[name=user_id]').length == 0) {
		alert('<spring:message code="error.require.select.user" text="대상자를 선택해주십시오."/>');
		return false;
	} else {
		if (confirm('<spring:message code="confirm.update" text="수정하시겠습니까?"/>')) {
			document.lecAppForm.action = '/MbMyPageService/userLecAppUpdate.do';
			document.lecAppForm.submit();
		}
	}
}
</script>
</head>

<body>
<form name="lecAppForm" method="post" action="/MbMyPageService/userLecAppUpdate.do">
	<input type="hidden" name="pageNum" value="${param.pageNum}"/>
	<input type="hidden" name="pageSize" value="5"/>
	<input type="hidden" name="lec_seq_no" value="${param.lec_seq_no}"/>

<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td valign="top">
			<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
				<colgroup>
					<col width="30"/>
					<col width="60"/>
					<col width="100"/>
					<col width="100"/>
					<col width="150"/>
					<col width="*"/>
					<col width="85"/>
					<col width="230"/>
				</colgroup>
				<tr class="header">
					<th><input type="checkbox" value="1" style='cursor:pointer;' onclick="checkAll(this.checked)"/></th>
					<th><spring:message code='lbl.number' text='순번'/></th>
					<th><spring:message code='lbl.agency.name' text='가맹점명'/></th>
					<th><spring:message code='lbl.date' text='신청일'/></th>
					<th><spring:message code='lbl.phone' text='연락처'/></th>
					<th><spring:message code='lbl.email' text='E-mail'/></th>
					<th><spring:message code='lbl.app.status' text='신청상태'/></th>
					<th><spring:message code='lbl.etc' text='비고'/></th>
				</tr>
				<c:if test="${empty lecAppList}">
					<tr height="130">
						<td colspan="8"><spring:message code='lbl.undefind.data' text='데이터가 존재하지 않습니다.'/></td>
					</tr>
				</c:if>
				<c:if test="${!empty lecAppList}">
					<c:forEach var="lecApp" items="${lecAppList}">
					<tr>
						<td><input type="checkbox" name="user_id" value="${lecApp.user_id}"/></td>
						<td>${lecApp.rn}</td>
						<td align="left">${lecApp.agency_name}</td>
						<td><fmt:formatDate value="${lecApp.app_date}" pattern="yyyy-MM-dd"/></td>
						<td>${lecApp.cell_phone}</td>
						<td>${lecApp.email}</td>
						<td><ytcares:code name="app_stat_cd" mcodeCd="LT002" lblCol="CODE_NM1" valCol="DCODE_CD" selected="${lecApp.app_stat_cd}" disabled="disabled"/></td>
						<td align="left"><input type="text" name="rmrks" value="${lecApp.rmrks}" maxlength="500" maxbyte="500" disabled="disabled" style="width:225px;"/> </td>
					</tr>
					</c:forEach>
					<c:if test="${fn:length(lecAppList) < 5}">
						<c:forEach var="i" begin="1" end="${5 - fn:length(lecAppList)}">
							<tr><td colspan="8">&nbsp;</td></tr>
						</c:forEach>
					</c:if>
				</c:if>
			</table>
			<table class="paging" cellpadding="0" cellspacing="0" border="0" align="center">
				<tr>
					<td width="100%"><ytcares:page count="${count}" pageSize="5" pageNum="${param.pageNum}" onclick="goPage"/></td>
				</tr>
			</table>
			<input type="button" value="<spring:message code='btn.insert' text='등록'/>" onclick="lecAppUpdate()" style="float:right;cursor:pointer;">
		</td>
	</tr>
</table>
</form>
<ytcares:msg/>
</body>
</html>
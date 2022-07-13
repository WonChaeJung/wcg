<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery-ui.min.css"/>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//화면초기화
	cmYTCaresInit();
});
function chkAct(str){
	var f = document.frm;
	switch (str) {
	case 'list':
		f.action="/AdLectureService/adminSelectLecReqList.do";
		f.submit();
		break;
	case 'delete':
		if(confirm("<spring:message code='confirm.delete' text='정말 삭제하시겠습니까?'/>")){
			f.action="/AdLectureService/adminDeleteLecReq.do";
			f.submit();
		}else{
			return false;
		}
		break;
	default:
		break;
	}
}
</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="frm" method="post">
<c:set var="lecReq" value="${LecReqInfo[0]}"/>
<input type="hidden" name="lec_req_no" value="${lecReq.lec_req_no}" />
<table class="ytcares-content" width="900" cellpadding="0" cellspacing="0" border="0" align="center" style="padding-top: 20px;">
<tr>
	<td width="150" valign="top"><jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"/></td>
	<td width="750" valign="top">
		<table class="ytcares-detail" style="width:750px;margin-left:2px;table-layout: fixed;" cellpadding="0" cellspacing="0" border="0">
			<colgroup>
				<col width="80">
				<col width="120">
				<col width="80">
				<col width="140">
				<col width="80">
				<col width="*">
			</colgroup>
			<tr class="gray">
				<td class="det-label"><spring:message code='lbl.title' text='제목'/></td>
				<td class="det-value-border" colspan="5">${lecReq.lec_req_title }</td>
			</tr>
			<tr class="gray">
				<td class="det-label"><spring:message code='lbl.agency' text='가맹점'/></td>
				<td class="det-value-border">${lecReq.agency_name }</td>
				<td class="det-label"><spring:message code='lbl.phone' text='연락처'/></td>
				<td class="det-value-border">${lecReq.cell_phone }</td>
				<td class="det-label"><spring:message code='lbl.email' text='E-mail'/></td>
				<td  class="det-value-border">${lecReq.email }</td>
			</tr>
			<tr>
				<td style="height:2px;"></td>
			</tr>
			<tr>
				<td colspan="6" class="gray">
					${lecReq.lec_req_desc}
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<img src="<spring:message code='img.board.delete' text='삭제'/>" onclick="chkAct('delete')" style="cursor: pointer;padding-top: 20px;">
					<img src="<spring:message code='img.board.confirm' text='확인'/>" onclick="chkAct('list')" style="cursor: pointer;padding-top: 20px;">
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
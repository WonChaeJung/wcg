<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<!--
file name : adLecInfoCUD.jsp
title     : 교육등록 및 수정(관리자)
date      : 2012/05/15
author    : Kim.S.D
revisions : 2012/05/15 – 최종작성 (revised by Kim.S.D)
-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<link href="/css/ytcares-calendar.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>
<script src="../js/commonValidation.js"></script>
<script src="../js/commonUtil.js"></script>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/ytcares-calendar.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//화면초기화
	cmYTCaresInit();
	var lec_st_date = new BsCalendar('lec_st_date', {useTrigger:1, datePattern:'yyyyMMdd'});
	lec_st_date.showCal();
	CKEDITOR.replace('lec_desc', {height:300});

	var lec_time = $('#lec_time').val();
	if (lec_time != '' && lec_time != null && lec_time != undefined) {
		var arrTime = lec_time.split('~');
		var lec_time_start_hh	= $.trim(arrTime[0]).split(':')[0];
		var lec_time_start_mm	= $.trim(arrTime[0]).split(':')[1];
		var lec_time_end_hh		= $.trim(arrTime[1]).split(':')[0];
		var lec_time_end_mm		= $.trim(arrTime[1]).split(':')[1];

		$('#lec_time_start_hh').val(lec_time_start_hh);
		$('#lec_time_start_mm').val(lec_time_start_mm);
		$('#lec_time_end_hh').val(lec_time_end_hh);
		$('#lec_time_end_mm').val(lec_time_end_mm);
	} 
});
function actionChk(act){
	//validation check
	var editor = CKEDITOR.instances.lec_desc;
	editor.updateElement();

	var lec_time_start	= $('#lec_time_start_hh').val() + ':' + $('#lec_time_start_mm').val();
	var lec_time_end	= $('#lec_time_end_hh').val() + ':' + $('#lec_time_end_mm').val();
	if (lec_time_end < lec_time_start) {
		alert("<spring:message code='error.start.end.time' text='종료시간은 시작시간 이후로 선택해 주십시오.'/>");
		return false;
	} else {
		$('#lec_time').val(lec_time_start + '~' + lec_time_end);	
	}
	//캘린더 날짜포맷지정으로 불요
	//var date = document.frm.lec_st_date.value;
	//document.frm.lec_st_date.value = date.replace(/-/g, "");
	
	if(!cmChkForm2("frm"))return false;

	switch(act){
	case'insert':
		if(confirm("<spring:message code='confirm.insert' text='등록하시겠습니까?'/>")){
		document.frm.action="/AdLectureService/adminInsertLecInfo.do";
		document.frm.submit();
		}
	break;
	case'update':
		if(confirm("<spring:message code='confirm.update' text='수정하시겠습니까?'/>")){
		document.frm.action="/AdLectureService/adminUpdateLecInfo.do";
		document.frm.submit();
		}
	break;
	case'delete':
		if(confirm("<spring:message code='confirm.delete' text='삭제하시겠습니까?'/>")){
		document.frm.action="/AdLectureService/adminDeleteLecInfo.do";
		document.frm.submit();
		}
	break;
	default : 
	return false;
	}
	
}
</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="frm" method="post">
<c:set var="lecInfo" value="${LectureList[0]}"/>
<input type="hidden" name="lec_seq_no" value="${lecInfo.lec_seq_no}"/>
<table class="ytcares-content" width="900" cellpadding="0" cellspacing="0" border="0" align="center" style="padding-top: 20px;">
<tr>
	<td width="150" valign="top"><jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"/></td>
	<td width="750">
		<table  class="ytcares-detail" style="width:750px;margin-left:2px;" cellpadding="0" cellspacing="0" border="0">
			<colgroup>
				<col width="100"/>
				<col width="100"/>
				<col width="100"/>
				<col width="110"/>
				<col width="100"/>
				<col width="*"/>
			</colgroup>
			<tr>
				<td class="det-label"><spring:message code='lbl.lec.name' text='교육이름'/></td>
				<td class="det-value" >
					<input type="text" name="lec_title" value="${lecInfo.lec_title}" size="13" required="required" maxlength="300" maxbyte="300">
				</td>
				<td class="det-label"><spring:message code='lbl.lec.day' text='교육일'/></td>
				<td class="det-value">
					<input type="text" id="lec_st_date" name="lec_st_date" value="${lecInfo.lec_st_date}" readonly="readonly" size="10" required="required" chkType="date">
				</td>
				<td class="det-label"><spring:message code='lbl.lec.time' text='교육시간'/></td>
				<td class="det-value">
					<input type="hidden" id="lec_time" name="lec_time" value="${lecInfo.lec_time}" required="required">
					
					<select id="lec_time_start_hh" name="lec_time_start_hh" style="width:45px">
					<c:forEach var="i" begin="0" end="23">
						<option value="<fmt:formatNumber value='${i}' pattern='00'/>"><fmt:formatNumber value='${i}' pattern='00'/></option>
					</c:forEach>
					</select>
					:
					<select id="lec_time_start_mm" name="lec_time_start_mm" style="width:45px">
					<c:forEach var="i" begin="0" end="55" step="5">
						<option value="<fmt:formatNumber value='${i}' pattern='00'/>"><fmt:formatNumber value='${i}' pattern='00'/></option>
					</c:forEach>
					</select>
					~
					<select id="lec_time_end_hh" name="lec_time_end_hh" style="width:45px">
					<c:forEach var="i" begin="0" end="23">
						<option value="<fmt:formatNumber value='${i}' pattern='00'/>"><fmt:formatNumber value='${i}' pattern='00'/></option>
					</c:forEach>
					</select>
					:
					<select id="lec_time_end_mm" name="lec_time_end_mm" style="width:45px">
					<c:forEach var="i" begin="0" end="55" step="5">
						<option value="<fmt:formatNumber value='${i}' pattern='00'/>"><fmt:formatNumber value='${i}' pattern='00'/></option>
					</c:forEach>
					</select>
					<!-- 
					<input type="text" name="lec_time" value="${lecInfo.lec_time}" required="required" maxlength="50" maxbyte="50">
					 -->
				</td>
			</tr>
			<tr>
				<td class="det-label"><spring:message code='lbl.lec.place' text='교육장소'/></td>
				<td class="det-value">
					<input type="text" name="lec_loc" value="${lecInfo.lec_loc}" size="13" required="required" maxlength="200" maxbyte="200">
				</td>
				<td class="det-label" width="100"><spring:message code='lbl.lec.agent' text='교육주체'/></td>
				<td class="det-value">
					<select name="lec_host" required="required" style="width:100px;">
						<option value="">
						<c:forEach var="user" items="${UserList}">
							<option value="${user.agency_name}" 
								<c:if test="${lecInfo.lec_host eq user.agency_name}">
									selected='selected'
								</c:if>
							>${user.agency_name}
							</option>
						</c:forEach>
					</select>
				</td>
				<td class="det-label"><spring:message code='lbl.status' text='상태'/></td>
				<td class="det-value">
					<ytcares:code mcodeCd="LT001" lblCol="CODE_NM1" valCol="DCODE_CD" name="lec_stat_cd" required="required" blank=" " selected="${lecInfo.lec_stat_cd}"/>
				</td>
			</tr>
			<tr>
				<td style="height:3px;"></td>
			</tr>
			<tr>
				<td colspan="6">
					<textarea name="lec_desc" id="lec_desc" style="width:100%;margin-top:5px;" required="required" maxlength="4000" maxbyte="4000">${lecInfo.lec_desc}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="6" align='center'>
					<c:choose>
					<c:when test="${empty lecInfo}">
						<img src="<spring:message code='img.btn.insert' text='등록'/>" onclick="actionChk('insert')" style="padding-top: 20px;cursor: pointer;">
					</c:when>
					<c:otherwise>
						<img src="<spring:message code='img.board.delete' text='삭제'/>" onclick="actionChk('delete')" style="padding-top: 20px;cursor: pointer;">
						<img src="<spring:message code='img.board.modify' text='수정'/>" onclick="actionChk('update')" style="padding-top: 20px;cursor: pointer;">
					</c:otherwise>
				</c:choose>
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
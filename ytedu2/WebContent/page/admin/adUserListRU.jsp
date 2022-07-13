<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%> 
<%@taglib prefix="ytcares"	uri="http://www.backsaninfo.com/jsp/core"%>
<!--
file name : adUserListRU.jsp
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/ytcares-calendar.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery-ui.min.css"/>

<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/ytcares-calendar.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var bsCal1 = new BsCalendar('bsCal1', {useTrigger:1,max:'today',leObjId:'bsCal2'});
	var bsCal2 = new BsCalendar('bsCal2', {useTrigger:1,max:'today',geObjId:'bsCal1'});
	bsCal1.showCal();
	bsCal2.showCal();

	initSrchForm();
});
/* paging */
function goPage(pageNo) {
	var f = document.agencySrchForm;
	f.pageNum.value 	= pageNo;
	f.grade.value		= f.pageGrade.value;
	f.agency_name.value = f.pageAgency_name.value;
	f.reg_date1.value	= f.pageReg_date1.value;
	f.reg_date2.value	= f.pageReg_date2.value;
	f.submit();
}
function SrchChk(){
	if(document.agencySrchForm.grade.value=="0"){document.agencySrchForm.grade.value="";}	
	document.agencySrchForm.submit();
}
function insertFormInput(rn){
	var userId="USER_ID"+rn,userName="USER_NAME"+rn,agencyName="AGENCY_NAME"+rn,familyId="FAMILY_ID"+rn;
	var email ="EMAIL"+rn,cellPhone ="CELL_PHONE"+rn,addr="ADDR"+rn,phone="PHONE"+rn;
	var grade = "GRADE"+rn,user_pass = "USER_PASS"+rn;
	var frm = document.agencySrchForm;

	document.agencyInsertfrm.user_id.value		= eval("frm."+userId).value;
	document.agencyInsertfrm.user_name.value	= eval("frm."+userName).value;
	document.agencyInsertfrm.agency_name.value	= eval("frm."+agencyName).value;
	document.agencyInsertfrm.family_id.value	= eval("frm."+familyId).value;
	document.agencyInsertfrm.email.value		= eval("frm."+email).value;
	document.agencyInsertfrm.cell_phone.value	= eval("frm."+cellPhone).value;
	document.agencyInsertfrm.phone.value		= eval("frm."+phone).value;
	document.agencyInsertfrm.addr.value			= eval("frm."+addr).value;
	document.agencyInsertfrm.user_pass.value	= eval("frm."+user_pass).value;
	document.agencyInsertfrm.grade.value		= eval("frm."+grade).value;
	/* 
	switch(eval("frm."+grade).value){
	case '2' :document.agencyInsertfrm.grade.selectedIndex = 0; 
		break;
	case '3' :document.agencyInsertfrm.grade.selectedIndex = 1;
		break;
	case '4' :document.agencyInsertfrm.grade.selectedIndex = 2; 
		break;
	case '8' :document.agencyInsertfrm.grade.selectedIndex = 3; 
		break;
	case '9':document.agencyInsertfrm.grade.selectedIndex = 4;  
		break;
	default :  document.agencyInsertfrm.grade.selectedIndex = 0;
	}
	*/
}

function updateAgencyInfo(){
	var frm = document.agencyInsertfrm;
	if(frm.user_id.value== ""){
		alert('<spring:message code="error.require.select.change.agency.name" text="변경할 가맹점을 선택해 주십시오."/>');
		return false;
	}
	if(confirm('<spring:message code="confirm.update" text="수정하시겠습니까?"/>')){
		frm.submit();
	}else{
		return false;
	}
}

function cmClearSrchForm() {
	$('form[name=agencySrchForm] :input:not(:button,:image)').val('');
}

function initSrchForm() {
	$('form[name=agencySrchForm]').each(function(){
		$(this).find(':input:not(:button,:image,:hidden)').keydown(function(event) {
			if (event.which == 13) {
				var $srchBtn = $('#btnSrch');
				$srchBtn.focus();
				$srchBtn.click();
			}
		});
	});
}
</script>
</head>
<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" style="padding-top:20px;">
	<tr>
		<td width="150" align="center" valign="top" >
			<jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include>
		</td>
		<td width="748" valign="top" style="padding-left: 2px;">
			<form name="agencySrchForm" method="post" action="/AdUserService/adminSearchAgencyInfo.do">
			<input type="hidden" name="pageNum" value=""/>
			<input type="hidden" name="admin_menu" value="${param.admin_menu}"/>
			
			<input type="hidden" name="pageGrade" value="${param.grade}"/>
			<input type="hidden" name="pageAgency_name" value="${param.agency_name}"/>
			<input type="hidden" name="pageReg_date1" value="${param.reg_date1}"/>
			<input type="hidden" name="pageReg_date2" value="${param.reg_date2}"/>
			<table class="ytcares-search" width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#fff">
				<colgroup>
					<col width="40"/>
					<col width="80"/>
					<col width="50"/>
					<col width="140"/>
					<col width="50"/>
					<col width="100"/>
					<col width="20"/>
					<col width="100"/>
					<col width="50"/>
					<col width="50"/>
				</colgroup>
				<tr height="30" class="code-lable">
					<td align="center"><spring:message code="lbl.grade" text="등급"/></td>
					<td align="left"><ytcares:code name="grade" blank='<spring:message code="lbl.all" text="전체"/>' mcodeCd="CM001" lblCol="CODE_NM1" valCol="DCODE_CD" where="DCODE_CD != '1'" selected="${param.grade}"/></td>
					<td align="center"><spring:message code="lbl.agency.name"	text="가맹점명"/></td>
					<td align="left"><input type="text" name="agency_name" value="${param.agency_name}"/></td>
					<td align="center"><spring:message code="lbl.join.date" text="가입일"/></td>
					<td align="left"><input type="text" id="bsCal1" name="reg_date1" value="${param.reg_date1}" size="10" maxlength="10" readonly/></td>
					<td align="center">~</td>
					<td align="left"><input type="text" id="bsCal2" name="reg_date2" value="${param.reg_date2}" size="10" maxlength="10" readonly/></td>
					<td align="center"><img src='<spring:message code="img.btn.srch" text="검색"/>' onclick="SrchChk()" style="cursor: pointer;"/></td>
					<td align="center"><img src='<spring:message code="img.btn.clear"	text="클리어"/>' onclick="cmClearSrchForm();" style="cursor: pointer;"/></td>
				</tr>
			</table>
			<table width="748" border="0" cellpadding="0" cellspacing="0" style="padding-top: 2px;">
				<colgroup>
					<col width="50"/>
					<col width="70"/>
					<col width="*"/>
					<col width="120"/>
					<col width="120"/>
				</colgroup>
				<tr class="header-admin" >
					<th><spring:message code="lbl.number" 		text="순번"/></th>
					<th><spring:message code="lbl.grade" 		text="등급"/></th>
					<th><spring:message code="lbl.agency.name"	text="가맹점명"/></th>
					<th><spring:message code="lbl.grade.id"	text="계층아이디"/></th>
					<th><spring:message code="lbl.join.date" text="가입일"/></th>
				</tr>
				<c:forEach var="agencyInfo" items="${agencyInfo}">
				<tr onclick="insertFormInput('${agencyInfo.RN}')" height="30px;">
					<td class="board-line">
						${agencyInfo.RN}
						<input type="hidden" name="USER_ID${agencyInfo.RN}" value="${agencyInfo.USER_ID}"/>
						<input type="hidden" name="USER_NAME${agencyInfo.RN}" value="${agencyInfo.USER_NAME}"/>
						<input type="hidden" name="USER_PASS${agencyInfo.RN}" value="${agencyInfo.USER_PASS}"/>
						<input type="hidden" name="AGENCY_NAME${agencyInfo.RN}" value="${agencyInfo.AGENCY_NAME}"/>
						<input type="hidden" name="FAMILY_ID${agencyInfo.RN}" value="${agencyInfo.FAMILY_ID}"/>
						<input type="hidden" name="EMAIL${agencyInfo.RN}" value="${agencyInfo.EMAIL}"/>
						<input type="hidden" name="CELL_PHONE${agencyInfo.RN}" value="${agencyInfo.CELL_PHONE}"/>
						<input type="hidden" name="ADDR${agencyInfo.RN}" value="${agencyInfo.ADDR}"/>
						<input type="hidden" name="PHONE${agencyInfo.RN}" value="${agencyInfo.PHONE}"/>
						<input type="hidden" name="GRADE${agencyInfo.RN}" value="${agencyInfo.GRADE}"/>
					</td>
					<td class="board-line">${agencyInfo.CASE_GRADE}</td>
					<td class="board-line">${agencyInfo.AGENCY_NAME}</td>
					<td class="board-line">${agencyInfo.FAMILY_ID}</td>
					<td class="board-line">${agencyInfo.REG_DATE}</td>
				</tr>
				</c:forEach>
				
				<c:if test="${fn:length(agencyInfo) < 10}">
					<c:forEach var="i" begin="1" end="${10 - fn:length(agencyInfo)}">
					<tr height="30">
						<td class="board-line" colspan="5">&nbsp;</td>
					</tr>
					</c:forEach>
				</c:if>
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><ytcares:page count="${count}" pageNum="${param.pageNum}" onclick="goPage"/></td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td></td>
		<td width="748" valign="top">
			<form name="agencyInsertfrm" method="post" action="/CmUserService/updateAgencyInfo.do">
			<table class="" width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr class="header-admin">
					<td colspan="6"><spring:message code="lbl.agency.join.info.change" text="가맹점가입정보변경"/></td>
				</tr>
				<tr>
					<td width="100" class="det-label"><spring:message code="lbl.id" text="아이디"/></td>
					<td align="left" class="det-value" width="150"><input type="text" readonly="readonly" name="user_id"/></td>
					<td width="100" class="det-label"><spring:message code="lbl.name" text="이름"/></td>
					<td align="left" class="det-value"><input type="text" readonly="readonly" name="user_name"/></td>
				</tr>
				<tr>
					<td width="100" class="det-label"><spring:message code="lbl.agency.name" text="가맹점명"/></td>
					<td align="left" class="det-value"><input type="text" readonly="readonly" name="agency_name"/></td>
					<td class="det-label" ><spring:message code="lbl.grade.id" text="계층아이디"/></td>
					<td align="left" class="det-value"><input type="text" readonly="readonly" name="family_id"/></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.email" text="이메일"/></td>
					<td colspan="3" align="left" class="det-value"><input type="text" readonly="readonly" name="email" style="width:436px;"/></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.phone" text="연락처"/>1</td>
					<td align="left" class="det-value"><input type="text" readonly="readonly" name="cell_phone"/></td>
					<td class="det-label"><spring:message code="lbl.phone" text="연락처"/>2</td>
					<td align="left" class="det-value"><input type="text" readonly="readonly" name="phone"/></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.address" text="주소"/></td>
					<td colspan="3" align="left" class="det-value"><input type="text" name="addr" style="width:436px;" required="required"/></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.pw" text="비밀번호"/></td>
					<td align="left" class="det-value"><input type="text" name="user_pass" style="width:150px;" required="required"/></td>
					<td class="det-label"><spring:message code="lbl.grade" text="등급"/></td>
					<td align="left" class="det-value"><ytcares:code name="grade" cssStyle="width:150px;" disabled="disabled" mcodeCd="CM001" lblCol="CODE_NM1" valCol="DCODE_CD" where="DCODE_CD != '1'"/></td>
				</tr>
				<tr>
					<td colspan="6" align="right" style="padding-top: 20px;"><img src='<spring:message code="img.btn.change.cont" text="내용변경"/>' onclick="updateAgencyInfo()"/></td> 
				</tr>
			</table>
			</form>
			<!-- 
			<div class="ytcares-content" style="width:250px;padding:0px;">
				<form name="agencyInsertfrm" method="post" action="/CmUserService/updateAgencyInfo.do">
				<ul class="header">
					<li><spring:message code="lbl.agency.join.info.change" text="가맹점가입정보변경"/></li>
				</ul>
				<ul class="item">
					<li class="label w80"><spring:message code="lbl.id" text="아이디"/></li>
					<li><input type="text" readonly="readonly" name="user_id" style="width:150px;"/></li>
				</ul>
				<ul class="item">
					<li class="label w80"><spring:message code="lbl.name" text="이름"/></li>
					<li><input type="text" readonly="readonly" name="user_name" style="width:150px;"/></li>
				</ul>
				<ul class="item">
					<li class="label w80"><spring:message code="lbl.agency.name" text="가맹점명"/></li>
					<li><input type="text" readonly="readonly" name="agency_name" style="width:150px;"/></li>
				</ul>
				<ul class="item">
					<li class="label w80"><spring:message code="lbl.grade.id" text="계층아이디"/></li>
					<li><input type="text" readonly="readonly" name="family_id" style="width:150px;"/></li>
				</ul>
				<ul class="item">
					<li class="label w80"><spring:message code="lbl.email" text="이메일"/></li>
					<li><input type="text" readonly="readonly" name="email" style="width:150px;"/></li>
				</ul>
				<ul class="item">
					<li class="label w80"><spring:message code="lbl.phone" text="연락처"/>1</li>
					<li><input type="text" readonly="readonly" name="cell_phone" style="width:150px;"/></li>
				</ul>
				<ul class="item">
					<li class="label w80"><spring:message code="lbl.phone" text="연락처"/>2</li>
					<li><input type="text" readonly="readonly" name="phone" style="width:150px;"/></li>
				</ul>
				<ul class="item">
					<li class="label w80"><spring:message code="lbl.address" text="주소"/></li>
					<li><input type="text" name="addr" style="width:150px;" required="required"/></li>
				</ul>
				<ul class="item">
					<li class="label w80"><spring:message code="lbl.pw" text="비밀번호"/></li>
					<li><input type="text" name="user_pass" style="width:150px;" required="required"/></li>
				</ul>
				<ul class="item">
					<li class="label w80"><spring:message code="lbl.grade" text="등급"/></li>
					<li><ytcares:code name="grade" cssStyle="width:150px;" disabled="disabled" mcodeCd="CM001" lblCol="CODE_NM1" valCol="DCODE_CD" where="DCODE_CD != '1'"/></li>
				</ul>
				<ul class="item" style="padding-top:20px;padding-bottom:20px;">
					<li class="action-btn" style="padding-right:10px;"><input type="button" value="내용변경" onclick="updateAgencyInfo()"/></li>
				</ul>
				
				</form>
			</div>
			 -->
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
</body>
</html>
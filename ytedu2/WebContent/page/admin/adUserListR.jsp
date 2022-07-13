<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core"%>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%> 
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form"%>
<!--
file name : adUserListR.jsp
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery-ui.min.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/ytcares-calendar.css" />
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/ytcares-calendar.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var bsCal1 = new BsCalendar('bsCal1', {useTrigger:1,max:'now',leObjId:'bsCal2'});
	var bsCal2 = new BsCalendar('bsCal2', {useTrigger:1,max:'now',geObjId:'bsCal1'});
	bsCal1.showCal();
	bsCal2.showCal();

	initSrchForm();
});
/* paging */
function goPage(pageNum) {
	var f = document.agencySrchForm;
	f.pageNum.value 	= pageNum;
	f.grade.value		= '${param.grade}';
	f.agency_name.value = '${param.agency_anem}';
	f.reg_date1.value	= '${param.reg_date1}';
	f.reg_date2.value	= '${param.reg_date2}';
	f.submit();
}

function SrchChk(){
	if(document.agencySrchForm.grade.value=="0"){document.agencySrchForm.grade.value="";}	
	document.agencySrchForm.submit();
}

function cmClearSrchForm() {
	$('form[name=agencySrchForm] :input:not(:button,:image)').val('');
}

/**
 * 검색용 입력폼에 대한 keydown이벤트바인딩
 * ytcares-search클래스 하위의 입력폼(버튼, 이미지버튼, 히든제외)에 대하여 enter key down 이벤트를 추가
 * keydown시의 호출 함수는 ytcares-search클래스 내의 검색버튼 혹은 이미지버튼의 onclick으로 대신함.
 * 검색폼에 대한 샘플은 adUserListR.jsp를 참조할 것(검색영역을 div로 구성하고 화면로드시 cmInitSrchForm()를 호출해줌)
 */
function initSrchForm() {
	$('form[name=agencySrchForm]').each(function(){
		$(this).find(':input:not(:button,:image,:hidden)').keydown(function(event) {
			if (event.which == 13) {
				var $srchBtn = $('#btnSrch');
				$srchBtn.focus();
				$srchBtn.click();
				/*
				var $target = $(event.target);
				var $parent = $target.parents('.ytcares-search');
				if ($parent.length != 0) {
					var $srchBtn = $parent.find('.search-btn input[type=button]:first');
					if ($srchBtn.length != 0) {
						$srchBtn.focus();
						$srchBtn.click();
					} else {
						$srchBtn = $parent.find('input[type=image]:first');
						if ($srchBtn.length != 0) {
							$srchBtn.focus();
							$srchBtn.click();
						}
					}
				}
				*/
			}
		});
	});
}

</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>

<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" style="padding-top:20px;">
	<tr>
		<td width="150" align="center" valign="top">
			<jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include>
		</td>
		<td width="748" valign="top" style="padding-left: 2px;">
			<form name="agencySrchForm" action="/AdUserService/adminSearchUserList.do">
			<input type="hidden" name="pageNum" value=""/>
			<input type="hidden" name="admin_menu" value="${param.admin_menu}"/>
			<table class="ytcares-search" style="width:748px;" width="100%" border="0" cellpadding="0" cellspacing="0" >
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
					<td align="left"><input type="text" name="agency_name" value="${param.agency_name}" style="width:130px;"/></td>
					<td align="center"><spring:message code="lbl.join.date" text="가입일"/></td>
					<td align="left"><input type="text" id="bsCal1" name="reg_date1" value="${param.reg_date1}" size="10" maxlength="10" readonly/></td>
					<td align="center">~</td>
					<td align="left"><input type="text" id="bsCal2" name="reg_date2" value="${param.reg_date2}" size="10" maxlength="10" readonly/></td>
					<td align="center"><img src='<spring:message code="img.btn.srch" text="검색"/>' id="btnSrch" onclick="SrchChk()" style="cursor:pointer;"/></td>
					<td align="center"><img src='<spring:message code="img.btn.clear"	text="클리어"/>' onclick="cmClearSrchForm();" style="cursor:pointer;"/></td>
				</tr>
			</table>
			<!-- 
			<div class="ytcares-search">
				<ul class="search-condition">
					<li class="search-name w60"><spring:message code="lbl.grade" text="등급"/></li>
					<li class="search-value" style="width:119px;"><ytcares:code name="grade" blank='<spring:message code="lbl.all" text="전체"/>' mcodeCd="CM001" lblCol="CODE_NM1" valCol="DCODE_CD" where="DCODE_CD != '1'" selected="${param.grade}"/></li>
					<li class="search-name w60"><spring:message code="lbl.agency.name"	text="가맹점명"/></li>
					<li class="search-value"><input type="text" name="agency_name" value="${param.agency_name}"/></li>
					<li class="clear-btn"><input type="button" onclick="cmClearSrchForm();" value='<spring:message code="btn.clear"	text="클리어"/>'/></li>
				</ul>
				<ul class="search-condition">
					<li class="search-name w60"><spring:message code="lbl.join.date" text="가입일"/></li>
					<li class="search-value"><input type="text" id="bsCal1" name="reg_date1" value="${param.reg_date1}" size="10" maxlength="10" readonly/>&nbsp;~<input type="text" id="bsCal2" name="reg_date2" value="${param.reg_date2}" size="10" maxlength="10" readonly/></li>
					<li class="search-btn"><input id="btnSrch" type="button" onclick="SrchChk()" value='<spring:message code="btn.search" text="검색"/>'/></li>
				</ul>
			</div>
			 -->
			</form>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-top: 2px;">
				<colgroup>
					<col width="60"/>
					<col width="80"/>
					<col width="140"/>
					<col width="200"/>
					<col width="*"/>
					<col width="100"/>
				</colgroup>
				<tr class="header-admin">
					<th><spring:message code="lbl.number" 		text="순번"/></th>
					<th><spring:message code="lbl.grade" 		text="등급"/></th>
					<th><spring:message code="lbl.agency.name"	text="가맹점명"/></th>
					<th><spring:message code="lbl.phone"		text="연락처"/></th>
					<th><spring:message code="lbl.email"		text="이메일"/></th>
					<th><spring:message code="lbl.join.date"	text="가입일"/></th>
				</tr>
				<c:forEach var="agencyInfo" items="${agencyInfo}">
				<tr height="30">
					<td align="center" class="board-line">${agencyInfo.RN}</td>
					<td align="center" class="board-line">${agencyInfo.CASE_GRADE}</td>
					<td align="left" class="board-line">${agencyInfo.AGENCY_NAME}</td>
					<td align="left" class="board-line">${agencyInfo.CELL_PHONE}</td>
					<td align="left" class="board-line">${agencyInfo.EMAIL}</td>
					<td align="center" class="board-line"><fmt:formatDate value="${agencyInfo.REG_DATE}" pattern="yyyy-MM-dd"/></td>
				</tr>
				</c:forEach>
				<c:if test="${fn:length(agencyInfo) < 10}">
					<c:forEach var="i" begin="1" end="${10 - fn:length(agencyInfo)}">
					<tr class="item" height="30">
						<td colspan="6" class="board-line">&nbsp;</td>
					</tr>
					</c:forEach>
				</c:if>
			</table>
			<table style="margin-top:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><ytcares:page count="${count}" pageNum="${param.pageNum}" onclick="goPage"/></td>
				</tr>
			</table>
			<!-- 
			<div>
				<ul class="header">
					<li class="w50"><spring:message code="lbl.number" 		text="순번"/></li>
					<li class="w70"><spring:message code="lbl.grade" 		text="등급"/></li>
					<li class="w140"><spring:message code="lbl.agency.name"	text="가맹점명"/></li>
					<li class="w120"><spring:message code="lbl.phone"		text="연락처"/></li>
					<li style="width:300px;"><spring:message code="lbl.email"		text="이메일"/></li>
					<li class="w90" style="float:right;"><spring:message code="lbl.join.date" text="가입일"/></li>
				</ul>
				<c:forEach var="agencyInfo" items="${agencyInfo}">
				<ul class="item">
					<li class="w50" style="text-align:center;">${agencyInfo.RN}</li>
					<li class="w70" style="text-align:center;">${agencyInfo.CASE_GRADE}</li>
					<li class="w140">${agencyInfo.AGENCY_NAME}</li>
					<li class="w120">${agencyInfo.CELL_PHONE}</li>
					<li style="width:300px;">${agencyInfo.EMAIL}</li>
					<li class="w90" style="float:right;">${agencyInfo.REG_DATE}</li>
				</ul>
				</c:forEach>
				<c:if test="${fn:length(agencyInfo) < 10}">
					<c:forEach var="i" begin="1" end="${10 - fn:length(agencyInfo)}">
					<ul class="item">
						<li>&nbsp;</li>
					</ul>
					</c:forEach>
				</c:if>
				
				<ul class="paging">
					<li><ytcares:page count="${count}" pageNum="${param.pageNum}" onclick="goPage"/></li>
				</ul>
			</div>
			 -->
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
</body>
</html>
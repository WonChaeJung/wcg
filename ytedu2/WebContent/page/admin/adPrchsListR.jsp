<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%> 
<%@taglib prefix="ytcares"	uri="http://www.backsaninfo.com/jsp/core"%>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form"%>
<!--
file name : adPrchsListR.jsp
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery-ui.min.css"/>
<link rel="stylesheet" type="text/css" href="/css/ytcares-calendar.css"/>
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/ckeditor/ckeditor.js"></script> 
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>
<script  type="text/javascript">
/* paging */
function goPage(pageNo) {
	var f = document.srchForm;
	f.pageNum.value			= pageNo;
	f.prchs_seq_no.value	= '${param.prchs_seq_no}';
	f.agency_name.value		= '${param.agency_name}';
	f.grade.value			= '${param.grade}';
	f.prchs_stat_cd.value	= '${param.prchs_stat_cd}';

	f.action = "/AdPrchsService/adminSearchPrchsList.do" ;
	f.submit();
}

function searchPrchsList(){
	document.srchForm.action = "/AdPrchsService/adminSearchPrchsList.do";
	document.srchForm.submit();
}

function updateStatCd(){
	var chkBox = document.updForm.prchsChk;
	if (chkBox) {
		var cnt = 0;
		if (chkBox.length) {
			for (var i = 0; i < chkBox.length; i++) {
				if (chkBox[i].checked) {
					cnt++;
				}
			}
		} else {
			if (chkBox.checked) {
				cnt++;
			}
		}
		
		if (cnt > 0) {
			document.updForm.action="/AdPrchsService/adminUpdatePrchsInfo.do";
			document.updForm.submit();
		} else {
			alert('<spring:message code="error.require.select.item" text="항목을 선택해 주십시오."/>');
			return false;
		}
	} else {
		return false;
	}
}

function allChk(isCheck){
	var checkBox = document.getElementsByName("prchsChk");
	if (checkBox) {
		if ( checkBox.length) {
			for(var i=0; checkBox.length; i++){
				if(i==checkBox.length){break;}
				checkBox[i].checked = isCheck;
			}
		} else {
			checkBox.checked = isCheck;
		}
	}
}

function statChange(obj, rn, cd){
	if (cd == obj.value) {
		document.getElementById('prchsChk'+rn).checked = false;
		return;
	} else if (cd > obj.value) {
		alert('<spring:message code="error.not.change" text="변경할 수 없습니다."/>');
		document.getElementById('prchsChk'+rn).checked = false;
		obj.value = cd;
		return;
	} else {
		document.getElementById('prchsChk'+rn).checked = true;
	}
}

$(document).ready(function(){
	cmYTCaresInit();
});

function csvOutput(){
	var form = document.srchForm;
	
	if(confirm('<spring:message code="confirm.out.csv" text="검색된결과를 CSV파일로 출력하시겠습니까?데이터양에 따라 시간이 소요될 수도 있습니다." javaScriptEscape="true"/>')){
		cmOpenPopup("","csvOutputPage","400","250","auto");
		form.action = "/AdPrchsService/adminPrchsCsvInput.do";
		form.target = "csvOutputPage";
		form.submit();	
	}

}
</script>
</head>
<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<table width="900" style="padding-top:20px;" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="150" align="center" valign="top" >
			<jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include>
		</td>
		<td width="748" valign="top" style="padding-left: 2px;">
				<table class="ytcares-search" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="100%" class="search-label">
							<form name="srchForm" action="" method="post" target="">
								<input type="hidden" name="pageNum" value=""/>
								<input type="hidden" name="admin_menu" value="${param.admin_menu}"/>
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr height="30">
										<td align="center" width="75"><spring:message code="lbl.buy.num" text="구매번호"/></td>
										<td align="center" width="*"><input type="text" name="prchs_seq_no" style="width:170px" value="${param.prchs_seq_no}"/></td>
										<td align="center" width="55"><spring:message code="lbl.buy.user" text="구매자"/></td>
										<td align="center" width="105"><input type="text" name="agency_name" style="width:95px" value="${param.agency_name}"/></td>
										<td align="center" width="45"><spring:message code="lbl.grade" text="등급"/></td>
										<td align="center" width="100"><ytcares:code name="grade" mcodeCd="CM001" lblCol="CODE_NM1" valCol="DCODE_CD" cssStyle="width:95px"  blank="전체" selected="${param.grade}"/></td>
										<td align="center" width="40"><spring:message code="lbl.status" text="상태"/></td>
										<td align="center" width="110"><ytcares:code name="prchs_stat_cd" mcodeCd="ES002" lblCol="CODE_NM1" valCol="DCODE_CD" cssStyle="width:105px" blank="전체 " selected="${param.prchs_stat_cd}"/></td>
										<td><img src="<spring:message code="img.btn.srch" />" style="cursor:pointer;" onclick="searchPrchsList()"/></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-top: 2px;">
					<tr>
						<td>
							<form name="updForm" action="" method="post">
							<%-- 페이징용파람 --%>
							<input type="hidden" name="pageNum"				value="${param.pageNum}"/>
							<input type="hidden" name="admin_menu"			value="${param.admin_menu}"/>
							<input type="hidden" name="pageAgency_name"		value="${param.agency_name}"/>
							<input type="hidden" name="pagePrchs_seq_no"	value="${param.prchs_seq_no}"/>
							<input type="hidden" name="pageGrade"			value="${param.grade}"/>
							<input type="hidden" name="pagePrchs_stat_cd"	value="${prchs_stat_cd}"/>
							
							<table style="width:100%" border="0" cellpadding="0" cellspacing="0">
								<colgroup>
									<col width="25"/>
									<col width="40"/>
									<col width="*"/>
									<col width="100"/>
									<col width="70"/>
									<col width="65"/>
									<col width="80"/>
									<col width="100"/>
									<col width="100"/>
									<col width="50"/>
								</colgroup>
								<tr class="header-admin">
									<td><input type="checkbox" name="checkAll" onclick="allChk(this.checked)" style="background-color: #f5f5f5"/></td>
									<td><spring:message code="lbl.number"		text="순번"/></td>
									<td><spring:message code="lbl.buy.num"		text="구매번호"/></td>
									<td><spring:message code="lbl.agency.name"	text="가맹점명"/></td>
									<td><spring:message code="lbl.grade"		text="등급"/></td>
									<td><spring:message code="lbl.order.amount" text="주문수량"/></td>
									<td><spring:message code="lbl.price"		text="가격"/></td>
									<td><spring:message code="lbl.buy.date"		text="구매일자"/></td>
									<td><spring:message code="lbl.status"		text="상태"/></td>
									<td><spring:message code="lbl.detail"		text="상세"/></td>
								</tr>
								<c:choose>
								<c:when test="${empty searchRlt}">
									<tr height="260">
										<td align="center" colspan="10" class="board-line"><spring:message code="lbl.undefind.data" text="데이터가 존재하지 않습니다."/></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="listRlt" items="${searchRlt}" varStatus="num">
										<tr title="${listRlt.PRCHS_DET}" height="30">
											<td align="center">
												<c:if test="${listRlt.PRCHS_STAT_CD lt 5}">
													<input id="prchsChk${listRlt.RN}" type="checkbox" name="prchsChk" value="${listRlt.PRCHS_SEQ_NO},${listRlt.FAMILY_ID},${listRlt.AGENCY_ACCM_PNT},${listRlt.SUBAGENCY_ACCM_PNT},${listRlt.SUPAGENCY_ACCM_PNT},${listRlt.GRADE}"/>
												</c:if>
												<c:if test="${listRlt.PRCHS_STAT_CD ge 5}"><input type="checkbox" disabled="disabled"/></c:if>
											</td>
											<td class="board-line">${listRlt.RN}</td>
											<td class="board-line">${listRlt.PRCHS_SEQ_NO}</td>
											<td class="board-line">${listRlt.AGENCY_NAME}</td>
											<td class="board-line">${listRlt.GRADE_NAME}</td>
											<td class="board-line" style="text-align:right;"><fmt:formatNumber value="${listRlt.PRCHS_CNT}" pattern="###,###"/></td>
											<td class="board-line" style="text-align:right;"><fmt:formatNumber value="${listRlt.PRCHS_PRICE}" pattern="###,###,###,###"/></td>
											<td class="board-line">${listRlt.PRCHS_DATE}</td>
											<td class="board-line">
												<c:if test="${listRlt.PRCHS_STAT_CD lt 5}">
													<ytcares:code name="prchs_stat_cd${listRlt.PRCHS_SEQ_NO}" mcodeCd="ES002" lblCol="CODE_NM1" valCol="DCODE_CD" selected="${listRlt.PRCHS_STAT_CD}" onchange="statChange(this, '${listRlt.RN}','${listRlt.PRCHS_STAT_CD}')"/>
												</c:if>
												<c:if test="${listRlt.PRCHS_STAT_CD ge 5}">${listRlt.PRCHS_STAT_NAME}</c:if>
											</td>
											<td class="board-line" align="center" title="${listRlt.RMRKS}"><img src="<spring:message code="img.btn.detail"/>" style="cursor:pointer;" onclick="cmOpenPrchsDetail('${listRlt.PRCHS_SEQ_NO}')"/></td>
										</tr>
									</c:forEach>
									<c:if test="${fn:length(searchRlt) < 10}">
										<c:forEach var="i" begin="1" end="${10 - fn:length(searchRlt)}">
											<tr height="30"><td colspan="10" class="board-line">&nbsp;</td></tr>
										</c:forEach>
									</c:if>
								</c:otherwise>
								</c:choose>
							</table>
							</form>
						</td>
					</tr>
				</table>
				<table class="paging" width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center" width="100%">
							<ytcares:page onclick="goPage" count="${countRlt}" pageNum="${param.pageNum}"/>
						</td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>	
						<td align="right">
							<img src="<spring:message code="img.btn.csv"/>" style="cursor:pointer;" onclick="csvOutput()"/>&nbsp;&nbsp;
							<img src="<spring:message code="img.board.modify" text="수정"/>" style="cursor:pointer;" onclick="updateStatCd()"/>
						</td>
					</tr>
				</table>
		</td>
	</tr>
</table>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<!-- 공통메세지처리 -->
<ytcares:msg/>
</body>
</html>
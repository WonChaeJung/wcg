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
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/ytcares-calendar.css" />
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/ytcares-calendar.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	cmYTCaresInit();

	new BsCalendar('prchs_start_date', {useTrigger:1,max:'now',leObjId:'prchs_end_date',pattern:'yyyy-MM-dd'}).showCal();
	new BsCalendar('prchs_end_date', {useTrigger:1,max:'now',geObjId:'prchs_strt_date',pattern:'yyyy-MM-dd'}).showCal();
});

function goPage(pageNum) {
	var srchFrm = document.prchsSrchForm;
	srchFrm.pageNum.value = pageNum;
	srchFrm.self_clsfy.value = '${param.self_clsfy}';
	srchFrm.prchs_start_date.value = '${param.prchs_start_date}';
	srchFrm.prchs_end_date.value = '${param.prchs_end_date}';
	srchFrm.prchs_stat_cd.value = '${param.prchs_stat_cd}';

	srchFrm.submit();
}
function searchPrchsList() {
	var srchFrm = document.prchsSrchForm;
	srchFrm.pageNum.value = 1;

	srchFrm.submit();
}
function clearSrchFrm() {
	var srchFrm = document.prchsSrchForm;
	srchFrm.self_clsfy.value = '';
	srchFrm.prchs_start_date.value = '';
	srchFrm.prchs_end_date.value = '';
	srchFrm.prchs_stat_cd.value = '';
}
</script>
</head>

<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp" />
<table width="900" class="ytcares-content" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td>
			<jsp:include page="/page/member/mbMemberMenu_f.jsp"/>
		</td>
	</tr>
	<tr>
		<td width="900" valign="top" style="padding-top: 20px;">
			<!-- main content start -->
			<form name="prchsSrchForm" method="post" action="/MbMyPageService/userSelectPrchsList.do">
			<input type="hidden" name="pageSize" value="10"/>
			<input type="hidden" name="pageNum" value="${param.pageNum}"/>
			<table class="ytcares-search" cellpadding="0" cellspacing="0" border="0" align="center">
				<colgroup>
					<col width="90"/>
					<col width="100"/>
					<col width="90"/>
					<col width="120"/>
					<col width="90"/>
					<col width="120"/>
					<col width="90"/>
					<col width="80"/>
					<col width="120"/>
				</colgroup>
				<tr>
					<td class="search-label"><spring:message code="lbl.self.kind" text="본인구분"/></td>
					<td class="">
						<select name="self_clsfy" onkeydown="alert('userkeydown');">
							<option value="">----</option>
							<option value="1" ${param.self_clsfy eq '1'?'selected':''}><spring:message code="lbl.self" text="본인"/></option>
							<option value="2" ${param.self_clsfy eq '2'?'selected':''}><spring:message code="lbl.agency.down" text="하위가맹점"/></option>
						</select>
					</td>
					<td class="search-label"><spring:message code="lbl.buy.start" text="구매시작"/></td>
					<td class=""><input type="text" id="prchs_start_date" name="prchs_start_date" value="${param.prchs_start_date}" size="10" maxlength="10" readonly="readonly"/></td>
					<td class="search-label"><spring:message code="lbl.buy.end" text="구매종료"/></td>
					<td class=""><input type="text" id="prchs_end_date" name="prchs_end_date" value="${param.prchs_end_date}" size="10" maxlength="10" readonly="readonly"/></td>
					<td class="search-label"><spring:message code="lbl.order.status" text="주문상태"/></td>
					<td class=""><ytcares:code name="prchs_stat_cd" mcodeCd="ES002" lblCol="CODE_NM1" valCol="DCODE_CD" blank="-----" selected="${param.prchs_stat_cd}"/></td>
					<td align="right" style="padding-right: 5px;">
						<img src='<spring:message code="img.btn.clear" text="클리어"/>' onclick="clearSrchFrm()" style="cursor: pointer;"/>
						<img src='<spring:message code="img.btn.srch" text="검색"/>' onclick="searchPrchsList()" style="cursor: pointer;"/>
					</td>
				</tr>
			</table>
			<!-- main content end -->
			</form>
			<hr/>
			<table cellpadding="0" cellspacing="0" border="0" align="center">
				<colgroup>
					<col width="185"/>
					<col width="100"/>
					<col width="50"/>
					<col width="*"/>
					<col width="70"/>
					<col width="70"/>
					<col width="70"/>
					<col width="85"/>
					<col width="85"/>
					<col width="85"/>
					<col width="85"/>
				</colgroup>
				<tr class="header">
					<th><spring:message code="lbl.buy.num" text="구매번호"/></th>
					<th><spring:message code="lbl.agency.name" text="가맹점명"/></th>
					<th><spring:message code="lbl.grade" text="등급"/></th>
					<th><spring:message code="lbl.goods.name" text="상품명"/></th>
					<th><spring:message code="lbl.amount" text="수량"/></th>
					<th><spring:message code="lbl.price" text="가격"/></th>
					<th><spring:message code="lbl.status" text="상태"/></th>
					<th><spring:message code="lbl.buy.date" text="구매일자"/></th>
					<th><spring:message code="lbl.delivery.date" text="배송일자"/></th>
					<th><spring:message code="lbl.buy.finish" text="구매완료"/></th>
					<th><spring:message code="lbl.buy.cancel" text="구매취소"/></th>
				</tr>
				<c:if test="${empty prchsAccmList}">
					<tr height="260">
						<td colspan="11"><spring:message code="lbl.undefind.data" text="데이터가 존재하지 않습니다."/></td>
					</tr>
				</c:if>
				<c:if test="${!empty prchsAccmList}">
					<c:forEach var="prchsAccm" items="${prchsAccmList}">
					<c:set var="summary" value="${prchsAccm.prchs_det}"/>
					<tr title="${summary}" onclick="cmOpenPrchsDetail('${prchsAccm.prchs_seq_no}')" style="cursor:pointer;">
						<td>${prchsAccm.prchs_seq_no}</td>
						<td align="left">${prchsAccm.agency_name}</td>
						<td>${prchsAccm.grade_name}</td>
						<td align="left">${prchsAccm.csmt_name}</td>
						<td align="right"><fmt:formatNumber value="${prchsAccm.prchs_cnt}" pattern="###,###,###"/></td>
						<td align="right"><fmt:formatNumber value="${prchsAccm.prchs_price}" pattern="###,###,###"/></td>
						<td>${prchsAccm.prchs_stat_name}</td>
						<td><fmt:formatDate value="${prchsAccm.prchs_date}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${prchsAccm.dlvr_date}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${prchsAccm.prchs_comp_date}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${prchsAccm.prchs_cncl_date}" pattern="yyyy-MM-dd"/></td>
					</tr>
					</c:forEach>
					<c:if test="${fn:length(prchsAccmList) < 10}">
						<c:forEach var="i" begin="1" end="${10 - fn:length(prchsAccmList)}">
							<tr><td colspan="11">&nbsp;</td></tr>
						</c:forEach>
					</c:if>
				</c:if>
			</table>
			<table class="paging" cellpadding="0" cellspacing="0" border="0" align="center">
				<tr>
					<td><ytcares:page count="${count}" pageNum="${param.pageNum}" onclick="goPage"/></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp" />
<ytcares:msg/>
</body>
</html>
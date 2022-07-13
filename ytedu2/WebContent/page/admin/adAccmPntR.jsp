<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%> 
<%@taglib prefix="ytcares"	uri="http://www.backsaninfo.com/jsp/core"%>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form"%>
<!--
file name : adAccmPntR.jsp
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery-ui.min.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/ytcares-calendar.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery.jqplot.min.css" /> 
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript" src="${ctxPath}/js/ytcares-calendar.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jqplot/excanvas.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jqplot/plugins/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jqplot/plugins/jqplot.pointLabels.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jqplot/plugins/jqplot.cursor.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jqplot/plugins/jqplot.highlighter.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jqplot/plugins/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jqplot/plugins/jqplot.dragable.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jqplot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jqplot/plugins/jqplot.canvasTextRenderer.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jqplot/plugins/jqplot.canvasAxisTickRenderer.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/ytcares-prchs-graph.js"></script>
<script>
var chart = null;
$(document).ready(function(){
	var bsCal0 = new BsCalendar('accm_ym', {onDateClicked:function(){drawAccmPntChart(null, null);},useTrigger:1,calType:2,yearSize:2,calHeadType:1,max:'now',width:200,height:140,monthName:['01','02','03','04','05','06','07','08','09','10','11','12']});
	var bsCal1 = new BsCalendar('prchs_date_start', {useTrigger:1,max:'now',leObjId:'prchs_date_end'});
	var bsCal2 = new BsCalendar('prchs_date_end', {useTrigger:1,max:'now',geObjId:'prchs_date_start'});
	bsCal0.showCal();
	bsCal1.showCal();
	bsCal2.showCal();

	cmYTCaresInit();

	$(':checkbox[name=accmPntDetail]').click(function() {
		if ($(':checkbox[name=accmPntDetail]:checked').length == $(':checkbox[name=accmPntDetail]').length) {
			$(':checkbox[name=allChkBox]:first').prop('checked', true);
		} else {
			$(':checkbox[name=allChkBox]:first').prop('checked', false);
		}
	});
	
	drawMonthlyAccmChart('accmPntGraph',{queryId:'accm.selectMonthlyAccm'});
	$('#accmPntGraph').bind('jqplotDataHighlight',
			function (ev, seriesIndex, pointIndex, data) {
				$('#prchs_info').html(''+data);
			}
	).bind('jqplotDataUnhighlight',
			function (ev) {
				$('#prchs_info').html('');
			}
	);
});

function goPage(pageNo) {
	var f = document.accmPntForm;
	f.pageNum.value = pageNo;
	f.prchs_date_start.value = '${param.prchs_date_start}';
	f.prchs_date_end.value = '${param.prchs_date_end}';
	f.term.value = '${param.term}';

	f.action = '/AdAccmService/adminSelectAccmPnt.do';
	f.submit();
}
function searchAccmPnt(){
	var f = document.accmPntForm;
	f.action = '/AdAccmService/adminSelectAccmPnt.do';
	f.submit();
}

function dateSrch(date){
	var f = document.accmPntForm;
	f.prchs_date_start.value = '';
	f.prchs_date_end.value = '';
	f.term.value = date;
	
	searchAccmPnt();
}

function clearSearchFrom() {
	var f = document.accmPntForm;
	f.prchs_date_start.value = '';
	f.prchs_date_end.value = '';
	f.term.value = '';
	f.include_stlmnt.checked = false;
}

function checkAllAccm(isChecked) {
	$(':checkbox[name=accmPntDetail]').prop('checked', isChecked);
}

function updateAccmPntStlmnt() {
	if ($(':checkbox[name=accmPntDetail]:checked').length == 0) {
		alert('<spring:message code="error.require.select.item" text="항목을 선택해 주십시오."/>');
		return false;
	} else {
		if (confirm('<spring:message code="confirm.insert" text="등록하시겠습니까?"/>')) {
			var f = document.accmPntForm;
			f.action = '/AdAccmService/adminUpdateAccmPntStlmnt.do';

			f.submit();
		}
		
	}
}
</script>

</head>
<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<table width="900" border="0" cellpadding="0" cellspacing="0" align="center" style="padding-top: 20px;">
	<tr>
		<td width="150" align="center" valign="top" >
			<table class="ytcares-content" style="width:100%;" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td><jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include></td>
				</tr>
			</table>
		</td>
		<td width="750" valign="top" style="padding-bottom: 20px;">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td style="padding-top:2px;padding-left: 2px;">
						<table  class="" style="width:100%;" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td colspan="2">
								<form name="accmPntForm" action="/AdAccmService/adminSelectAccmPnt.do">
								<input type="hidden" name="pageNum"		value=""/>
								<input type="hidden" name="admin_menu"	value="${param.admin_menu}"/>
								<input type="hidden" name="term"		value=""/>
								<table class="ytcares-search" width="748" border="0" cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="80"/>
										<col width="125"/>
										<col width="20"/>
										<col width="125"/>
										<col width="70"/>
										<col width="70"/>
										<col width="100"/>
										<col width="*"/>
									</colgroup>
									<tr height="30" class="code-lable">
										<td><spring:message code="lbl.buy.date" text="구매일자"/></td>
										<td><input type="text" id="prchs_date_start" name="prchs_date_start" value="${param.prchs_date_start}" size="10" maxlength="10" readonly/></td>
										<td>~</td>
										<td><input type="text" id="prchs_date_end" name="prchs_date_end" value="${param.prchs_date_end}" size="10" maxlength="10" readonly/></td>
										<td><img src="<spring:message code="img.btn.week"/>" style="cursor:pointer;" onclick="dateSrch(this)"/></td>
										<td><img src="<spring:message code="img.btn.month"/>" style="cursor:pointer;" onclick="dateSrch(this)"/></td>
										<td><input type="checkbox" style="background-color:#e3e3e3;padding-right: 3px;" name="include_stlmnt" value="1" ${param.include_stlmnt eq '1'?'checked':''}/><spring:message code="lbl.all" text="전체"/></td>
										<td>
										    <img src="<spring:message code="img.btn.srch"/>" style="cursor:pointer;" onclick="searchAccmPnt()"/>
											<img src="<spring:message code="img.btn.clear"/>" style="cursor:pointer;"  onclick="clearSearchFrom()"/>
										</td>
									</tr>
								</table>
								<table style="width:100%;margin-top:2px;table-layout: fixed;" border="0" cellpadding="0" cellspacing="0">
									<colgroup>
										<col width="20"/>
										<col width="*"/>
										<col width="90"/>
										<col width="85"/>
										<col width="85"/>
										<col width="90"/>
										<col width="85"/>
										<col width="85"/>
										<col width="85"/>
									</colgroup>
									<tr class="header-admin">
										<td><input type="checkbox" name="allChkBox" onclick="checkAllAccm(this.checked)" style="background-color:#f4f4f4;"/></td>
											<td><spring:message code="lbl.buy.num" text="구매번호"/></td>
											<td><spring:message code="lbl.buy.user" text="구매자"/></td>
											<td><spring:message code="lbl.buy.app" text="구매신청"/></td>
											<td><spring:message code="lbl.buy.finish" text="구매완료"/></td>
											<td><spring:message code="lbl.point.subj.user" text="적립대상"/></td>
											<td><spring:message code="lbl.point.date" text="적립일"/></td>
											<td><spring:message code="lbl.point" text="적립금"/></td>
											<td><spring:message code="btn.point.check.date" text="정산일"/></td>
									</tr>
									<c:forEach var="accmPnt" items="${accmPntList}">
										<tr height="30">
											<td class="board-line"><c:if test="${accmPnt.STLMNT_YN eq '0'}"><input type="checkbox" name="accmPntDetail" value="${accmPnt.ACCM_USER_ID},${accmPnt.PRCHS_SEQ_NO}"/></c:if></td>
											<td class="board-line" onclick="cmOpenPrchsDetail('${accmPnt.PRCHS_SEQ_NO}')" style="cursor:pointer;" title="${accmPnt.PRCHS_SEQ_NO}">${accmPnt.PRCHS_SEQ_NO}</td>
											<td class="board-line">${accmPnt.AGENCY_NAME}</td>
											<td class="board-line">${accmPnt.PRCHS_DATE}</td>
											<td class="board-line">${accmPnt.PRCHS_COMP_DATE}</td>
											<td class="board-line">${accmPnt.ACCM_AGENCY_NAME}</td>
											<td class="board-line">${accmPnt.ACCM_DATE}</td>
											<td class="board-line" style="text-align:right;"><fmt:formatNumber value="${accmPnt.ACCM_PNT}" pattern="###,###,###"/></td>
											<td class="board-line">${accmPnt.STLMNT_DATE}</td>
										</tr>
									</c:forEach>
									<c:if test="${fn:length(accmPntList) < 10}">
										<c:forEach var="i" begin="1" end="${10 - fn:length(accmPntList)}">
											<tr height="30"><td colspan="9" class="board-line">&nbsp;</td></tr>
										</c:forEach>
									</c:if>
								</table>
								</form>
								<table class="paging" width="100%">
									<tr>
										<td align="center" width="100%">
											<ytcares:page onclick="goPage" count="${count}" pageNum="${param.pageNum}"/>
										</td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
						<img src='<spring:message code="img.btn.point.check" text="적립금정산"/>' style="float:right;cursor: pointer;" onclick="updateAccmPntStlmnt()"/>					
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="border: 1px solid #d1d1d1;">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
				<colgroup>
					<col width="190"/>
					<col width="600"/>
				</colgroup>
				<tr>
					<td valign="top">
						<table class="ytcares-content" style="width:100%;" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<table class="ytcares-detail" style="width:100%;">
										<colgroup>
											<col width="80"/>
											<col width="*"/>
										</colgroup>
										<tr>
											<td class="det-label" align="center"><spring:message code="lbl.point.status" text="적립금현황"/><br/><spring:message code="lbl.all" text="전체"/></td>
											<td class="det-value-border" width="*" align="right">
												<fmt:formatNumber value="${statSumm.TOT_ACCM_PNT}" pattern="###,###,###,###" type="currency"/><br/>
												<fmt:formatNumber value="${statSumm.ALL_ACCM_PNT}" pattern="###,###,###,###" type="currency"/>
											</td>
										</tr>
									</table>
									<table  class="ytcares-detail" style="width:100%;">
										<colgroup>
											<col width="80"/>
											<col width="*"/>
										</colgroup>
										<tr style="height:25px;">
											<td class="det-label"><spring:message code="lbl.buy.app" text="구매신청"/></td>
											<td class="det-value-border" align="right">[<c:out value="${statSumm.PRCHS_REQ_CNT}" default="0"/>/<c:out value="${statSumm.TOT_CNT}" default="0"/>]<spring:message code="lbl.goods.case" text="건"/></td>
					
										</tr>
										<tr style="height:25px;">
											<td class="det-label"><spring:message code="lbl.deposit.wait" text="입금대기"/></td>
											<td class="det-value-border" align="right">[<c:out value="${statSumm.PAY_CNT}" default="0"/>/<c:out value="${statSumm.TOT_CNT}" default="0"/>]<spring:message code="lbl.goods.case" text="건"/></td>
										</tr>
										<tr style="height:25px;">
											<td class="det-label"><spring:message code="lbl.deposit.wait" text="배 송 중"/></td>
											<td class="det-value-border" align="right">[<c:out value="${statSumm.DLVR_CNT}" default="0"/>/<c:out value="${statSumm.TOT_CNT}" default="0"/>]<spring:message code="lbl.goods.case" text="건"/></td>
											
										</tr>
										<tr style="height:25px;">
											<td class="det-label"><spring:message code="lbl.delivery.finish" text="배송완료"/></td>
											<td class="det-value-border" align="right">[<c:out value="${statSumm.DLVR_COMP_CNT}" default="0"/>/<c:out value="${statSumm.TOT_CNT}" default="0"/>]<spring:message code="lbl.goods.case" text="건"/></td>
										</tr>
										<tr style="height:25px;">
											<td class="det-label"><spring:message code="lbl.buy.cancel" text="구매취소"/></td>
											<td class="det-value-border" align="right">[<c:out value="${statSumm.CNCL_CNT}" default="0"/>/<c:out value="${statSumm.TOT_CNT}" default="0"/>]<spring:message code="lbl.goods.case" text="건"/></td>
										</tr>
										<tr style="height:25px;">
											<td class="det-label"><spring:message code="lbl.buy.finish" text="구매완료"/></td>
											<td class="det-value-border" align="right">[<c:out value="${statSumm.PRCHS_COMP_CNT}" default="0"/>/<c:out value="${statSumm.TOT_CNT}" default="0"/>]<spring:message code="lbl.goods.case" text="건"/></td>
										</tr>
										<tr style="height:25px;">
											<td class="det-label">&nbsp;</td>
											<td class="det-value-border" align="right">&nbsp;</td>
										</tr>
										<tr style="height:25px;">
											<td class="det-label"><spring:message code="lbl.agency.count" text="가맹점수"/></td>
											<td class="det-value-border" align="right">[ <c:out value="${statSumm.AGENCY_CNT}" default="0"/> ]<spring:message code="lbl.goods.unit" text="개"/></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td style="padding-left:2px;">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<colgroup>
								<col width="*"/>
								<col width="60"/>
							</colgroup>
							<tr>
								<td valign="top">
									<table class="ytcares-search" style="width:100%; margin-bottom:2px;">
										<colgroup>
											<col width="80"/>
											<col width="100"/>
											<col width="80"/>
											<col width="100"/>
											<col width="*"/>
										</colgroup>
										<tr height="26" style="">
											<td class="search-label"><spring:message code="lbl.all" text="전체"/></td>
											<td style="height:26px;verticla-align:middle;">
												<input type="hidden" id="graphType" name="graphType" value="monthly"/>
												<input type="radio" id="include_stlmnt_no"	style="background-color:#e3e3e3;" name="include_stlmnt_yn" value="0" checked="checked" onclick="drawAccmPntChart(null, null)"/>&nbsp;No&nbsp;
												<input type="radio" id="include_stlmnt_yes" style="background-color:#e3e3e3;" name="include_stlmnt_yn" value="1" onclick="drawAccmPntChart(null, null)"/>&nbsp;Yes
											</td>
											<td class="search-label"><spring:message code="lbl.point" text="적립금"/></td>
											<td><input type="text" id="accm_ym" name="accm_ym" readonly="readonly" size="7" maxlength="5"/></td>
											<td><div id="prchs_info" style="float:right;text-align:right;">&nbsp;</div></td>
										</tr>
									</table>
									<div id="accmPntGraph" style="width:560px;height:262px;border:1px solid #f5f5f5;background-color:#fffffa;border-radius:5px;"></div>
								</td>
								<td>
									<table class="ytcares-content" style="padding-left:2px;width:60px;" cellpadding="0" cellspacing="0">
										<tr><td valign="top">
											<table class="right-tab-menu" style="width:60px;height:300px;" cellpadding="0" cellspacing="0" align="right">
											<tr><td class="tab" onclick="drawAccmPntChart(this, 'monthly')"><a href="javascript:void(0)">Daily</a></td></tr>
											<tr><td class="tab" onclick="drawAccmPntChart(this, 'agency')"><a href="javascript:void(0)"><spring:message code="lbl.agency" text="가맹점"/><br/>TOP10</a></td></tr>
											<tr><td class="tab" onclick="drawAccmPntChart(this, 'agemon')"><a href="javascript:void(0)"><br/>Daily</a></td></tr>
											<tr><td class="tab" onclick="drawAccmPntChart(this, 'csmt')"><a href="javascript:void(0)"><spring:message code="lbl.goods" text="상품"/></a></td></tr>
											<tr><td>&nbsp;</td></tr>
											<tr><td>&nbsp;</td></tr>
											<tr><td>&nbsp;</td></tr>
											</table>
										</td></tr>
									</table>
								</td>
							</tr>
						</table>
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
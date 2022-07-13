<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%> 
<%@taglib prefix="ytcares"	uri="http://www.backsaninfo.com/jsp/core"%>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form"%>
<!--
file name : adPrchsStartListR.jsp
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery-ui.min.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/ytcares-admin.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/ytcares-calendar.css" />
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/ytcares-calendar.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>
<script  type="text/javascript">
$(document).ready(function(){
	var bsCal1 = new BsCalendar('bsCal1', {useTrigger:1,max:'now',leObjId:'bsCal2'});
	var bsCal2 = new BsCalendar('bsCal2', {useTrigger:1,max:'now',geObjId:'bsCal1'});
	bsCal1.showCal();
	bsCal2.showCal();
});
/* paging */
function goPage(pageNo) {
	var f = document.srchForm;
	f.pageNum.value = pageNo;
	f.submit();
}
function searchCheck(){
	var f = document.srchForm;
	f.submit();
}
</script>
</head>
<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="150" align="center" valign="top" >
			<jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include>
		</td>
		<td width="820" valign="top">
			<form name="srchForm" action="/AdAccmService/adminSearchStatList.do" method="post">
				<table width="100%" border="0">
					<tr>
						<td width="100%">
							<table width="100%" border="1" bgcolor="#ffffff">
								<tr>
									<td width="600">
										<table border="1">
											<tr>
												<td align="center" width="150" ><spring:message code="lbl.section" text="구분"/></td>
												<td align="left" style="padding-left: 8px;" width="450" >
													<ytcares:code name="prchs_stat_cd" mcodeCd="ES002" lblCol="CODE_NM1" valCol="DCODE_CD" cssStyle="width:150px;" selected="${param.prchs_stat_cd}"/>
												</td>
											</tr>
											<tr>
												<td align="center" width="150" ><spring:message code="lbl.buy.num" text="구매번호"/></td>
												<td align="left" style="padding-left: 8px;" width="450" ><input type="text" name="prchs_seq_no" value="${param.prchs_seq_no}" style="width: 150px"/></td>
											</tr>
											<tr>
												<td align="center" width="150"><spring:message code="lbl.buy.date" text="구매일시"/></td>
												<td align="left" style="padding-left: 8px;" width="450" >
													<table border="1">
														<tr>
															<td width="100%" colspan="3"><input type="text" id="bsCal1" name="prchs_date_start" value="${param.prchs_date_start}" size="10" maxlength="10" readonly/>
																&nbsp;&nbsp;~&nbsp;&nbsp;<input type="text" id="bsCal2" name="prchs_date_end" value="${param.prchs_date_end}" size="10" maxlength="10" readonly/>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td align="center" width="150" ><spring:message code="lbl.agency.name" text="가맹점명"/></td>
												<td align="left" style="padding-left: 8px;" width="450" >
													<select style="width: 150px;" name="agency_name">
														<option value=""><spring:message code="lbl.all" text="전체"/></option>
														<c:forEach var="srchRlt" items="${agencyList}">
															<c:choose>
																<c:when test="${param.agency_name eq srchRlt}">
																	<option value="${srchRlt}" selected="selected">${srchRlt}</option>	
																</c:when>
																<c:otherwise>
																<c:if test="${!empty param.agency_name}">
																	<option value="${srchRlt}">${srchRlt}</option>
																</c:if>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select> 
												</td>
											</tr>
										</table>
									</td>
									<td width="200" style="padding-top: 10px;" valign="top">
										<table width="100%" border="0">
											<tr style="padding-top: 10px;">
												<td align="right" style="padding-right: 10px;"><input type="button" value='<spring:message code="btn.search" text="검색"/>' onclick="searchCheck()"/></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="100%">
							<table width="100%" border="1">
								<tr>
									<td width="50" align="center"><spring:message code="lbl.number"		text="순번"/></td>
									<td width="250" align="center"><spring:message code="lbl.buy.num"		text="구매번호"/></td>
									<td width="100" align="center"><spring:message code="lbl.buy.user"		text="구매자"/></td>
									<td width="100" align="center"><spring:message code="lbl.order.amount" text="주문수량"/></td>
									<td width="100" align="center"><spring:message code="lbl.price"		text="가격"/></td>
									<td width="100" align="center"><spring:message code="lbl.buy.date"		text="구매일자"/></td>
									<td width="100" align="center"><spring:message code="lbl.status"		text="상태"/></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="100%">
							<table width="100%" border="1">
								<c:forEach var="srchRlt" items="${statListRlt}"> 
									<tr>
										<td width="50" align="center">${srchRlt.RN}</td>
										<td width="250" align="center" title="${srchRlt.PRCHS_DET}">${srchRlt.PRCHS_SEQ_NO}</td>
										<td width="100" align="center">${srchRlt.AGENCY_NAME}</td>
										<td width="100" align="center">${srchRlt.PRCHS_CNT}</td>
										<td width="100" align="center">${srchRlt.PRCHS_PRICE}</td>
										<td width="100" align="center">${srchRlt.PRCHS_DATE}</td>
										<td width="100" align="center">${srchRlt.PRCHS_STAT_NAME}</td>	
									</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table align="center">
								<tr>
									<td>
										<ytcares:page onclick="goPage" count="${count}" pageNum="${param.pageNum}"/>
										<input type="hidden" name="pageNum"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
</body>
</html>
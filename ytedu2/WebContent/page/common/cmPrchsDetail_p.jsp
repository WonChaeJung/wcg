<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<!--
file name : cmPrchsDetail_p.jsp
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var optAddDesc = '${prchsDetail.prchs_det}'.replace(/<br\/>/gi, '\n');
	$('#optAddDesc').attr('title', optAddDesc);
	
});
</script>
</head>
<body>
<table class="ytcares-detail" style="margin:5px 5px 5px 5px; border: 1px solid #c8c8c8;" border="0" cellpadding="0" cellspacing="0">
<colgroup>
	<col width="100"/>
	<col width="*"/>
	<col width="80"/>
	<col width="150"/>
	<col width="80"/>
	<col width="170"/>
</colgroup>
<tr>
	<td class="det-label"><spring:message code='lbl.buy.serial.num' text='구매일련번호'/></td>
	<td class="det-value">${prchsDetail.prchs_seq_no}</td>
	<td class="det-label"><spring:message code='lbl.buy.count' text='구매개수'/></td>
	<td class="det-value"><fmt:formatNumber value="${prchsDetail.prchs_cnt}" pattern="###,###,###"/></td>
	<td class="det-label"><spring:message code='lbl.buy.price' text='구매가격'/></td>
	<td class="det-value"><fmt:formatNumber value="${prchsDetail.prchs_price}" pattern="###,###,###,###,###"/></td>
</tr>
<tr>
	<td class="det-label"><spring:message code='lbl.agency.name' text='가맹점명'/></td>
	<td class="det-value">${prchsDetail.agency_name}</td>
	<td class="det-label"><spring:message code='lbl.id' text='아이디'/></td>
	<td class="det-value">${prchsDetail.prchs_user_id}</td>
	<td class="det-label"><spring:message code='lbl.grade' text='등급'/></td>
	<td class="det-value">${prchsDetail.grade_name}</td>
</tr>
<tr>
	<td class="det-label"><spring:message code='lbl.grade.id' text='계층아이디'/></td>
	<td class="det-value">${prchsDetail.family_id}</td>
	<td class="det-label"><spring:message code='lbl.recommend.agency' text='추천가맹점'/></td>
	<td class="det-value">${prchsDetail.rcmmd_agency_name}</td>
	<td class="det-label"><spring:message code='lbl.recommend.id.grade' text='추천인등급'/></td>
	<td class="det-value">${prchsDetail.rcmmd_grade_name}</td>
</tr>
<tr height="50">
	<td rowspan="2" class="det-label"><spring:message code='lbl.goods.image' text='상품이미지'/></td>
	<td rowspan="2" class="det-value"><c:if test="${!empty prchsDetail.csmt_img}"><img src="/ytcares/eshop/${prchsDetail.csmt_img}" border="0" width="200" height="100"/></c:if></td>
	<td height="50" class="det-label"><spring:message code='lbl.goods.id' text='상품아이디'/></td>
	<td class="det-value">${prchsDetail.csmt_id}</td>
	<td rowspan="3" class="det-label"><spring:message code='lbl.option' text='옵션'/><br/><spring:message code='lbl.add.form' text='추가구성'/></td>
	<td id="optAddDesc" rowspan="3" class="det-value">${prchsDetail.prchs_det}</td>
</tr>
<tr >
	<td class="det-label"><spring:message code='lbl.goods.name' text='상품명'/></td>
	<td class="det-value">${prchsDetail.csmt_name}</td>
</tr>

<tr>
	<td class="det-label"><spring:message code='lbl.get.user' text='수취인'/></td>
	<td class="det-value">${prchsDetail.dlvr_name}</td>
	<td class="det-label"><spring:message code='lbl.phone' text='전화번호'/></td>
	<td class="det-value">${prchsDetail.dlvr_phone}</td>
</tr>
<tr>
	<td class="det-label"><spring:message code='lbl.delivery.address' text='배달주소'/></td>
	<td colspan="5" align="left" class="det-value">${prchsDetail.dlvr_addr}</td>
</tr>
<tr>
	<td class="det-label"><spring:message code='lbl.buy.date' text='구매일'/></td>
	<td class="det-value"><fmt:formatDate value="${prchsDetail.prchs_date}" pattern="yyyy-MM-dd"/></td>
	<td class="det-label"><spring:message code='lbl.delivery.date' text='배송일'/></td>
	<td class="det-value"><fmt:formatDate value="${prchsDetail.dlvr_date}" pattern="yyyy-MM-dd"/></td>
	<td class="det-label"><spring:message code='lbl.delivery.finish.date' text='배송완료일'/></td>
	<td class="det-value"><fmt:formatDate value="${prchsDetail.dlvr_comp_date}" pattern="yyyy-MM-dd"/></td>
</tr>
<tr>
	<td class="det-label"><spring:message code='lbl.buy.finish.date' text='구매완료일'/></td>
	<td class="det-value"><fmt:formatDate value="${prchsDetail.prchs_comp_date}" pattern="yyyy-MM-dd"/></td>
	<td class="det-label"><spring:message code='lbl.buy.cancel.date' text='구매취소일'/></td>
	<td class="det-value"><fmt:formatDate value="${prchsDetail.prchs_cncl_date}" pattern="yyyy-MM-dd"/></td>
	<td class="det-label"><spring:message code='lbl.buy.status' text='구매상태'/></td>
	<td class="det-value"><span style="color:#ff0000;">${prchsDetail.prchs_stat_name}</span></td>
</tr>
<tr height="80">
	<td class="det-label"><spring:message code='lbl.etc' text='비고'/></td>
	<td class="det-value" colspan="5">${prchsdetail.rmrks}</td>
</tr>
</table>
	<img src='<spring:message code='img.btn.close' text='닫기'/>' style="margin-top:5px;margin-right:5px; float:right;cursor: pointer;" onclick="self.close();"/>
</body>
</html>
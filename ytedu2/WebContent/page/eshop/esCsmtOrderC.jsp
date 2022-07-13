<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/commonValidation.js"></script>
<script src="/js/commonUtil.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
    cmYTCaresInit();
});

function fillInfo(){
	document.getElementById('dlvr_name').value=document.getElementById('user_name').value;
	document.getElementById('dlvr_phone').value=document.getElementById('cell_phone').value;
	document.getElementById('dlvr_addr').value=document.getElementById('addr').value;
}

function submitCheck(){
    if(!cmChkForm2('csmtPrchsForm')){
        return false;
    }
    document.csmtPrchsForm.submit();
}

/*
function failed(){
	if("${requestScope.problem_csmt}" == "true"){
		alert("<spring:message code='error.not.enough.goods' text='재고가 부족합니다.'/>");
		location.href="/EsCsmtService/selectCsmtList.do?csmt_kind_cd=NEW";
	}
	if("${requestScope.problem_csmt_ad}" == "true"){
		alert("<spring:message code='error.not.enough.goods' text='재고가 부족합니다.'/>");
		location.href="/EsCsmtService/selectCsmtList.do?csmt_kind_cd=NEW";
	}
}
*/
</script>
<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr valign="top">
		<td><img src="<spring:message code='img.eshop.bg' />" /></td>
	</tr>
	<tr valign="top" >
		<td align="center" style="padding-top: 18px;">
			<jsp:include page="/page/eshop/esTopMenu_f.jsp"/>
		</td>
	</tr>
	<tr >
		<td style="padding-top: 20px;">
	    <form name="csmtPrchsForm" action="/EsCsmtOrderService/userCallCsmtOrder.do">
		   <table class="header" width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr height="34px;">
					<td><spring:message code='lbl.number' text='순번'/></td>
			   		<td><spring:message code='lbl.goods.name' text='상품명'/></td>
			   		<td><spring:message code='lbl.amount' text='수량'/></td>
			   		<td><spring:message code='lbl.goods.price' text='상품금액'/></td>
				</tr>
				<c:set var="bcList" value="${buyCart}"/>
				<c:forEach var="bc" items="${bcList}">
				<tr height="40">
					<td>
						<input type="hidden" name="cart_no" value="${bc.cart_no}">
						<c:out value="${bc.cart_no}"/>
					</td>
					<td>
						<c:out value="${bc.csmt_name}"/>
					</td>
					<td>
						<c:out value="${bc.total_count}"/>
					</td>
					<td>
						<c:out value="${bc.total_price}"/>
					</td>
				</tr>
				</c:forEach>
			</table>
			<table cellpadding="0" cellspacing="0" border="0" style="padding-top:10px;">
				<colgroup>
					<col width="80"/>
					<col width="140"/>
					<col width="80"/>
					<col width="140"/>
					<col width="80"/>
					<col width="*"/>
				</colgroup>
				<tr>
					<td style="padding-bottom: 10px;"><b><spring:message code='lbl.order.user' text='주문자'/></b></td>
					<td align="left" colspan="5" style="padding-bottom: 10px;"><input type="checkbox" onclick="fillInfo()" style="padding-right: 5px;"/><spring:message code='lbl.same.order.accepter' text='수신자와 정보 동일'/></td>
				</tr>
				<tr bgcolor="#fafafa">
					<td class="silver" height="28px;" style="border: 1px solid #D7D7D7;"><spring:message code='lbl.name' text='이름'/></td>
					<td width="140" style="border-top: 1px solid #D7D7D7;border-bottom: 1px solid #D7D7D7;"> 
						<input type="hidden" name="prchs_user_id" value="${userInfo.user_id}">
						<input type="text" id="user_name"  size="15" disabled = "disabled" value="${userInfo.user_name}" style="width: 140px;border: 0;">
					</td>
					<td class="silver" style="border: 1px solid #D7D7D7;"><spring:message code='lbl.phone' text='전화번호'/></td>
					<td width="140" style="border-top: 1px solid #D7D7D7;border-bottom: 1px solid #D7D7D7;"><input type="text" id="cell_phone" size="15" disabled="disabled" value="${userInfo.cell_phone}" style="width: 140px;border: 0;"></td>
					<td class="silver" style="border: 1px solid #D7D7D7;"><spring:message code='lbl.address' text='주소'/></td>
					<td style="border-top: 1px solid #D7D7D7;border-bottom: 1px solid #D7D7D7;border-right: 1px solid #D7D7D7;"><input type="text" id="addr"  size="55" disabled = "disabled" value="${userInfo.addr}" style="width: 380px;border: 0;"></td>
				</tr>
				<tr><td style="padding-bottom: 20px;">&nbsp;</td><td style="padding-bottom: 20px;">&nbsp;</td></tr>
				<tr>
					<td style="padding-bottom: 10px;"><b><spring:message code='lbl.accepter' text='수신자'/></b></td>
					<td colspan="5">&nbsp;</td>
				</tr>
				<tr >
					<td class="silver" height="28px;" style="border-top: 1px solid #D7D7D7;border-bottom: 1px solid #D7D7D7;border-left: 1px solid #D7D7D7;"><spring:message code='lbl.name' text='이름'/></td>
					<td><input name="dlvr_name" id="dlvr_name"  size="15" required="required" maxbyte="100" class="input" value="" style="width: 140px;height: 28px;line-height:26px;"></td>
					
					<td class="silver" style="border-top: 1px solid #D7D7D7;border-bottom: 1px solid #D7D7D7;"><spring:message code='lbl.phone' text='전화번호'/></td>
					<td><input name="dlvr_phone" id="dlvr_phone"  size="15" required="required" maxbyte="20" class="input" value="" style="width: 140px;height: 28px;line-height:26px;"></td>
					<td class="silver" style="border-top: 1px solid #D7D7D7;border-bottom: 1px solid #D7D7D7;"><spring:message code='lbl.address' text='주소'/></td>
					<td>
						<input name="dlvr_addr" id="dlvr_addr" size="55" required="required" maxbyte="200" class="input" value="" style="width: 380px;height: 28px;line-height:26px;">
						<input type="hidden" name="pay_acc" value=""/>
					</td>
				</tr>
				<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-top: 20px;">
				<tr>
					<td align="center">
						<img src="<spring:message code='img.btn.order'/>" style="cursor:pointer" onClick="submitCheck();"/>
						<img src="<spring:message code='img.btn.cancel'/>" onClick="javascript:window.location='/EsCsmtService/selectCsmtList.do?csmt_kind_cd=ALL'" style="cursor:pointer">
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
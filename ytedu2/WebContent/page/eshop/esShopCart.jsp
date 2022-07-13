<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link href="${ctxPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script src="${ctxPath}/js/commonValidation.js"></script>
<script src="${ctxPath}/js/commonUtil.js"></script>
<script src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	cmYTCaresInit();
});

function optpop_open(cart_no){
	cmOpenPopup("/EsCsmtOrderService/callCartOpt.do?call_cart_no="+cart_no,"OptionChangePopup","400","200","auto");
}

function del(cart_no) {
	location.href = "/EsCsmtOrderService/callCartCsmtDel.do?cart_no="+cart_no;
	
}

function order(cart_info){
	document.getElementById(cart_info).checked="checked";
	document.orderAction.submit();
}

function orderChk(){
	var arr = new Array();
	var chkNum = 0;
	arr = document.getElementsByName('cart_check');
	for(var i=0;i<arr.length;i++){
		if(arr[i].checked){
			chkNum=1;
	        break;
		}
	}
	if(chkNum == 0){
		alert("<spring:message code='error.check.goods' text='상품을 체크해 주십시오.'/>");
		return false;
	}
	document.orderAction.submit();
}

function chkAllOrder(isCheck) {
	if (!isCheck) {
		isCheck = false;
	}
	var chks = document.getElementsByName('cart_check');
	for (var i = 0; i < chks.length; i++) {
		chks[i].checked = isCheck;
	}

}
</script>
</head>
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
	<tr>
	 	<td style="padding-top: 20px;">
	    <c:set var="cartList" value="${sessionScope.cartBeanList}"/>
	    <form method="post" name="orderAction" action="/EsCsmtOrderService/selectedShopCart.do">
			<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
				<tr class="header">
					<td width="25"><input type="checkbox" onclick="chkAllOrder(this.checked)" style="background-color: #f4f4f4;"/></td>
					<td width="80"><spring:message code='lbl.number' text='순번'/></td>
			   		<td width="*"><spring:message code='lbl.goods.name' text='상품명'/></td>
			   		<td width="100"><spring:message code='lbl.amount' text='수량'/></td>
			   		<td width="200"><spring:message code='lbl.goods.price' text='상품금액'/></td>
			   		<td width="140"><spring:message code='btn.order' text='주문'/></td>
				</tr>
				<c:choose>
				<c:when test="${empty cartList}">
				<tr height="250">
					<td colspan="6">
						<spring:message code='error.empty.cart' text='장바구니가 비어있습니다.'/>
					</td>
				</tr>
				</c:when>
				<c:when test="${!empty cartList}">
				<c:forEach items="${cartList}" var="cartInfo" varStatus="itemCount">
				<tr height="50">
					<td><input type="checkbox" id="cart_check+${cartInfo.cart_no}" name="cart_check" value="${cartInfo.cart_no}"></td>
					<td><c:out value="${cartInfo.cart_no}"/></td>
			   		<td>
		   			<c:out value="${cartInfo.csmt_name}"/>&nbsp;&nbsp;
		   			<c:choose>
		   				<c:when test="${cartInfo.goods_state eq 'AD'}">
		   					<spring:message code='lbl.goods.add.used' text='추가상품 있음'/>
		   				</c:when>
		   				<c:when test="${cartInfo.goods_state eq 'OP'}">
		   					<spring:message code='lbl.option.used' text='옵션 있음'/>
		   				</c:when>
		   				<c:when test="${cartInfo.goods_state eq 'OA'}">
		   					<spring:message code='lbl.option.used.goods' text='옵션 있음, 추가상품 있음'/>
		   				</c:when>
		   			</c:choose>
			   		</td>
			   		<td>
			   			<c:out value="${cartInfo.total_count}"/>
			   			<img src="<spring:message code='img.board.change' text='변경'/>" style="cursor:pointer;" onclick="optpop_open('${cartInfo.cart_no}')"/>
			   		</td>
			   		<td align="right">
			   			<fmt:formatNumber value="${cartInfo.total_price}" pattern="###,###,###,###,###"/>
			   		</td>
			   		<td>
			   			<img src="<spring:message code='img.board.order' text='주문'/>" style="cursor:pointer;" onclick="order('cart_check+${cartInfo.cart_no}')"/>
			   			<img src="<spring:message code='img.board.delete' text='삭제'/>" style="cursor:pointer;" onclick="del('${cartInfo.cart_no}')"/>
			   		</td>
				</tr>
				</c:forEach>
				<c:if test="${fn:length(cartList) < 5}">
					<c:forEach var="i" begin="1" end="${5 - fn:length(cartList)}">
						<tr height="50"><td colspan="6">&nbsp;</td></tr>
					</c:forEach>
				</c:if>
				</c:when>
				</c:choose>
		 </table>
		 </form>
		 <c:if test="${!empty cartList}">
			<table width="100%">
				<tr>
					<td align="center">
						<img src="<spring:message code='img.board.allselect' text='전체선택'/>" style="cursor:pointer;" onclick="chkAllOrder(true);"/>
						<img src="<spring:message code='img.board.selorder' text='선택주문'/>" style="cursor:pointer;" onclick="orderChk();"/>
					</td>
				</tr>
			</table>
		</c:if>
		</td>
	</tr>
</table>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>

</body>
</html>
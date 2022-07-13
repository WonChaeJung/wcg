<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ytcares" uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<!-- 코멘트 삽입 부분(doctype 위에 코멘트 쓰지 말것) -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link href="${ctxPath}/css/style_shop.css" rel="stylesheet" type="text/css"/>
<script src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script src="../js/commonValidation.js"></script>
<script src="../js/commonUtil.js"></script>
<script type="text/javascript">
var k=0;
var l=0;
var prchsOk=0;

$(document).ready(function(){
    cmYTCaresInit();
});

function cartAdded(){
	if("${param.cartAdded}" == "true"){
		var sure = confirm("<spring:message code='confirm.cart.goods.in' text='장바구니에 물품이 담겼습니다. 지금 확인해보시겠습니까?'/>");
		if(sure)
			location.href="/EsCsmtOrderService/callCsmtCart.do";
	}
}

function addPrchs_Add(){
	var addGoods = document.getElementsByName('addGoods');
	var hiddenString="";
	var total_price=0;
	var addGoodsString="";
	for(var j=0;j<addGoods.length;j++){
		if(addGoods[j].value!=""){
			addGoodsString+=addGoods[j].options[addGoods[j].selectedIndex].firstChild.nodeValue;
			hiddenString+='<input type="hidden" name="prchsAddVal" value='+addGoods[j].value+'>';
			total_price+=parseInt(addGoods[j].options[addGoods[j].selectedIndex].getAttribute("add_price"));
			
			var div = document.createElement('div');
			div.setAttribute('style', 'text-align:right;');
			
			addGoodsString+=hiddenString
				+'<input type="button" value= "+" style="float:none;" onClick="javascript:document.getElementById(\'prchsAddCount'+l+'\').value++;'
				+'priceCalc(\'prchsAddCount'+l+'\', \'prchsAddPrice'+l+'\', \'prchsAddDefPrice'+l+'\');">'
				
				+'<input type="button" value= "-" style="float:none;" onClick="javascript:if(document.getElementById(\'prchsAddCount'+l+'\').value>=2)'
				+'document.getElementById(\'prchsAddCount'+l+'\').value--;'
				+'priceCalc(\'prchsAddCount'+l+'\', \'prchsAddPrice'+l+'\', \'prchsAddDefPrice'+l+'\');">'
				
				+'수량 : <input type="text" style="width:20px;" chkType="num" onchange="priceCalc(\'prchsAddCount'+l+'\', \'prchsAddPrice'+l+'\', \'prchsAddDefPrice'+l+'\')"' 
				+'onblur="priceCalc(\'prchsAddCount'+l+'\', \'prchsAddPrice'+l+'\', \'prchsAddDefPrice'+l+'\')" value=1 id="prchsAddCount'+l+'" name="prchsAddCount"/>'
				
				+'<input type="text" style="width:80px;" maxlength="8" readonly="readonly" '
	            +' name="prchsAddPrice" id="prchsAddPrice'+l+'" onblur="priceCalc(\'prchsAddCount'+l+'\', \'prchsAddPrice'+l+'\', \'prchsAddDefPrice'+l+'\')" value="'+total_price+'"><spring:message code="lbl.won" text="원"/>'
	            
	            +'<input type="hidden" id="prchsAddDefPrice'+l+'" value="'+total_price+'">'//기본가격+옵션가격총합
				+'<input type="button" value="<spring:message code='btn.delete' text='삭제'/>" onclick="remove_item(this)" style="float:none;">';
			div.innerHTML = addGoodsString+document.getElementById('Optional').innerHTML;
			
			document.getElementById('field').appendChild(div);
			cmYTCaresInit();
			l++;
		}
	}
	
}

function addCart(){
	var addCart = document.getElementsByName('insertCart');
	addCart.Submit;
}

function del(id) {
	var tr = document.getElementById(id);
	tr.parentNode.removeChild(tr);
	i--;
}

function addPrchs_Opt(idx){
	var prchsOption = document.getElementsByName('selectedOpt');
	if (idx == 0 && prchsOption.length != 1) {
		for(var i=0;i<prchsOption.length;i++){
			if (i != 0) {
				prchsOption[i].selectedIndex = -1;
			}
		}
	} else {
		var j=0;
		var prchsString="";
		var hiddenString="";
		var total_price=0;
		for(var i=0;i<prchsOption.length;i++){
			if(prchsOption[i].value!=""){
				prchsString+=prchsOption[i].options[prchsOption[i].selectedIndex].getAttribute("code_nm1")+" ";
				total_price+=parseInt(prchsOption[i].options[prchsOption[i].selectedIndex].getAttribute("code_nm2"));
				
				hiddenString+='<td><input type="hidden" name="prchsVal" value='+prchsOption[i].value+'></td>';
				j++;
			}
			else if(prchsOption[i].value==""){
				j--;
			}
		}
		if("${optlistSize}" == j){//해당 상품이 가진 전체 옵션 사이즈 받아와서 콤보 박스에 값을 선택했는지 체크후에 추가
			
			var div = document.createElement('div');
			div.setAttribute('id', prchsString);
			div.setAttribute('style', 'text-align:right;');
			if (document.getElementById(div.id) != null) {
				return ;
			}
			prchsString+=hiddenString
				
				+'<spring:message code='lbl.amount' text='수량'/> : '
				+'<img src="<spring:message code='img.board.plus' />" style="cursor:pointer;float:none;" onClick="javascript:document.getElementById(\'prchsCount'+k+'\').value++;'
				+'priceCalc(\'prchsCount'+k+'\', \'prchsPrice'+k+'\', \'prchsDefPrice'+k+'\');">'
				
				+' <input type="text" style="width:20px;" maxlength="4"' 
				+'chkType="num" required="required" onchange="priceCalc(\'prchsCount'+k+'\', \'prchsPrice'+k+'\', \'prchsDefPrice'+k+'\')"' 
				+'onblur="priceCalc(\'prchsCount'+k+'\', \'prchsPrice'+k+'\', \'prchsDefPrice'+k+'\')" value=1 id="prchsCount'+k+'" name="prchsCount"/>'

				+'<img src="<spring:message code='img.board.minus' />" style="cursor:pointer;float:none;padding: 0 10px 0 3px;" onClick="javascript:if(document.getElementById(\'prchsCount'+k+'\').value>=2)'
				+'document.getElementById(\'prchsCount'+k+'\').value--; priceCalc(\'prchsCount'+k+'\', \'prchsPrice'+k+'\', \'prchsDefPrice'+k+'\')">'
				
				+'<input type="text" style="width:80px;border:0px;" maxlength="8" readonly="readonly" align="righti"'
				+' name="prchsPrice" id="prchsPrice'+k+'" value="'+(Number('${csmtBeanInfo.csmt_price}')+total_price)+'"><spring:message code="lbl.won" text="원"/>'
				
				+'<input type="hidden" id="prchsDefPrice'+k+'" value="'+(Number('${csmtBeanInfo.csmt_price}')+total_price)+'">'//기본가격+옵션가격총합
				+'<img src="<spring:message code='img.board.delete' />" style="cursor:pointer;float:none;padding:4px 0 4px 4px;" onclick="remove_item(this)">';
			div.innerHTML = prchsString+document.getElementById('Optional').innerHTML;
			document.getElementById('field').appendChild(div);
			cmYTCaresInit();
			k++;
			prchsOk=1;
		}
	}
}

function priceCalc(obj, obj2, obj3){
    if(document.getElementById(obj).value<=0){
        alert("<spring:message code='error.require.check.word' text='-값 입력 불가'/>");
        document.getElementById(obj).value=1;
        priceCalc(obj, obj2, obj3);
        return;
    }
    var prchsCount = document.getElementById(obj).value;
    var prchsDefPrice = document.getElementById(obj3).value;
    document.getElementById(obj2).value=prchsCount*prchsDefPrice;
}

function remove_item(obj){
	document.getElementById('field').removeChild(obj.parentNode);
	k--;
	if(k==0){
		prchsOk=0;
	}
}

function submitCheck(type){
	if("${optlistSize}"!=0){
		if(prchsOk == 0){
			alert("<spring:message code='confirm.check.option' text='옵션을 선택하여 주십시오.'/>");
			return false;
		}
	}
	
	if(!cmChkForm2('insertCart')){
		return false;
	}
	var csmt_stock = parseInt("${csmtBeanInfo.csmt_stock}");
	var prchsCount = document.getElementsByName('prchsCount');
	var prchs = 0;
	for(var i=0;i<prchsCount.length;i++){
		prchs+=prchsCount[i].value;
	}
	
	
	if(csmt_stock<prchs){
		alert("<spring:message code='error.not.enough.goods'/>");
		return false;
	}
	
	if(type == 1){
		document.getElementById('wherePrchs').value = 1;
	}
	
	else {
		document.getElementById('wherePrchs').value = 2;
    }
	document.insertCart.submit();
}
</script>
</head>

<body onload="cartAdded()">
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
		<td>
	    <c:set var="Good" value="${csmtBeanInfo}"/>
		<c:set var="GoodOpt" value="${csmtOptBeanInfo}"/>
		<c:set var="AdList" value="${csmtBeanList}"/>
		<form name="insertCart" method="post" action="/EsCsmtOrderService/callShopCart.do">
		   <table width="900" style="padding-top:20px;" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td style="padding-left:20px" width="250" valign="top">
					   <input type="hidden" id="wherePrchs" name="wherePrchs" value="">
						<img src="/ytcares/eshop/${Good.csmt_img}" border="0" width="250" height="180"/>
					</td>
					<td valign="top">
						<table class="board-list" width="575" style="padding-left:40px;" border="0" cellpadding="0" cellspacing="0">
							<colgroup>
								<col width="100"/>
								<col width="475"/>
							</colgroup>
							<tr>
								<td class="silver" style="border-top: 1px solid #D7D7D7;"><spring:message code='lbl.goods.section' text='상품구분'/></td>
								<td align="left" style="padding-left:20px;border-top: 1px solid #D7D7D7;">
									<input type="hidden" name="csmt_kind_cd" value="${Good.csmt_kind_cd}"/>
									<c:choose>
										<c:when test="${Good.csmt_kind_cd eq 'CH'}">药品</c:when>
										<c:when test="${Good.csmt_kind_cd eq 'BK'}">教材</c:when>
										<c:when test="${Good.csmt_kind_cd eq 'GD'}">美容仪</c:when>
									</c:choose>
									&nbsp;新品
								</td>
							</tr>
							
							<tr>
								<td class="silver"><spring:message code='lbl.goods.name' text='상품명'/></td>
								<td align="left" style="padding-left:20px;"><input type="hidden" name="csmt_name" value="${Good.csmt_name}"/>${Good.csmt_name}</td>
							</tr>
							
							<tr>
								<td class="silver"><spring:message code='lbl.goods.num' text='상품번호'/></td>
								<td align="left" style="padding-left:20px;"><input type="hidden" name="csmt_id" value="${Good.csmt_id}"/>${Good.csmt_id}</td>
								
							</tr>
							
							<tr>
							    <td class="silver"><spring:message code='lbl.goods.sale.price' text='판매가'/>
							    <input type="hidden" name="csmt_def_price" value="${Good.csmt_price}"/>
							    </td>
							    <td align="left" style="padding-left:20px;">&nbsp;</td>
							</tr>
							
							<tr>
			                    <td class="silver"><spring:message code='lbl.goods.amount' text='재고수량'/></td>
			                    <td align="left" style="padding-left:20px;"><input type="hidden" id="csmt_stock" name="csmt_stock" value="${Good.csmt_stock}"/>${Good.csmt_stock}</td>
							</tr>
                            
							<tr>
							<c:choose>
								<c:when test="${!empty GoodOpt}">
								    <td class="silver"><spring:message code='lbl.order.option' text='주문옵션'/></td>
									<td class="det-value-border" align="left" style="padding-left:20px;">
										<c:forEach var="Gopt" items="${GoodOpt}" varStatus="idx">
											<ytcares:code name="selectedOpt" id="selectedOpt" cssStyle="width:190px;" mcodeCd="${Gopt.csmt_opt_cd}" lblCol="CODE_NM1" valCol="DCODE_CD" blank="<spring:message code='lbl.select.check' text='선택해주세요.'/>" onchange="addPrchs_Opt('${idx.index}')"/>
											<input type="hidden" name="mCodeOpt" value="${Gopt.csmt_opt_cd}"/><br/>
										</c:forEach>
									</td>
								</c:when>
								<c:when test="${empty GoodOpt}">
									<td class="silver"><spring:message code='lbl.order.amount' text='주문수량'/></td>
									<td class="det-value-border" align="left" style="padding-left:20px;">
										<input type="text" name="prchsCount" required="required" value="1" size="4" maxlength="4" chkType="num"/>개
									</td>
								</c:when>
							</c:choose>
							<c:if test="${!empty AdList}">
								<td class="det-label"><spring:message code='lbl.add.form' text='추가구성'/></td>
								<td class="det-value-border" align="left">
									<select name="addGoods" onchange="addPrchs_Add()" >
										<option selected="selected" value="">
											<spring:message code='lbl.select.check' text='선택해주세요.'/>
										</option>
										<c:forEach var="Aopt" items="${AdList}" varStatus="idx">
										<option value="${Aopt.csmt_id}" add_price="${Aopt.csmt_price}">
											<c:out value="${Aopt.csmt_name}" />
										</option>
										</c:forEach>
									</select>
								</td>
							</c:if>
							</tr>
							<tr>
								<td colspan="4" valign="top">
									<div id="Optional" style="display:none"></div>
									<div id="field" style="width:575px;"></div>
									<div id="resultPrice" style="width:575px;"></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" align=right style="padding-top: 20px;">
						<img src='<spring:message code="img.btn.order" text="주문하기"/>' onclick="submitCheck(1)" style="cursor: pointer;"/>
						<img src='<spring:message code="img.btn.cart" text="장바구니"/>' style="margin-right:10px;cursor: pointer;" onclick="submitCheck(2)"/>
					</td>
				</tr>
				<tr height="20"><td></td></tr>
			</table>
			<table width="900" cellpadding="0" cellspacing="0" border="0" align="center" style="border-top: 1px solid #D7D7D7;border-bottom: 2px solid #D7D7D7;">
			    <tr>
                    <td style="padding-top: 20px;"><div style="width:900px;min-height:250px;overflow:auto;">${Good.csmt_desc}</div></td>
                </tr>
                <tr>
                    <td style="padding-top: 20px;">
	                    <img src='<spring:message code="img.btn.order" text="주문하기"/>' onclick="submitCheck(1)" style="cursor: pointer;"/>
	                    <img src='<spring:message code="img.btn.cart" text="장바구니"/>' style="margin-right:10px;cursor: pointer;" onclick="submitCheck(2)"/>
                    </td>
                </tr>
                <tr height="20"><td></td></tr>
			</table>
		</form>
		</td>
	</tr>
</table>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<!-- 공통메세지처리 -->
<ytcares:msg/>
</body>
</html>
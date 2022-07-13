<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link href="${ctxPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script src="../js/commonValidation.js"></script>
<script src="../js/commonUtil.js"></script>
<script type="text/javascript">

$(document).ready(function(){
    cmYTCaresInit();
});

function priceCalc(obj, obj2, obj3){
	if(document.getElementById(obj).value<=0){
		alert("<spring:message code='error.require.check.word' text='-값 입력 불가'/>");
		document.getElementById(obj).value=1;
		priceCalc(obj, obj2, obj3);
		return;
	}
	document.getElementById(obj3).value=document.getElementById(obj).value*obj2;
}

function remove_item(id){
	var tr = document.getElementById(id);
	tr.parentNode.removeChild(tr);
}

function changedCart(){
	if("${requestScope.changed}" == "true"){
		window.close();
		window.opener.location.reload(); 
	}
}

function submitCheck(){
    if(!cmChkForm2('optionChange')){
        return false;
    }
    document.optionChange.submit();
}

</script>
</head>
<body onload="changedCart()">
	<form name="optionChange" action="/EsCsmtOrderService/callCartOptCng.do" method="post">
	<input type="hidden" name="cart_no" value="${itemInfo.cart_no}"/>
	<table class="ytcares-content" width="100%" height="150" border="0" cellpadding="0" cellspacing="0">
	<c:choose>
		<c:when test="${itemInfo.goods_state eq 'DEF'||itemInfo.goods_state eq 'AD'}">
		<tr>
			<td>
				<table class="ytcares-detail" style="width:100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="80"><spring:message code='lbl.amount' text='수량'/> : </td> 
						<td width="30">
					    	<img src="<spring:message code="img.board.plus"/>" style="cursor:pointer;" onClick = "javascript:document.getElementById('prchsCount').value++;priceCalc('prchsCount','${itemInfo.def_price}','priceTotal')">
					    </td>
						<td width="35">
						<input type="text" size="2" maxlength="4" chkType="num" style="width:30px;"
							onblur="priceCalc('prchsCount','${itemInfo.def_price}','priceTotal')" 
							id="prchsCount" value="${itemInfo.def_count}" name="prchsCount"/>
						</td>
		                <td width="30">
							<img src="<spring:message code="img.board.minus"/>" style="cursor:pointer;" onClick = "javascript:if(document.getElementById('prchsCount').value>=2)
							document.getElementById('prchsCount').value--;
							priceCalc('prchsCount','${itemInfo.def_price}','priceTotal')">
						</td>  
						<td width="*" align="left"><input type="text" size="8" readonly="readonly" style="text-align:right;width:60px;" name="optTotal" 
		                   id="priceTotal" value="${itemInfo.def_count*itemInfo.def_price}"><spring:message code='lbl.won' text='원'/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		</c:when>
		
		<c:when test="${itemInfo.goods_state ne 'DEF'}">
			<c:if test="${!empty itemInfo.option_List}">
				<c:forEach items="${itemInfo.option_List}" var="opl" varStatus="optIndex">
				<tr>
					<td>
						<table class="ytcares-detail" style="width:100%;margin-top:1px;" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="1"><input type="hidden" name="cart_opt_no" value="${opl.cart_opt_no}"/></td>
								<td width="*">
								<c:forEach items="${opl.option_prop}" var="oprop">
									<c:out value="${oprop.code_nm1}"/>
								</c:forEach>
								</td>
								<td width="80"><spring:message code='lbl.amount' text='수량'/> : </td>
								<td width="35"><img src="<spring:message code="img.board.plus"/>" style="cursor:pointer;" onClick = "javascript:document.getElementById('prchsCount+${optIndex.count}').value++;
								priceCalc('prchsCount+${optIndex.count}','${opl.def_opt_price}','priceTotal+${optIndex.count}')"></td>
								<td width="35"><input type="text" size="2" chkType="num" maxlength="4" style="width:30px;" onblur="priceCalc('prchsCount+${optIndex.count}','${opl.def_opt_price}','priceTotal+${optIndex.count}')"  id="prchsCount+${optIndex.count}" value="${opl.opt_cnt}" name="prchsCount"/></td>
								<td width="35"><img src="<spring:message code="img.board.minus"/>" style="cursor:pointer;" onClick = "javascript:if(document.getElementById('prchsCount+${optIndex.count}').value>=2)
									document.getElementById('prchsCount+${optIndex.count}').value--;
									priceCalc('prchsCount+${optIndex.count}','${opl.def_opt_price}','priceTotal+${optIndex.count}')"></td>
								<td width="100" align="right"><input type="text" size="9" readonly="readonly" style="text-align:right;" name="optTotal" 
								id="priceTotal+${optIndex.count}" value="${opl.total_price}"><spring:message code='lbl.won' text='원'/></td>
								
								<!-- <td><input type="button" value="삭제" onclick="remove_item('opt+${optIndex.count}')"></td> -->
							</tr>
						</table>
					</td>
				</tr>
				</c:forEach>
			</c:if>
		</c:when>
	</c:choose>
			
    <c:if test="${!empty itemInfo.addgoods_List}">
		<c:forEach items="${itemInfo.addgoods_List}" var="add" varStatus="addIndex">
		<tr>
			<td>
				<table class="ytcares-detail" style="width:100%;margin-top:1px;" border="0" cellpadding="0" cellspacing="0">
				<tr id="addGoods+${addIndex.count}">
				<td width="1"><input type="hidden" name="cart_ad_no" value="${add.cart_ad_no}"/></td>
				<td width="*"><c:out value="${add.addCsmt.csmt_name}"/></td>
				
				
				
				
				<td width="80"><spring:message code='lbl.amount' text='수량'/> : </td>
				<td width="35"><img src="<spring:message code="img.board.plus"/>" style="cursor:pointer;" onClick = "javascript:document.getElementById('prchsAddCount+${addIndex.count}').value++;
				priceCalc('prchsAddCount+${addIndex.count}','${add.addCsmt.csmt_price}','priceAddTotal+${addIndex.count}')"></td>
				<td width="35"><input type="text" size="2" chkType="num" style="width:30px;"
				onblur="priceCalc('prchsCount+${addIndex.count}','${add.addCsmt.csmt_price}','priceAddTotal+${addIndex.count}')" 
				id="prchsAddCount+${addIndex.count}" value="${add.prchs_cnt}" name="prchsAddCount"/></td>
				<td width="35"><img src="<spring:message code="img.board.minus"/>" style="cursor:pointer;" onClick = "javascript:if(document.getElementById('prchsAddCount+${addIndex.count}').value>=2)
					document.getElementById('prchsAddCount+${addIndex.count}').value--;
					priceCalc('prchsAddCount+${addIndex.count}','${add.addCsmt.csmt_price}','priceAddTotal+${addIndex.count}')"></td>
				<td width="100" align="right"><input type="text" size="9" readonly="readonly" style="text-align:right;" name="addTotal" 
				id="priceAddTotal+${addIndex.count}" value="${add.total_price}"><spring:message code='lbl.won' text='원'/></td>
				
				<!-- <td><input type="button" value="<spring:message code='lbl.delete' text='삭제'/>" onclick="remove_item('addGoods+${addIndex.count}')"></td> -->
			</tr>
			</table>
		</td>
		</tr>
		</c:forEach>
	</c:if>
	</table>
	</form>
	<table style="margin-top:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center">
				<img src="<spring:message code="img.board.change"/>" style="cursor:pointer;" onclick="submitCheck();">
				<img src="<spring:message code="img.board.cancel"/>" style="cursor:pointer;" onclick="javascript:window.close();">
			</td>
		</tr>
	</table>
</body>
</html>
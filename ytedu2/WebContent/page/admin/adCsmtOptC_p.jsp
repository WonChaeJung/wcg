<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"			uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"			uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring"		uri="http://www.springframework.org/tags"%>
<!--
file name : adCsmtOptC_p.jsp
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/commonValidation.js"></script>
<script src="/js/commonUtil.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	cmYTCaresInit();
});

function addDetailOpt(){
	var div = document.createElement('div');
    div.innerHTML = document.getElementById('Optional').innerHTML;
    document.getElementById('field').appendChild(div);
    cmYTCaresInit();
}

function remove_item(obj){
    document.getElementById('field').removeChild(obj.parentNode);
}

function orderChk(){
    var arr = new Array();
    var chkNum = 0;
    arr = document.getElementsByName('detailOpt');
    for(var i=0;i<arr.length;i++){
        if(arr[i].value!=""){
            chkNum=1;
            break;
        }
    }
    if(chkNum == 0){
        alert("最少要选一个项目"); //상세 옵션을 하나라도 입력 하십시오.
        return false;
    }
    return true;
}

function submitChk(){
	if(!orderChk()){
		return false;
	}
	if(!cmChkForm2('optForm')){
        return false;
    }
	document.optForm.submit();
}

function change_succeed(){
	if("${requestScope.changed}" == 1){
		opener.addcodeoption("${requestScope.code_nm}","${requestScope.code_value}");
		alert("添加选项成功"); //옵션이 성공적으로 추가되었습니다.
		window.close();
	}
}
</script>
</head>
<body onload="change_succeed()">
<form name="optForm" action="/AdCsmtServiceImpl/adminInsertCsmtCodeInfo.do" method="post">
<input type="hidden" name="command" value="upd">
<table width="600" align="center" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td align="left">
        	<table class="ytcares-detail" border="0" cellpadding="0" cellspacing="0">
        		<tr>
        			<td class="det-label" width="100"><spring:message code="lbl.opt.name" text="옵션명"/></td>
        			<td class="det-value"><input type="text" name="optName" value="" required="required" maxbyte="100"></td>
        			<td class="det-label" width="100"><spring:message code="lbl.opt.cont" text="옵션설명"/></td>
        			<td class="det-value"><input type="text" name="rmrks" value="" maxbyte="500"></td>
        			<td> <img src="<spring:message code="img.btn.detail.add" text="상세추가"/>" style="cursor:pointer;" onClick="addDetailOpt()"></td>
        		</tr>
        		<tr>
        			<td colspan="5" align="left">
        				<div id="Optional" style="width:465px;display:none;padding-top:2px;">
   							<spring:message code="lbl.opt.cont" text="상세옵션명" />
   							<input type="text" name="detailOpt" maxlength="8" value="" >
	                		<spring:message code="lbl.add.price" text="추가가격"/>
	                		<input type="text" name="detailOptPrice" chkType="num" maxlength="8" style="width:80px" value="" >
        					<img src="<spring:message code="img.board.delete" text="삭제"/>" onclick="remove_item(this)" style="float:none;cursor:pointer;">
			            </div>
			            <div id="field"></div>
        			</td>
        		</tr>
        	</table>
        </td>
    </tr>
    <tr>
        <td style="padding: 10px;">
            <img src="<spring:message code="img.btn.add"/>" style="cursor:pointer;" onClick="submitChk()">
            <img src="<spring:message code="img.board.cancel"/>" style="cursor:pointer;" onClick="javascript:window.close()">
        </td>
    </tr>
</table>
</form>
</body>
</html>
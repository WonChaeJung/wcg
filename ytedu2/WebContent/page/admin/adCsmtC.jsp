<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<!--
file name : adCsmtC.jsp
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery-ui.min.css"/>
<link rel="stylesheet" type="text/css" href="/css/ytcares-calendar.css"/>
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/ytcares-calendar.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript" src="${ctxPath}/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var bsCal1 = new BsCalendar('bsCal1', {useTrigger:1,max:'now'});
	bsCal1.showCal();
});
function addOpt(){
	var div = document.createElement('div');
	div.innerHTML = document.getElementById('Optional').innerHTML;
	document.getElementById('field').appendChild(div);
}

function remove_item(obj){
	document.getElementById('field').removeChild(obj.parentNode);
}

function checkSelected(obj){
	var selectItems=document.getElementsByName('csmt_option');
	for(var i=1;i<selectItems.length;i++){
		if(selectItems[i].value == obj.value && selectItems[i] != obj){
			alert("<spring:message code='error.request.cant.select.same.item' text='다른 아이템을 선택하십시오.'/>");
			obj.value="";
			break;
		}
	}
}

function submitCheck(){
    if(!cmChkForm2('insertCsmt')){
        return false;
    }
    document.insertCsmt.submit();
}

function optpop_open(){
    cmOpenPopup("/AdCsmtServiceImpl/adminInsertCsmtCodeInfo.do?command=add","OptionChangePopup","600","250","yes");
}

function addcodeoption(code_nm, code_value){
	var csmt_option = document.getElementById('csmt_option');
	csmt_option[csmt_option.length] = new Option(code_nm, code_value);
}

function fileCheck(obj)
{
    
	var fileName = obj.value;
    var extension = fileName.substr(fileName.lastIndexOf(".") + 1 ,(fileName.length - fileName.lastIndexOf(".")));
     //조건문으로 이미지파일 이외 파일은 종료    
    if(extension.toLowerCase() != "jpg" && extension.toLowerCase() != "gif" && extension.toLowerCase() != "png" && extension.toLowerCase() != ""){
        alert('<spring:message code="error.request.img.file.type" text="jpg, gif, png 파일 형식으로 올려주시기 바랍니다."/>');
        obj.select();
        document.selection.clear();
        //fileValueReset();
        return;
    }
}
</script>
</head>
<body onload="cmYTCaresInit()">
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<table width="900" style="padding-top:20px;" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="150" align="center" valign="top" ><jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include></td>
		<td width="748" valign="top" style="padding-left: 2px;">
			<form method="post" name="insertCsmt" action="/AdCsmtServiceImpl/adminInsertCsmt.do" enctype="multipart/form-data">
			<input type="hidden" name="admin_menu" value="${param.admin_menu}"/>
			<table class="ytcares-detail" style="width:100%;" cellpadding="0" cellspacing="0" border="0">
				<colgroup>
					<col width="120"/>
					<col class="det-value" width="620"/>
				</colgroup>
					<tr>
						<td class="det-label"><spring:message code="lbl.select.kind" text="분류선택"/></td>
						<td class="det-value"><ytcares:code name="csmt_kind_cd" mcodeCd="ES001" lblCol="CODE_NM1" valCol="DCODE_CD" required="required"/></td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.goods" text="상품"/></td>
						<td class="det-value"><input type="text" size="55" maxlength="50" maxbyte="45" name="csmt_name" required="required" ></td>
					</tr>
					
					<tr>
						<td class="det-label"><spring:message code="lbl.option" text="옵션"/><img src="<spring:message code="img.btn.add"/>" style="padding-left:30px;cursor:pointer;" size="55" maxlength="50" name="optionAdd" value="추가" onclick="addOpt()"></td>
						
						<td class="det-value">
							<div id="Optional" style="display:none;width:200px;">
								<select id="csmt_option" name="csmt_option" onchange="checkSelected(this)">
									<option value="" selected="selected"><spring:message code="lbl.select.check" text="선택해주세요"/></option>
									<c:forEach var="OptList" items="${mcodeList}">
									<option value="${OptList.mcode_cd}">${OptList.mcode_nm}</option>
									</c:forEach>
								</select>
								<img src="<spring:message code="img.board.delete"/>" style="cursor:pointer;" onclick="remove_item(this)" style="float:none;">
							</div>
							<div id="field"></div>
						</td>
						
					</tr>
					<tr>
                       <td class="det-label"><spring:message code="lbl.code" text="코드"/><img src="<spring:message code="img.btn.add"/>" style="cursor:pointer;padding-left:30px;" onClick="optpop_open();"></td>
                    	<td class="det-value"></td>
                    </tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.price" text="가격"/></td>
						<td class="det-value"><input type="text" size="10" maxlength="8" name="csmt_price" required="required" chkType="num"/> <spring:message code="lbl.standard.money" text="원 (99999999원까지 지정 가능)"/></td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.amount" text="수량"/></td>
						<td class="det-value"><input type="text" size="10" maxlength="4" name="csmt_stock" required="required" chkType="num"/> <spring:message code="lbl.standard.count" text="개 (9999개까지 지정 가능)"/></td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.make.company" text="제조사"/></td>
						<td class="det-value"><input type="text" size="55" maxlength="20" name="pub_comp"></td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.make.date" text="제조날짜"/></td>
						<td class="det-value"><input type="text" readonly="readonly" size="10" maxlength="10" id="bsCal1" name="pub_date"></td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.goods.image" text="상품이미지"/></td>
						<td class="det-value">
							<div id="fileDiv">
								<input type="file" name="csmt_img" style="width:250px;height:20px;" onChange="fileCheck(this)">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="det-value" style="padding-top: 2px;"><textarea rows="13" id="csmt_desc" name="csmt_desc" style="width:748px;" ></textarea></td>
					</tr>
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="padding-top: 20px;">
				<tr>
					<td align="center">
						<img style="cursor: pointer" src=<spring:message code="img.btn.insert"/> onClick="submitCheck()">
						<img style="cursor: pointer" src=<spring:message code="img.btn.cancel"/> onClick="javascript:history.back()">
					</td>
				</tr>
			</table>
			</form>
			<script>
				CKEDITOR.replace('csmt_desc');
			</script>
		</td>
	</tr>
</table>

<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<!--
file name : adCsmtU.jsp
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>
<link href="/css/ytcares-calendar.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="/js/ytcares-calendar.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/js/commonUtil.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var bsCal1 = new BsCalendar('bsCal1', {useTrigger:1, max:'today'});
	bsCal1.showCal();
});

function csmtList() {
	location.href = '/AdCsmtServiceImpl/adminSelectCsmtList.do?admin_menu=2';	
}

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
function remove_img(obj){
	var isDelete = eval(obj.getAttribute('isDelete'));
	var csmtimg_check = document.getElementById('csmtimg_check');
	if(isDelete){
		document.getElementById('imgdeleted').value="1";
		document.getElementById('fileDiv').style.display="none";
		document.getElementById('csmt_img').value="";
		obj.setAttribute('isDelete', 'false');
		obj.value = '<spring:message code="lbl.cancel" text="취소"/>';
	}
	else if(!csmtimg_check.checked){
		document.getElementById('imgdeleted').value="0";
		document.getElementById('fileDiv').style.display="";
		obj.setAttribute('isDelete', 'true');
		obj.value = '<spring:message code="lbl.delete" text="삭제"/>';
	}
}

function optionDel(){
	var csmt_opt_del = document.getElementById('csmt_opt_del');
	var optionAdd = document.getElementById('optionAdd');
	var optionDisplay = document.getElementById('optionDisplay');
	if(csmt_opt_del.checked){
		optionAdd.style.display="none";
		optionDisplay.style.display="none";
	}
	else if(!csmt_opt_del.checked){
		optionAdd.style.display="";
		optionDisplay.style.display="";
	}
}
function submitCheck(){
    if(!cmChkForm2('updateCsmt')){
        return false;
    }
    document.updateCsmt.csmt_kind_cd.disabled = false;
    document.updateCsmt.submit();
}

function optpop_open(){
    cmOpenPopup("/AdCsmtServiceImpl/adminInsertCsmtCodeInfo.do?command=add","OptionChangePopup","600","250","auto");
}

function addcodeoption(code_nm, code_value){
    var csmt_option = document.getElementById('csmt_option');
    csmt_option[csmt_option.length] = new Option(code_nm, code_value);
}

function fileCheck(obj){
    
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
<c:set var="csmtinfo" value="${csmtInfo}"/>
<table width="900" style="padding-top:20px;" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="150" align="center" valign="top" ><jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include></td>
		<td width="748" valign="top" style="padding-left: 2px;">
			<form method="post" name="updateCsmt" action="/AdCsmtServiceImpl/adminUpdateCsmt.do" enctype="multipart/form-data">
			<input type="hidden" name="pageNum" value="${param.pageNum}"/>
			<input type="hidden" name="admin_menu" value="${param.admin_menu}"/>
			<table class="ytcares-detail" style="width:100%;" cellpadding="0" cellspacing="0" border="0">
				<colgroup>
					<col width="120"/>
					<col class="det-value" width="620"/>
				</colgroup>
					<tr>
						<td class="det-label"><spring:message code="lbl.select.kind" text="분류선택"/></td>
						<td class="det-value"><ytcares:code name="csmt_kind_cd" disabled="disabled" selected="${csmtinfo.csmt_kind_cd}" mcodeCd="ES001" lblCol="CODE_NM2" valCol="DCODE_CD" required="required"/></td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.goods" text="상품"/></td>
						<td class="det-value">
							<input type="hidden" name="csmt_id" value="${csmtinfo.csmt_id}">
							<input type="text" size="55" value="${csmtinfo.csmt_name}" maxlength="50" maxbyte="45" name="csmt_name" required="required">
						</td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.option" text="옵션"/><img src="<spring:message code="img.btn.add"/>" style="padding-left:40px;cursor:pointer;" size="55" maxlength="50" id="optionAdd" name="optionAdd" onclick="addOpt()"></td>
						<td class="det-value">
							<c:if test="${!empty csmtOptList}">
								<div>
								<c:forEach var="csmtopt" items="${csmtOptList}">
									<c:forEach var="mcode" items="${mcodeList}">
									<c:if test="${csmtopt.csmt_opt_cd eq mcode.mcode_cd}">
										<input type="hidden" name="csmt_cur_option" value="${mcode.mcode_cd}">
										<c:out value="${mcode.mcode_nm}"/>
									</c:if>
									</c:forEach>
								</c:forEach>
								<input type="checkbox" name="csmt_opt_del" id="csmt_opt_del" value="Y" onclick="optionDel()"/><spring:message code="lbl.goods.option.delete" text="상품 옵션 제거"/>
								</div>
							</c:if>
							<div id="optionDisplay">
								<div id="Optional" style="display:none">
									<select id="csmt_option" name="csmt_option" onchange="checkSelected(this)">
										<option value="" selected="selected">
											<spring:message code="lbl.select.check" text="선택해주세요"/>
										</option>
										<c:forEach var="mcode" items="${mcodeList}">
											<option value="${mcode.mcode_cd}">${mcode.mcode_nm}</option>
										</c:forEach>
									</select>
									<img src="<spring:message code="img.board.delete"/>" style="cursor:pointer;" onclick="remove_item(this)" style="padding-left:5px;float:none;">
								</div>
								<div id="field"></div>
							</div>
						</td>
					</tr>
					<tr>
                        <td class="det-label"><spring:message code="lbl.code" text="코드"/><img src="<spring:message code="img.btn.add"/>" style="padding-left:40px;cursor:pointer;" onClick="optpop_open();"></td>
                    	<td class="det-value"></td>
                    </tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.price" text="가격"/></td>
						<td class="det-value"><input type="text" value="${csmtinfo.csmt_price}" size="10" maxlength="8" name="csmt_price" required="required" chkType="num"/> <spring:message code="lbl.standard.money" text="원 (99999999원까지 지정 가능)"/></td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.amount" text="수량"/></td>
						<td class="det-value"><input type="text" value="${csmtinfo.csmt_stock}" size="10" maxlength="4" name="csmt_stock" required="required" chkType="num"/> <spring:message code="lbl.standard.count" text="개 (9999개까지 지정 가능)"/></td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.make.company" text="제조사"/></td>
						<td class="det-value"><input type="text" value="${csmtinfo.pub_comp}" size="55" maxlength="20" name="pub_comp"></td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.make.date" text="제조날짜"/></td>
						<td class="det-value"><input type="text" value="<fmt:formatDate  value="${csmtinfo.pub_date}" pattern="yyyy-MM-dd"/>" readonly="readonly" size="10" maxlength="10" id="bsCal1" name="pub_date"></td>
					</tr>
					<tr>
						<td class="det-label">
							<spring:message code="lbl.goods.image" text="상품이미지"/>
								<img src="<spring:message code="img.board.delete"/>" style="cursor:pointer;" name="csmtimg_check" id="csmtimg_check" onclick="remove_img(this)" isDelete="true"/>
								<input type="hidden" name="imgdeleted" id="imgdeleted" value="0"/>
						</td>
						<td class="det-value">
							<div id="fileDiv">
								<input type="file" name="csmt_img" id="csmt_img" style="width:250px;height:20px;" onChange="fileCheck(this)"><spring:message code="lbl.now.image" text="등록된 이미지"/> : ${csmtinfo.csmt_img}
								<input type="hidden" name="csmt_cur_img" value="${csmtinfo.csmt_img}" style="padding-left: 5px;"/>
							</div>
						</td>
					</tr>
					<tr >
						<td colspan="2" class="det-value" style="padding-top: 2px;"><textarea rows="13" cols="65" id="csmt_desc" name="csmt_desc" style="width: 748px;" >${csmtinfo.csmt_desc}</textarea></td>
					</tr>
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" style="padding-top: 20px;">
				<tr>
					<td align="center">
						<img style="cursor: pointer" src=<spring:message code="img.btn.insert"/> onClick="submitCheck()">
						<img style="cursor: pointer" src=<spring:message code="img.btn.cancel"/> onClick="csmtList()">
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
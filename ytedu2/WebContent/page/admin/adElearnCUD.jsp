<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ytcares"	uri="http://www.backsaninfo.com/jsp/core"%>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%> 
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form"%>
<!--
file name : adElearnCUD.jsp
title     : 온라인강의 등록, 수정, 삭제
date      : 2012/05/11
author    : Jung.W.C
revisions : 2012/05/16 – 최종작성 (revised by Jung.B.R) : 스크립트 에러 수정
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" type="text/css" href="/css/ytcares-calendar.css" />
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>
<script type="text/javascript" src="/js/commonUtil.js"></script>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script> 
<script type="text/javascript">
/* Editor Read */
$(document).ready(function(){
	CKEDITOR.replace('content', {height:300});
	cmYTCaresInit();
});

/* 등록, 수정, 삭제 */
function actionChk(str){
	//CKEDITOR 동기화
	CKEDITOR.instances.content.updateElement();
	//validation check
	if(!cmChkForm2("frm"))return false;
	
	switch(str){
	case "insert": 
		if(confirm('<spring:message code="confirm.insert" text="등록하시겠습니까?"/>')){
		document.frm.action="/AdElearnService/adminInsertElearn.do?admin_menu=${param.admin_menu}";
		document.frm.enctype="multipart/form-data";
		document.frm.submit();
		}
	break;
	case "update": 
		if(confirm('<spring:message code="confirm.update" text="수정하시겠습니까?"/>')){
			document.frm.sub_category.disabled = false;
			document.frm.action="/AdElearnService/adminUpdateElearn.do?admin_menu=${param.admin_menu}";
			document.frm.enctype="multipart/form-data";
			document.frm.submit(); 
		}
	break;
	case "delete": 
		if(confirm('<spring:message code="confirm.delete" text="삭제하시겠습니까?"/>')){
		document.dummy.action="/AdElearnService/adminDeleteElearn.do";
		document.dummy.enctype="application/x-www-form-urlencoded";
		document.dummy.submit();
		}
	break; 
	case "list":
		document.dummy.action="/AdElearnService/adminSelectElearnList.do";
		document.dummy.chkFlg.value="1";
		document.dummy.submit();
	break;
	default : 
	return false;
	}
	
}

//이미지파일 형식 체크
function fileCheck()
{
	var file = document.getElementById("append_data1");
	var fileval = file.value;
	
	var extension = fileval.substr(fileval.lastIndexOf(".") + 1 ,(fileval.length - fileval.lastIndexOf(".")));
	 //조건문으로 이미지파일 이외 파일은 종료	
	if(extension.toLowerCase() == "jpg" || extension.toLowerCase() == "gif" || extension.toLowerCase() == "png" || extension.toLowerCase() == ""){
	}else{
		alert('<spring:message code="error.request.img.file.type" text="jpg, gif, png 파일 형식으로 올려주시기 바랍니다."/>');
		file.select();
	//	document.selection.clear();
		fileValueReset();
		return;
	}
}
//잘못된 이미지파일 형식 클리어
function fileValueReset(){
	var chkKbn = document.dummy.chkKbn.value;
   	var fileDiv = document.getElementById("fileDiv");
   	if(chkKbn=="insert"){
   		fileDiv.innerHTML = "<input id=\"append_data1\" name=\"append_data1\" type=\"file\" style=\"width: 660px\" onChange=\"fileCheck(this.value);\" required=\"required\">";
	}else{
		fileDiv.innerHTML = "<input id=\"append_data1\" name=\"append_data1\" type=\"file\" style=\"width: 660px\" onChange=\"fileCheck(this.value);\">";
	}
}


//동영상 파일 형식 체크
function fileCheckMov()
{
	var file = document.getElementById("append_data2");
	var fileval = file.value;
	var extension = fileval.substr(fileval.lastIndexOf(".") + 1 ,(fileval.length - fileval.lastIndexOf(".")));
	//조건문으로 동영상파일 이외 파일은 종료	
	if(extension.toLowerCase() == "wmv" || extension.toLowerCase() == "asf" || extension.toLowerCase() == ""){
	}else{
		alert(extension + '<spring:message code="error.request.mov.file.type" text="는 지원하지 않는 확장자입니다. 지원하는 확장자 : wmv, asf, avi, swf, mpeg"/>');
		file.select();
	//	document.selection.clear();
		fileValueResetMov();
		return;
	}	
}

//잘못된 동영상파일 형식 클리어
function fileValueResetMov(){
	var chkKbn = document.dummy.chkKbn.value;
   	var fileDiv = document.getElementById("fileDivMov");
   	if(chkKbn=="insert"){
   		fileDiv.innerHTML = "<input id=\"append_data2\" name=\"append_data2\" type=\"file\" style=\"width: 660px\" onChange=\"fileCheck(this.value);\" required=\"required\">";
	}else{
		fileDiv.innerHTML = "<input id=\"append_data2\" name=\"append_data2\" type=\"file\" style=\"width: 660px\" onChange=\"fileCheck(this.value);\">";
	}
}

</script>
</head>
<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="dummy" action="" method="post">
<input type="hidden" name="pageNum"			value="${param.pageNum}">
<input type="hidden" name="admin_menu"		value="${param.admin_menu}">
<input type="hidden" name="category"		value="${param.category}">
<input type="hidden" name="sub_category"	value="${srchRlt.SUB_CATEGORY}">
<input type="hidden" name="seq_no"			value="${srchRlt.SEQ_NO}"/>
<input type="hidden" name="imgFile"			value="${srchRlt.APPND_DATA1}"/>
<input type="hidden" name="movFile"			value="${srchRlt.APPND_DATA2}"/>
<input type="hidden" name="chkFlg"			value=""/>
<input type="hidden" name="chkKbn"			value="${param.chkKbn}"/>
</form>
<table class="ytcares-content" border="0" align="center">
	<tr>
		<td width="150" align="center" valign="top" >
			<jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include>
		</td>
		<td width="820" valign="top">
			<form name="frm" action="" enctype="multipart/form-data" method="post">
				<input type="hidden" name="admin_menu" value="${param.admin_menu}"/>
				
				<table class="ytcares-detail" style="width:818px;margin-left:2px;" border="0" align="center" bgcolor="#ffffff">
					<colgroup>
						<col width="60"/>
						<col width="*"/>
					</colgroup>
					<tr>
						<td class="det-label"><spring:message code="lbl.section" text="구분"/></td>
						<td class="det-value">
							<ytcares:code name="sub_category" disabled="${param.chkKbn eq 'insert'?'':'disabled'}" selected="${srchRlt.SUB_CATEGORY}" mcodeCd="BD003" lblCol="CODE_NM1" valCol="DCODE_CD" cssStyle="width:155px"/>
						</td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.title" text="제목"/></td>
						<td class="det-value"><input name="title" type="text" style="width: 555px" value="${srchRlt.TITLE}" required="required" maxlength="30" maxbyte="100"/></td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.image" text="이미지"/></td>
						<td class="det-value">
						<div id="fileDiv">
							<c:choose>
							<c:when test="${param.chkKbn eq 'update'}">
								<input type="file" id="append_data1" name="append_data1" style="width: 660px" onchange="fileCheck();" value="${srchRlt.APPND_DATA1}"/>
								<input type="hidden" name="imgFile" value="${srchRlt.APPND_DATA1}" required="required" maxbyte="100"/>
							</c:when>
							<c:otherwise>
								<input type="file" id="append_data1" name="append_data1" style="width: 660px" onchange="fileCheck();" required="required" maxbyte="100"/>
								<input type="hidden" name="imgFile" value="${srchRlt.APPND_DATA1}"/>
							</c:otherwise>
							</c:choose>
						</div>
						</td>
					</tr>
					<tr>
						<td class="det-label"><spring:message code="lbl.movie" text="동영상"/></td>
						<td class="det-value">
						<div id="fileDivMov">
							<c:choose>
							<c:when test="${param.chkKbn eq 'update'}">
								<input type="file" id="append_data2" name="append_data2" style="width: 660px" onchange="fileCheckMov();" value="${srchRlt.APPND_DATA2}"/>
								<input type="hidden" name="movFile" value="${srchRlt.APPND_DATA2}" required="required" maxbyte="100"/>
							</c:when>
							<c:otherwise>
								<input type="file" id="append_data2" name="append_data2" style="width: 660px" onchange="fileCheckMov();" value="${srchRlt.APPND_DATA2}" required="required" maxbyte="100"/>
							</c:otherwise>
							</c:choose>
						</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" width="800">
							<textarea id="content" name="content" required="required" maxbyte="4000">${srchRlt.CONTENT}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<c:if test="${param.chkKbn eq 'update'}">
							<input type="button" disabled="disabled" value="<spring:message code="btn.insert" text="등록"/>" style="float:none;"/>
							<input type="button" value="<spring:message code="btn.update" text="수정"/>" onclick="actionChk('update')" style="float:none;"/>
							<input type="button" value="<spring:message code="btn.delete" text="삭제"/>" onclick="actionChk('delete')" style="float:none;"/>
							<input type="hidden" name="seq_no" value="${srchRlt.SEQ_NO}"/>
						</c:if>
						<c:if test="${param.chkKbn eq 'insert'}">
							<input type="button" value="<spring:message code="btn.insert" text="등록"/> " onclick="actionChk('insert')" style="float:none;"/>
							<input type="button" disabled="disabled" value="<spring:message code="btn.update" text="수정"/>" style="float:none;"/>
							<input type="button" disabled="disabled" value="<spring:message code="btn.delete" text="삭제"/>" style="float:none;"/>
						</c:if>
							<input type="button" value="<spring:message code="btn.list" text="목록"/>" onclick="window.location='/AdElearnService/adminSelectElearnList.do?category=${param.category}&pageNum=${param.pageNum}'" style="float:none;"/>
							<input type="hidden" name="chkFlg" value=""/>
						</td>
					</tr>
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
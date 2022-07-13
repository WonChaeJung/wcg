<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<!--
file name : adFAQCUD.jsp
title     : FAQ 게시물 등록, 수정, 삭제
date      : 2012/05/11
author    : Jung.B.R
revisions : 2012/05/17 – 최종작성 (revised by Jung.B.R)
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 게시물 등록</title>
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>
<script type="text/javascript" src="/js/commonUtil.js"></script>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
/* Editor Read */
$(document).ready(function(){
	CKEDITOR.replace('content',{height:300});
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
		document.frm.action="/AdBoardService/adminInsertFaq.do";
		document.frm.enctype="multipart/form-data";
		document.frm.submit();
		}
	break;
	case "reple": 
		if(confirm('<spring:message code="confirm.insert" text="답글을 등록하시겠습니까?"/>')){
			document.frm.sub_category.disabled = false;
			document.frm.action="/AdBoardService/adminInsertReple.do";
			document.frm.enctype="multipart/form-data";
			document.frm.submit(); 
		}
	break;
	case "update": 
		if(confirm('<spring:message code="confirm.update" text="수정하시겠습니까?"/>')){
			document.frm.sub_category.disabled = false;
			document.frm.action="/AdBoardService/adminUpdateFaq.do";
			document.frm.enctype="multipart/form-data";
			document.frm.submit(); 
		}
	break;
	case "delete": 
		if(confirm('<spring:message code="confirm.delete" text="삭제하시겠습니까?"/>')){
			document.frm.sub_category.disabled = false;
			document.frm.action="/AdBoardService/adminDeleteFaq.do";
			document.frm.enctype="application/x-www-form-urlencoded";
			document.frm.submit();
		}
	break; 
	default : 
	return false;
	}
	
}
</script>
</head>
<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<c:if test="${param.chkKbn eq 'insert'}">
<jsp:useBean id="boardInfo" class="com.ytcares.bean.TBoardBean" scope="request" />
</c:if>
<form:form commandName="boardInfo" name="frm" method="post" action="">
<input type="hidden" name="category" 	 value="${param.category}"/>
<input type="hidden" name="sub_category" value="${param.sub_category}"/>
<c:if test="${param.chkKbn eq 'update'}">
<input type="hidden" name="ref_no" 		 value="${param.ref_no}"/>
<input type="hidden" name="re_step" 	 value="${param.re_step}"/>
<input type="hidden" name="re_level" 	 value="${param.re_level}"/>
</c:if>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center" style="padding-top: 20px;">
	<tr>
		<td width="150" valign="top"><jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"/></td>
		<td width="750">
			<table class="ytcares-detail" style="width:748px;margin-left:2px;" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="left"><form:input path="title" cssStyle="width:738px;" required="required" maxbyte="100"/></td>
				</tr>
				<tr>
					<td style="padding-top:2px;">
						<form:textarea path="content" id="content" rows="10" cssStyle="width:738px;" required="required" maxbyte="4000"/>
					</td>
				</tr>
			</table>
			<table width="100%" cellpadding="0" cellspacing="0" border="0" style="padding-top: 20px">
				<tr>
					<td align="center">
						<c:if test="${param.chkKbn eq 'update'}">
							<input type="button" disabled="disabled" value="<spring:message code="btn.insert" text="등록"/>" />
							<img src='<spring:message code="img.board.reply" text="답글달기"/>' onclick="actionChk('reple')" style="cursor:pointer;"/>
							<img src='<spring:message code="img.board.modify" text="수정"/>' onclick="actionChk('update')" style="cursor:pointer;"/>
							<img src='<spring:message code="img.board.delete" text="삭제"/>' onclick="actionChk('delete')" style="cursor:pointer;"/>
							<input type="hidden" name="seq_no" value="${param.seq_no }"/>
						</c:if>
						<c:if test="${param.chkKbn eq 'insert'}">
							<img src='<spring:message code="img.board.add" text="글쓰기"/>' onclick="actionChk('insert')" style="cursor:pointer;"/>
							<input type="button" disabled="disabled" value="<spring:message code="btn.insert.re" text="답글달기"/>"/>
							<input type="button" disabled="disabled" value="<spring:message code="btn.update" text="수정"/>" />
							<input type="button" disabled="disabled" value="<spring:message code="btn.delete" text="삭제"/>" />
						</c:if>
							<img src='<spring:message code="img.board.list" text="목록"/>' style="cursor:pointer;" onclick="window.location='/AdBoardService/adminSelectFaq.do?category=01&sub_category=02&pageNum=${param.pageNum}'"/>
							<input type="hidden" name="chkFlg" value=""/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form:form>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<!-- 공통메세지처리 -->
<ytcares:msg/>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ytcares.common.YTCaresConstants.Common" %>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<!--
file name : ltLecReqC.jsp
title     : 교육요청
date      : 2012/05/11
author    : Kim.S.D
revisions : 2012/05/14 – 최종작성 (revised by Kim.S.D)
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/ytcares-calendar.css" />
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/ytcares-calendar.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script src="${ctxPath}/js/commonValidation.js"></script>
<script src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript">
/* Editor Read */
$(document).ready(function(){
	//화면초기화
	cmYTCaresInit();
	CKEDITOR.replace('lec_req_desc',{width:768,height:300});
});

/* validation check */
function checkVal(){
	var editor = CKEDITOR.instances.lec_req_desc;
	editor.updateElement();
	
	if(!cmChkForm2("frm"))return false;
	
	/* chrome에서 등록불가로 submit버튼을 input으로 교체 */
	document.frm.submit();
}
</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<img src='<spring:message code="img.lecture.bg" text="상단이미지"/>'/>
<form name="frm" method="post" action="/LtLectureService/userInsertLecReq.do">
<table class="border-list" width="900" cellpadding="0" cellspacing="0" border="0" align="center" style="padding-top: 10px;">
	<tr>
		<td valign="top">
			<table class="ytcares-detail" style="width:900px" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="120" align='center' class="gray"><spring:message code="lbl.title" text="제목"/>&nbsp;<font color="red">*</font></td>
					<td width="760" align='left'>
						<input type="text" name="lec_req_title" style="width:99%;" required="required" maxlength="300" maxbyte="300">
					</td>
				</tr>
				<tr height="1" bgcolor="#d8d8d8"><td colspan="2"></td></tr>
				<tr>
					<td width="120" align='center' class="gray"><spring:message code="lbl.lec.req.content" text="교육요청내용"/>&nbsp;<font color="red">*</font></td>
					<td align='left'>
						<textarea name="lec_req_desc" id="lec_req_desc" required="required" maxbyte="4000"></textarea>
					</td>
				</tr>
				<tr height="1" bgcolor="#d8d8d8"><td colspan="2"></td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<img src="<spring:message code="img.board.confirm"/>" style='cursor:pointer;' onclick="checkVal()"/>
			<img src="<spring:message code="img.board.cancel"/>" style='cursor:pointer;' onclick="javascript:history.back();">
		</td>
	</tr>
</table>
</form>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<!-- 공통메세지처리 -->
<ytcares:msg/>
</body>
</html>
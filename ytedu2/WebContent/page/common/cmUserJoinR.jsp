<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java"		contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<style type="text/css">
.UserJoinC_InputBox_T{padding:3px 0 3px 5px; border:1px;border-style:solid;border-color:#cccccc}
.UserJoinC_Content_td{padding-left:10px;}

</style>
<link href="${ctxPath}/css/style.css" rel="stylesheet" type="text/css" />
<script src="${ctxPath}/js/commonValidation.js"></script>
<script src="${ctxPath}/js/commonUtil.js"></script>
<script src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
function submitChk(str){
	var frm = eval("document."+str);
	frm.submit();
}
</script>
</head>
<body onload="cmYTCaresInit()">
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp" />
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td colspan="2">
			<img src='<spring:message code="img.member.bg" text="타이틀이미지"/>'/>
		</td>
	</tr>
	<tr>
		<td width="184" valign="top">
			<jsp:include page="/page/common/cmUserLeftMenu_f.jsp" />
		</td>
		<td width="716" align="center" valign="top">
			<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff">
				<tr>
					<td width="100%" align="center">
						<img src="<spring:message code='img.mem.join.success.title'/>" height="60"/>
					</td>
				</tr>
				<tr>
					<td>
						<img src="<spring:message code='img.mem.join.success.top'/>" height="115"/>
					</td>
				</tr>
				<tr>
					<td>
						<img src="<spring:message code='img.mem.join.success.mid'/>" height="127"/>
					</td>
				</tr>
				<tr>
					<td align="center">
						<img src="<spring:message code='img.mem.join.success.bot'/>" height="42" onclick="submitChk('callIndex')" style="cursor: pointer;"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<form name="callIndex" action="/main.do"></form>
<form name="callLogin" action="/CmUserService/callUserLogin.do"></form>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp" />
<ytcares:msg/>
</body>
</html>
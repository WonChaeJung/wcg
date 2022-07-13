<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares LSS Room Choice</title>
<link href="${ctxPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script>
function setLssRoomTitle(RoomTitle) {
	window.opener.setRoomTitle(RoomTitle);
	self.close();
}
</script>
</head>
<body style="background-color:#ffffff;">
<div style="width:300px;height:170px;overflow-x:hidden;overflow-y:auto;">
<table width="100%" height="170" border="1" cellpadding="0" cellspacing="0" style="table-layout:fixed;" align="center">
	<tr height="25px">
		<td align="center"><b>JOINABLE LSS ROOM INFO</b></td>
	</tr>
<c:forEach var="lssMap" items="${userLssTable}">
	<tr>
		<td width="100%" height="25"><input type="button" value="${lssMap.key}" onclick="setLssRoomTitle('${lssMap.key}')" style="width:100%;height:25px;"></td>
	</tr>
	<tr>
		<td height="40">
			<div style="width:100%;height:40px;overflow-x:hidden;overflow-y:auto;">
			<c:forEach var="user" items="${lssMap.value}">
				${user.agency_name}<br/>
			</c:forEach>
			</div>
		</td>
	</tr>
</c:forEach>
</table>
</div>
<input type="button" value="close" onclick="self.close();" style="float:right;"/>
</body>
</html>
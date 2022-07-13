<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link href="${ctxPath}/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>

<table width="900" cellpadding="0" cellspacing="0" border="0">
     <tr>
	    <td align="center" valign="top" >
	    <jsp:include page="/page/eshop/esTopMenu_f.jsp"/>
		   <table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="970" valign="top">
						<!-- 중앙컨텐츠 -->
						 <tr>
						    <td><img src="/images/order_complete_tip.gif"></td>
						 </tr>
						 <tr>
						    <td style="padding-top:51px;" align="center">
						    <a href="/index.jsp">
						    <img src="/images/order_complete_enter.gif" border="0">
						    </a></td>
						 </tr>
						<tr height="128">
					<td></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<!-- 공통메세지처리 -->
<ytcares:msg/>

</body>
</html>
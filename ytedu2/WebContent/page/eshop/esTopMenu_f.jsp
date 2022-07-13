<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<c:set var="uri" value="${pageContext.request.requestURI}"/>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr valign="top">
		<td style="border-bottom:0px none;">
			<table class="tab-menu" width="100%" cellpadding="0" cellspacing="0" border="0" align="center" style="border-bottom: 1px solid; border-bottom-color: #9DD12C">
			<tr>
				<td style="padding-left:20px;" width="93"><a href="/EsCsmtService/selectCsmtList.do?csmt_kind_cd=ALL&pageSize=6"><img src="<spring:message code='img.eshop.tab.product' />"></a></td>
				<td width="94"><a href="/EsCsmtOrderService/callCsmtCart.do"><img src="<spring:message code='img.eshop.tab.cart' />"></a></td>
				<td>&nbsp;</td>
			</tr>
			</table>
		</td>
	</tr>
</table>

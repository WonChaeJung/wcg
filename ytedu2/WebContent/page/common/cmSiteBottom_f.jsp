<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<style type="text/css">
<c:choose>
	<c:when test="${fn:startsWith(pageContext.request.requestURI, '/page/common/cmSiteMain.jsp')}">
		table.footer { padding-top: 10px;}
	</c:when>
	<c:otherwise>
		table.footer {padding-top: 80px;}
	</c:otherwise>
</c:choose>
</style>
<table class="footer" width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td>
			<img src="/images/kr/bottom_copy.gif"/>
		</td>
	</tr>
</table>
<!-- copyrighte end-->

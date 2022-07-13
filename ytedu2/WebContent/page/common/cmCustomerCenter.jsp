<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp" />
<table width="900" align="center" cellpadding="0" cellspacing="0" border="0">
	<tr valign="top">
		<td>
			<img src='<spring:message code="img.cum.bg" text="상단이미지"/>' />
		</td>
	</tr>
	<tr valign="top">
		<td>
			<table width="900" align="center" cellpadding="0" cellspacing="0" border="0">
				<tr valign="top">
					<td width="184">
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td>
									<img src='<spring:message code="img.cum.left.title" text="고객센터"/>'/>
								</td>
							</tr>
							<tr>
								<td>
									<img src='<spring:message code="img.cum.left.over" text="고객센터안내"/>'/>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td>
									<img src='<spring:message code="img.cum.title" text="고객센터"/>'/>
								</td>
							</tr>
							<tr>
								<td>
									<img src='<spring:message code="img.cum.center" text="content"/>'/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp" />
</body>
</html>

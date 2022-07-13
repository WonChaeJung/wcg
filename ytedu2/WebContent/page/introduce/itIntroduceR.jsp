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
			<img src="/images/kr/top_bg_intro.gif" />
		</td>
	</tr>
	<tr valign="top">
		<td>
			<table width="900" align="center" cellpadding="0" cellspacing="0" border="0">
				<tr valign="top">
					<td>
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td>
									<img src='<spring:message code="img.intro.content" text="고객센터"/>'/>
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

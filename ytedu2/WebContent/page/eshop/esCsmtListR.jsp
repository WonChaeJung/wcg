<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn"       uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
function goPage(pageNum) {
    var f = document.csmtForm;
    f.pageNum.value = pageNum;

    f.action = '/EsCsmtService/selectCsmtList.do';
    f.submit();
}
</script>
</head>
<body>
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="csmtForm" method="post" action=""/>
    <input type="hidden" name="pageNum" value=""/>
    <input type="hidden" name="pageSize" value="6">
    <input type="hidden" name="csmt_kind_cd" value="${param.csmt_kind_cd}">
</form>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr valign="top">
		<td><img src="<spring:message code='img.eshop.bg' />" /></td>
	</tr>
	<tr valign="top" >
		<td align="center" style="padding-top: 18px;">
			<jsp:include page="/page/eshop/esTopMenu_f.jsp"/>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<c:set var="Goods" value="${csmtBeanList}"/>
				<c:choose>
					<c:when test="${!empty Goods}">
						<tr height="255">
						<c:forEach var="i" begin="0" end="5" varStatus="idx">
							<c:set var="Good" value="${csmtBeanList[i]}"/>
							<c:if test="${i < fn:length(csmtBeanList) }">
								<c:url value="/EsCsmtService/selectCsmtInfo.do" var="csmt_link">
									<c:param name="csmt_id" value="${Good.csmt_id}"/>
								</c:url>
									<td align="center" style="padding:0 50 0 0;border:0px solid #efefef;">
										<table border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td style="padding: 13 0 0 0;" colspan="2"><a href="${csmt_link}"><img src="/ytcares/eshop/${Good.csmt_img}" border="0" width="250" height="180"/></a></td>
											</tr>
											<tr>
												<td style="padding:13 0 0 3;" colspan="2">
													<table cellpadding="0" cellspacing="0" border="0" align="center">
														<tr>
															<td align="center" style="margin-left:20px" title="${Good.csmt_name}" valign="middle">
															<div style="max-width:240px;">
																<div align="center" style="float:left;max-width:220px;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;">
																	<a href="${csmt_link}">${Good.csmt_name}
																	</a>
																</div>
																<div style="float:left;margin-top:5px;">
																     <c:if test="${(today.time - Good.csmt_reg_ymd.time)/(24*60*60*1000)<=3}">
	                                                                    <img src="<spring:message code='img.new' />">
	                                                                </c:if>
	                                                            </div>
															</div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
									
								</c:if>
								<c:if test="${i ge fn:length(csmtBeanList)}">
									<td>&nbsp;</td>
								</c:if>
								<c:if test="${i eq 2}"></tr><tr height="255"></c:if>
							</c:forEach>
							</tr>
						</c:when>
						<c:otherwise>
							<tr height="510"><td><spring:message code='lbl.undefind.goods' text='상품이 없습니다.'/></td></tr>
						</c:otherwise>
					</c:choose>
				</table>
				<c:if test="${param.csmt_kind_cd ne 'NEW'}">
				<table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" width="100%">
                        <ytcares:page onclick="goPage" count="${count}" pageSize="6" pageNum="${param.pageNum}"/>
                    </td>
                </tr>
            	</table>
            	</c:if>
		</td>
	</tr>
</table>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
</body>
</html>
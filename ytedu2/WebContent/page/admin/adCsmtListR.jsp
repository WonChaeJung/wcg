<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags"%>
<!--
file name : adCsmtListR.jsp
-->
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery-ui.min.css"/>
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript">
function goPage(pageNum) {
	var f = document.csmtForm;
	f.pageNum.value = pageNum;

	f.action = '/AdCsmtServiceImpl/adminSelectCsmtList.do';
	f.submit();
}

function updateCsmtInfo(csmtId) {
	var f = document.csmtForm;
	f.csmt_id.value = csmtId;
	f.CsmtMng.value = 'upd';
	
	f.action = '/AdCsmtServiceImpl/adminSelectCsmtInfo.do';
	f.submit();
}

function deleteCsmtInfo(csmtId) {
	if (confirm('<spring:message code="confirm.delete" text="정말 삭제하시겠습니까?"/>')) {
		var f = document.csmtForm;
		f.csmt_id.value = csmtId;
		f.CsmtMng.value = '';
		
		f.action = '/AdCsmtServiceImpl/adminDeleteCsmt.do';
		f.submit();
	}
}
function optpop_open(){
    cmOpenPopup("/AdCsmtServiceImpl/adminInsertCsmtCodeInfo.do?command=add","OptionChangePopup","600","400","auto");
}
</script>
</head>
<body onload="cmYTCaresInit()">
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="csmtForm" method="post" action=""/>
	<input type="hidden" name="pageNum" value=""/>
	<input type="hidden" name="admin_menu" value="${param.admin_menu}"/>
	<input type="hidden" name="csmt_id" value=""/>
	<input type="hidden" name="CsmtMng" value=""/>
</form>
<table class="ytcares-content" width="900" border="0" cellpadding="0" cellspacing="0" align="center" style="padding-top: 20px;">
	<tr>
		<td width="150" align="center" valign="top" ><jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include></td>
		<td width="*" valign="top" style="padding-left: 2px;">
			<table cellpadding="0" cellspacing="0" border="0" style="table-layout: fixed;">
				<colgroup>
					<col width="80"/>
					<col width="100"/>
					<col width="*"/>
					<col width="110"/>
					<col width="60"/>
					<col width="150"/>
					<col width="110"/>
					<col width="65"/>
					<col width="65"/>
				</colgroup>
				<tr class="header-admin">
					<td><spring:message code="lbl.goods.kind" text="상품종류"/></td>
					<td><spring:message code="lbl.goods.code" text="상품코드"/></td>
					<td><spring:message code="lbl.goods" text="상품"/></td>
					<td><spring:message code="lbl.goods.add.date" text="상품등록날짜"/></td>
					<td><spring:message code="lbl.amount" text="수량"/></td>
					<td><spring:message code="lbl.make.company" text="제조사"/></td>
					<td><spring:message code="lbl.make.date" text="제조날짜"/></td>
					<td><spring:message code="btn.update" text="수정"/></td>
					<td><spring:message code="btn.delete" text="삭제"/></td>
				</tr>
				<c:set var="Goods" value="${csmtBeanList}"/>
			   	<c:choose>
     				<c:when test="${Goods eq null}">
						<tr height="260">
							<td class="board-line" align="center" colspan="9"><spring:message code="lbl.undefind.data" text="데이터가 존재하지 않습니다."/></td>
						</tr>
					</c:when>
					<c:when test="${Goods ne null}">
					<c:forEach var="Good" items="${Goods}">
						<tr height="30">
							<td class="board-line">${Good.csmt_kind_cd}</td>
							<td class="board-line">${Good.csmt_id}</td>
							<td class="board-line" align="left">${Good.csmt_name}</td>
							<td class="board-line"><fmt:formatDate value="${Good.csmt_reg_ymd}" pattern="yyyy-MM-dd"/></td>
							<td class="board-line">${Good.csmt_stock}</td>
							<td class="board-line">${Good.pub_comp}</td>
							<td class="board-line"><fmt:formatDate value="${Good.pub_date}" pattern="yyyy-MM-dd"/></td>
							<td><img style="cursor:pointer;" src="<spring:message code="img.board.modify"/>" onclick="updateCsmtInfo('${Good.csmt_id}')"/></td>
							<td><img style="cursor:pointer;" src="<spring:message code="img.board.delete"/>" onclick="deleteCsmtInfo('${Good.csmt_id}')"/></td>
						</tr>
				   </c:forEach>
					<c:if test="${fn:length(csmtBeanList) < 10}">
						<c:forEach var="i" begin="1" end="${10 - fn:length(csmtBeanList)}">
							<tr><td colspan="9">&nbsp;</td></tr>
						</c:forEach>
					</c:if>
				   </c:when>
				</c:choose>
			</table>
			<table class="paging" width="100%">
				<tr>
					<td align="center" width="100%">
						<ytcares:page onclick="goPage" count="${count}" pageNum="${param.pageNum}"/>
					</td>
				</tr>
			</table>
			<table style="width:100%;padding-top:20px;" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right"><a href="/AdCsmtServiceImpl/adminSelectCsmtInfo.do?CsmtMng=add"><img style="cursor:pointer;" src="<spring:message code="img.btn.insert"/>"></a></td>
					
				</tr>
			</table>
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
</body>
</html>
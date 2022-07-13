<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %> 
<%@taglib prefix="ytcares"	uri="http://www.backsaninfo.com/jsp/core"%>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<title>FAQ 게시물 리스트</title>
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
<link rel="stylesheet" type="text/css" href="/css/jquery-ui.min.css"/>
<style type="text/css">
.user-tree ul {list-style:decimal-leading-zero outside none;margin-left:30px;}
.user-tree li {list-style:decimal-leading-zero outside none;line-height:22px;}
.li-mouse-over{background-color:#FFAD33;}
</style>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript">
function appendChildAgency(liObj) {
	var user_id = $(liObj).attr('user_id');
	$.ajax({
		url: '${ctxPath}/YTCaresAjax.do',
		asynch:false,
		cache:false,
		dataType: 'json',
		type:'POST',
		data:{
			queryId:'user.adminSelectChildTree',
			user_id:user_id
		},
		success: function(json){
			var html = new Array();
			html[html.length] = '<ul>';
			for (var i = 0; i < json.length; i++) {

				html[html.length] = '<li user_id="'+json[i].USER_ID+'" child_cnt="'+json[i].CHILD_CNT+'">';
				html[html.length] = '<span style="display:none">';
				html[html.length] = '<input type="hidden" name="user_name" value="'+json[i].USER_NAME+'"/>';
				html[html.length] = '<input type="hidden" name="agency_name" value="'+json[i].AGENCY_NAME+'"/>';
				html[html.length] = '<input type="hidden" name="family_id" value="'+json[i].FAMILY_ID+'"/>';
				html[html.length] = '<input type="hidden" name="rcmmd_id" value="'+json[i].RCMMD_ID+'"/>';
				html[html.length] = '<input type="hidden" name="cell_phone" value="'+json[i].CELL_PHONE+'"/>';
				html[html.length] = '<input type="hidden" name="phone" value="'+json[i].PHONE+'"/>';
				html[html.length] = '<input type="hidden" name="email" value="'+json[i].EMAIL+'"/>';
				html[html.length] = '<input type="hidden" name="zipcode" value="'+json[i].ZIPCODE+'"/>';
				html[html.length] = '<input type="hidden" name="addr" value="'+json[i].ADDR+'"/>';
				html[html.length] = '<input type="hidden" name="reg_date" value="'+json[i].REG_DATE+'"/>';
				html[html.length] = '<input type="hidden" name="grade" value="'+json[i].GRADE+'"/>';
				html[html.length] = '<input type="hidden" name="grade_nm" value="'+json[i].GRADE_NM+'"/>';
				html[html.length] = '<input type="hidden" name="accm_pnt" value="'+json[i].ACCM_PNT+'"/>';
				html[html.length] = '</span>';
				if (json[i].DLT_FLG == '1') {
					html[html.length] = '<span style="text-decoration:line-through;">';
				} else {
					html[html.length] = '<span>';
				}
				html[html.length] = json[i].AGENCY_NAME;
				html[html.length] = ' (';
				html[html.length] = json[i].CHILD_CNT;
				html[html.length] = ') [';
				html[html.length] = json[i].GRADE_NM;
				html[html.length] = ' ]</span>';
				html[html.length] = '</li>';
				
				
			}
			html[html.length] = '</ul>';
			$(liObj).append(html.join(''));
			
			$(liObj).find('li').click(function(e){
				e.preventDefault();
				e.stopPropagation();
				if($(this).attr('child_cnt') != '0' && $(this).find('ul').length == 0) {
					appendChildAgency(this);
				}
				$(this).find('ul:first').slideToggle('slow');
				
				var user_id		= $(this).attr('user_id');
				var user_name	= $(this).find(':hidden[name=user_name]:first').val();
				var agency_name = $(this).find(':hidden[name=agency_name]:first').val();
				var family_id	= $(this).find(':hidden[name=family_id]:first').val();
				var rcmmd_id	= $(this).find(':hidden[name=rcmmd_id]:first').val();
				var cell_phone	= $(this).find(':hidden[name=cell_phone]:first').val();
				var phone		= $(this).find(':hidden[name=phone]:first').val();
				var email		= $(this).find(':hidden[name=email]:first').val();
				var zipcode		= $(this).find(':hidden[name=zipcode]:first').val();
				var addr		= $(this).find(':hidden[name=addr]:first').val();
				var reg_date	= $(this).find(':hidden[name=reg_date]:first').val();
				var grade_nm	= $(this).find(':hidden[name=grade_nm]:first').val();
				var accm_pnt	= $(this).find(':hidden[name=accm_pnt]:first').val();
				
				$('#user_id').html(user_id);
				$('#user_name').html(user_name);
				$('#agency_name').html(agency_name);
				$('#family_id').html(family_id);
				$('#rcmmd_id').html(rcmmd_id);
				$('#cell_phone').html(cell_phone);
				$('#phone').html(phone);
				$('#email').html(email);
				$('#zipcode').html(zipcode);
				$('#addr').html(addr);
				$('#reg_date').html(reg_date);
				$('#grade_nm').html(grade_nm);
				$('#accm_pnt').html(accm_pnt);
			}).css('cursor', 'pointer').mouseover(function(){
				$(this).children().filter('span:nth-child(2)').addClass('li-mouse-over');
			}).mouseout(function() {
				$(this).children().filter('span:nth-child(2)').removeClass('li-mouse-over');
			});
		},
		error:function(jqXHR, textStatus, err) {
			alert(err);
			return 0;
		}
	});
}

$(document).ready(function(){
	$('#ytcares-user-tree li').click(function() {

	}).click(function(e){
		e.preventDefault();
		e.stopPropagation();
		if(parseInt($(this).attr('child_cnt')) != 0 && $(this).find('ul').length == 0) {
			appendChildAgency(this);
		}
		$(this).find('ul:first').slideToggle('slow');
		
		var user_id		= $(this).attr('user_id');
		var user_name	= $(this).find(':hidden[name=user_name]:first').val();
		var agency_name = $(this).find(':hidden[name=agency_name]:first').val();
		var family_id	= $(this).find(':hidden[name=family_id]:first').val();
		var rcmmd_id	= $(this).find(':hidden[name=rcmmd_id]:first').val();
		var cell_phone	= $(this).find(':hidden[name=cell_phone]:first').val();
		var phone		= $(this).find(':hidden[name=phone]:first').val();
		var email		= $(this).find(':hidden[name=email]:first').val();
		var zipcode		= $(this).find(':hidden[name=zipcode]:first').val();
		var addr		= $(this).find(':hidden[name=addr]:first').val();
		var reg_date	= $(this).find(':hidden[name=reg_date]:first').val();
		var grade_nm	= $(this).find(':hidden[name=grade_nm]:first').val();
		var accm_pnt	= $(this).find(':hidden[name=accm_pnt]:first').val();
		
		$('#user_id').html(user_id);
		$('#user_name').html(user_name);
		$('#agency_name').html(agency_name);
		$('#family_id').html(family_id);
		$('#rcmmd_id').html(rcmmd_id);
		$('#cell_phone').html(cell_phone);
		$('#phone').html(phone);
		$('#email').html(email);
		$('#zipcode').html(zipcode);
		$('#addr').html(addr);
		$('#reg_date').html(reg_date);
		$('#grade_nm').html(grade_nm);
		$('#accm_pnt').html(accm_pnt);
	}).css('cursor', 'pointer').mouseover(function(){
		$(this).children().filter('span:nth-child(2)').addClass('li-mouse-over');
	}).mouseout(function() {
		$(this).children().filter('span:nth-child(2)').removeClass('li-mouse-over');
	});
	
	
});
</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center" style="padding-top: 20px;">
	<tr valign="top">
		<td width="150" valign="top"><jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"/></td>
		<td width="748">
			<table  class="ytcares-content" style="width:750px;margin-left:2px;" cellpadding="0" cellspacing="0" border="0" align="center">
				<tr>
					<td width="425">
						<table class="ytcares-detail" style="width:425px;" cellpadding="0" cellspacing="0" border="0" align="center">
							<tr>
								<td width="425" valign="top">
									<div class="user-tree" style="text-align:left;height:376px;overflow-x:hidden;overflow-y:auto;">
									<ul id="ytcares-user-tree">
										<c:forEach var="user" items="${userTreeList}">
										<li user_id="${user.USER_ID}" child_cnt="${user.CHILD_CNT}">
											<span style="display:none">
												<input type="hidden" name="user_name" value="${user.USER_NAME}"/>
												<input type="hidden" name="agency_name" value="${user.AGENCY_NAME}"/>
												<input type="hidden" name="family_id" value="${user.FAMILY_ID}"/>
												<input type="hidden" name="rcmmd_id" value="${user.RCMMD_ID}"/>
												<input type="hidden" name="cell_phone" value="${user.CELL_PHONE}"/>
												<input type="hidden" name="phone" value="${user.PHONE}"/>
												<input type="hidden" name="email" value="${user.EMAIL}"/>
												<input type="hidden" name="zipcode" value="${user.ZIPCODE}"/>
												<input type="hidden" name="addr" value="${user.ADDR}"/>
												<input type="hidden" name="reg_date" value="${user.REG_DATE}"/>
												<input type="hidden" name="grade" value="${user.GRADE}"/>
												<input type="hidden" name="grade_nm" value="${user.GRADE_NM}"/>
												<input type="hidden" name="accm_pnt" value="${user.ACCM_PNT}"/>
											</span>
											<span style="${use.DLT_FLG eq '1'?'text-decoration:line-through;':''}">${user.AGENCY_NAME} (${user.CHILD_CNT }) [${user.GRADE_NM}]</span>
										</c:forEach>
									</ul>
									</div>
								</td>
							</tr>
						</table>
					</td>
					<td width="320" valign="top">
						<table id="user_info" class="ytcares-detail" style="width:300px;" cellpadding="0" cellspacing="0" border="0" align="center">
							<colgroup>
								<col width="100"/>
								<col width="220"/>
							</colgroup>

							<tr>
								<td class="det-label"><spring:message code="lbl.id" text="아이디"/></td>
								<td id="user_id" class="det-value">&nbsp;</td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.name" text="이름"/></td>
								<td id="user_name" class="det-value">&nbsp;</td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.grade" text="등급"/></td>
								<td id="grade_nm" class="det-value"></td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.agency.name" text="가맹점명"/></td>
								<td id="agency_name" class="det-value"></td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.grade.id" text="계층아이디"/></td>
								<td id="family_id" class="det-value"></td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.referee" text="추천인"/></td>
								<td id="rcmmd_id" class="det-value"></td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.phone" text="연락처"/>1</td>
								<td id="cell_phone" class="det-value"></td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.phone" text="연락처"/>2</td>
								<td id="phone" class="det-value"></td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.email" text="이메일"/></td>
								<td id="email" class="det-value"></td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.zipcode" text="우편번호"/></td>
								<td id="zipcode" class="det-value"></td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.address" text="주소"/></td>
								<td id="addr" class="det-value"></td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.join.date" text="가입일"/></td>
								<td id="reg_date" class="det-value"></td>
							</tr>
							<tr>
								<td class="det-label"><spring:message code="lbl.point" text="적립금"/></td>
								<td id="accm_pnt" class="det-value"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
</body>
</html>
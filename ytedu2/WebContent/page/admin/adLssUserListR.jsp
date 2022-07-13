<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ytcares.common.YTCaresSessionListener"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core"%>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery-ui.min.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/ytcares-admin.css"/>
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>

<script type="text/javascript">
function goPage(pageNum) {
	document.lssForm.pageNum.value		= pageNum;
	document.lssForm.grade.value		= '${param.grade}';
	document.lssForm.agency_name.value	= '${param.agency_name}';
	document.lssForm.family_id.value	= '${param.family_id}';
	document.lssForm.action = '/AdLssService/adminSelectLssList.do';
	document.lssForm.submit();
}

function srchUserList() {
	document.lssForm.pageNum.value		= 1;
	document.lssForm.action = '/AdLssService/adminSelectLssList.do';
	document.lssForm.submit();
}

function clearSrchForm() {
	document.lssForm.grade.value		= '';
	document.lssForm.agency_name.value	= '';

	document.lssForm.grade.focus();
}

function showLssSubjList(roomtitle) {
	$('#allLssSubjList div').hide();
	if (roomtitle != null && roomtitle != undefined && roomtitle != '') {
		$('#lssSubjList-'+roomtitle).show();
	}
}

function checkToggle(isCheck) {
	$('.ytcares-list .item :checkbox').prop('checked', isCheck);
}

function removeLssSubj(userid) {
	if (userid == null || userid == undefined || userid == '') {
		alert('<spring:message code="error.require.select.delete.user" text="대상에서 제외할 유저를 선택해 주십시오."/>');
		return;
	}
	var roomTitle = $('#room_title').val();
	$.ajax({
		url: '/AdLssService/execRemoveLssSubj.do',
		asynch:false,
		cache:false,
		dataType: 'text',
		type:'POST',
		data:{
			room_title:roomTitle,
			user_id:userid
		},
		success: function(json){
			alert(json);
		},
		error:function(jqXHR, textStatus, err) {
			alert(err);
		}
	});
	$('#lssSubjList-'+$('#room_title').val()+'-'+userid).remove();
}

function addLssSubj () {
	if ($('.ytcares-list .item :checked').length == 0) {
		alert('<spring:message code="error.require.select.delete.user" text="추가할 대상을 선택해 주십시오."/>');
		return;
	}
	
	if ($('#room_title').val() == '') {
		alert('<spring:message code="error.require.select.list" text="해당 대상자를 추가할 방을 개설중 목록에서 선택하십시오."/>');
		$('#room_title').focus();
		return;
	}
	var qData = 'room_title='+$('#room_title').val();
	$('.ytcares-list .item :checked').each(function(){
		if($('#lssSubjList-'+$('#room_title').val()+'-'+$(this).val()).length == 0) {
			qData += ('&user_id=' + $(this).val());
		} else {
			$(this).prop('checked', false);
		}
	});

	if ($('.ytcares-list .item :checked').length == 0) {
		alert('<spring:message code="error.overlap.user" text="선택하신 유저는 이미 대상자에 포함되어 있습니다."/>');
		$('#checkAll').prop('checked', false);
		return;
	}
	
	$.ajax({
		url: '/AdLssService/execAddLssSubj.do',
		asynch:false,
		cache:false,
		dataType: 'json',
		type:'POST',
		data:qData,
		success: function(json) {
			if (json == null || json == undefined || json.length == 0) {
				return;
			} else {
				var errMsg = json[0].errMsg; 
				if (errMsg == null || errMsg == undefined) {
					var title = $('#room_title').val();
					for (var i = 0; i < json.length; i++) {
						if($('#lssSubjList-'+title+'-'+json[i].user_id).length == 0) {
							var html = new Array();
							html[html.length] = '<ul id="lssSubjList-';
							html[html.length] = title;
							html[html.length] = '-';
							html[html.length] = json[i].user_id;
							html[html.length] = '" class="item">';
							html[html.length] = '<li class="w220" style="vertical-align:middle;">';
							html[html.length] = json[i].agency_name;
							html[html.length] = '<img src="/images/close_icon.gif" onclick="removeLssSubj(\'';
							html[html.length] = json[i].user_id;
							html[html.length] = '\')" border="0" width="12" height="11" style="margin:0px;float:right;cursor:pointer;" align="bottom"/></li>';
							$('#lssSubjList-'+title).append(html.join(''));
						}
					}
					
					alert('<spring:message code="msg.insert.select.user" text="선택한 유저를 대상자로 추가하였습니다."/>');
				} else {
					alert(errMsg);
					return;
				}
			}

		},
		error:function(jqXHR, textStatus, err) {
			alert(err);
		}
	});

	
	$('.ytcares-list .item :checked').prop('checked', false);
	$('#checkAll').prop('checked', false);
}

function addLssRoom() {
	var roomTitle = $('#add_room_title').val();
	if (roomTitle == '') {
		alert('<spring:message code="error.require.room.title" text="추가할 방 이름을 입력해 주십시오."/>');
		return false;
	}

	if ($('#room_title option[value="'+roomTitle+'"]').length != 0) {
		alert('<spring:message code="error.overlap.room.title" text="이미 동일한 방제목이 존재합니다."/>');
		$('#add_room_title').focus();
		return false;
	}
	
	$.ajax({
		url: '/AdLssService/execAddLssRoom.do',
		asynch:false,
		cache:false,
		dataType: 'json',
		type:'POST',
		data:{
			room_title:roomTitle
		},
		success: function(json) {
			if (json == null || json == undefined || json.length == 0) {
				return;
			}

			var errMsg = json[0].errMsg;
			if (errMsg) {
				alert(errMsg);
				return;
			} else {
				$('#allLssSubjList div').hide();
				
				$('#room_title').append('<option value="'+roomTitle+'">'+roomTitle+'</option>');
				$('#add_room_title').val('');

				$('#room_title').val(roomTitle);
				$('#allLssSubjList').append('<div id="lssSubjList-'+roomTitle+'"/>');

				alert('<spring:message code="msg.success.insert" text="추가하였습니다."/>');
			}
		},
		error:function(jqXHR, textStatus, err) {
			alert(err);
		}
	});
}
function removeLssRoom() {
	var roomTitle = $('#room_title').val();
	if (roomTitle == '') {
		alert('<spring:message code="error.require.select.delete.room" text="삭제 할 방을 선택 해 주십시오."/>');
		return false;
	}
	
	$.ajax({
		url: '/AdLssService/execRemoveLssRoom.do',
		asynch:false,
		cache:false,
		dataType: 'json',
		type:'POST',
		data:{
			room_title:roomTitle
		},
		success: function(json) {
			if (json == null || json == undefined || json.length == 0) {
				return;
			}

			var errMsg = json[0].errMsg;
			if (errMsg) {
				alert(errMsg);
			} else {
				$('#room_title option[value="'+roomTitle+'"]:first').remove();
				$('#lssSubjList-'+roomTitle).remove();
				alert('<spring:message code="msg.success.delete" text="삭제하였습니다."/>');
				return;
			}
		},
		error:function(jqXHR, textStatus, err) {
			alert(err);
		}
	});
}

function launchLss() {
	var $f = $('form[name="lssLaunchForm"]:first');
	
	if ($('#room_title').val() == '') {
		alert('<spring:message code="error.require.select.room" text="개설중인 방을 선택해 주십시오."/>');
		$('#room_title').focus();
		return false;
	} else {
		$f.find(':hidden[name="RoomTitle"]:first').val($('#room_title').val());
	}


	var win = cmOpenPopup('', 'YTCaresLSS', 800, 600, 'yes');
	$f.prop('action', '/AdLssService/adminLauchLss.do');
	$f.prop('target', 'YTCaresLSS');

	$f.submit();
}

$(document).ready(function(){
	if ('${param.room_title}' != '') {
		showLssSubjList('${param.room_title}');
	}

	$(':checkbox[name=lss_user_id]').click(function() {
		if ($(':checkbox[name=lss_user_id]:checked').length == $(':checkbox[name=lss_user_id]').length) {
			$('#checkAll').prop('checked', true);
		} else {
			$('#checkAll').prop('checked', false);
		}
	});
});

</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="lssLaunchForm" action="/AdLssService/adminLauchLss.do" method="post">
<input type="hidden" name="UserName"	value="${loggedUserAgency}">
<input type="hidden" name="Dept"		value="YTCares">
<input type="hidden" name="Position"	value="Lecturer">
<input type="hidden" name="userlevel"	value="1">
<input type="hidden" name="RoomTitle"	value="">
</form>
<form name="lssForm" action="/AdLssService/adminSelectLssList.do" method="post">
<input type="hidden" name="pageNum"		value="${param.pageNum}"/>
<input type="hidden" name="admin_menu"	value="${param.admin_menu}"/>
<table style="padding-top:20px;" width="900" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="150" align="center" valign="top">
			<jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include>
		</td>
		<td width="748" valign="top">
			<div class="ytcares-content" style="width:460px;height:300px;padding:0px;border: 1px solid #c8c8c8;">
				<ul class="header">
					<li style="padding-top: 4px;"><spring:message code="lbl.lss.set.info" text="LSS설정정보"/></li>
				</ul>
				<ul class="item">
					<li class="label w150" style="text-align:center;padding-top:2px;"><spring:message code="lbl.room.title" text="방제목"/></li>
					<li><input type="text" id="add_room_title" name="add_room_title" style="width:200px;padding-top:2px;"/><img src="<spring:message code="img.btn.add"/>" onclick="addLssRoom()" style="margin-left:2px;margin-right:0px;"/></li>
				</ul>
				<ul class="item">
					<li class="label w150" style="text-align:center;"><spring:message code="lbl.opening" text="개설중"/></li>
					<li><select id="room_title" name="room_title" onchange="showLssSubjList(this.value)" style="width:205px;">
							<option value=""><spring:message code="lbl.select.check" text="선택해주세요"/></option>
						<c:forEach var="lssSubj" items="${lssSubjTable}">
							<option value="${lssSubj.key}" ${(param.room_title eq lssSubj.key)?'selected=selected':''}>${lssSubj.key}</option>
						</c:forEach>
						</select><img src="<spring:message code="img.board.delete"/>" onclick="removeLssRoom()" style="margin-left:2px;margin-right:0px;"/>
					</li>
				</ul>
			</div>
		</td>
		<td>
			<div class="ytcares-content" style="width:280px;height:300px;padding:0px;border: 1px solid #c8c8c8;"">
				<ul class="header">
					<li style="padding-top: 4px;"><spring:message code="lbl.in.ok.user" text="입장가능 대상자"/></li>
				</ul>
				<div id="allLssSubjList" style="background-color:#ffffff;overflow-x:hidden;overflow-y:auto;width:245px;height:200px;margin:0px;padding:0px;">
					<c:forEach var="lssSubjMap" items="${lssSubjTable}">
						<div id="lssSubjList-${lssSubjMap.key}" style="display:none;">
						<c:forEach var="lssSubj" items="${lssSubjMap.value}">
						<ul id="lssSubjList-${lssSubjMap.key}-${lssSubj.user_id}" class="item">
							<li class="w220" style="vertical-align:middle;">${lssSubj.agency_name}<img src="/images/close_icon.gif" onclick="removeLssSubj('${lssSubj.user_id}')" border="0" width="12" height="11" style="margin-top:5px;float:right;cursor:pointer;" align="bottom"/></li>
						</ul>
						</c:forEach>
						</div>
					</c:forEach>
				</div>
				<ul class="item" style="padding-top:10px;padding-bottom:10px;">
					<li class="action-btn" style="padding-right:10px;"><img src="<spring:message code="img.board.confirm"/>" style="cursor:pointer" onclick="launchLss()"/></li>
				</ul>
			</div>
		</td>
	</tr>
	<tr>
		<td></td>
		<td width="748" valign="top" colspan="2">
			<div class="ytcares-search" style="width:748px;">
				<ul class="search-condition" style="padding-top: 3px;">
					<li class="search-name w40"><spring:message code="lbl.grade" text="등급"/></li>
					<li class="search-value"><ytcares:code name="grade" blank='<spring:message code="lbl.all" text="전체"/>' mcodeCd="CM001" lblCol="CODE_NM1" valCol="DCODE_CD" where="DCODE_CD != '1'" selected="${param.grade}"/></li>
					<li class="search-name w60"><spring:message code="lbl.agency.name" text="가맹점명"/></li>
					<li class="search-value"><input type="text" name="agency_name" value="${param.agency_name}"/></li>
					<li class="search-name w70"><spring:message code="lbl.agency.down" text="하위가맹점"/></li>
					<li class="search-value">
						<select name="family_id" style="width:120px;">
							<option value="">-----</option>
							<c:forEach var="agency" items="${supSubAgencyList}">
							<option value="${agency.FAMILY_ID}" ${(param.family_id eq agency.FAMILY_ID)?'selected=selected':''}>${agency.AGENCY_NAME}</option>
							</c:forEach>
						</select>
					</li>
					<li class="search-btn"><img src="<spring:message code="img.btn.srch" />" onclick="srchUserList()" style="cursor:pointer;"/></li>
					<li class="clear-btn"><img src="<spring:message code="img.btn.clear" />" onclick="clearSrchForm()" style="cursor:pointer;"/></li>
				</ul>
			</div>
			<div class="ytcares-list" style="width:748px;">
				<ul class="header" style="padding-top: 5px;">
					<li class="w40"><input type="checkbox" id="checkAll" name="checkAll" value="1" onclick="checkToggle(this.checked)" style="background-color: #f5f5f5;"/></li>
					<li class="w100"><spring:message code="lbl.user" text="유저명"/></li>
					<li class="w130"><spring:message code="lbl.agency.name" text="가맹점명"/></li>
					<li class="w100"><spring:message code="lbl.grade" text="등급"/></li>
					<li class="w100"><spring:message code="btn.login" text="로그인"/></li>
					<li class="w150"><spring:message code="lbl.login.date" text="로그인일시"/></li>
					<li class="w50"style="float:right;padding:0 15px 0 0"><img src="<spring:message code="img.btn.add"/>" onclick="addLssSubj()" style="cursor: pointer;"/></li>
				</ul>
				<c:forEach var="user" items="${userList}">
				<c:set var="user_id" value="${user.USER_ID}"/>
				<ul class="item">
					<li class="w50" style="text-align:center;padding-left: 15px;"><input type="checkbox" name="lss_user_id" value="${user.USER_ID}"></li>
					<li class="w110">${user.USER_NAME}</li>
					<li class="w110">${user.AGENCY_NAME}</li>
					<li class="w100" style="text-align:center;">${user.CASE_GRADE}</li>
					<%
						if(YTCaresSessionListener.getInstance().isAlreadLoggedOn(String.valueOf(pageContext.getAttribute("user_id")))) {
							out.print("<li class=\"w100\" style=\"text-align:center;\">Y</li>\n");
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
							out.print("<li class=\"w140\" style=\"text-align:center;\">\n"+sdf.format(YTCaresSessionListener.getInstance().getUserBean(String.valueOf(pageContext.getAttribute("user_id"))).getLogon_dttm())+"</li>");
							
						}else{
							out.print("<li class=\"w100\" style=\"text-align:center;\">N</li>\n");
							out.print("<li class=\"w140\">&nbsp;</li>\n");
						} 
					%>
				</ul>
				</c:forEach>
				<c:if test="${fn:length(userList) < 10}">
					<c:forEach var="i" begin="1" end="${10 - fn:length(userList)}">
						<ul style="height: 30px;" class="item"></ul>
					</c:forEach>
				</c:if>
				<ul class="paging" style="height: 30px;">
					<li><ytcares:page count="${userCount}" pageNum="${param.pageNum}" onclick="goPage"/></li>
				</ul>
			</div>
		</td>
	</tr>
</table>
</form>
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
</body>
</html>
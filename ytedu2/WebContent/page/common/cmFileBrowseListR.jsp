<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<html>
<head>
<title>YTCaresFileBrowse</title>
<meta content="text/html; charset=utf-8" http-equiv="content-type"/>
<link 	rel="stylesheet" type="text/css" href="/css/ytcares-calendar.css"/>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/ytcares-calendar.js"></script>

<style>
body, td{
	font-size:12px;
	margin:0px 0px 0px 0px;
}
.file-items-div {
	width:99%;
	min-height:340px;
	max-height:340px;
	overflow-y:auto;
	overflow-x:hidden;
	clear:both;
}
.file-item-ul {
	margin:0px 0px 0px 0px;
	padding:2px;
	list-style:none;
	width:19%;
	height:115px;
	overflow:hidden;
	float:left;
	border:1px solid #ffffff;
	vertical-align:middle;
	text-align:center;
}
.file-item-ul img {
	cursor:pointer;
}
.file-item-ul li {
	font-size:8pt;
	font-family:Arial;
	overflow:hidden;
}
.file-item-mouse-over {
	border:1px solid #33cc33;
	background-color:#d6ffc2;
}

.file-action-button {
	width:99%;
	height:24px;
	margin:3px 0px 3px 0px;
	padding:1 20 1 1;
	vertical-align:middle;
	clear:both;
}
.file-action-button span {
	float:left;
}
.file-action-button button {
	float:right;
	height:22px;
	margin:0px 2px 0px 2px;
	border:1px solid black;
	cursor:pointer;
	background-color:#dcdcdc;
}

</style>

<script>
function selectAll(isCheck) {
	$('#file-items :checkbox').attr('checked', isCheck);
}

function deleteImg() {
	if ($('#file-items :checked').length == 0) {
		alert("<spring:message code='error.require.file' text='선택된 파일이 하나도 없습니다.'/>");
	} else {
		if (confirm("<spring:message code='confirm.file.delete' text='선택된 파일을 삭제하시겠습니까?'/>")) {
			var $f = $('#file-items-form');
			$f.attr('target', '_self');
			$f.attr('method', 'post');
			$f.attr('action', '/CmFileService/deleteFiles.do');

			$f.submit();
		}
	}
}

function showAll() {
	$('#modifyDate').val();
	
	$('#file-items-form :hidden[name=modifyDate]:first').val('');
	$('#file-items-form').attr('action', '/CmFileService/fileBrowse.do');
	$('#file-items-form').submit();
}
$(document).ready(function() {
	$('.file-item-ul').mouseover(function() {
		$(this).addClass('file-item-mouse-over');
	}).mouseout(function() {
		$(this).removeClass('file-item-mouse-over');
	});

	$('ul.file-item-ul>li>img').click(function() {
		opener.CKEDITOR.tools.callFunction('${param.CKEditorFuncNum}', 'http://${pageContext.request.localName}:${pageContext.request.localPort}'+$(this).attr('alt'));
		self.close();
	});

	$('.file-action-button button').mouseover(function() {
		$(this).css('background-color', '#efefef');
	}).mouseout(function() {
		$(this).css('background-color', '#dcdcdc');
	});
	
	var cal = new BsCalendar('modifyDate', {
		max:'today',
		useTrigger:1,
		onDateClicked:function(dateStr) {
			$('#file-items-form :hidden[name=modifyDate]:first').val(dateStr);
			$('#file-items-form').attr('action', '/CmFileService/fileBrowse.do');
			$('#file-items-form').submit();
		}
	}).showCal();
	
	if ('${param.modifyDate}' == '') {
		//$('#modifyDate').val(cal.getDateStr(cal.today));
	}
});
</script>
</head>
<body>
<div class="file-action-button">
	<span>
	<spring:message code='lbl.create.date' text='생성일'/> <input id="modifyDate" name="modifyDate" value="${param.modifyDate}" size="10" readonly="readonly" onkeydown="return false;"/>
	<button onclick="showAll()"><spring:message code='lbl.all' text='전체'/></button>
	</span>
	<button onclick="deleteImg()"><spring:message code='btn.select.delete' text='선택삭제'/></button>
	<button onclick="selectAll(false)"><spring:message code='btn.select.cancel' text='전체해제'/></button>
	<button onclick="selectAll(true)"><spring:message code='btn.select.all' text='전체선택'/></button>
</div>

<div id="file-items" class="file-items-div">
<form id="file-items-form" action="" method="post">
<input type="hidden" name="modifyDate" value="${param.modifyDate}"/>

<c:forEach var="reqParam" items="${pageContext.request.parameterMap}">
	<c:forEach var="paramValue" items="${reqParam.value}">
		<c:if test="${reqParam.key ne 'filename'}">
		<input type="hidden" name="${reqParam.key}" value="${paramValue}"/>
		</c:if>
	</c:forEach>
</c:forEach>

<c:forEach var="file" items="${fileList}" varStatus="i">
	<ul class="file-item-ul">
		<li><input type="checkbox" name="filename" value="${file.name}"/></li>
		<c:choose>
			<c:when test="${param.type eq 'image'}">
				<li><img src="${file.path}thumbnails/${file.name}" alt="${file.path}${file.name}" border="0" width="50"/></li>
			</c:when>
			<c:when test="${param.type eq 'flash'}">
				<li><img src="/images/flash.png" alt="${file.path}${file.name}" border="0" width="50"/></li>
			</c:when>
			<c:otherwise>
				<c:set var="nameandext" value="${fn:split(file.name, '.')}"/>
				<c:choose>
					<c:when test="${fn:length(nameandext) eq 1}">
						<li><img src="/images/filetypes/default.png" alt="${file.path}${file.name}" border="0" width="50"/></li>
					</c:when>
					<c:otherwise>
						<c:set var="ext" value="${fn:toLowerCase(nameandext[fn:length(nameandext)-1])}"/>
						<c:choose>
							<c:when test="${fn:contains('htm,html', ext)}">
								<li><img src="/images/filetypes/htm.png" alt="${file.path}${file.name}" border="0" width="50"/></li>
							</c:when>
							<c:when test="${fn:contains('zip,rar,alz,7z,tar,gz,jar,war', ext)}">
								<li><img src="/images/filetypes/zip.png" alt="${file.path}${file.name}" border="0" width="50"/></li>
							</c:when>
							<c:when test="${fn:contains('aiff,bmp,gif,jpg,jpeg,png', ext)}">
								<li><img src="${file.path}thumbnails/${file.name}" alt="${file.path}${file.name}" border="0" width="50"/></li>
							</c:when>
							<c:when test="${fn:contains('asp,avi,bat,bin,ccd,cmd,com,css,dll,img,inf,ini,iso,mdf,mds,midi,mov,mp3,mp4,mpc,mpg,ogg,php,sys,txt,wav,wma,wmv', ext)}">
								<li><img src="/images/filetypes/${ext}.png" alt="${file.path}${file.name}" border="0" width="50"/></li>
							</c:when>
							<c:otherwise>
								<li><img src="/images/filetypes/default.png" alt="${file.path}${file.name}" border="0" width="50"/></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		
		<li>${file.name}</li>
		<li>${file.lastModified}</li>
		<li><fmt:formatNumber value="${file.length/1024}" maxFractionDigits="0" type="number" pattern="###,###,### KB"/></li>
	</ul>
	<c:if test="${(i.index mod 5) eq 4}">
	<br/>
	</c:if>
</c:forEach>
</form>
</div>

<div class="file-action-button">
	<button onclick="self.close()"><spring:message code='btn.close' text='닫기'/></button>
	<button onclick="deleteImg()"><spring:message code='btn.select.delete' text='선택삭제'/></button>
	<button onclick="selectAll(false)"><spring:message code='btn.select.cancel' text='전체해제'/></button>
	<button onclick="selectAll(true)"><spring:message code='btn.select.all' text='전체선택'/></button>
</div>
<ytcares:msg/>
</body>
</html>

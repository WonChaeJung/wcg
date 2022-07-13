<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<!--
file name : bdBoardMenu_f.jsp
title     : 게시판 사이드 메뉴
date      : 2012/04/05
author    : Jung.B.R
revisions : 2012/05/29 최종작성 (revised by Jung.B.R)
-->

<script language="JavaScript">
function na_restore_img_src(name, nsdoc)
{
  var img = eval((navigator.appName.indexOf('Netscape', 0) != -1) ? nsdoc+'.'+name : 'document.all.'+name);
  if (name == '')
    return;
  if (img && img.altsrc) {
    img.src    = img.altsrc;
    img.altsrc = null;
  } 
}
 
function na_preload_img()
{ 
  var img_list = na_preload_img.arguments;
  if (document.preloadlist == null) 
    document.preloadlist = new Array();
  var top = document.preloadlist.length;
  for (var i=0; i < img_list.length-1; i++) {
    document.preloadlist[top+i] = new Image;
    document.preloadlist[top+i].src = img_list[i+1];
  } 
}
 
function na_change_img_src(name, nsdoc, rpath, preload)
{ 
  var img = eval((navigator.appName.indexOf('Netscape', 0) != -1) ? nsdoc+'.'+name : 'document.all.'+name);
  if (name == '')
    return;
  if (img) {
    img.altsrc = img.src;
    img.src    = rpath;
  } 
}

</script>
<table width="184" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td width="100%" height="140">
			<img src='<spring:message code="img.board.left.title" text="게시판타이틀"/>' width="184" height="67" border="0">
			<a href="/BdBoardService/selectBoardList.do?category=01&sub_category=01" onmouseout="na_restore_img_src('image1', 'document')" onmouseover="na_change_img_src('image1', 'document', '<spring:message code="img.board.left.over.notice" text="공지사항"/>', true)">
			<img src='<spring:message code="img.board.left.notice" text="공지사항"/>' width="184" height="34" border="0" name="image1"></a>
			<a href="/BdBoardService/selectBoardList.do?category=01&sub_category=02" onmouseout="na_restore_img_src('image2', 'document')" onmouseover="na_change_img_src('image2', 'document', '/images/kr/board_left_o_02.gif', true)">
			<img src="/images/kr/board_left_02.gif" width="184" height="34" border="0" name="image2"></a>
			<img src="/images/left_end.gif" width="184" height="7" border="0">
		</td>
	</tr>
</table>

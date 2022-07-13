<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<script language="JavaScript">
function na_restore_img_src(name, nsdoc)
{
	var img = eval((navigator.appName.indexOf('Netscape', 0) != -1) ? nsdoc+'.'+name : 'document.all.'+name);
	if (name == '')return;
	if (img && img.altsrc) {
	img.src = img.altsrc;
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
	if (name == '')return;
	if (img){img.altsrc = img.src;
	img.src = rpath;} 
}
function MM_swapImgRestore() {
	var i,x,a=document.MM_sr; 
	for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() {
	var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
	var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
	if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_findObj(n, d) {
	var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_reloadPage(init) {
	if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
	document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
	else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
function MM_showHideLayers() {
	var i,p,v,obj,args=MM_showHideLayers.arguments;
	for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
	if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
	obj.visibility=v; }
}
function MM_swapImage() {
var i,j=0,x,a=MM_swapImage.arguments; 
document.MM_sr=new Array; 
for(i=0;i<(a.length-2);i+=3)
	if ((x=MM_findObj(a[i]))!=null){
	document.MM_sr[j++]=x; 
	if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
<c:choose>
	<c:when test="${empty loggedUserId}">
		<table width="184" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td width="100%" height="140">
					<img src='<spring:message code="img.mem.left.title" text="회원정보"/>' width="184" height="67" border="0">
					<a href="/CmUserService/callUserLogin.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Img01','','<spring:message code="img.mem.left.login.over"/>',1)" onfocus=blur() >
					<img src='<spring:message code="img.mem.left.login" text="로그인"/>' width="184" height="33" border="0" name="Img01"></a>
					<a href="/CmUserService/callUserAgree.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Img02','','<spring:message code="img.mem.left.join.over"/>',1)" onfocus=blur() >
					<img src='<spring:message code="img.mem.left.join" text="회원가입"/>' width="184" height="33" border="0" name="Img02"></a>
					<a href="/CmUserService/callSrchIdpw.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Img03','','<spring:message code="img.mem.left.find.over"/>',1)" onfocus=blur() >
					<img src='<spring:message code="img.mem.left.find" text="아이디/비번찾기"/>' width="184" height="33" border="0" name="Img03"></a>
					<img src="/images/mem_left_end.gif" width="184" height="7" border="0">
				</td>
			</tr>
		</table>
	</c:when>
	<c:otherwise>
		<table width="184" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td width="100%" height="140">
				<img src='<spring:message code="img.mem_left_title" text="회원정보"/>' width="184" height="67" border="0">
				<a href="#" OnMouseOut="na_restore_img_src('image1', 'document')" OnMouseOver="na_change_img_src('image1', 'document', '/images/kr/mem_login_01.gif', true)"><img src="/images/kr/mem_login_01.gif" width="184" height="33" border="0" name="image1"></a>
				</td>
			</tr>
		</table>
	</c:otherwise>
</c:choose>

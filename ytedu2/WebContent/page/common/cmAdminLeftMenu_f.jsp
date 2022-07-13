<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<script>
$(document).ready(function(){
	var menu = parseInt('${empty param.admin_menu?"0":param.admin_menu}', 10);
	$('#admin-menu').accordion({active:menu});
});
</script>
<style>
.admin-menu div{font-size:14px;}
</style>
<div id="admin-menu" style="width:150px;font-size:14px;text-align:left;">
	<h3><a href="#"><spring:message code='menu.lec' text='교육'/></a></h3>
	<div>
		<a href="/AdLectureService/adminSelectLecList.do?admin_menu=0"><spring:message code='menu.lec.insert' text='교육등록'/></a><br/>
		<a href="/AdLectureService/adminSelectAppList.do?admin_menu=0&pageSize=5"><spring:message code='menu.lec.app' text='교육신청'/></a><br/>
		<a href="/AdLectureService/adminSelectLecReqList.do?admin_menu=0"><spring:message code='menu.lec.req' text='교육개설요청'/></a><br/>
	</div>
	<!--  	
	<h3><a href="#"><spring:message code='menu.el' text='온라인강의'/></a></h3>
	<div>
		<a href="/AdElearnService/adminSelectElearnList.do?admin_menu=1"><spring:message code='menu.el' text='온라인강의'/></a><br/>
	</div>
	-->
	<h3><a href="#"><spring:message code='menu.eshop' text='쇼핑몰'/></a></h3>
	<div>
		<a href="/AdCsmtServiceImpl/adminSelectCsmtList.do?admin_menu=1"><spring:message code='menu.eshop.goods.info' text='상품정보'/></a><br/>
		<a href="/AdPrchsService/adminSearchPrchsList.do?admin_menu=1"><spring:message code='menu.eshop.sale.status' text='판매관리현황'/></a><br/>
		<a href="/AdAccmService/adminSelectAccmPnt.do?admin_menu=1"><spring:message code='menu.eshop.point.status' text='적립금현황'/></a><br/>
	</div>

	<h3><a href="#"><spring:message code='menu.board' text='게시판관리'/></a></h3>
	<div>
		<a href="/AdBoardService/adminSelectBoard.do?admin_menu=2&category=01&sub_category=01"><spring:message code='menu.board.notice' text='공지사항'/></a><br/>
		<a href="/AdBoardService/adminSelectFaq.do?admin_menu=2&category=01&sub_category=02"><spring:message code='menu.board.faq' text='FAQ'/></a><br/>
	</div>
	
	<h3><a href="#"><spring:message code='menu.member' text='회원관리'/></a></h3>
	<div>
		<a href="/AdUserService/adminSearchUserList.do?admin_menu=3"><spring:message code='menu.agency.search' text='가맹점검색'/></a><br/>
		<a href="/AdUserService/adminSearchAgencyInfo.do?admin_menu=3"><spring:message code='menu.agency.info.change' text='가맹점정보변경'/></a><br/>
		<a href="/AdUserService/adminSelectUserTree.do?admin_menu=3"><spring:message code='menu.agency.tree' text='가맹점트리'/></a><br/>
	</div>
	
	<h3><a href="#"><spring:message code='menu.etc' text='기타'/></a></h3>
	<div>
		<a href="/AdCodeService/adminSelectMCodeList.do?admin_menu=4"><spring:message code='menu.code' text='코드관리'/></a><br/>
		<a href="/AdLssService/adminSelectLssList.do?admin_menu=4"><spring:message code='menu.lss' text='LSS관리'/></a><br/>
	</div>
</div>

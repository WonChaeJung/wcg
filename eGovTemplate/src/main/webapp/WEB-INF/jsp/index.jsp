<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/com/include/common-doctype-taglib.jspf"%><%--doctype과 taglib 정의 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/common/css/style.css'/>"  />
<link rel="stylesheet" href="<c:url value='/common/jquery/css/custom-theme/jquery-ui-1.10.3.custom.min.css'/>" />
<style>
.menu li ul{z-index:15;}
</style>
<script src="<c:url value='/common/jquery/js/jquery-1.9.1.js'/>"></script>
<script src="<c:url value='/common/jquery/js/jquery-ui-1.10.3.custom.min.js'/>"></script>

<script src="<c:url value='common/IBSheet7/mditab/ibmditabinfo.js'/>"></script>
<script src="<c:url value='common/IBSheet7/mditab/ibmditab.js'/>"></script>

<title>IBSheet7 Template</title>
<script>

	$(document).ready(function(){
		
		$("#accordion").accordion({
			collapsible : true,
			heightStyle : "content"
		});
		
		$( ".menu" ).menu({
			  select: function( event, ui ) {
			  }
		});
		
		//좌측 메뉴 접기 펼침
		$("#splitter").bind("click",function(){
			$( "#left").toggle("slow",function(){
				if($("#left").css("display")=="none"){ //왼쪽 메뉴가 접혔으면 contents 영역을 늘리자.
					$("#contents").css("width","calc(100% - 5px)");
				}else{
					$("#contents").css("width","calc(100% - 205px)");
				}
			});
		});
		
		//tab 컨트롤 사용
		 createIBMDITab2(document.getElementById("Tab_DIV"), "myTab", "100%", "100%", "Main");
	});
	function myTab_OnloadTab2Finish(){
		//텝 초기화
		myTab.Init(1, false, true, 'gif', false, true, false);
		myTab.SetTabItemLayout(2);
 		myTab.SetTabTitlePos(2);
		myTab.SetMaxZIndex(10);
	}
	function movePage(product, page,obj) {
		//제품명
		document.hiddenForm.navi1.value = event.currentTarget.parentNode.parentNode.parentNode.parentNode.parentNode.previousElementSibling.innerText;
		//대메뉴명
		document.hiddenForm.navi2.value = event.currentTarget.parentNode.parentNode.parentNode.firstElementChild.innerText;
		//선택 메뉴명
		document.hiddenForm.navi3.value = event.currentTarget.innerText;
		
 		var base_path = "<c:url value='/'/>";
		var url = base_path + product + "/" + page+".do";
		var title = obj.childNodes[0].data;
		
		//이미 열린 페이지가 있는지 확인
		var tabid = myTab.FindTabID(page);
		if (url !== "" && tabid === -1) {
	    
			var idx = myTab.InsertItem2(page, title, "");
			var frm = document.getElementById("hiddenForm");
			frm.action = url;
	 		
			var ifrm = myTab.GetTabIframe(idx);		
	 		frm.target = ifrm.name;
	 		frm.submit();
		} else {
	    	myTab.SetSelectedIndex(tabid);
	    }
		
	}
	
	
	
	
	
</script>
</head>
<body>
<DIV id="main">
	<DIV id="left">
  		<h3 class="ui-widget-header">IBSheet7<br>eGovFrame Template</h3>
  		<div class="hspace"></div>
  		<div id="accordion">
		  <h3>ibsheet</h3>
		  <div>
		    <ul class="menu">
			  <li>
			    <a href="#">데이터 조회 / 저장</a>
			    <ul>
					<li><a href="#" onclick="javascript:movePage('sheet/SearchSave','basic',this)">일반 조회/저장</a></li>
					<li><a href="#" onclick="javascript:movePage('sheet/SearchSave','masterDetail',this)">마스터/디테일 구조 조회/저장</a></li>
					<li><a href="#" onclick="javascript:movePage('sheet/SearchSave','double',this)">서로 무관한 두개 시트 조회/저장</a></li>
					<li><a href="#" onclick="javascript:movePage('sheet/SearchSave','pageIndex',this)">페이지 네비게이션</a></li>
					<li><a href="#" onclick="javascript:movePage('sheet/SearchSave','sheet2Form',this)">ibsheet &lt;-&gt; form 데이터 연동</a></li>
			    </ul>
			  </li>
			  <li>
			    <a href="#">USE Tree</a>
			    <ul>
					<li><a href="#" onclick="javascript:movePage('sheet/Tree','01tree',this)">일반 트리 조회</a></li>
				</ul>
			  </li>
			</ul>
		  </div>
		  
	
		  <h3>ibchart</h3>
		  <div id="test12">
		    <ul class="menu">
			  <li>
			    <a href="#">기본기능</a>
			    <ul>
					<li><a href="#" onclick="javascript:movePage('chart/basic','01basicchart',this)">단일 시리즈 차트(파이)</a></li>
					<li><a href="#" onclick="javascript:movePage('chart/basic','02multiseries',this)">다중 시리즈 차트(막대,꺽은선)</a></li>
				</ul>
			  </li>
			</ul>
		  </div>



		  <h3>ibupload</h3>
		  <div>
		    <ul class="menu">
			  <li>
			    <a href="#">응용</a>
			    <ul>
					<li><a href="#" onclick="javascript:movePage('upload/board','boardlist',this)">일반 게시판(list페이지 와 content 페이지 분리)</a></li>
<!-- 					<li><a href="#" onclick="javascript:movePage('upload/board','uploadInSheet',this)">게시판(시트내 업로드)--- 개발 중 ---</a></li> -->
				</ul>
			  </li>
			</ul>
		  </div>
		
		
		
		  <h3>기타 util</h3>
		  <div>
		    <ul class="menu">
			  <li>
			    <a href="#">etc</a>
			    <ul>
					<li><a href="#" onclick="javascript:movePage('etc/util','popup',this)">공통 팝업</a></li>
<!-- 					<li><a href="#" onclick="javascript:movePage('etc/util','util',this)">유틸 함수</a></li> -->
				</ul>
			  </li>
			</ul>
		  </div>
		  
		  
		  
		  
		</div>
  	</DIV>
  	
  	<DIV id="splitter"></DIV>
  	
  	
	<DIV id="contents">
 		<div id="Tab_DIV"></div>
	</DIV>
</DIV>

<form name="hiddenForm" id="hiddenForm" method="post">
<input type="hidden" name="navi1">
<input type="hidden" name="navi2">
<input type="hidden" name="navi3">
</form>

</body>
</html>

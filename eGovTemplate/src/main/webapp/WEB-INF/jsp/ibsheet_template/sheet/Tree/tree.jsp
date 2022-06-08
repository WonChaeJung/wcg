<%@page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-doctype-taglib.jspf"%><%--doctype과 taglib 정의 --%>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-javascript-css.jspf"%><%--javascript과 css 정의 --%>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-ibsheetibchart.jspf"%><%--ibsheet ibchart 정의 --%>
	<script>
		var mySheet = new ibsheetObject();
		$(document).ready(function(){
			
			//ibsheet 객체 생성  ( 시트가 위치할 element  , 시트 이름 ,    너비     ,   높이           )
			ib.comm.createIBSheet( document.getElementById("ibsheet_div"), "mySheet" , "100%" , "100%");
			
			//시트 초기화 변수
			var initSheet = {};
			
			initSheet.Cfg = {FrozenCol:3,SearchMode:2,Page:30,ChildPage:10};
			initSheet.HeaderMode = {Sort:0,ColMove:1,ColResize:1};
			initSheet.Cols = [
			            {Header:"상태",Type:"Status",Width:60,SaveName:"sStatus",Align:"Center"},
			            {Header:"삭제",Type:"DelCheck",Width:60,SaveName:"sDelete",Align:"Center"},
			            {Header:"ID",Type:"Text",Width:60,SaveName:"empno",Align:"Center",KeyField:1},
			            {Header:"이름",Type:"Text",Width:150,SaveName:"ename",Align:"Left",TreeCol:1},
			            {Header:"직책",Type:"Text",Width:100,SaveName:"job",Align:"Center"},
			            {Header:"부서코드",Type:"Combo",Width:100,SaveName:"deptno",Align:"Center",ComboText:"${DNAME}",ComboCode:"${DEPTNO}",PopupText:"${DNAME}"},
			            {Header:"입사일",Type:"Date",Width:120,SaveName:"hiredate",Format:"Ymd",Align:"Center",EditLen:8},
			            {Header:"책임자",Type:"Text",Width:120,SaveName:"mgr",Align:"Center"},
			            {Header:"급여",Type:"Int",Width:120,SaveName:"sal",Align:"Right",Format:"NullInteger"},
			            {Header:"COMM",Type:"Int",Width:60,SaveName:"comm",Align:"Right",Format:"Integer"}
			            ];
			
			//시트 초기화
			IBS_InitSheet(mySheet,initSheet);

		});
	
		function doAction(str){
			switch(str){
				case "search":
					//데이터 조회
					//공통 조회 함수
					var param = {url:"<c:url value='/sheet/Tree/treeSearch.do'/>"
						,sheet:"mySheet"
						,mapping:{mySheet:"TREEDATA"}};
					ib.comm.search( param );
					break;
			
				case "insert":
					mySheet.DataInsert();					
					break;
				case "exceldown":
					var param = {id:"mySheet",name:"TreeSheet","sheetname":"TREE"};
					ib.comm.downExcel(param);
					break;
				case "excelupload":
					var param = {id:"mySheet"};
					ib.comm.loadExcel(param);
					break;
			}
			
		}
		
	</script>
</head>
<body>
<div id="main">
	<jsp:include page="../../common/jsp/sheetNavi.jsp" flush="true"/>
	<div id="title">
		트리 조회 예제
	</div>
	<div id="desc">
	트리 구조사용시 다음 4가지 부분을 설정해야 한다.<br>
	1.	ibsheet.cfg에 UseJsonTreeLevel 속성을 1로 설정<br>
	2.	InitColumns() 메서드를 통해 시트를 초기화 할 때 트리를 표시할 컬럼에 TreeCol:1 로 설정<br>
	3.	조회 json에 각 컬럼의 내용과 별개로 Level이라는 속성 사용<br>
	4. SetConfig()함수에 ChildPage:10으로 설정<br>
	</div>
	
	
	<div id="buttonArea">
	
	<button type="button" onclick="doAction('exceldown')">엑셀다운</button>
	
	<button type="button" onclick="doAction('search')">조회</button>
	
	</div>
	<!-- ibsheet 객체 -->
	<div class="ib_product" style="height:calc(100% - 225px);">
		<div id="ibsheet_div"></div>
	</div>
</div>
</body>
</html>
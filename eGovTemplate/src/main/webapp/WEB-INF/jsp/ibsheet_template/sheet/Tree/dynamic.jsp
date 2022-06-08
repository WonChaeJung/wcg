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
			createIBSheet2( document.getElementById("ibsheet_div"), "mySheet" , "100%" , "100%"    );
			
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
			mySheet.FitColWidth();
// 			console.log(mySheet.Version());
		});
	
		function doAction(str){
			switch(str){
				case "search":
					//데이터 조회
					//공통 조회 함수
					var param = {url:"<c:url value='/sheet/Tree/treeRootSearch.do'/>"
						,sheet:"mySheet"};
					DataSearch( param );
					break;
			
// 				case "insert":
// 					mySheet.DataInsert();					
// 					break;
				case "exceldown":
					mySheet.Down2Excel({FileName:"TreeSheet.xlsx",TreeLevel:1,SheetDesign:1});
					break;
// 				case "excelupload":
// 					mySheet.LoadExcel({Mode:"HeaderMatch"});
// 					break;
// 				case "textdown":
// 					mySheet.Down2Text({FileName : "basicSample.txt"});
// 					break;
// 				case "textupload":
// 					mySheet.LoadText({Mode:"HeaderMatch"});
// 					break;
// 				case "pdfdown":
// 					mySheet.Down2Pdf({FileName : "basicSample.pdf",Paper:"landscape","DPI":2400});
// 					break;
			
			}
			
		}
		
		function mySheet_OnTreeChild(row){
			
			mySheet.DoSearchChild(row,"<c:url value='/sheet/Tree/treeChildSearch.do'/>", "empno="+mySheet.GetCellValue(row,"empno"),{"Wait":1});
			
		}
		
	</script>
</head>
<body>
<div id="main">
	<jsp:include page="../../common/jsp/sheetNavi.jsp" flush="true"/>
	<div id="title">
		동적 확장 트리 조회 예제
	</div>
	<div id="desc">
	최초 2 Depth까지 조회 후, [+]클릭시 자식노드를 조회해 확장한다.<br>
	1. DoSearchChild()메서드를 통해 조회<br>
	2. 조회데이터에 자식 노드가 있는 경우 HaveChild 속성값이 1로 조회<br>
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
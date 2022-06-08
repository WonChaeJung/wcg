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
			ib.comm.createIBSheet( document.getElementById("ib_product1"), "sheet1" , "100%" , "250px");
			//시트 초기화 변수
			var initSheet = {};
			
			initSheet.Cfg = {SearchMode:smLazyLoad};
			initSheet.Cols = [
			            {Header:"상태",Type:"Status",Width:60,SaveName:"sStatus",Align:"Center"},
			            {Header:"삭제",Type:"DelCheck",Width:60,SaveName:"sDelete",Align:"Center"},
			            {Header:"직책",Type:"Text",Width:100,SaveName:"job",Align:"Center"},
			            {Header:"부서코드",Type:"Combo",Width:100,SaveName:"deptno",Align:"Center",ComboText:"${DNAME}",ComboCode:"${DEPTNO}",PopupText:"${DNAME}"},
			            {Header:"ID",Type:"Text",Width:60,SaveName:"empno",Align:"Center",KeyField:1,UpdateEdit:0},
			            {Header:"이름",Type:"Text",Width:150,SaveName:"ename",Align:""},
			            {Header:"입사일",Type:"Date",Width:120,SaveName:"hiredate",Format:"Ymd",Align:"Center",EditLen:8},
			            {Header:"책임자",Type:"Text",Width:120,SaveName:"mgr",Align:"Center"},
			            {Header:"급여",Type:"Int",Width:120,SaveName:"sal",Align:"Right",Format:"NullInteger"},
			            {Header:"COMM",Type:"Int",Width:60,SaveName:"comm",Align:"Right",Format:"Integer"}
			            ];
			
			//시트 초기화
			ib.comm.IBS_InitSheet(sheet1,initSheet);

			
			//ibsheet 객체 생성  ( 시트가 위치할 element  , 시트 이름 ,    너비     ,   높이           )
			ib.comm.createIBSheet( document.getElementById("ibsheet_div"), "sheet2" , "100%" , "100%");
			
			//시트 초기화 변수
			var initSheet = {};
			
			initSheet.Cfg = {SearchMode:smLazyLoad};
			initSheet.Cols = [
			            {Header:"상태",Type:"Status",Width:60,SaveName:"sStatus",Align:"Center"},
			            {Header:"삭제",Type:"DelCheck",Width:60,SaveName:"sDelete",Align:"Center"},
			            {Header:"부서코드",Type:"Text",Width:100,SaveName:"deptno",Align:"Center",KeyField:1,UpdateEdit:0},
			            {Header:"부서명",Type:"Text",Width:60,SaveName:"dname",Align:"Center",KeyField:1},
			            {Header:"위치",Type:"Text",Width:150,SaveName:"loc",Align:"Center"}
			            ];
			//시트 초기화
			ib.comm.IBS_InitSheet(sheet2,initSheet);
		});
	
		function doAction(str){
			switch(str){
				case "search":
					//데이터 조회
					//공통 조회 함수
					var param = {url:"<c:url value='/sheet/SearchSave/05doubleSearch.do'/>"
						,sheet:[sheet1,sheet2]
					};
					ib.comm.search( param );
					break;
				case "save":
 					var param = {url:"<c:url value='/sheet/SearchSave/05doubleSave.do'/>"
						,sheet:[sheet1,sheet2]
// 						,subparam: FormQueryString(document.frm) + "&" + FormQueryString(document.frm2)
//  						,quest:false
 						};
 					ib.comm.save(param);
	
					break;
				
				case "exceldown":
					var param = [
					    {id:"sheet1",title:"사용자정보",name:"두개 시트 다운로드","sheetname":"EMP"},
					    {id:sheet2,title:"부서 정보","sheetname":"DEPT"}
					];
					ib.comm.downExcel(param);	
					break;
					
				case "excelload":
					var param = [
						{id:"sheet1","sheetname":"EMP"},
						{id:"sheet2","sheetname":"DEPT"}
					];
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
		두개 이상의 시트를 동시 조회/저장
	</div>
	<div id="desc">
	두개 이상의 시트를 한번의 통신으로 조회하거나, 하나의 request에 묶어 저장한다.
	</div>
	
	<!-- <div id="functionArea"> -->
	<!-- 	<form name="frm"> -->
	<!--  	</form> -->
	<!-- </div> -->
	<div id="buttonArea">
	<button type="button" onclick="doAction('search')">조회</button>
	<button type="button" onclick="doAction('save')">저장</button>
	<button type="button" onclick="doAction('exceldown')">엑셀</button>
	<button type="button" onclick="doAction('excelload')">엑셀업로드</button>
	</div>
	<!-- ibsheet 객체 -->
	<p class="subtitle">First Sheet</p>
	<div class="ib_product1" id="ib_product1"></div>
	<p class="subtitle">Second Sheet</p>
	<!-- ibsheet 객체 -->
	<div class="ib_product" style="height:calc(100% - 520px);">
		<div id="ibsheet_div"></div>
	</div>
</div>
</body>
</html>
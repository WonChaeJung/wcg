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
			ib.comm.createIBSheet( document.getElementById("ibsheet_div"), "mySheet" , "100%" , "100%"    );
			
			//시트 초기화 변수
			var initSheet = {};
			//                          SearchMode:smServerPaging2
			initSheet.Cfg = {FrozenCol:3,SearchMode:smServerPaging2,Page:100,CountPosition:4,PagingPosition:1};
			initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1};
			initSheet.Cols =	[{Header:"No",Type:"Text",Width:45,SaveName:"rn",Align:"center"},
			                	 {Header:"삭제",Type:"DelCheck",Width:50,SaveName:"DCheck",Align:"center"},
					        	{Header:"우편번호",Type:"Text",Width:85,Align:"Center",SaveName:"postno",Format:"PostNo"},
					        	{Header:"시도",Type:"Text",Width:70,SaveName:"sido"},
					        	{Header:"시군구",Type:"Text",Width:80,SaveName:"sigungu"},
					        	{Header:"읍면동",Type:"Text",Width:80,SaveName:"ubmyndong"},
					        	{Header:"리",Type:"Text",Width:80,SaveName:"lee"},
					        	{Header:"주소",Type:"Text",Width:300,SaveName:"address"},
					        	{Header:"상태",Type:"Status",Width:50,SaveName:"sStatus",Hidden:1}];
			
			//시트 초기화(sheet , 초기화 정보 , 시트를 담고 있는 div 객체)
			ib.comm.IBS_InitSheet(mySheet,initSheet); 
		});
	   
		function doAction(str){
			switch(str){
				case "search":
					//데이터 조회
					var param = {
						"url":"<c:url value='/sheet/SearchSave/pageIndexSearch.do'/>"
						,"subparam":FormQueryStringEnc(document.frm)
						,"sheet":mySheet};
					ib.comm.searchPaging(param);
					break;
				case "save":
 					var param = {url:"<c:url value='/sheet/SearchSave/largeScrollSave.do'/>"
						,sheet:["mySheet"]};
 					DataSave( param );  //이 함수는 common.js 에 존제

					break;
				case "insert":
					mySheet.DataInsert();					
					break;
				case "exceldown":
					mySheet.Down2Excel({SheetDesign:1});
					break;
			}
			
		}
		function chgOnePageRow(rowCnt){
			mySheet.SetPageCount(~~(rowCnt));
			doAction("search");
		}
		function showAndHidePageIndex(v){
			alert(v);
			if(v){
				//시트 내부의 페이지 네비게이션을 감춘다.
				mySheet.SetCountPosition(0);
				//시트 하단에 페이지 인덱스를 표시한다.
				makePageIndex(mySheet);
			}else{
				//시트 내부의  페이지 네비게이션을 보여준다.
				mySheet.SetCountPosition(3);
			}
		}
		//시트의 데이터를 기초로 페이지 인덱스를 생성한다.
		function makePageIndex(sheet){
			
		}

	</script>
</head>
<body>

<div id="main">
	<jsp:include page="../../common/jsp/sheetNavi.jsp" flush="true"/>
	<div id="title">
		페이지인덱스 조회 / 저장 예제
	</div>
	<div id="desc">
	페이지 네비게이션을 이용하여 보기 
	</div>
	
		<div id="functionArea">
			<form name="frm">
				페이지 인덱스 보이기 :  <input type="checkbox"  onchange="showAndHidePageIndex(this.checked)">
				&nbsp;
				보여지는 행 개수 : <select name="OnePageRow" onchange="chgOnePageRow(this.value)">
					<option value="20">20</option>
					<option value="50">50</option>
					<option value="100">100</option>
				</select>
			</form>
 		</div>
	
 	
		<div id="buttonArea">
			<button type="button" onclick="doAction('exceldown')">엑셀다운</button>
			<button type="button" onclick="doAction('search')">조회</button>
			<button type="button" onclick="doAction('insert')">추가</button>
			<button type="button" onclick="doAction('save')">저장</button>
		</div>

		<!-- ibsheet 객체 -->
		<div class="ib_product" style="height:calc(100% - 280px);">
			<div id="ibsheet_div"></div>
			<div id="pageCount" style="display:none;"></div>
		</div>
	
</div>

</body>
</html>
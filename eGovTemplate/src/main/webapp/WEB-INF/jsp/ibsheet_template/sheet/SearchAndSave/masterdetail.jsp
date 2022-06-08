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
			ib.comm.createIBSheet( document.getElementById("ib_product1"), "sheet1" , "100%" , "100%");
			//시트 초기화 변수
			var initSheet = {};
			
			initSheet.Cfg = {SearchMode:smLazyLoad,MergeSheet:msHeaderOnly};
			initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1};
			initSheet.Cols = [
			            {Header:"상태",Type:"Status",Width:60,SaveName:"sStatus",Align:"Center",Hidden:1},
			            {Header:"삭제",Type:"DelCheck",MinWidth:60,SaveName:"sDelete",Align:"Center"},
			            {Header:"부서코드",Type:"Text",MinWidth:80,SaveName:"deptno",Align:"Center",KeyField:1,UpdateEdit:0},
			            {Header:"부서명",Type:"Text",MinWidth:100,SaveName:"dname",Align:"Center",KeyField:1},
			            {Header:"위치",Type:"Text",MinWidth:120,SaveName:"loc",Align:"Center"}
			            ];
			//시트 초기화
			ib.comm.IBS_InitSheet(sheet1,initSheet);
			
			
			//ibsheet 객체 생성  ( 시트가 위치할 element  , 시트 이름 ,    너비     ,   높이           )
			ib.comm.createIBSheet( document.getElementById("ib_product2"), "sheet2" , "100%" , "100%");
			
			//시트 초기화 변수
			var initSheet = {};
			
			initSheet.Cfg = {SearchMode:smLazyLoad};
			initSheet.HeaderMode = {Sort:0,ColMove:1,ColResize:1};
			initSheet.Cols = [
			            {Header:"상태",Type:"Status",Width:60,SaveName:"sStatus",Align:"Center",Hidden:0},
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
			ib.comm.IBS_InitSheet(sheet2,initSheet);
			//수정한 행의 색상
			sheet2.SetRowBackColorU("#FFFF88")

			
		});
	
		function doAction(str){
			switch(str){
				case "search":
					//데이터 조회
					//공통 조회 함수
					var param = {url:"<c:url value='/sheet/SearchSave/deptSearch.do'/>"
						,sheet:"sheet1"};
					ib.comm.search( param );
					break;
				case "save":
					var param = {url:"<c:url value='/sheet/SearchSave/05doubleSave.do'/>"
						,sheet:[sheet1,sheet2]
 						};
 					ib.comm.save(param);
					break;
			
				
				case "exceldown":
					var param = [
					             {id:sheet1,title:"DEPT"}
					             ,{id:"sheet2",title:"EMP"}
					             ];
					ib.comm.downExcel(param);
					break;
			}
		}
		/*
		포커스 이동시 발생하는 이벤트
		*/
		function sheet1_OnSelectCell(or,oc,nr,nc){
			
			//행의 이동이 있는 경우에만 조회한다.
			if(or!=nr){
				
				//detail 시트에 수정된 내용이 있는 경우 저장여부를 확인한다.
				if(sheet2.IsDataModified()){
					if(confirm("EMP Sheet에 수정된 내용이 존재합니다.\n저장하시겠습니까?\n취소를 선택하시면 원래 선택되었던 행으로 되돌아 갑니다.")){
						//싱크로 동작해야한다.
						var param = {
								url:"<c:url value='/sheet/SearchSave/empSave2.do'/>"
								,sync:1
								,quest:0
								,sheet:"sheet2"
						};
						ib.comm.save(param);
					}else{
						sheet1.SelectCell(or,oc,{Event:0});//원래 행으로 되돌리면서 OnSelectCell 이벤트는 발생 시키지 않는다.	
						return;
					}
				}
				
				//detail 시트 조회
				var param = {url:"<c:url value='/sheet/SearchSave/empSearch.do'/>"
					,subparam:"deptno="+sheet1.GetCellValue(nr,"deptno")
					,sheet:"sheet2"
					,mapping:{sheet2:"SHEETDATA1"}};
				ib.comm.search( param );
				
			}
			
		}
	
		function sheet1_OnSearchEnd(code,msg){
				
		}
	</script>
</head>
<body>
<div id="main">
	<jsp:include page="../../common/jsp/sheetNavi.jsp" flush="true"/>
	<div id="title">
		서로 마스터/디테일 관계를 갖고 있는 시트의 조회/저장
	</div>
	<div id="desc">
	마스터시트에 데이터를 선택하는 것에 따라 디테일시트에 관련 데이터를 조회하는 예제를 살펴본다.
	</div>

	<div id="buttonArea">
	<button type="button" onclick="doAction('search')">조회</button>
	<button type="button" onclick="doAction('save')">저장</button> 
	<button type="button" onclick="doAction('exceldown')">엑셀</button>
	</div>
	<div style="height:calc(100% - 215px);">
		<div style="width:29%;height:100%;float:left">
			<!-- ibsheet 객체 -->
			<p class="subtitle">DEPT Sheet</p>
			<div class="ib_product1" id="ib_product1"></div>
		</div>
		<div style="width:2%;height:100%;float:left">&nbsp;</div>
		<div style="width:69%;height:100%;float:left">
			<p class="subtitle">EMP Sheet</p>
			<div class="ib_product2" id="ib_product2"></div>
		</div>
	</div>

</div>
</body>
</html>
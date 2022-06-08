<%@page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-doctype-taglib.jspf"%><%--doctype과 taglib 정의 --%>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-javascript-css.jspf"%><%--javascript과 css 정의 --%>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-ibsheetibchart.jspf"%><%--ibsheet ibchart 정의 --%>
	<style>
		.detailform{border:1px solid #888888;border-collapse: collapse;width:100%}
		.detailform th{background-color:#EAEAEA;width:13%}
		.detailform td{width:20%;text-align:center}
		.detailform td input[type=text]{border:1px solid #888888;text-align:center;}
	</style>    
	<script>
		var mySheet = new ibsheetObject();
		$(document).ready(function(){
			
			//ibsheet 객체 생성  ( 시트가 위치할 element  , 시트 이름 ,    너비     ,   높이           )
			ib.comm.createIBSheet( document.getElementById("ib_product2"), "mySheet" , "100%" , "250px");
			
			//시트 초기화 변수
			var initSheet = {};
			
			initSheet.Cfg = {SearchMode:smLazyLoad};
			initSheet.HeaderMode = {Sort:0,ColMove:1,ColResize:1};
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
			ib.comm.IBS_InitSheet(mySheet,initSheet);
			
			//조회
			doAction("search");
			
		});
	
		function doAction(str){
			switch(str){
				case "search":
					//데이터 조회
					//공통 조회 함수
					var param = {url:"<c:url value='/sheet/SearchSave/empSearch.do'/>"
					,subparam:""
					,sheet:"mySheet"
					,mapping:{mySheet:"SHEETDATA1"}};
					ib.comm.search( param );
					break;
				case "save":
					var param = {
						url:"<c:url value='/sheet/SearchSave/empSave.do'/>"
						,quest:1
						,sheet:"mySheet"
					};
					ib.comm.save(param);
					break;
			
				
				case "exceldown":
					var param = [
					             {id:"mySheet",title:"EMP(직원정보)"}
					             ];
					ib.comm.downExcel(param);
					break;
			}
		}
		function mySheet_OnSelectCell(row,col,newRow,newCol){
			
			if(row!=newRow){
				var param = {
						sheet:mySheet,
						form:document.detailForm,
						row:newRow,
						formPreFix:"frm_"
				}
				IBS_CopySheet2Form(param);
			}
		}
		//ibsheet 에서 데이터 수정시 폼에 복사
		function mySheet_OnChange(row,col,value,oldValue){
			var saveName = mySheet.ColSaveName(col);
			document.detailForm["frm_"+saveName].value = value;
		}
		$(document).ready(function(){
			//폼에서 데이터 수정시 ibsheet에 복사
			var eles = document.detailForm.elements;
			for(var i=0;i<eles.length;i++){
				eles[i].addEventListener("change",function(){
					mySheet.SetCellValue( mySheet.GetSelectRow(), (this.name).substring(4), this.value);
				},false);
			}
		});
	</script>
</head>
<body>
<div id="main">
	<jsp:include page="../../common/jsp/sheetNavi.jsp" flush="true"/>
	<div id="title">
		시트와 Form 간의 데이터 복사
	</div>
	<div id="desc">
	시트의 데이터를 Form 영역으로 복사하거나 Form의 데이터를 시트로 복사하는 방법을 알아본다.
	</div>

	<div id="buttonArea">
		<button type="button" onclick="doAction('search')">조회</button>
		<button type="button" onclick="doAction('save')">저장</button> 
		<button type="button" onclick="doAction('exceldown')">엑셀</button>
	</div>
	<div>
		<p class="subtitle">EMP Sheet</p>
		<div class="ib_product2" id="ib_product2"></div>
	</div>
	<div style="height:calc(100% - 468px)">
		<p class="subtitle">Detail Form</p>
		<form name="detailForm" id="detailForm">
			<table class="detailform">
				<tr>
					<th>직책</th><td><input type="text" name="frm_job"></td>
					<th>부서</th><td><select name="frm_deptno">${DEPT}</select></td>
					<th></th><td></td>
				</tr>
				<tr>
					<th>ID</th><td><input type="text" name="frm_empno"></td>
					<th>이름</th><td><input type="text" name="frm_ename"></td>
					<th>책임자ID</th><td><input type="text" name="frm_mgr"></td>
				</tr>
				<tr>
					<th>입사일</th><td><input type="text" name="frm_hiredate"></td>
					<th>급여</th><td><input type="text" name="frm_sal"></td>
					<th>상여</th><td><input type="text" name="frm_comm"></td>
				</tr>
			</table>
		</form>
	</div>
	
</div>
</body>
</html>
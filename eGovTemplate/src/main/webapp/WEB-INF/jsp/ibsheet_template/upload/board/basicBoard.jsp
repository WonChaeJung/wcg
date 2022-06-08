<%@page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-doctype-taglib.jspf"%><%--doctype과 taglib 정의 --%>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-javascript-css.jspf"%><%--javascript과 css 정의 --%>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-ibsheetibchart.jspf"%><%--ibupload --%>
	<script>
		$(document).ready(function(){
		
			//ibsheet 객체 생성  ( 시트가 위치할 element  , 시트 이름 ,    너비     ,   높이           )
			ib.comm.createIBSheet( document.getElementById("ib_product"), "mySheet" , "100%" , "250px"    );
		
			//시트 초기화 변수
			var initSheet = {};
			initSheet.Cfg = {SearchMode:smLazyLoad};
			initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1};
			initSheet.Cols = [
			            {Header:"NO",Type:"Text",MinWidth:50,SaveName:"no",Align:"Center",Edit:0,FitColWidth:0},
			            {Header:"제 목",Type:"Text",MinWidth:200,SaveName:"title",Align:"Left"},
			            {Header:"작성자",Type:"Text",MinWidth:80,SaveName:"cuser",Align:"Center",Edit:0,FitColWidth:0},
			            {Header:"작성일",Type:"Date",MinWidth:80,SaveName:"cdate",Align:"Center",FitColWidth:0},
			            {Header:"파일유무",Type:"Image",MinWidth:40,SaveName:"fileExist",Align:"Center",FitColWidth:0,ImgHeight:16,ImgWidth:16},
			            {Header:"내용",Type:"Text",SaveName:"content",Hidden:1},
			            {Header:"파일내용",Type:"Text",SaveName:"filedata",Hidden:1}
			            ];
			//시트 초기화
			ib.comm.IBS_InitSheet(mySheet,initSheet);
			
			mySheet.SetImageList(0,"../../common/IBSheet7/upload/js/Main/icon16/file.gif");
			mySheet.SetEditableColorDiff(0);
			mySheet.SetEditable(0);   
            doAction("search");
		});
	
		function doAction(str){
			switch(str){
				case "search":
					//데이터 조회
					//공통 조회 함수
					var param = {url:"<c:url value='/upload/basic/bbs_search.do'/>"
						,subparam:FormQueryStringEnc(document.searchFrm)   //폼객체 안에 내용을 QueryString으로 바꾼다.
						,sheet:"mySheet"};
					ib.comm.search( param );
					break;
				case "new":
					var popUrl = "<c:url value='/upload/board/boardcontents.do'/>";
					var opt = {
							url:popUrl,
							width:"m",  //s,m,l  
							height:500,
							title:"새 글쓰기",
							type:"newBoardContent",  //<-- 팝업에 대한 이름...
							resFuncName:function(){doAction('search')}
					};
					ib.comm.showPopup(opt);
					break;
			}
			
		}
		//더블 클릭한 행의 내용을 팝업으로 띄운다.
		function mySheet_OnDblClick(row,col){
			//한행의 데이터를 json 형태로 추출
			var rowJson = mySheet.GetRowData(row);
			var popUrl = "<c:url value='/upload/board/boardcontents.do'/>";
			var opt = {
					url:popUrl,
					width:"m",
					height:500,
					title:"수정/삭제",
					cond:rowJson,
					type:"newBoardContent",  //<-- 팝업에 대한 이름...
					resFuncName:function(){doAction('search')}
			};
			ib.comm.showPopup(opt);
		}
		


	</script>
</head>
<body>
<jsp:include page="../../common/jsp/sheetNavi.jsp" flush="true"/>

<div id="title">
	응용 / 게시판
</div>
<div id="desc">
list 와 content가 분리된 게시판(자료실)을 구현해 본다.
</div>

<div id="functionArea">
<form name="searchFrm">
제목 : <input type="text" name="frm_searchtitle"/>
</form>
</div>

<div class="buttonArea">
	
	<button type="button" onclick="doAction('search')">조회</button>
	<button type="button" onclick="doAction('new')">글쓰기</button>
</div>

<!-- ibsheet 객체 -->
<div class="ib_product" id="ib_product"></div>

</body>
</html>
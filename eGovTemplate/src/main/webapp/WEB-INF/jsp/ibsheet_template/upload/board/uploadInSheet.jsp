<%@page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-doctype-taglib.jspf"%><%--doctype과 taglib 정의 --%>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-javascript-css.jspf"%><%--javascript과 css 정의 --%>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-ibsheetibchart.jspf"%><%--ibupload --%>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-ibupload.jspf"%><%--ibupload 관련 파일 include --%>
	<script>
		var mySheet = new ibsheetObject();
		$(document).ready(function(){
		
			//ibsheet 객체 생성  ( 시트가 위치할 element  , 시트 이름 ,    너비     ,   높이           )
			ib.comm.createIBSheet( document.getElementById("ib_product"), "mySheet" , "100%" , "250px"    );
		
			//시트 초기화 변수
			var initSheet = {};
			initSheet.Cfg = {SearchMode:smLazyLoad,MergeSheet:msHeaderOnly};
			initSheet.HeaderMode = {Sort:1,ColMove:1,ColResize:1};
			initSheet.Cols = [
			            {Header:"NO",Type:"Text",MinWidth:50,SaveName:"no",Align:"Center",Edit:0,FitColWidth:0},
			            
			            {Header:"상 태",Type:"Status",MinWidth:50,SaveName:"status",FitColWidth:0},
			            {Header:"삭 제",Type:"DelCheck",MinWidth:50,SaveName:"del",FitColWidth:0},
			            
			            {Header:"제 목",Type:"Text",MinWidth:300,SaveName:"title",Align:"Left"},
			            {Header:"작성자",Type:"Text",MinWidth:100,SaveName:"cuser",Align:"Center",Edit:0,FitColWidth:0},
			            {Header:"작성일",Type:"Date",MinWidth:120,SaveName:"cdate",Align:"Center",InsertEdit:0,UpdateEdit:1,FitColWidth:0},
// 			            {Header:"첨부파일",Type:"Popup",MinWidth:100,SaveName:"filename"},
			            {Header:"첨부파일\n수정",Type:"Button",Align:"Center",MinWidth:30,SaveName:"modiBtn",DefaultValue:"\u270E",FitColWidth:0,ToolTip:"파일삭제"},
			            {Header:"첨부파일\n다운로드",Type:"Button",Align:"Center",MinWidth:30,SaveName:"downBtn",DefaultValue:"\u21E9",FitColWidth:0,ToolTip:"다운로드"},
			            {Header:"filedata",Type:"Text",SaveName:"filedata",Width:300,Hidden:0}
			            ];
			//시트 초기화
			ib.comm.IBS_InitSheet(mySheet,initSheet);
			
			 //업로드 생성
			 $("#myUpload").IBUpload({
				 iconMode:"detail",
// 			     limitFileCountOnce:1, //파일 하나만 선택할수 있다.
			     downloadFileName:(new Date()).toLocaleString().substring(0,10)+"게시판연동_압축파일",
			     uploadServerUrl:"<c:url value='/upload/basic/bbs_save.do'/>",
				 downloadServerUrl:"<c:url value='/common/file/DownLoad.do'/>",
			     onContextMenu: function(key) {
			         doAction(key);
			     },
			     //업로드 완료 이벤트
			     onUploadFinish:function(msg1,msg2){
// 			    	alert(msg1+"\n\n\n"+msg2);
			     	if(msg2["etcdata"]["msg"]!=""){
			     		alert(msg2["etcdata"]["msg"]);
			     	}
			     	//저장 완료 후 다시 조회한다.
			     	doAction("search");
			     },
			     
			     //파일 추가 이벤트
			     onAddFile:function(files){
			    	var sr = mySheet.GetSelectRow();
					mySheet.SetCellValue(sr,"filedata",files);
					var jsonObj = $.parseJSON(files);
					mySheet.SetCellValue(sr,"filename",jsonObj["name"]);
			     }
			 });
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
				case "save":
// 					//삭제할 행들은 업로드 컨트롤에서도 제거해 준다.
// 					var rows = mySheet.FindStatusRow("D");
// 					var rowArr = rows.split(";");
// 					for(var i=0;i<rowArr.length;i++){
// 						mySheet_OnButtonClick(rowArr[i], mySheet.SaveNameCol("delBtn"));
// 					}
					
// 					var saveStr = mySheet.GetSaveString({Mode:2,Delim:"‡"}) + "&mySheet_SAVENAME="+IBS_ConcatSaveName(mySheet);
					
// 					//시트에 수정된 내용이 있는 경우에만 저장하자.
// 					if(mySheet.IsDataModified()&&saveStr.indexOf("KeyFieldError")<0){
// 						$('#myUpload').IBUpload('uploadServerUrl',"/IBSheetTemplate/upload/basic/bbs_save2.do");
// 						//시트의 변경된 내용과 같이 저장한다.
// 						$('#myUpload').IBUpload('extendParamUpload', saveStr);
// 						$('#myUpload').IBUpload('upload');	
// 					}
					break;
				case "new":
					var row = mySheet.DataInsert(0);
					//default 값 셋팅
					mySheet.SetCellText(row,"cuser","몽키D루피");
					break;
				case "test":
						var data = [
	                         {name: "관심과집중.mp4", size: "11417124", date: "20160101125959", url: "20160126_180337_82754651"}
	                        ];
					$("#myUpload").IBUpload("files",data);					
						
					break;
				case "test2":
					var data = [
	                        {name: "오렌지.jpg", size: "1075761", date: "20160101125959", url: "20160126_180801"}
	                        ,{name: "제품비교표2018.xlsx", size: "14020", date: "20160101125959", url: "20160126_181434_41920849"}
	                        ];
						$("#myUpload").IBUpload("files",data);					
							
						break;

			}
		}
// 		function mySheet_OnSelectCell(row,col,nr,nc){
// 			var data = mySheet.GetCellValue(row,"filedata");
// 			$("#myUpload").IBUpload('files',data)
// 		}    
		//첨부파일 추가 
		function mySheet_OnPopupClick(row,col){
			//기존 팝업에 파일 있으면 제거 후에 업로드 한다.
			mySheet_OnButtonClick(row,mySheet.SaveNameCol("delBtn"));
			$('#myUpload').IBUpload('add');
		}
		function mySheet_OnSearchEnd(code,msg){
			//시트의 filedata 컬럼의 값을 ibupload에 로드한다.
// 			var col = mySheet.SaveNameCol("filedata");
// 			var fr = mySheet.GetDataFirstRow();
// 			var er = mySheet.GetDataLastRow();
// 			var file = mySheet.GetRangeText(fr,col,er,col,"|",",");
// 			$('#myUpload').IBUpload('files',"["+file+"]");
			
		}
		
		function mySheet_OnButtonClick(row,col){
			//클릭한 컬럼 명
			var sn = mySheet.ColSaveName(0,col);
			
			if(sn=="downBtn"){//다운로드
				var fileStr = mySheet.GetCellText(row,"filedata");
				$("#myUpload").IBUpload('linkDown',fileStr);
			}else if(sn=="modiBtn"){//삭제
				
				//한행의 데이터를 json 형태로 추출
				var rowJson = mySheet.GetRowData(row);
				var popUrl = "<c:url value='/upload/board/uploadPopup.do'/>";
				var opt = {
						url:popUrl,
						width:"s",
						height:250,
						title:"수정/삭제",
						cond:rowJson,
						type:"filePopup",  //<-- 팝업에 대한 이름(매우중요)
						resFuncName:function(){}
				};
				ib.comm.showPopup(opt);
				
				
				
// 				if(mySheet.GetCellText(row, "filedata")=="")return;
// 				var selectRowFileData =   $.parseJSON(mySheet.GetCellText(row, "filedata"));
// 				var files = $("#myUpload").IBUpload("fileList");
// // 					alert(JSON.stringify(files));
// //					files : 
// //					[{"key":"file0_0","name":"IBChart 유형 과 기능.pptx","date":"20160522161753","size":"1126384","url":"20160522161753_55754622","id":"20160522161753_55754622","progress":"다운로드 가능"},{"key":"file0_1","name":"ibsheet7 기초 가이드 for 컨플루언스.docx","date":"20160522161753","size":"22390","url":"20160522161753","id":"20160522161753","progress":"다운로드 가능"}]
// // 					[{"key":"file0_0","name":"ActiveX배포 업체 리스트_v5.xlsx","date":"20160522162845","size":"22495","url":"20160522162845","id":"20160522162845","progress":"다운로드 가능"},{"key":"file0_2","name":"ibsheet7 기초 가이드 for 컨플루언스.docx","date":"20160522161753","size":"22390","url":"20160522161753","id":"20160522161753","progress":"다운로드 가능"},{"key":"file1_0","name":"IBUpload 7.3 기술지원 테스트 시나리오.pptx","date":"20160522164305","size":"56268","url":"file1_0","id":"file1_0","progress":"대기중"}]
				

// 				for(var i=0;i<files.length;i++){
// 					if(files[i]["id"].indexOf("file")==0){
// 						//아직 서버에 저장하지 않은 파일
// 						if(files[i]["id"]==selectRowFileData["id"]){
// 							$("#myUpload").IBUpload("deleteIndex",i);
// 							mySheet.SetCellText(row,"filename","");
// 							mySheet.SetCellText(row,"filedata","");
// 						}	
// 					}else{
// 						//서버에 존재하는 파일
// 						if(files[i]["url"]==selectRowFileData["url"]){
// 							$("#myUpload").IBUpload("deleteIndex",i);
// 							mySheet.SetCellText(row,"filename","");
// 							mySheet.SetCellText(row,"filedata","");
// 						}	
// 					}
// 				}
			}
			
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
	<button type="button" onclick="doAction('save')">저장</button>
	<button type="button" onclick="doAction('new')">추가</button>
	<button type="button" onclick="doAction('test')">test</button>
	<button type="button" onclick="doAction('test2')">test2</button>
</div>

<!-- ibsheet 객체 -->
<div class="ib_product" id="ib_product"></div>

<!--  ibupload 객체 -->
<div style="width:99%;height:200px;border:1px solid #ADADAD">
	<div id="myUpload" style=""></div>
</div>
</body>
</html>
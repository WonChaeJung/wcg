<%@page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-doctype-taglib.jspf"%><%--doctype과 taglib 정의 --%>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-javascript-css.jspf"%><%--javascript과 css 정의 --%>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-ibupload.jspf"%><%--ibupload 관련 파일 include --%>
	<style>
    .tableDiv{width:96%;height:170px;box-sizing:border-box;border:1px solid #898989;}
 	.tableTh{background-color:#DDDDFF;font-family:"맑은고딕",Dotum;font-size:0.9em;font-weight:700;text-align:center;vertical-align:middle;width:80px;float:left;height:100%;}
 	.tableTd{border: 1px solid #ADADAD;
	    border-collapse: collapse;
	    padding:3px;
	    float:left;
	    }
	</style>

	<title>내용</title>
	

<script>
function init(){
	
	//부모창에서 넘어온 내용.
	var param = ib.comm.getPopupParam("newBoardContent");
	
	ib.comm.loadForm("frm",param,"frm_");
	
		    
	 //업로드 생성
	 $("#myUpload").IBUpload({
// 	     viewType:"icon",
  	 	iconMode :"list",
// 	     theme :"Main",
// 	     autoUpload:false,
	     downloadFileName:"게시판연동_압축파일",
		 files:param["filedata"],
		 uploadServerUrl:"<c:url value='/upload/basic/bbs_save.do'/>",
		 downloadServerUrl:"<c:url value='/common/file/DownLoad.do'/>",
		 limitFileSize:1024*1024*500,   //500MB 이하만 업로드 하자
		 limitFileCount: 10,
		 useDragDrop:true,
	     onContextMenu: function(key) {
	         doAction(key);
	     },
	     onUploadFinish:function(msg1,msg2){
	     	if(msg2["etcdata"]["msg"]!=""){
	     		alert(msg2["etcdata"]["msg"]);
	     	}
	     	//저장 완료 후 다시 조회한다. (이벤트 안에서 팝업이 닫히면 스크립트오류가 발생하여 timeout을 걸었음)
 	     	setTimeout( function(){doAction("list");},100);
	     }
	 });
}

function doAction(str){
	switch(str){
		case "list":
			//목록으로 돌아가기
			var param = ib.comm.getPopupParam("newBoardContent");
			//callback event 호출
			param.resFuncName();
			//창을 닫음
			ib.comm.closePopup("newBoardContent");
			break;
		case "save":
			$('#myUpload').IBUpload('extendParamUpload',FormQueryStringEnc(document.frm));
			$('#myUpload').IBUpload('upload');
			break;
		case "deletesave":
			if(document.frm.frm_no.value==""){
				alert("아직 저장되지 않은 데이터는 삭제하실 수 없습니다.");
				return;
			}
			
			if(confirm("삭제하시겠습니까?")){
				//업로드 컨트롤 위에 파일을 모두 지운다.
				var files = $("#myUpload").IBUpload("fileList");
				console.log(files);
				$("#myUpload").IBUpload("deleteServer", files);
				$('#myUpload').IBUpload('uploadServerUrl',"<c:url value='/upload/basic/bbs_save.do'/>");
				$('#myUpload').IBUpload('extendParamUpload',FormQueryStringEnc(document.frm)+"&isDelete=Y");
				$('#myUpload').IBUpload('upload');	
			}
			break;

		case "reset":

			$("#myUpload").IBUpload("files",[]);
			break;
			
		case 'add': //파일추가
            $('#myUpload').IBUpload('add');
            break;
        case 'delete': //파일삭제
            $('#myUpload').IBUpload('delete');
            break;
        case 'download':  //다운로드
            $('#myUpload').IBUpload('download');
            break;
	}
}

</script>
</head>
<body onload="init()">


<div style="height:2px"></div>

<div class="tableDiv">
	<div class="tableTh">파일정보</div>
	<div class="tableTd">
		<div style="width:98%;height:130px;border:1px solid #ADADAD">
			<div id="myUpload"></div>
		</div>
		<div style="width:100%;height:5px"></div>
		<div>
		    <button type="button" onclick="javascript:doAction('add');">파일추가</button>
		    <button type="button" onclick="javascript:doAction('delete');">파일제거</button>
		    <button type="button" onclick="javascript:doAction('download');">다운로드</button>
	    </div>	
	</div>
</div>		
<div style="clear:both"></div>
<div class="buttonAreaCenter">
	<button type="button" onclick="doAction('save')">저장</button>
	<button type="button" onclick="doAction('list')">닫기</button>
</div>
</body>
</html>
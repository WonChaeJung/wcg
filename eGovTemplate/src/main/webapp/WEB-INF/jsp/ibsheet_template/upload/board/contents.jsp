<%@page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-doctype-taglib.jspf"%><%--doctype과 taglib 정의 --%>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-javascript-css.jspf"%><%--javascript과 css 정의 --%>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-ibupload.jspf"%><%--ibupload 관련 파일 include --%>
	<style>
	.content_table{width:100%;border-collapse: collapse;}
	.content_table,.content_table td{
		border: 1px solid #ADADAD;
	    border-collapse: collapse;
	    padding:3px;
    }
    .content_table th{background-color:#DDDDFF;font-family:"맑은고딕",Dotum;font-size:0.9em;font-weight:700;text-align:center}
    .content_table input{width:98%;font-family:"돋움",Dotum,font-size:1em;border:1px solid #ADADAD}
    .content_table textarea{width:98%;font-family:"돋움",Dotum,font-size:1em;border:1px solid #ADADAD;height:150px;}
    
    
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
 		 contextMenuItems:{
             "download": {name: "다운로드 (D)", icon: "", accesskey: "d"}
         },
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
			document.frm.frm_no.value = "";
			document.frm.frm_cdate.value = "";
			document.frm.frm_cuser.value = "";
			document.frm.frm_title.value = "";
			document.frm.frm_content.value = "";
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
<div class="buttonArea">
	<button type="button" onclick="doAction('list')">닫기</button>
	<button type="button" onclick="doAction('save')">저장</button>
	<button type="button" onclick="doAction('deletesave')">삭제</button>
</div>

<div style="height:2px"></div>
<form name="frm" id="frm">
<input type="hidden" name="frm_filedata">
<table class="content_table">
	<colgroup>
		<col style="width:150px" />
		<col style="width:200px" />
		<col style="width:150px" />
		<col style="width:200px" />
	</colgroup>
	<tr>
		<th>No</th>
		<td><input type="text" name="frm_no" readonly style="background-color:#ADADAD" value="${no}"/></td>
		<th>작성일</th>
		<td><input type="text" name="frm_cdate"   readonly style="background-color:#ADADAD"  value="${cdate}"/></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td colspan="3"><input type="text" size="15" name="frm_cuser"  value="${cdate}"/></td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3"><input type="text" name="frm_title"  value="${title}"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="3"><textarea name="frm_content">${content}</textarea></td>
	</tr>
	<tr>
		<th>파일정보</th>
		<td colspan="3">
			<div style="width:98%;height:100px;border:1px solid #ADADAD">
				<div id="myUpload"></div>
			</div>
			<div style="width:100%;height:5px"></div>
			<div>
			    <button type="button" onclick="javascript:doAction('add');">파일추가</button>
			    <button type="button" onclick="javascript:doAction('delete');">파일제거</button>
			    <button type="button" onclick="javascript:doAction('download');">다운로드</button>
		    </div>
		</td>
	</tr>
</table>
</form>
</body>
</html>
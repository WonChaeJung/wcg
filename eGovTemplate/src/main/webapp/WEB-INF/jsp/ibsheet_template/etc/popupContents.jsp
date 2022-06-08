<%@page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-doctype-taglib.jspf"%><%--doctype과 taglib 정의 --%>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-javascript-css.jspf"%><%--javascript과 css 정의 --%>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-ibupload.jspf"%><%--ibupload 관련 파일 include --%>
	<style>
		.content_table,.content_table td{
			border: 1px solid #ADADAD;
		    border-collapse: collapse;
		    padding:3px;
	    }
	    .content_table input{width:98%;font-family:"돋움",Dotum,font-size:1em;border:1px solid #ADADAD}
	    .content_table textarea{width:98%;font-family:"돋움",Dotum,font-size:1em;border:1px solid #ADADAD}
	    .content_table{width:100%;}
	    .table_title{background-color:#DDDDFF;font-family:"맑은고딕",Dotum;font-size:0.9em;font-weight:700;text-align:center}
	</style>

	<title>팝업 테스트</title>
	

	<script>
	$(document).ready(function() {
		//부모창에서 넘어온 내용.
		var param = ib.comm.getPopupParam("testPopupExam");
		
		//부모창 접근
		var opener = param.opener;
		console.log(opener);
		
		//넘어온 내용을 폼에 넣는다.
		ib.comm.loadForm("frm",param.sendDATA);
		
		
		$("#dialog-ok").click(function(){
			var param = ib.comm.getPopupParam("testPopupExam");
			//callback event 호출
			param.resFuncName(  ib.comm.formToJson("frm") );
			//창을 닫음
			ib.comm.closePopup("testPopupExam");
		});
		
		$("#dialog-cancel").click(function(){
			//창을 닫음.
			ib.comm.closePopup("testPopupExam");
		});
	});
	
	
	
	</script>
</head>
<body>

<div style="height:2px"></div>
<form name="frm" id="frm">
<table class="content_table">
	<colgroup>
		<col style="width:20%"/>
		<col style="width:30%"/>
		<col style="width:20%"/>
		<col style="width:30%"/>
	</colgroup>
	<tr>
		<td class="table_title">No</td>
		<td><input type="text" name="frm_no" id="frm_no" readonly style="background-color:#ADADAD" value=""/></td>
		<td class="table_title">작성일</td>
		<td><input type="text" name="frm_cdate" id="frm_cdate" readonly style="background-color:#ADADAD"  value=""/></td>
	</tr>
	<tr>
		<td class="table_title">작성자</td>
		<td colspan="3"><input type="text" size="15" name="frm_cuser"  id="frm_cuser"   value=""/></td>
	</tr>
	<tr>
		<td class="table_title">제목</td>
		<td colspan="3"><input type="text" name="frm_title" id="frm_title"  value=""/></td>
	</tr>
	<tr>
		<td class="table_title">내용</td>
		<td colspan="3"><textarea name="frm_content" id="frm_content" style="height:300px">
홍길동전(洪吉童傳)》은 1612년 허균이 지은 것으로 알려진 한글소설[1]이다. 의적 홍길동을 소재로 한 내용이다.
조선 시대의 도적패 우두머리였던 홍길동(洪吉同)의 이야기를 허균이 소설로 꾸몄으리라 여겨지고 있다. 실존 인물인 홍길동(洪吉同)은 연산군 때 사람이나, 허균은 소설의 배경을 세종 때로 설정하였다</textarea></td>
	</tr>
</table>
</form>
<div style="height:5px"></div>
<div style="text-align:center">
    <button id="dialog-ok">확인</button>
    <button id="dialog-cancel">취소</button>
</div>

</body>
</html>
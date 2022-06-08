<%@page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-doctype-taglib.jspf"%><%--doctype과 taglib 정의 --%>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-javascript-css.jspf"%><%--javascript과 css 정의 --%>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-ibsheetibchart.jspf"%><%--ibsheet ibchart 정의 --%>
	<script>
	$(document).ready(function(){
		//팝업 버튼 클릭시
		$("#popExam").click(function(){
			var param = {"sendDATA":
							{"frm_no":55
							,"frm_cdate":"2017-03-06"
							,"frm_cuser":"허균"
							,"frm_title":"홍길동전"
							}
						};
			var opt = {
					url:"etc/util/popupContent.do",
					width:"m",
					height:500,
					title:"팝업 타이틀",
					type:"testPopupExam",  //<-- 팝업에 대한 이름...
					cond:param,
					resFuncName:callBackFunc
			};
			ib.comm.showPopup(opt);
		});	
		
	});
	function callBackFunc(rtnData){
		var s = JSON.stringify(rtnData,null,4);
		$("#rtnText").val(s);
	}
	</script>
</head>
<body >
<div id="main">
	
	<jsp:include page="../common/jsp/sheetNavi.jsp" flush="true"/>
	<div id="title">popup 공통 util</div>
	<div id="desc">
		jquery ui를 이용한 팝업을 생성해 본다.
	</div>
	
	
	<div id="functionArea">
		<form name="frm">
			<textarea name="rtnText" id="rtnText" style="width:100%;height:300px"></textarea>
	 	</form>
	</div>
	<div id="buttonArea">
		<button type="button" id="popExam">기본 팝업</button>
	</div>
	
</div><!-- main end -->
</body>
</html>
<%@page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-doctype-taglib.jspf"%><%--doctype과 taglib 정의 --%>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-javascript-css.jspf"%><%--javascript과 css 정의 --%>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-ibsheetibchart.jspf"%><%--ibsheet ibchart 정의 --%>
	<script>
		
		$(document).ready(function(){
			//ibchart 객체 생성  ( 차트가 위치할 element  , 차트 이름 ,   { 너비     ,   높이}           )
			createIBChart("chart_div", "myChart", {width:"100%",height:"500px"});
			
			var prop ={
				    "chart": {
				        "type": "pie"
				    },
				    "title": {
				        "text": "파이 차트",
				        "align": "center",
				        "verticalAlign": "top"
				    },
				    "legend": {
				        "enabled": true,
				        "layout": "vertical",
				        "align": "right",
				        "verticalAlign": "middle",
				        "reversed": false,
				        "borderWidth": "1",
				        "borderRadius": "5",
				        "floating": false
				    },
				    "xAxis": {
				        "Title": {
				            "enabled": false
				        },
				        "gridLineDashStyle": "solid",
				        "labels": {
				            "enabled": true,
				            "align": "center"
				        }
				    },
				    "yAxis": [
				        {
				            "title": {
				                "enabled": false
				            },
				            "gridLineDashStyle": "solid",
				            "labels": {
				                "enabled": true
				            }
				        }
				    ],
				    "toolTip": {
				        "enabled": true,
				        "borderWidth": 0
				    },
				    "plotOptions": {
				        "series": {
				            "dataLabels": {
				                "enabled": true,
				                "align": "center"
				            },
				            "animation": true
				        },
				        "pie": {
				            "showInLegend": true
				        }
				    }
				}
				myChart.setOptions(prop);
			
				myChart.draw();
		});
	
		function doAction(str){
			switch(str){
				case "search":
					
										
						
					var param = {url:"<c:url value='/chart/basic/chartDataSearch.do'/>"
						,subparam:FormQueryStringEnc(document.frm)   //폼객체 안에 내용을 QueryString으로 바꾼다.
						,chart:"myChart"};
					ib.comm.search( param );
					

					break;
			
			
			}
			
		}
		
	
	</script>
</head>
<body>
<jsp:include page="../../common/jsp/sheetNavi.jsp" flush="true"/>
<div id="title">
	차트 기본 예제
</div>
<div id="desc">
전자정부 표준 프레임워크에서 차트 데이터  조회 작업을 확인해 본다.
</div>

<div id="functionArea">
	<form name="frm">
		부서 : 
		<select id="deptno"><option value="">전체부서</option>
			${DEPT_OPTION}
		</select>
 	</form>
</div>
<div id="buttonArea">

<button type="button" onclick="doAction('search')">조회</button>
</div>
<!-- ibsheet 객체 -->
<div class="ib_product" id="chart_div"></div>
</body>
</html>
<%@page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-doctype-taglib.jspf"%><%--doctype과 taglib 정의 --%>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-javascript-css.jspf"%><%--javascript과 css 정의 --%>
	<%@ include file="/WEB-INF/jsp/ibsheet_template/common/jsp/common-ibsheetibchart.jspf"%><%--ibsheet ibchart 정의 --%>
	<script>
		
		$(document).ready(function(){
			//ibchart 객체 생성  ( 차트가 위치할 element  , 차트 이름 ,   { 너비     ,   높이}           )
			createIBChart("ib_product", "myChart", {width:"100%",height:"450px"});
			
			
			var prop ={
				    "chart": {
				        "zoomType": "x",
				        "type": "column"
				    },
				    "title": {
				        "text": "막대 차트",
				        "align": "center",
				        "verticalAlign": "top"
				    },
				    "legend": {
				        "enabled": true,
				        "layout": "horizontal",
				        "align": "center",
				        "verticalAlign": "bottom",
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
				            "align": "center",
				            "rotation": 45
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
				        },{
				            "opposite": true,
				            "title": {
				                "text": "Second Y축"
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
				        }
				    }
				};
			myChart.setOptions(prop,{append:1});
			myChart.setEvents({
				searchEnd: function(event) {
				
					
					myChart.series(2).setOptions({
						name : "대형차",
						color : "#FF5674",
						yAxis:1
					}, {
						append: true
					});
					myChart.series(3).setOptions({
						name : "초대형차",
						color : "#c9a9c3",
						yAxis:1
					}, {
						append: true
					});
					
					myChart.draw();
				}
			});
			myChart.draw();		
		});


		function doAction(str){
			switch(str){
				case "search":
					myChart.setOptions({
					    "chart": {
					        "zoomType": "x",
					        "type":  document.frm.charttype.value
					    },
					    "title": {
					        "text": document.frm.charttype[document.frm.charttype.selectedIndex].text,
					        "align": "center",
					        "verticalAlign": "top"
					    }
					},{append:true});
					//9-2. URL로 부터 가져오기	
					var param = {url:"<c:url value='/chart/basic/chartDataSearch2.do'/>"
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
	여러개 시리즈를 사용하는 차트 
</div>
<div id="desc">
전자정부 표준 프레임워크에서 차트 데이터  조회 작업을 확인해 본다.
</div>

<div id="functionArea">
	<form name="frm">
		차트 종류 : <select id="charttype">
			<option value="column">막대</option>
			<option value="bar">누운막대</option>
			<option value="line">꺽은선</option>
			<option value="spline">부드러운꺽은선</option>
		</select>
 	</form>
</div>
<div id="buttonArea">

<button type="button" onclick="doAction('search')">조회</button>
</div>
<!-- ibchart 객체 -->
<div class="ib_product" id="ib_product"></div>
</body>
</html>
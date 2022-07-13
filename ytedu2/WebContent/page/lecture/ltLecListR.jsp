<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<!--
file name : ltLecListR.jsp
title     : 교육메인(유저)
date      : 2012/05/04
author    : Kim.S.D
revisions : 2012/05/09 – 최종작성 (revised by Kim.S.D)
-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/ytcares-calendar.css" />
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/ytcares-calendar.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>
<script type="text/javascript">
var cnt= 0;
var seq_no = new Array();
var title = new Array();
var st_date = new Array();
var ed_date = new Array();
var loc = new Array();
var time = new Array();
var host = new Array();
var stat = new Array();

var lecData = new Array();

var cal = null;
$(document).ready(function(){
	//화면초기화
	cmYTCaresInit();
	
	cnt = document.cal.cnt.value;

	for(var i = 0; i<cnt; i++){
		if(cnt == 1){
			seq_no[i] = document.cal.seq_no.value;
			title[i] = document.cal.title.value;
			st_date[i] = document.cal.st_date.value;
			ed_date[i] = document.cal.ed_date.value;
			loc[i] = document.cal.loc.value;
			time[i] = document.cal.time.value;
			host[i] = document.cal.host.value;
			stat[i] = document.cal.stat.value;
		}else{
			seq_no[i] = document.cal.seq_no[i].value;
			title[i] = document.cal.title[i].value;
			st_date[i] = document.cal.st_date[i].value;
			ed_date[i] = document.cal.ed_date[i].value;
			loc[i] = document.cal.loc[i].value;
			time[i] = document.cal.time[i].value;
			host[i] = document.cal.host[i].value;
			stat[i] = document.cal.stat[i].value;
		}

		//타이틀, 데이터타입, 시작날짜, 끝날짜, 그외 내용
		lecData[i] = new BsCalData("<spring:message code='lbl.lec.name' text='교육명'/>:"+title[i], 3, st_date[i], ed_date[i], "<spring:message code='lbl.lec.place' text='장소'/>:"+loc[i]+'\n'+"<spring:message code='lbl.lec.time' text='교육시간 '/>"+time[i], seq_no[i]);
	}
	
	//사용자 지정옵션 달력
	cal = new BsCalendar('lecCal', {
			width:197,
			height:167,
			calHeadType:2,
			calData:lecData,
			//년월변경전 체크함수 true, false 리턴
			onChangeValid:function(year, month) {return true;},
			//날짜변경시 실행함수
			onYearChanged:function(year, month, cal){
				/* 년도 변경시 실행함수 내용  혹은 js 함수명*/
				checkCount(year, month, cal);
				},
			//월변경시 실행함수
			onMonthChanged:function(year, month, cal){
				/* 월 변경시 실행함수 내용 작성 혹은 js 함수명*/
				checkCount(year, month, cal);
				},
			//날짜클릭시 실행함수
			onDateClicked:function(dateStr, cal, td) {
				if(cal.isCalData(dateStr)) {
					var calData = cal.getCalData(dateStr);
					if (calData && calData.length != 0) {
						var userdata = calData[0].userdata;
						if (userdata != null && userdata != undefined && userdata != '') {
							location.href = '/LtLectureService/userSelectLecInfo.do?lec_seq_no=' + userdata;
						}
					}
				}
				
			}
		});
	//달력표시
	cal.showCal();
	//달력데이터표시
	cal.showCalData();
	//초기 화면 테이블 표시
	firstTable();
});
function strToDate(date, delim){
	if (date == null || date == undefined) return null;
	if (delim == null || delim == undefined) {
		delim = '.';
	}
	if (typeof date == 'string') {
		if(date.match(/^[0-9]{4}[^0-9][0-9]{2}[^0-9][0-9]{2}$/)) {
			date = date.replace(/[^0-9]/gi, delim);
			return date;
		} else if (date.match(/^[0-9]{2}[^0-9][0-9]{2}[^0-9][0-9]{4}$/)) {
			date = date.replace(/[^0-9]/gi, delim);
			date = date.split(delim);
			return date[2] + delim + date[0] + delim + date[1];
		} else if (date.match(/^[0-9]{8}$/)) {
			var yy = parseInt(date.substr(0,4), 10);
			var mm = parseInt(date.substr(4,2), 10);
			var dd = parseInt(date.substr(6,2), 10);
			return yy + delim + ((mm < 10)?'0':'') + mm + delim + ((dd < 10)?'0':'') + dd;
		} else {
			return null;
		}
	} else if (date instanceof Date) {
		var yy = date.getFullYear();
		var mm = date.getMonth() + 1;
		var dd = date.getDate();
		return yy + delim + ((mm < 10)?'0':'') + mm + delim + ((dd < 10)?'0':'') + dd;
	}
	return null;
}
function checkCount(year, month, cal){
	//cal.calStart 로 달력이 표시시작일
	//cal.calEnd로 달력의 표시종료일을 취득할 수 있음.
	$('#ajaxTest').html('');
	
	if(month<10){
		month = "0"+month;
	}
	//ajax실행
	$.ajax({
		//ajax실행 uri 필수,uri동일
		url: '${ctxPath}/YTCaresAjax.do',
		//비동기여부
		asynch:false,
		//캐시여부
		cache:false,
		//응답의 데이터타입 json
		dataType: 'json',
		//http요청방식
		type:'POST',
		//요청파라미터
		data:{
			queryId:'lecture.selectLecList',
			defaultTime:year+""+month,
			start:cal.calStart,
			end:cal.calEnd
		},
		//ajax요청성공시의 처리 내용
		success: function(json){
			var num = json.length;
			var html = new Array();
			html[html.length] = "<table class='board-list' width='100%' border='0' align='center' cellpadding='0' cellspacing='0' style='border-bottom:2px solid; border-bottom-color: #02A6F9;'>";
			if(num == 0){
				html[html.length] = '<tr height="260">';
				html[html.length] = '<td colspan="6" align="center">';
				html[html.length] = '<spring:message code='lbl.search.result.zero.lec.info' text='교육 정보가 없습니다.'/>';
				html[html.length] = '</td>';
				html[html.length] = '</tr>';
				html[html.length] = '</table>';
				
				$('#ajaxTest').html(html.join(''));
			}
			else{
				for (var i=0; i<num;i++) {
					//html[html.length] = '<tr>';
					if(num == 1){
						html[html.length] = '<tr style="cursor:pointer;" onclick="javascript:location.href=\'/LtLectureService/userSelectLecInfo.do?lec_seq_no='+document.cal.seq_no.value+'\';">';
					}else{
						html[html.length] = '<tr style="cursor:pointer;" onclick="javascript:location.href=\'/LtLectureService/userSelectLecInfo.do?lec_seq_no='+document.cal.seq_no[i].value+'\';">';
					}
					
					html[html.length] = "<td width='63' align='center'>";
					if(num == 1){
						html[html.length] = num;
					}else{
						html[html.length] = num-i;
					}
					html[html.length] = '</td>';
					html[html.length] = "<td width='214' align='left'>";
					html[html.length] = json[i].lec_title;
					html[html.length] = '</td>';
					html[html.length] = "<td width='205' align='center'>";
					//yyyy.MM.dd형태로 포맷
					html[html.length] = strToDate(json[i].lec_st_date)+"~"+strToDate(json[i].lec_ed_date);
					html[html.length] = '</td>';
					html[html.length] = "<td width='184' align='left'>";
					html[html.length] = json[i].lec_loc;
					html[html.length] = '</td>';
					html[html.length] = "<td width='105' align='left' align='center'>";
					html[html.length] = json[i].lec_host;
					html[html.length] = '</td>';
					html[html.length] = "<td width='114' align='center'>";
					//html[html.length] = "<a href='/LtLectureService/userSelectLecInfo.do?lec_seq_no="+json[i].lec_seq_no+"'>";
					if(json[i].lec_stat_cd == 1){
						html[html.length] = "<img src='<spring:message code='img.lecture.status.ok'/>'>";
					}else{
						html[html.length] = "<img src='<spring:message code='img.lecture.status.ng'/>'>";
					}
					//html[html.length] = "</a>";
					html[html.length] = '</td>';
					html[html.length] = "<td width = '15'>";
					html[html.length] = '</td>';
					html[html.length] = '</tr>';
					//오류수정
					lecData[i] = new BsCalData("<spring:message code='lbl.lec.name' text='교육명'/>:"+json[i].lec_title, 3, json[i].lec_st_date, json[i].lec_ed_date, "<spring:message code='lbl.lec.place' text='장소'/>:"+json[i].lec_loc+'\n'+"<spring:message code='lbl.lec.time' text='교육시간 '/>"+json[i].lec_time, json[i].lec_seq_no);
				}
				if(num < 10){
					for (var j=0; j<10-num;j++){
						html[html.length] = '<tr height="28">';
						html[html.length] = '<td colspan="6" align="center">';
						html[html.length] = '&nbsp;';
						html[html.length] = '</td>';
						html[html.length] = '</tr>';
					}
				}
				html[html.length] = '</table>';
				
				//새로운 데이터로 redraw
				cal.redraw({calData:lecData});
				
				$('#ajaxTest').html(html.join(''));
				cmYTCaresInit();
			}
		},
		//ajax요청실패시의 처리 내용
		error:function(jqXHR, textStatus, err) {
			return false;
		}
	});
	return true;
}

function goReq(){
	var f = document.frm;
	f.action = "/LtLectureService/userSelectLectureReq.do";
	f.submit();
}
</script>
</head>
<body>
<form name="cal">
<input type="hidden" name="cnt" value="${count}"/>
<c:forEach var="lecList" items="${LectureList}">
	<input type="hidden" name="seq_no" value="${lecList.lec_seq_no}"/>
	<input type="hidden" name="title" value="${lecList.lec_title}"/>
	<input type="hidden" name="st_date" value="${lecList.lec_st_date}"/>
	<input type="hidden" name="ed_date" value="${lecList.lec_ed_date}"/>
	<input type="hidden" name="loc" value="${lecList.lec_loc}"/>
	<input type="hidden" name="time" value="${lecList.lec_time}"/>
	<input type="hidden" name="host" value="${lecList.lec_host}"/>
	<input type="hidden" name="stat" value="${lecList.lec_stat_cd}"/>
</c:forEach>
</form>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<form name="frm" method="post">
<!-- main content -->
<img src='<spring:message code="img.lecture.bg" text="상단이미지"/>'/>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
<tr valign="top">
	<td width="200" style="padding-top: 12px" valign="top">
		<div id="lecCal"></div>
	</td>
	<td width="700">
		<table style="width:700px;" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="700" align="left"><img src="<spring:message code='img.lecture.warning'/>"></td>
			</tr>
		</table>
	</td>
</tr>
</table>
<table class="ytcares-content" width="900" cellpadding="0" cellspacing="0" border="0" align="center">
<tr>
	<td width="100%" align="center" valign="top">
		<table class="header-lecture" style="margin-top:3px;" border='0' align='center' cellpadding='0' cellspacing='0'>
			<tr>
				<td width='63'><spring:message code="lbl.num" text="번호"/></td>
				<td width='214'><spring:message code="lbl.lec.name" text="교육명"/></td>
				<td width='205'><spring:message code="lbl.lec.date" text="교육일시"/></td>
				<td width='184'><spring:message code="lbl.lec.place" text="교육장소"/></td>
				<td width='105'><spring:message code="lbl.lec.agent" text="교육주체"/></td>
				<td width='114'><spring:message code="lbl.app.status" text="신청상태"/></td>
				<td width="15"></td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td>
		<div id="ajaxTest" style="margin-top:1px;width:100%;max-height:285px;overflow-y:scroll;overflow-x:hidden"></div>
	</td>
</tr>
<tr>
	<td align="right" colspan="2"><img src='<spring:message code="img.lecture.request" text="교육요청"/>' onclick="goReq()" style="padding-top: 20px;cursor: pointer;"/> </td>
</tr>
</table>
<!-- main content end -->
</form>
<!-- 하단메뉴 -->
<jsp:include page="/page/common/cmSiteBottom_f.jsp" />
<!-- 공통메세지처리 -->
<ytcares:msg/>
</body>
<script type="text/javascript">
function firstTable(){
	var str = "<table class='board-list' width='100%' border='0' align='center' cellpadding='0' cellspacing='0' style='border-bottom:1px solid; border-bottom-color: #f6f6f6;'>";
	if(cnt.value == 0){
		str += '<tr height="260">';
		str += '<td colspan="6" align="center">';
		str += "<spring:message code='lbl.search.result.zero.lec.info' text='교육 정보가 없습니다.'/>";
		str += '</td>';
		str += '</tr>';
		str += '</table>';
	}else{
		for(var i = 0; i<cnt; i++){
			if(cnt == 1){
				str += '<tr style="cursor:pointer;" onclick="javascript:location.href=\'/LtLectureService/userSelectLecInfo.do?lec_seq_no='+document.cal.seq_no.value+'\';">';
			}else{
				str += '<tr style="cursor:pointer;" onclick="javascript:location.href=\'/LtLectureService/userSelectLecInfo.do?lec_seq_no='+document.cal.seq_no[i].value+'\';">';
			}
			str += "<td width='63' align='center'>";
			str += cnt-i;
			str += '</td>';
			str += "<td width='214' align='left'>";
			if(cnt == 1){
				str += document.cal.title.value;
			}else{
				str += document.cal.title[i].value;
			}
			str += '</td>';
			str += "<td width='205' align='center'>";
			//날짜포맷추가
			if(cnt == 1){
				str += strToDate(document.cal.st_date.value) + "~" + strToDate(document.cal.ed_date.value);
			}else{
				str += strToDate(document.cal.st_date[i].value) + "~" + strToDate(document.cal.ed_date[i].value);
			}
			str += '</td>';
			str += "<td width='184' align='left'>";
			if(cnt == 1){
				str += document.cal.loc.value;
			}else{
				str += document.cal.loc[i].value;
			}
			str += '</td>';
			str += "<td width='105' align='center'>";
			if(cnt == 1){
				str += document.cal.host.value;
			}else{
				str += document.cal.host[i].value;
			}
			str += '</td>';
			str += "<td width='114' align='center'>";
			//str += "<a href='/LtLectureService/userSelectLecInfo.do?lec_seq_no="+document.cal.seq_no[i].value+"'>";
			if(cnt == 1){
				if(document.cal.stat.value == 1){
					str += "<img src='<spring:message code='img.lecture.status.ok'/>'>";
				}else{
					str += "<img src='<spring:message code='img.lecture.status.ng'/>'>";
				}
			}else{
				if(document.cal.stat[i].value == 1){
					str += "<img src='<spring:message code='img.lecture.status.ok'/>'>";
				}else{
					str += "<img src='<spring:message code='img.lecture.status.ng'/>'>";
				}
			}
			//str += "</a>";
			str += '</td>';
			str += "<td width='15'>";
			str += '</td>';
			str += '</tr>';
		}
		if(cnt < 10){
			for(var j= 0; j<10-cnt;j++){
				str += '<tr height="28">';
				str += '<td colspan="6" align="center">&nbsp;</td>';
				str += '</tr>';
			}
		}
		str += '</table>';
		document.getElementById('ajaxTest').innerHTML = str;

		cmYTCaresInit();
	}
}
</script>
</html>
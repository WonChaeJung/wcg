<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt"		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<link href="/css/ytcares-calendar.css" rel="stylesheet" type="text/css"/>
<style type="text/css"> 
	table.main-board>tbody>tr>td {font-family:"verdana", "tahoma"; font-size:12px; color: #797979;}
</style>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/commonUtil.js"></script>
<script type="text/javascript" src="/js/ytcares-calendar.js"></script>
<script type="text/javascript">
var cal = null;
$(document).ready(function(){
	cal = new BsCalendar('lecCal', {
		width:198,
		height:151,
		calHeadType:2,
		onYearChanged:function(year, month, cal){checkCount(year, month, cal);
			},
		onMonthChanged:function(year, month, cal){checkCount(year, month, cal);},
		onDateClicked:function(dateStr, cal, td){
			if(cal.isCalData(dateStr)) {
				var calData = cal.getCalData(dateStr);
				if (calData && calData.length != 0) {
					var userdata = calData[0].userdata;
					if (userdata != null && userdata != undefined && userdata != '') {
						//메인화면에서는 data속성에 reqURI를 넣어서 사용함
						if ('${loggedUserId}' != '') {
							location.href = userdata;
						} else {
							alert("<spring:message code='error.require.login' text='로그인해주세요.'/>");
							document.loginform.user_id.focus();
							return;
						}
					}
				}
			}
		}
	}).showCal();
	var date = new Date();
	checkCount(date.getFullYear(), date.getMonth()+1, cal);
});

function checkCount(year, month, cal){
	
	if(month<10){
		month = "0"+month;
	}

	var lecData = new Array();
	//ajax실행
	$.ajax({
		//ajax실행 uri 필수,uri동일
		url: '${ctxPath}/YTCaresAjax.do',
		//비동기여부
		asynch:true,
		//캐시여부
		cache:false,
		//응답의 데이터타입 json
		dataType: 'json',
		//http요청방식
		type:'POST',
		//요청파라미터
		data:{
			queryId:'lecture.selectMainLectureList',
			defaultTime:year+""+month
		},
		//ajax요청성공시의 처리 내용
		success: function(json){
			var num = json.length;
			if(num > 0){
				for (var i=0; i<num;i++) {
					lecData[i] = new BsCalData(json[i].lec_title, 3, json[i].lec_st_date, json[i].lec_ed_date, json[i].lec_loc+'\n'+json[i].lec_time, '/LtLectureService/userSelectLecInfo.do?lec_seq_no='+json[i].lec_seq_no);
				}
				//새로운 데이터로 redraw
				cal.redraw({calData:lecData});
			}
		},
		//ajax요청실패시의 처리 내용
		error:function(jqXHR, textStatus, err) {
			cal.redraw();
			return false;
		}
	});
	return true;
}

function loginUser(){
	var loginform = document.loginform;
	if(loginform.user_id.value == ""){
		alert('<spring:message code="error.require.id" text="" javaScriptEscape="true"/>');
		loginform.user_id.focus();
		return false;
	}
	if(loginform.user_pass.value == ""){
		alert('<spring:message code="error.require.pw" text="" javaScriptEscape="true"/>');
		loginform.user_pass.focus();
		return false;
	}
	loginform.submit();
}
function loginOnKeydown() {
	var keyCode=(window.netscape)?e.which:event.keyCode;
	if (keyCode == 13) {
		loginUser();
	}
}
function joinUser() {
	location.href = '/CmUserService/callUserJoin.do';
}
function searchIdPss() {
	location.href = '/CmUserService/callSrchIdpw.do';
}
function setRoomTitle(RoomTitle) {
	var win = cmOpenPopup('', 'YTCaresLSS', 800, 600, 'yes');
	var $f = $('form[name="lssLaunchForm"]:first');
	$f.find(':hidden[name=RoomTitle]:first').val(RoomTitle);
	$f.find(':hidden[name=RoomTitle]:gt(0)').remove();
	$f.prop('action', '/CmUserService/userLaunchLss.do');
	$f.prop('target', 'YTCaresLSS');
	$f.submit();
}

function launchLSS() {
	var $f = $('form[name="lssLaunchForm"]:first');
	var win = cmOpenPopup('', 'YTCaresLSS', 800, 600, 'yes');
	$f.prop('action', '/CmUserService/userLaunchLss.do');
	$f.prop('target', 'YTCaresLSS');

	$f.submit();
}

function lssRoomPopup(){
	//LSS 방제목 표시
	var win = cmOpenPopup('', 'lssRoomChoice', 300, 200, 'no');
	var $f = $('form[name="lssLaunchForm"]:first');
	$f.prop('action', '/CmUserService/userLssRoomChoice.do');
	$f.prop('target', 'lssRoomChoice');

	$f.submit();
}


</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<c:if test="${!empty lssRoomTitle}">
<form name="lssLaunchForm" action="/CmUserService/userLauchLss.do" method="post">
<input type="hidden" name="UserName"	value="${loggedUserAgency}">
<input type="hidden" name="Dept"		value="YTCares">
<input type="hidden" name="Position"	value="Student">
<input type="hidden" name="userlevel"	value="2">
<c:forEach var="title" items="${lssRoomTitle}">
<input type="hidden" name="RoomTitle"	value="${title}">
</c:forEach>
</form>
</c:if>
<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
	<!------------ main banner s ----------->
	<tr>
		<td style="padding-top: 10px;">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
						<embed src="/images/main.swf" width="900" height="300">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<!------------ main banner e ----------->
	<tr>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<!------------ main left s ----------->
					<td width="230" style="padding-top: 10px;padding-left: 7px;">
						<table cellpadding="0" cellspacing="0" border="0">
							<tr valign="top">
								<td>
									<!------------ event zone s ----------->
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td><img src="/images/main_event.gif" width="230" height="22"></td>
										</tr>
										<tr>
											<td align="center"><img src='<spring:message code="img.main.event.img" text="이벤트존이미지"/>'></td>
										</tr>
									</table>
									<!------------ event zone e ----------->
								</td>
							</tr>
							<!------------ call center s ----------->
							<tr>
								<td style="padding-top: 5px;"><img src='<spring:message code="img.main.call.center" text="콜센터"/>'></td>
							</tr>
							<!------------ call center e ----------->
							<!------------ elearning & lss s ----------->
							<tr>
								<td align="center">
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td style="padding-top: 5px;"><a href="/ElElearnService/selectMovList.do"><img src='<spring:message code="img.main.el.view" text="동영상보기"/>'></a></td>
										</tr>
										<tr>
											<td style="padding-top: 5px;">
												<img src='<spring:message code="img.main.lss" text="LSS"/>'/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<!------------ elearning & lss e ----------->
						</table>
					</td>
					<!------------ main left e ----------->
					<!------------ main center s ----------->
					<td width="423" style="padding-top: 10px;padding-left: 15px;" >
						<table width="423" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" border="0" background='<spring:message code="img.main.notice" text="공지사항"/>' width="423" height="23">
										<tr>
											<td align="right" style="padding-right: 30px;"><a href="/BdBoardService/selectBoardList.do?category=01&sub_category=01"><spring:message code="lbl.more" text="more"/></a></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr height="109">
								<td>
									<table class="main-board" width="100%" cellpadding="0" cellspacing="0" border="0" style="table-layout: fixed;">
										<c:choose>
										<c:when test="${empty noticeList}">
											<tr valign="middle" class="gray">
												<td colspan="3"><spring:message code="lbl.undefind.data" text="데이터가 존재하지 않습니다."/></td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="notice" items="${noticeList}">
												<tr>
													<td width="330" align="left" style="vertical-align:middle;" title="${notice.title}">
														<div style="float:left;max-width:315px;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;">
															<img src="/images/main_latest_dot.gif" border="0" style="vertical-align:baseline;"><a href="/BdBoardService/updateReadCount.do?&category=${notice.category}&sub_category=${notice.sub_category}&seq_no=${notice.seq_no}" class="gray">${notice.title}</a>
														</div>
														<div style="float:left;">
															<c:if test="${(today.time - notice.reg_date.time)/(24*60*60*1000) le 3}">
															&nbsp;<img src="<spring:message code='img.new'/>" style="vertical-align:baseline;"/>
															</c:if>
														</div>	
													</td>
									
													<td width="93" align="right"><fmt:formatDate value="${notice.reg_date}" type="date" pattern="yyyy.MM.dd"/></td>
												</tr>
											</c:forEach>
											<c:if test="${fn:length(noticeList) < 5}">
												<c:forEach var="i" begin="1" end="${5 - fn:length(noticeList)}">
													<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
												</c:forEach>
											</c:if>
										</c:otherwise>	
										</c:choose>
									</table>
								</td>
							</tr>
						</table>
						<table width="423" cellpadding="0" cellspacing="0" border="0">
							<tr valign="top">
								<td style="padding-top: 5px;">
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td colspan="3">
												<img src="/images/main_eshop.gif">
											</td>
										</tr>
										<tr><td colspan="3"><img src="/images/main_eshop_top_line.jpg"></td></tr>
										<tr valign="top">
											<td><img src="/images/main_eshop_center_line.gif"></td>
											<td width="423">
												<c:forEach var="csmt" items="${csmtList}">
													<li style="display:inline;float:left;padding-left: 0;"> 
													<table class="main-board" width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;">
														<tr>
															<td width="119" align="center" style="padding-left: 15px;">
																<a href="/EsCsmtService/selectCsmtInfo.do?csmt_id=${csmt.CSMT_ID}"><img src="/ytcares/eshop/${csmt.CSMT_IMG}" title="${csmt.CSMT_NAME}" width="119" height="83" border="0"/></a>
															</td>
														</tr>
														<tr height="14px;"><td></td></tr>
														<tr valign="middle" >
															<td align="center" title="${csmt.CSMT_NAME}" valign="middle">
															<div style="width:100px;">
															     <div style="float:left;max-width:85px;overflow: hidden;text-overflow: ellipsis;white-space:nowrap;">
															         <nobr>${csmt.CSMT_NAME}</nobr>
															     </div>
															     <div style="float:left;width:10px;margin-top:5px;margin-left:5px;">
															         <c:if test="${(today.time - csmt.CSMT_REG_YMD.time)/(24*60*60*1000)<=3}">
															             <img src="<spring:message code='img.new' />">
															         </c:if>
															     </div>
															</div>
															</td>
														</tr>
													</table>
													</li>
												</c:forEach>
											</td>
											<td><img src="/images/main_eshop_center_line.gif"></td>
										</tr>
										<tr><td colspan="3"><img src="/images/main_eshop_bot_line.gif"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<!------------ main center e ----------->
					<!------------ main right s ----------->
					<td width="210" style="padding-top: 10px;padding-left: 15px;">
						<table width="210" height="325" cellpadding="0" cellspacing="0" border="0" background="/images/main_right_line.jpg">
							<tr height="145" valign="top">
								<td width="193" align="center" style="padding-top: 6px;">
									<form name="loginform" method="post" action="/CmUserService/login.do">
									<table width="198" height="90" border="0" cellpadding="0" cellspacing="0" background="/images/main_login_back.gif">
										<c:choose>
											<c:when test="${empty loggedUserId}">
											<tr height="60">
												<td>
													<table width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td height="20" align="center">
																<input id="user_id" type="text" name="user_id" value="" maxlength="12" size="12" onkeydown="loginOnKeydown()" style="width:97px;border:1px solid;border-color: #D8D8D8"/>
															</td>
														</tr>
														<tr>
															<td height="20" style="padding-top: 5px;" align="center">
																<input id="user_pass" type="password" name="user_pass" value="" maxlength="16" size="12" onkeydown="loginOnKeydown()" style="width:97px;border:1px solid;border-color: #D8D8D8"/>
															</td>
														</tr>
													</table>
												</td>
												<td onclick="loginUser()"><img src='<spring:message code="img.main.login.btn" text="로그인"/>' style="cursor: pointer;"></td>
											</tr>
											<tr>
												<td colspan="2" align="center" >
													<table width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td onclick="joinUser()" style="padding-left: 5px;">
																<img src='<spring:message code="img.main.join.btn" text="회원가입"/>' width="70" style="cursor: pointer;">
															</td>
															<td onclick="searchIdPss()">
																<img src='<spring:message code="img.main.find.btn" text="아이디/비번찾기"/>' width="90" style="cursor: pointer;">
															</td>
														</tr>
													</table>
												</td>
											</tr>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${loggedUserGrade eq ytcaresAdmin}">
														<tr valign="middle">
															<td width="210" align="center" colspan="2"> 
																${sessionScope['com.ytcares.user.bean'].user_id}<spring:message code='lbl.mode' text='모드입니다.'/>
															</td>
														</tr>
														<tr>
															<td><a href="/AdLectureService/adminSelectLecList.do?admin_menu=0"><img src='<spring:message code="img.main.mypage.btn" text="마이페이지"/>'/></a></td>
															<td><a href="/CmUserService/logout.do"><img src='<spring:message code="img.main.logout.btn" text="로그아웃"/>'/></a></td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<td width="210" align="center" colspan="2">
																<spring:message code='lbl.welcome' text='안녕하십니까'/> ${sessionScope['com.ytcares.user.bean'].user_name}<spring:message code='lbl.nim' text='님'/><br>
																<div id="lssLink">
																<c:if test="${!empty lssRoomTitle}">
																	<c:choose>
																	<c:when test="${fn:length(lssRoomTitle) eq 1}">
																		<input type="button" value="LSS" onclick="launchLSS();"/>
																	</c:when>
																	<c:otherwise>
																		<input type="button" value="LSS" onclick="lssRoomPopup();"/>
																	</c:otherwise>
																	</c:choose>
																</c:if>
																</div>
															</td>
														</tr>
														<tr>
															<td onclick="submitChk('callMyInfo')" style="cursor: pointer;"><img src='<spring:message code="img.main.mypage.btn" text="마이페이지"/>'/></td>
															<td><a href="/CmUserService/logout.do"><img src='<spring:message code="img.main.logout.btn" text="로그아웃"/>'/></a></td>
														</tr>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</table>
									</form>
								</td>
							</tr>
							<tr height="23"><td><img src='<spring:message code="img.main.cal" text="교육일정"/>' width="198px;"></td></tr>
							<tr>
								<td style="padding-left: 6px;" valign="top">
									<div id="lecCal" style="margin:0px;width:198px;"></div>
								</td>
							</tr>
						</table>
					</td>
					<!------------ main right e ----------->
				</tr>
			</table>
		</td>
	</tr>
</table>
	
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
<c:if test="${!empty lssRoomTitle}">
<script>
if ('${fn:length(lssRoomTitle)}' == 1) {
	if (confirm("<spring:message code='confirm.lss.move.user' text='LSS화상교육대상자입니다. 지금이동하시겠습니까?'/>")) {
		//직접호출
		launchLSS();
	}
} else {
	lssRoomPopup();
}
</script>
</c:if>
</body>
</html>
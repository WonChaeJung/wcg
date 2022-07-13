<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="form"		uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<title></title>
<script src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
function ajaxTest() {
	//div태그내의 html제거
	$('#ajaxTest').html('');

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
			queryId:'board.selectBoardList',
			category:'01',
			sub_category:'01',
			start:1,
			end:10
		},
		//ajax요청성공시의 처리 내용
		success: function(json){
			if (json.length == 0) {
				alert('result is zero');
			} else {
				var html = new Array();
				html[html.length] = '<table border="1">';
				for (var i = 0; i < json.length;i++) {
					html[html.length] = '<tr>';
					for (var key in json[i]) {
						html[html.length] = '<td>';
						html[html.length] = json[i][key];
						html[html.length] = '</td>';
					}
					html[html.length] = '</tr>';
				}
				html[html.length] = '</table>';
	
				$('#ajaxTest').html(html.join(''));
			}
		},
		//ajax요청실패시의 처리 내용
		error:function(jqXHR, textStatus, err) {
			return false;
		}
	});
}

function joinUser() {
	var f = document.join;
	f.target = '_self';
	f.submit();
}

function checkDupUserId() {
	var f = document.join;
	
	if (f.user_id.value == '' || f.user_id.value == null || f.user_id.value == undefined) {
		alert('아이디를 입력하세요.');
		return;
	} else {
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
				queryId:'user.selectUserInfoAjax',
				user_id:f.user_id.value
			},
			//ajax요청성공시의 처리 내용
			success: function(json){
				if (json.length == 0) {
					alert('사용가능한 아이디 입니다.');
				} else {
					alert('사용가능한 아이디가 아닙니다.');
				}
			},
			//ajax요청실패시의 처리 내용
			error:function(jqXHR, textStatus, err) {
				return false;
			}
		});
	}
}
</script>
</head>
<body>

<jsp:useBean id="userBean" class="com.ytcares.bean.TUserBean" scope="request"/>

<form:form commandName="userBean" name="join" method="post" action="/TestService/joinUser.do">
아이디:	<form:input path="user_id"/><br/>
패스워드:<form:input path="user_pass"/><br/>
이름:	<form:input path="user_name"/><br/>
가맹점명:<form:input path="agency_name"/><br/>
추천인:<form:input path="rcmmd_id"/><br/>
계층아이디:<form:input path="family_id"/><br/>
휴대폰:<form:input path="cell_phone"/><br/>
전화:<form:input path="phone"/><br/>
이메일:<form:input path="email"/><br/>
우편번호:<form:input path="zipcode"/><br/>
주소:<form:input path="addr"/><br/>
등급:<form:input path="grade"/><br/>

</form:form>

<input type="button" onclick="checkDupUserId()" value="아이디중복체크"/>
<input type="button" onclick="joinUser()" value="서브밋"/>

<ytcares:msg/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/test1.css" rel="stylesheet" type="text/css" />
<script src="/js/commonUtil.js"></script>
<Script type="text/javascript">
function isIE9()
{
	var agent = window.navigator.userAgent;
	if(agent.indexOf("MSIE 9.0")!= -1){
		alert("true");
		return true;
	}else alert("false");return false;
	
}
function chk(){
	alert("test");
	var obj=document.frm.text1.value;
	isHangul(obj);
}
function isHangul(s)
{
	var len;
	len = s.length;
	for (var i = 0; i < len; i++)  {
		if (s.charCodeAt(i) != 32 && (s.charCodeAt(i) < 44032 || s.charCodeAt(i) > 55203))
			alert("len :"+len);
		return false;
	}
	return false;
}

function winOpenAtCenter(sURL, sWindowName, w, h, sScroll) {
	  // 화면 중앙으로 Popup 띄우기.. 스크롤바는 옵션..
	  // ex)
	  //openWin("test.asp", "winTest", 400, 300);     ☞ 스크롤바 없음
	  //openWin("test.asp", "winTest", 400, 300, "yes");  ☞ 스크롤바 있음
	  //openWin("test.asp", "winTest", 400, 300, "auto"); ☞ 스크롤바 자동
	  var x = (screen.width - w) / 2;
	  var y = (screen.height - h) / 2;
	  if (sScroll==null) sScroll = "no";
	  var sOption = "";
	  sOption = sOption + "toolbar=no, channelmode=no, location=no, directories=no, resizable=no, menubar=no";
	  sOption = sOption + ", scrollbars=" + sScroll + ", left=" + x + ", top=" + y + ", width=" + w + ", height=" + h;

	  var win = window.open(sURL, sWindowName, sOption);
	  return win;
}
function winOpenAtCenter2(sURL, sWindowName, w, h, sScroll) {
	var win2 = winOpenAtCenter(sURL, sWindowName, w, h, sScroll);
};
function window_resize(winWidth, winHeight) {
	// 스크롤 없애기
	document.body.style.overflow='hidden';
	var foxHeight = 80;
	var ieHeight  = 60;
	var ie7Height = 80;
	var ie8Height = 90;
	if (navigator.userAgent.indexOf("MSIE")!=-1)	// IE 일 경우
	{
		var res = isIE7();
		if( isIE7() ) {	window.resizeTo(winWidth, winHeight + ie7Height); }
		else if( isIE8() ) { window.resizeTo(winWidth, winHeight + ie8Height); }
		else { window.resizeTo(winWidth, winHeight + ieHeight); }
	}
	else{
		window.resizeTo(winWidth, winHeight + foxHeight);
	}
}
function chkval(){

	var userId = document.frm.userId;
	var userNm = document.frm.userNm;
	var userPW = document.frm.passwd;
	var userEM = "";
	var email1 = document.frm.email1.value;
	var email2 = document.frm.email2.value;
	if(!cmIdValChk(userId)){
		userId.focus();
		return false;
	}
	if(!cmNameValChk(userNm)){
		userNm.focus();
		return false;
	}
	if(!cmPassWdValChk(userPW)){
		userPW.focus();
		return false;
	}
	if(email1 != "" && email2 !=""){
		userEM = email1+"@"+email2;
		alert("userEM :"+userEM);
	}else{
		alert("이메일을 제대로 입력해 주십시오.");
		return false;
	}
	if(!cmEmailValChk(userEM)){
		userEM.focus();
		return false;
	}
	document.frm.submit();
}

function testcmChkXPSP2(){
	alert(cmChkXPSP2());
}
function testcmChkIE7(){
	var agent = window.navigator.userAgent;
	alert("agent : "+agent+"\n"+"cmChkIE7 :"+cmChkIE7());
}
function testcmChkIE8(){
	alert(cmChkIE8());
}
function testcmChkIE(){
	alert(cmChkIE());
}

// 데이터체크를 위한 함수 테스트
function aaa(){

	var testStr = document.frm.byteTest.value;
	
	//alert(testStr.charCodeAt());
	//alert(String.fromCharCode(44032));
	//alert(escape(testStr));
	//alert(escape(testStr).indexOf("%u"));
	alert(cmAL32Len(testStr));
}
function cmAL32Len(str){
	var ch, size = 0;
	for (x = 0; x<str.length; x++){
		ch = str.charCodeAt(x);
		if(!(ch&0xFF80)) {
			size += 1;
		}else if(!(ch&0xF800)){
			size += 2;
		}else {
			size += 3;
		}
	}
	return size;
}

function Test(formName){
	if (formName == undefined || formName == null ||'' == formName) return;
	var frm = eval("document." + formName);
	//var userName = document.getElementsByName("userNm")[0];
	//alert(userName.getAttribute("maxlength"));
	if(frm){
		for(var i =0;i<frm.elements.length; i++){
			var obj = frm.elements[i];
			if(obj.hasAttribute('required')){
					if(obj.value==""||obj.value==null){
					alert("필수항목입니다");
					obj.focus();
					return false;
				}
			}
			if(obj.hasAttribute('maxlength')){
				var len = obj.getAttribute('maxlength');
				if(len != undefined && len != null && len != ''){
					if(obj.value.length>len){
						alert("maxlangth 초과");
						obj.select();
						return false;
					}
				}
			}
			if(obj.hasAttribute('maxbyte')){
				var bytes = obj.getAttribute("maxbyte");
				if (bytes != undefined && bytes != null && bytes != ''){
					if(cmAL32Len(obj.value) > bytes){
						alert("byte 초과");
						obj.select();
						return false;
					}
				}
			}
			if(obj.hasAttribute('chkType')){
				if(obj.value!="" && obj.value!=undefined && obj.value!=null){
					if(obj.getAttribute('chkType')=="num"){
						if(!cmNumberChk(obj.value)){
							alert("숫자만입력");
							obj.select();
							return false;
						}
					}
					if(obj.getAttribute('chkType')=="alnum"){
						var expr = /^[.a-zA-Z0-9-]+$/;
						if(!expr.test(frm.elements[i].value)){
							alert("영어 및 숫자만 입력");
							obj.select();
							return false;
						}
					}
				}
			}
		}
	} 
}
function paramTest(args){
	
	alert("args.a : "+args.a+"\n"+"args.b : "+args.b);
}
function dustkswk(){
	paramTest({a:5,b:3});
	return null;
}
</Script>
<title>Insert title here</title>
</head>
<body onload=dustkswk()>
<form name="frm" action="test.do">
	<table width="890" border="1">
		<tr>
			<td>
				<table width="280">
					<tr><td>
						<input type="button" onclick="isIE9()" value="isIE9"/>
					</td></tr>
					<tr>
						<td><input type="button" onclick="chk()" value="isHangul"/></td>
						<td><input type="text" name="text1"/></td>	
					</tr>
					<tr><td><input type="button" onclick="cmOpenPopup2('test1515.jsp','test','400','300','no')" value="팝업창"/></td></tr>
				</table>
			</td>
			<td>
				<table width="610" border="0">
					<tr>
						<td width="100">아이디</td>
						<td width="100"><input id="testUserId" type="text" required="required" maxbyte="36" maxlength="12" name="userId" chkType="alnum" style="padding:3px 0 3px 5px; border:1px;border-style:solid;border-color:#cccccc" onfocus="cmInfcs(this); cmOnTooltip('help2');" onblur="cmOutfcs(this); cmOffTooltip('help2');"/></td>
						<td width="410" align="left">
						<div id="help2" class="help left h32" style="left:296px; top:-4px; _width:318px; display: none;" >
							<div class="txt"><p>5~12 자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.</p></div>
							<span class="shadow1"></span>
							<span class="shadow2"></span>
							<span class="arrow" style="position:absolute; z-index:4; top:13px; left:-3px; display:block; width:4px; height:6px; background:url(https://static.nid.naver.com/images/user/images/join2/bu_help_left.gif) no-repeat; overflow:hidden;"></span>
						</div>
						</td>
					</tr>
					<tr>
						<td width="100">이름</td>
						<td width="100" colspan="2"><input type="text" required="required" maxbyte="10" maxlength="12"  name="userNm" chkType="num" style="padding:3px 0 3px 5px; border:1px;border-style:solid;border-color:#cccccc" onfocus="cmInfcs(this)" onblur="cmOutfcs(this)"/></td>
					</tr>
					<tr>
						<td width="100">패스워드</td>
						<td width="100" colspan="2"><input type="password" required="required" maxbyte="10" maxlength="14" name="passwd" chkType="num"  style="padding:3px 0 3px 5px; border:1px;border-style:solid;border-color:#cccccc" onfocus="cmInfcs(this)" onblur="cmOutfcs(this)"/></td>
					</tr>
					<tr>
						<td width="100">이메일</td>
						<td width="*" colspan="2"><input type="text" name="email1" title="정규식 수정 또는 입력폼을 키비시이하게 해야할듯" style="width:100px;padding:3px 0 3px 5px; border:1px;border-style:solid;border-color:#cccccc" onfocus="cmInfcs(this)" onblur="cmOutfcs(this)"/>@<input type="text" name="email2" style="padding:3px 0 3px 5px;width:100px; border:1px;border-style:solid;border-color:#cccccc" onfocus="cmInfcs(this)" onblur="cmOutfcs(this)"/></td>
					</tr>
					<tr>
						<td colspan="3"> <input type="button" value="유효성체크 테스트" onclick="chkval();"/></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width="280" align="center">
				<table width="100%" align="center">
					<tr>
						<td align="center">Navigator 객체취득 테스트</td>
					</tr>
					<tr>
						<td align="center"><input type="button" onclick="testcmChkXPSP2()" style="width: 120px;" value="XP 서비스팩2"/></td>
					</tr>
					<tr>
						<td align="center"><input type="button" onclick="testcmChkIE7()" style="width: 120px;" value="IE7.0"/></td>
					</tr>
					<tr>
						<td align="center"><input type="button" onclick="testcmChkIE8()" style="width: 120px;" value="IE8.0"/></td>
					</tr>
					<tr>
						<td><input type="button" onclick="testcmChkIE()" style="width:120px;" value="INTERNET EXPLORER"/> </td>
					</tr>
				</table>
			</td>
			<td width="610">
				<table width="100%">
					<tr>
						<td><input type="button" value="바이트체크" onclick="aaa();"/></td>
						<td><input type="text" name="byteTest"/></td>
					</tr>
					<tr>
						<td><input type="button" value="cmNumOnly" onclick="cmNumOnly(document.frm.numOnly.value)"/></td>
						<td><input type="text" name="numOnly" onkeydown="cmNumOnly(this.value)"/></td>
					</tr>
					<tr>
						<td><input type="button" value="isNumeric" onclick="alert(cmNumberChk(document.frm.numericTest.value))"/></td>
						<td><input type="text" name="numericTest"/></td>
					</tr>
					<tr>
						<td><input type="button" value="formChkTest" onclick="Test('frm')"/></td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
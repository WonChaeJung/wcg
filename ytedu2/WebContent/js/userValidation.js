/*-------------------------------------------------------------------
 * 설   명 : 문자열 한글체크
 * 인자값 : String
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function isHangul(str)
{
	var len;
	len = str.length;
	for (var i = 0; i < len; i++)  {
		if (str.charCodeAt(i) != 32 && (str.charCodeAt(i) < 44032 || str.charCodeAt(i) > 55203))
		return false;
	}
	return false;
}
/*-------------------------------------------------------------------
 * 설   명 : 입력받은파라미터값에서 공백이 있는지 체크함
 * 인자값 : 없음
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function cmChkSpace(obj)
{
	if(obj.search(/\s/)!=-1){
		return true;
	} else{
		return false;
	}
}
/*-------------------------------------------------------------------
 * 설   명 : 아이디의 유효성체크 (공백, 길이, 특수기호)
 * 인자값 : document.fomeName.InputName 값
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function cmIdValChk(str){
	var chkVal = str.value;
	var rtnVal = cmChkSpace(chkVal);
	var i,cnt=0;
	var isID =/^[a-z0-9_]{5,12}$/;
	var isNum=/\d/;
	if(chkVal==""){
		alert("请输入用户名"); //아이디를 입력하세요.
		return false;
	}
	if(rtnVal){
		alert("用户名不能有空格"); //아이디에 공백이 삽입될 수 없습니다.
		return false;
	}
	if(chkVal.charAt(0) == '_') {
		alert("用户名不能用'_'符号开头"); //아이디의 첫문자는 '_'로 시작할수 없습니다.
		return false;
	}
	if(!isID.test(chkVal) ) {
		alert("用户名必须是大小写英文字母，数字，特殊符号(_)组成，长度5~12个字符"); //아이디는 5~12자의 영문 소문자와 숫자, 특수기호(_)만 사용할 수 있습니다.
		return false;
	}
	for(i=0; i < chkVal.length; i++) {
		if (i == 0 && !(chkVal.charAt(i)>="a"&&"z">=chkVal.charAt(i))){
			alert("用户名请用拼音开头"); //아이디는 반드시 영문자로 시작하여야 합니다.
			return false;
		}
		if(isNum.test(chkVal.substring(i,i+1))){
			cnt++;
		}
		if(cnt>7){
			alert("不能使用8个以上数字"); //숫자가 8개 이상 사용되면 안됩니다.
			return false;
		}
	}
	return true;
}

/*-------------------------------------------------------------------
 * 설   명 : 가맹점명의 유효성체크 (공백, 길이, 특수기호)
 * 인자값 : document.fomeName.InputName 값
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function cmAgencyNmValChk(str){
	var chkVal = str.value;
	var rtnVal = cmChkSpace(chkVal);
	var i,cnt=0;
	var isNum=/\d/;
	if(chkVal==""){
		alert("请输入公司名"); //가맹점명 입력하세요.
		return false;
	}
	if(rtnVal){
		alert("公司名不能有空格"); //가맹점명에 공백이 삽입될 수 없습니다.
		return false;
	}
	if(chkVal.charAt(0) == '_') {
		alert("公司名不能用'_'符号开头"); //가맹점명의 첫문자는 '_'로 시작할수 없습니다.
		return false;
	}
	for(i=0; i < chkVal.length; i++) {
		if(isNum.test(chkVal.substring(i,i+1))){
			cnt++;
		}
		if(cnt>7){
			alert("不能使用8个以上数字"); //숫자가 8개 이상 사용되면 안됩니다.
			return false;
		}
	}
	return true;
}
/*-------------------------------------------------------------------
 * 설   명 : 비밀번호의 유효성체크 (공백,길이,영문대소문자및특수문자)
 * 인자값 : document.fomeName.InputName 값
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function cmPassWdValChk(str)
{
	var chkVal = str.value;
	var rtnVal = cmChkSpace(chkVal);
	var isPassWd = /^[A-Za-z0-9`\-=\\\[\];',\.\/~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{6,16}$/;
	var cnt = 0;
	if(chkVal == ""){
		alert("请输入密码"); //비밀번호를 입력해 주십시오.
		str.focus();
		return false;
	}
	if(rtnVal) {
		alert("密码不能有空格"); //비밀번호는  공백이 삽입될 수 없습니다.
		str.focus();
		return false;
	}
	if( chkVal.length < 6 ){
		alert("密码必须是6个字以上"); //비밀번호는 6자 이상 입력해 주십시오.
		str.focus();
		return false;
	}
	if( !isPassWd.test(chkVal)){
		alert("密码必须是写英文字母，数字，特殊符号组成，长度6~16个字符"); //비밀번호는 6~16자의 영문자와 숫자, 특수문자만 사용할 수 있습니다.
		str.focus();
		return false;
	}
	return true;
}

/*-------------------------------------------------------------------
 * 설   명 : E-Mail 유효성체크 
 * 인자값 : String (ex : var str = email1+"@"+email2;)
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function cmEmailValChk(str)
{	
	if(str == ""){
		alert("请输入E-mail"); //이메일주소를 입력해 주십시오.
		str.focus();
		return false;
	}
	if(cmChkSpace(str)){
		alert("邮箱格式错误"); //이메일주소를 정확히 입력해 주십시오.
		str.select();
		return false;
	}
	if( -1 == str.indexOf('.') ) {
		alert("邮箱格式错误"); //이메일주소를 정확히 입력해 주십시오.
		str.select();
		return false;
	}
	var isEmail = /[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+(\.[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+)*@[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+(\.[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+)*/;
	if( !isEmail.test(str)){
		alert("邮箱格式错误"); //이메일주소를 정확히 입력해 주십시오.
		str.select();
		return false;
	}
	if( chkVal.length > 60 ) {
		alert("邮箱格式错误"); //이메일주소를 정확히 입력해 주십시오.
		str.select();
		return false;
	}
	return true;
}
/*-------------------------------------------------------------------
 * 설   명 : 이름 유효성체크 
 * 인자값 : document.fomeName.InputName 값
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function cmNameValChk(str)
{
	var chkVal = str.value;
	chkTrimVal = chkVal.replace(/(^\s*)|(\s*$)/g, "");
	if(chkTrimVal== ''){
		alert("请输入您的姓名"); //이름을 입력해 주십시오.
		str.focus();
		return false;
	}
	var rtnVal = cmChkSpace(chkVal);
	if( rtnVal ){
		alert("姓名不能有空格"); //이름은 공백이 삽입될 수 없습니다.
		str.select();
		return false;
	}
	if( chkTrimVal.length > 10 || chkTrimVal.length < 2) {
		alert("姓名必须是写中文或英文字母，长度2~10个字符"); //이름은 2~10자의 문자만 사용할 수 있습니다.
		str.select();
		return false;
	}
	return true;
}
/*-------------------------------------------------------------------
 * 설   명 : 핸드폰 유효성체크 
 * 인자값 : document.fomeName.InputName 값
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function cmCellPhoneValChk(str)
{	
	var chkVal = str.value;
	if(cmChkSpace(chkVal)){
		alert("请输入正确的手机号码"); //핸드폰번호를 정확히 입력해 주십시오.
		str.select();
		return false;
	}
	if( chkVal.length > 15 ) {
		alert("请输入正确的手机号码"); //핸드폰번호를 정확히 입력해 주십시오.
		str.select();
		return false;
	}
	return true;
}
/*-------------------------------------------------------------------
 * 설   명 : 전화번호 유효성체크 
 * 인자값 : document.fomeName.InputName 값
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function cmPhoneValChk(str)
{	
	var chkVal = str.value;
	if(cmChkSpace(chkVal)){
		alert("请输入正确的电话号码"); //전화번호를 정확히 입력해 주십시오.
		str.select();
		return false;
	}
	if( chkVal.length > 15 ) {
		alert("请输入正确的电话号码"); //전화번호를 정확히 입력해 주십시오.
		str.select();
		return false;
	}
	return true;
}
function chkPattern(str,type)	//형식 체크
{
  switch(type)
  {
    case "NUM": //숫자만
      patten = /^[0-9]+$/;
      break;
    case "PHONE": //전화번호	형식 : 033-1234-5678
      patten = /^[0-9]{2,4}-[0-9]{3,4}-[0-9]{4}$/;
      break;
    case "EMAIL": //메일
      patten = /^[a-zA-Z][a-zA-Z0-9_\.\-]+@([a-zA-Z0-9-]{2,}\.)+([a-zA-Z]{2,4}|[a-zA-Z]{2}\.[a-zA-Z]{2})$/;
      break;

    case "DOMAIN": //영자 숫자와	.	다음도 영자
      patten = /^[.a-zA-Z0-9-]+.[a-zA-Z]+$/;
      break;

    case "ENG": //영자만
      patten = /^[a-zA-Z]+$/;
      break;

    case "ENGNUM": //영자와	숫자
      patten = /^[a-zA-Z0-9]+$/;
      break;

    case "HOST": //영자	와 '-'
      patten = /^[a-zA-Z-]+$/;
      break;

    case "ID": //첫글자는	영자 그뒤엔	영어숫자 2이상 12자리	이하
      patten = /^[a-zA-Z]{1}[a-zA-Z0-9_-]{2,12}$/;
      break;

    case "DATE": //	형식 : 2002-08-15
      patten = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
      break;

	case "EMAIL_SS": //메일
      patten = /^[._a-zA-Z0-9-]+@[._a-zA-Z0-9-]+\.[a-zA-Z]+$/;
      break;
	
	case "PASSWD" :		// 로그인시 패스워드 패턴 체크
		patten = /([a-zA-Z0-9-]|([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])){6,40}$/;
	  break;
	case "PASSWD_BOARD" :		// 게시판작성시 패스워드 패턴 체크
		patten = /([a-zA-Z0-9-]|([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])){4,14}$/;
	break;
	case "MAN_CT" :		// 수강인원 숫자범위 1-999
		patten = /^[0-9]{1,3}$/;
	break;
    default :
      return false;
  }
	return patten.test(str);
}

function isValidType(field,type) //	chkPatten로	형식체크 후	메세지 출력
{
	
	if(!chkPattern(field.value,type))
	{
	//	field.focus();
		return false;
	}
	return true;

}

function CheckValid(String,	space) //	유효성 체크
{
	 var retvalue	=	false;
	 for (var	i=0; i<String.length;	i++)
	 {		//String이 0(""	이나 null)이면 무조건	false
			if (space	== true)
			{
				 if	(String.charAt(i)	== ' ')
				 {			//String이 0이 아닐때	space가	있어야만 true(valid)
						retvalue = true;
						break;
				 }
			}	else {
				 if	(String.charAt(i)	!= ' ')
				 {			//string이 0이 아닐때	space가	아닌 글자가	있어야만 true(valid)
						retvalue = true;
						break;
				 }
			}
	 }
	 return	retvalue;
}

// 항목이	비어있는지 체크
function isEmpty(field,	error_msg) {
	// error_msg가 ""이면	alert와	focusing을 하지	않는다
	
	if(error_msg ==	"")	{
		if(!CheckValid(field.value,	false))	{
			return true;
		} else {
			return false;
		}
	} else {
		if(!CheckValid(field.value,	false))	{
			alert(error_msg);
			field.focus();
			return true;
		} else {
			return false;
		}
	}
}

// 항목이	비어있는지 체크
function isNotSelect(field,	error_msg)
{
  var value = field.value;
	// error_msg가 ""이면	alert와	focusing을 하지	않는다
	if(error_msg ==	"")	{
		if(!CheckValid(value,	false) || value == "00")		{
			return true;
		}	else {
			return false;
		}
	}	else {
		if(!CheckValid(value,	false) || value == "00")	{
			alert(error_msg);
			field.focus()	;
			return true;
		}	else {
			return false;
		}
	}
}

// 라디오	버튼이 체크되어있는지	체크
function isNotCheckedRadio(field,	error_msg) {
	if ( field ==	null ) {
		alert(error_msg);
		return true;
	}

	if ( field.length	== null	)	{
		if ( field.checked ==	true ) {
			return false;
		}	else {
			alert(error_msg);
			return true;
		}
	}

	for(var i = 0; i < field.length; i++)	{
		if(field[i].checked	== true) {
			return false;
		}
	}
	alert(error_msg);
	return true;
}
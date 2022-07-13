<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%> %>
<script src="/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
function getAL32UTF8Length(str) {
	var ch, size = 0;

	for (x = 0; x < str.length; x++) {
		ch = str.charCodeAt(x);
		if (!(ch & 0xFF80)) {
			size += 1;
		} else if (!(ch & 0xF800)) {
			size += 2;
		} else {
			size += 3;
		}
	}
	return size;
}

function test() {
	var frm = document.frm;
	for (var i = 0; i < frm.length; i++) {
		alert(frm.elements[i].cha_chk);
	}

	if (frm.myinput.hasAttribute("maxbyte")) {
		alert(frm.myinput.getAttribute("maxbyte"));
	}

	return false;
}
function getByteLength(strValue)
{
    var byteLength = 0;
    for (inx = 0; inx < strValue.length; inx++)
	{
        var oneChar = escape(strValue.charAt(inx));
        if ( oneChar.length == 1 )
		{
            byteLength ++;
        }
		else if (oneChar.indexOf("%u") != -1)
		{
            byteLength += 2;
        }
		else if (oneChar.indexOf("%") != -1)
		{
            byteLength += oneChar.length/3;
        }
    }
    return byteLength;
}

function ajaxTest() {
	$.ajax({
		  url: '${ctxPath}/YTCaresAjax.do',
		  asynch:false,
		  cache:false,
		  dataType: 'json',
		  type:'POST',
		  data:'queryId=board.selectBoardList&category=01&sub_category=01&start=1&end=10',
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
				alert(html.join());
				$('#ajaxTest').html(html.join(''));
			}
		  },
		error:function(jqXHR, textStatus, err) {
			return false;
		}
	});
}
</script>
</head>
<body>
<form:form></form:form>
<form name="frm" action="" method="post">
	<input id="myinput" name="myinput" cha_chk="111" value="" maxlength="15" maxbyte="5" onkeydown="">

아이디 <input type="text" name="user_id"/>
패스워드 <input type="text" name=""/>
이름<input type="text" name=user_id/>
가맹점명<input type="text" name=user_id/>
추천인<input type="text" name=user_id/>
계층아이디<input type="text" name=user_id/>
휴대폰<input type="text" name=user_id/>
전화<input type="text" name=user_id/>
이메일<input type="text" name=user_id/>
우편번호<input type="text" name=user_id/>
주소<input type="text" name=user_id/>
월급<input type="text" name=user_id/>

</form>  

</body>
</html>
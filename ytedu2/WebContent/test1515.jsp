<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/js/commonUtil.js"></script>
<script type="text/javaScript">
function localTime(){
	var localTime = new Date();
	var HH = localTime.getHours();
	var MM = localTime.getMinutes();
	var SS = localTime.getSeconds();

	var str = HH;
	str += (MM<10?':0':':')+MM;
	str += (SS<10?':0':':')+SS;
	document.getElementById('time').innerHTML="<font size='15' color='#ff00ff'><b>"+str+"</font>";
	setTimeout("localTime()",1000);
}

var stDate  = null;
var t;
function startWatch(kind){
	if(kind=='start'){stDate = new Date();}
	var btnArea = document.getElementById('timeBtn');
	var inhtm = "<input type='button' value='STOP' onclick='stopWatch()' style='width:80px'/> ";
	inhtm +="<input type='button' value='RESET' onclick='resetWatch()' style='width:80px'/>";
	btnArea.innerHTML = inhtm;
	t = setInterval("inputRlt()", 10);
	
}
function inputRlt(kind){
	var chkDate = new Date();
	chkDate.setTime(chkDate.getTime() - stDate.getTime());
	var MM = chkDate.getMinutes();
	var SS = chkDate.getSeconds();
	var mm = chkDate.getMilliseconds();
	//alert(chkDate.getTime());
	document.getElementById('timeChk').innerHTML = (MM<10?"0":":")+MM+(SS<10?":0":":")+SS+(mm<100?':0':':')+mm;
	
}
function stopWatch(){
	//var end_date = new Date();
	clearInterval(t);
	var btnArea = document.getElementById('timeBtn');
	var inhtm = "<input type='button' value='START' onclick='startWatch()' style='width:80px'/> ";
	inhtm +="<input type='button' value='RESET' onclick='resetWatch()' style='width:80px'/>";
	btnArea.innerHTML = inhtm;
}
function resetWatch(){
	clearInterval(t);
	stDate = null;
	var btnArea = document.getElementById('timeBtn');
	var inhtm = "<input type='button' value='START' onclick='startWatch('start')' style='width:80px'/> ";
	inhtm +="<input type='button' value='RESET'disabled='disabled' style='width:80px'/>";
	btnArea.innerHTML = inhtm;
	document.getElementById('timeChk').innerHTML = '00:00:00';
}
</script>
</head>
<body onload='localTime()'>
<form name="frm" action="" method="post">
<table width="400" >
	<tr>
		<td width="100%" align="center">
			<table width="100%" border="1" align="center">
				<tr>
					<td width="400" align="center"><font size="6">현재시간</font></td>
				</tr>
				<tr>
					<td width="400"  width="150" align="center">
						<div id='time'></div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="100%" align="center">
			<table width="100%" border="1" align="center">
				<tr>
					<td width="400" align="center"><font size="6">스탑워치</font></td>
				</tr>
				<tr>
					<td width="400">
						<table width="100%" border="1">
							<tr>
								<td width="50%" align="center">
									<div id="timeChk">00:00:00</div>
								</td>
								<td width="50%" align="center">
									<div id="timeBtn">
										<input type="button" value="START" onclick="startWatch('start')" style="width:80px"/>
										<input type="button" value="RESET" onclick="resetWatch()" disabled="disabled" style="width:80px"/>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div id="list"></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>
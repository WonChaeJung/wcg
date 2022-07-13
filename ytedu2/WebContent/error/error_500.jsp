<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTEdu</title>
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr valign="middle">
    	<td align="center" colspan="2" style="padding-top: 100px;">
    		<img src="/images/warning.jpg" border="0" />
    	</td>
    </tr>
<tr>
	<td align="center" style="padding: 10 50 50 50;" colspan="2">
		<font style="font-family:verdana, tahoma; font-size:50px; letter-spacing:-1px; color:#b22c2b;"><b>请登录</b></font>
		<p>
			${requestScope["javax.servlet.error.request_uri"]}<br/>
			${requestScope["javax.servlet.error.status_code"]}<br/>
			${requestScope["javax.servlet.error.exception_type"]}<br/>
			${requestScope["javax.servlet.error.message"]}
			
		</p>
	</td>
</tr>

<tr>
  	<td align="right" style="padding: 50 10 50 50;"><a href="/CmUserService/callUserLogin.do"><img src="/images/login_bt.gif" border="0"></a></td>
	<td align="left" style="padding: 50 50 50 10;"><a href="/main.do"><img src="/images/btn_home.gif" border="0"></a></td>
</tr>
</table >
</body>
</html>
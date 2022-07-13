<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PW Search</title>
<link href="${ctxPath}/css/style.css" rel="stylesheet" type="text/css"/>
<script src="${ctxPath}/js/commonUtil.js"></script>
<script src="${ctxPath}/js/userValidation.js"></script>
<script type="text/javascript">
/*
 * 화면 초기 표시 처리
 */
function idfind(){
	if(!cmChkForm2("frmIdfind"))return false;
	if(!cmNameValChk(document.frmIdfind.user_name))return false;
	cmOpenPopup("","test","400","250","auto");
	document.frmIdfind.action = "/CmUserService/searchUserId.do";
	document.frmIdfind.target = "test";
	document.frmIdfind.submit();
}
function pwfind(){
	if(!cmChkForm2("frmPwfind"))return false;
	if(!cmNameValChk(document.frmPwfind.user_id))return false;
	cmOpenPopup("","test","400","250","auto");
	document.frmPwfind.action = "/CmUserService/searchUserPass.do";
	document.frmPwfind.target = "test";
	document.frmPwfind.submit();	
}
/*
 * reset
 */
function reset(){
	document.frm.reset();
}
</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<table width="900" align="center" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			<img src="<spring:message code='img.member.bg' />"/>
		</td>
	</tr>
</table>
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr valign="top">
	    <td width="200" align="left">
            <jsp:include page="/page/common/cmUserLeftMenu_f.jsp"/>
        </td>
		<td width="700" valign="top" align="center">
			<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff">
			    
				<tr height="15">
					<td></td>
				</tr>
				<tr>
					<td align="left"><img src="<spring:message code='img.member.title.idpw'/>"></td>
				</tr>
				<tr>
					<td style="padding-top:10px;" align="left">
					<form name="frmIdfind">
						<table class="topbottom-style" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff">
						    <tr height="3">
						    </tr>
							<tr>
								<td>
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td class="silver" style="width:100px;padding-left:8px;"><spring:message code='lbl.name' text='이름'/></td>
											<td style="padding-left:8px;"><input type="text" name="user_name" required="required" maxlength="30" onkeydown="if(event.keyCode==13){idfind(this.form); return false;}"></td>
										</tr>
										<tr height="2">
						                    <td></td>
						                </tr>
										<tr>
											
											<td class="silver" style="width:100px;padding-left:8px;"><spring:message code='lbl.agency.name' text='가맹점명'/></td>
											<td style="padding-left:8px;"><input type="text" name="agency_name" required="required" maxlength="30" onkeydown="if(event.keyCode==13){idfind(this.form); return false;}"></td>
										</tr>
									</table>
								</td>
								
							</tr>
							<tr height="3">
							</tr>
						</table>		
					</form>
					</td>
				</tr>
				<tr height="20">
                    <td></td>
                </tr>
				<tr>
                    <td style="padding-left:8px;" align="center"><img src="/images/login_bt.gif" style="cursor: pointer;" onclick="idfind(this.form); return false;" ></td>
                </tr>
				<tr height="15">
					<td></td>
				</tr>
			 </table>
			 <table style="margin-top:10px;" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff">
				<tr height="15"><td></td></tr>
				<tr>
					<td align="left"><img src="<spring:message code='img.member.find.pw'/>"></td>
				</tr>
				<tr>
					<td style="padding-top:10px;"  align="left">
						<form name="frmPwfind" action="" target="">
							<table class="topbottom-style" width="100%" cellpadding="0" cellspacing="0" border="0">
							    <tr height="3">
                                </tr>
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td class="silver" style="width:100px;padding-left:8px;"><spring:message code='lbl.id' text='아이디'/></td>
												<td style="padding-left:8px;"><input type="text" name="user_id" required="required" maxbyte="100" maxlength="12" onkeydown="if(event.keyCode==13){findPw(this.form); return false;}"></td>
											</tr>
											<tr height="2">
				                                <td></td>
				                            </tr>
											<tr>
												<td class="silver" style="width:100px;padding-left:8px;"><spring:message code='lbl.email' text='이메일'/></td>
												<td style="padding-left:8px;"><input type="text" name="email" required="required" maxbyte="maxbyte" maxlength="40" onkeydown="if(event.keyCode==13){findPw(this.form); return false;}"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr height="3">
                                </tr>
							</table>
						</form>
					</td>
				</tr>
				<tr height="20">
                    <td></td>
                </tr>
				<tr>
                    <td style="padding-left:8px;" valign="top" align="center"><img src="/images/login_bt.gif" style="cursor: pointer;"onclick="pwfind(this.form); return false;"></td>
                </tr>
				<tr height="15">
					<td></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
</body>
</html>
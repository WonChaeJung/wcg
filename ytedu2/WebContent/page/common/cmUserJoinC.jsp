<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ytcares"	uri="http://www.backsaninfo.com/jsp/core" %>
<%@taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<jsp:include page="/page/common/cmSiteInclude_f.jsp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link href="/css/style_member.css" rel="stylesheet" type="text/css" />
<script src="/js/commonValidation.js"></script>
<script src="/js/commonUtil.js"></script>
<script src="/js/userValidation.js"></script>
<script src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
function checkVal(){
	var form 			= document.frm;
	var agencyChkVal 	= document.frm.agencyChkFlg.value;
	var idChkVal 		= document.frm.idChkFlg.value;
	
	if(!cmChkForm2("frm"))return false;
	
	if(!cmNameValChk(form.user_name))return false;
	if(!cmAgencyNmValChk(form.agency_name))return false;
	if(!cmIdValChk(form.user_id))return false;
	if(!cmPassWdValChk(form.user_pass))return false;
	if(form.user_pass.value != form.userPassChk.value){
		alert("<spring:message code='btn.update' text='수정'/>패스워드를 다시 확인해주십시오");
		return false;	
	}
	if(form.cell_phone.value == "" && form.phone.value ==""){
		alert("<spring:message code='btn.update' text='수정'/>핸드폰번호나 전화번호중 하나는 필수입력항목입니다.");return false;}
	if(!cmCellPhoneValChk(form.cell_phone))return false;
	if(!cmPhoneValChk(form.phone))return false;
	if(agencyChkVal == 0){alert("<spring:message code='btn.update' text='수정'/>가맹점명 중복체크를  해주십시오.");return false;}
	if(idChkVal == 0){alert("<spring:message code='btn.update' text='수정'/>아이디 중복체크를 해주십시오 .");return false;}

	document.frm.submit();
}
/*
 * 아이디 재설정시 value값 변경
 */
function idReChk(){
	frm.chk.value = 0;
}
function check_pw_mail_unreal(frm) {
	if (frm.email_list.value!="" && frm.email_list.value!="self") {
		frm.email2.disbled=false;
		frm.email2.style.display = 'none';
		frm.email2.value = frm.email_list.value;
	} else if (frm.email_list.value=="self") {
		frm.email2.value = '';
		frm.email2.style.display = 'inline';
		frm.email2.focus();
	}
}
function idDuplChk(userid){
	if (userid.length < 5) {
		$('#id_dupl').html('<span style="color:#ff0000;"><spring:message code="error.invalid.check.id" text="사용할 수 없는 아이디입니다."/></span>');
		document.frm.idChkFlg.value="0";
		return;
	}
	var isID =/^[a-z0-9_]{5,12}$/;
	if(!/^[a-z0-9_]{5,12}$/.test(userid)){
		$('#id_dupl').html("<span style='color:#ff0000;'><spring:message code='error.invalid.check.id' text='사용할 수 없는 아이디입니다.'/></span>");
		document.frm.idChkFlg.value="0";
		return;
	}
	
	$.ajax({
		  url: '${ctxPath}/YTCaresAjax.do',
		  asynch:false,
		  cache:false,
		  dataType: 'json',
		  type:'POST',
		  data:'queryId=user.selectIdDuplchk&user_id='+userid, 
		  success: function(json){
			if (json.length == 0) {
				alert("<spring:message code='error.fail.overlap.check' text='중복 확인중 예외가 발생하였습니다.'/>");
			} else {
				if(json[0].USER_CNT == 0){
					$('#id_dupl').html("<spring:message code='msg.join.success.id' text='가입가능한 아이디 입니다.'/>");
					document.frm.idChkFlg.value="1";
				}else{
					$('#id_dupl').html("<span style='color:#ff0000;'><spring:message code='error.join.overlap.id' text='아미 가입된 아이디입니다.'/></span>");
					document.frm.idChkFlg.value="0";
				}
				$('#id_dupl').attr("");
			}
		  },
		error:function(jqXHR, textStatus, err) {
			return false;
		}
	});
}
function agencyDuplChk(agency_name) {
	if(agency_name.length <= 0){
		document.frm.agencyChkFlg.value='0';
		$('#agency_dupl').html("<span style='color:#ff0000;'><spring:message code='error.invalid.check.agency.name' text='사용할 수 없는가맹점명입니다.'/></span>");
		return;
	}

	$.ajax({
		  url: '${ctxPath}/YTCaresAjax.do', 
		  asynch:false,
		  cache:false,
		  dataType: 'json',
		  type:'POST', 
		  data:'queryId=user.selectAgencyIdDuplchk&agency_name='+agency_name, 
  		  success: function(json){
			if (json.length == 0) {
				alert("<spring:message code='error.fail.overlap.check' text='중복확인중 예외가 발생하였습니다.'/>");
			} else {
				var html = new Array();
				if(json[0].AGENCY_CNT == 0){
					$('#agency_dupl').html("<spring:message code='msg.join.success.agency.name' text='사용 가능한 가맹점명입니다.'/>");
					document.frm.agencyChkFlg.value="1";
				}else{
					$('#agency_dupl').html("<span style='color:#ff0000;'><spring:message code='error.join.overlap.agency.name' text='이미 가입된 가맹점명 입니다.'/></span>");
					document.frm.agencyChkFlg.value="0";
				}
				$('#agency_dupl').attr("");
			}
		  },
		error:function(jqXHR, textStatus, err) {
			return false;
		}
	});
}
function chkZipcode(){
	var e = document.getElementById("zipcode");
	var zipc = e.value;
	var ziplen = zipc.length;
	var zippatten = /^[0-9]{3}-[0-9]{3}$/;
	if(ziplen == 7){
		if(zippatten.test(zipc)){
			return true;
		}else{
			alert("<spring:message code='error.require.check.format' text='입력 가능한 형식에 맞지 않습니다.'/>");
			return false;
		}
	}else{
		alert("<spring:message code='error.require.check.format' text='입력 가능한 형식에 맞지 않습니다.'/>");
		return false;
	}
}
</script>
</head>
<body onload="cmYTCaresInit()">
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp" />
<table width="900" cellpadding="0" cellspacing="0" border="0" align="center" >
	<tr>
		<td colspan="2">
			<img src='<spring:message code="img.member.bg" text="타이틀이미지"/>'/>
		</td>
	</tr>
	<tr valign="top">
		<td width="184" >
			<table cellpadding="0" cellspacing="0" border="0" align="center">
				<tr >
					<td>
						<jsp:include page="/page/common/cmUserLeftMenu_f.jsp"/>
					</td>
				</tr>
			</table>
		</td>
		<td width="716">
			<table cellpadding="0" cellspacing="0" border="0" align="center">
				<tr valign="top">
					<td>
						<img src='<spring:message code="img.mem.title" text="타이틀"/>'/>
					</td>
				</tr>
				<tr>
					<td>
						<img src='<spring:message code="img.mem.step" text="스텝"/>'/>
					</td>
				</tr>
				<tr>
					<td>
						<img src='<spring:message code="img.mem.req" text="필수항목"/>'/>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td valign="top">
								<form name="frm" method="post" action="/CmUserService/insertUserInfo.do" onsubmit="return check();">
								<input type="hidden" name="chk"	value="0">
								<input type="hidden" name="idChkFlg" value=""/>
								<input type="hidden" name="agencyChkFlg" value=""/>
									<!-- main content -->
									<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-top: 2px solid;border-bottom: 1px solid;border-color: #E4E4E4;">
										<tr>
											<td width="170" class="line"><img src='<spring:message code="img.mem.id" text="아이디"/>'/></td>
											<td class="join" align="left" width="170"><input type="text" name="user_id" class="input" onkeyup="idDuplChk(this.value)" maxbyte="36" maxlength="12" required="required" style="width: 155px;"/></td>
											<td width="376" class="line"><div id="id_dupl" style="margin-left:10px"></div></td>
										</tr>
										<tr>
											<td width="170" class="line"><img src='<spring:message code="img.mem.name" text="이름"/>'/></td>
											<td class="join" align="left" colspan="2"><input type="text"  name="user_name" class="input" maxbyte="30" maxlength="10" required="required" style="width: 155px;"/></td>
											
										</tr>
										<tr>
											<td width="170" class="line"><img src='<spring:message code="img.mem.pass" text="패스워드"/>'/></td>
											<td class="join" align="left" colspan="2"><input type="password" name="user_pass" class="input" maxbyte="48" maxlength="16" required="required" style="width: 155px;"/></td>
										
										</tr>
										<tr>
											<td width="170" class="line"><img src='<spring:message code="img.mem.pass.re" text="패스워드확인"/>'/></td>
											<td class="join" align="left" colspan="2"><input type="password" name="userPassChk" class="input" maxbyte="48" maxlength="16" required="required" style="width: 155px;"/></td>
										
										</tr>
										<tr>
											<td width="170" class="line"><img src='<spring:message code="img.mem.agency" text="가맹점명"/>'/></td>
											<td class="join" align="left"><input type="text" name="agency_name" class="input" onkeyup="agencyDuplChk(this.value)" maxbyte="100" required="required" style="width: 155px;"/></td>
											<td class="line"><div id="agency_dupl" style="margin-left:10px"></div></td>
										</tr>
										<tr>
											<td width="170" class="line"><img src='<spring:message code="img.mem.suisen" text="추천인"/>'/></td>
											<td class="join" align="left" colspan="2">
												<select name="rcmmd_id" style="width: 160px; color:#7B7B7C;" required="required">
													<c:forEach var="i" items="${srchInfo}">
														<option value="${i.USER_ID}">${i.AGENCY_NAME}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td width="170" class="line"><img src='<spring:message code="img.mem.email" text="이메일"/>'/></td>
											<td class="join" align="left" colspan="2">
													<div>
														<input type="text" name="email1" class="input" maxbyte="90" maxlength="30" required="required" title="" style="width: 155px;"/> @
														<input type="text" name="email2" class="input" maxbyte="90" maxlength="30" required="required" title="" style="width: 155px;"/>	
															<select name="email_list" style="width:105px; height:20px; color:#7B7B7C;" onchange="check_pw_mail_unreal(this.form);">
																<option selected="selected"><spring:message code='lbl.insert.direct' text='직접 입력'/></option>
																<option value="naver.com">naver.com</option>
																<option value="nate.com">nate.com</option>
																<option value="dreamwiz.com">dreamwiz.com</option>
																<option value="yahoo.co.kr">yahoo.co.kr</option>
																<option value="empal.com">empal.com</option>
																<option value="unitel.co.kr">unitel.co.kr</option>
																<option value="gmail.com">gmail.com</option>
																<option value="korea.com">korea.com</option>
																<option value="chol.com">chol.com</option>
																<option value="paran.com">paran.com</option>
																<option value="freechal.com">freechal.com</option>
																<option value="hanmail.net">hanmail.net</option>
																<option value="hotmail.com">hotmail.com</option>
																<option value="self"><spring:message code='lbl.select.check' text='선택하세요'/></option>
															</select>
													</div>
											</td>
										</tr>
										<tr>
											<td width="170" class="line"><img src='<spring:message code="img.mem.phone" text="연락처"/>'/></td>
											<td class="join" align="left" colspan="2">
												<input type="text" class="input" name="cell_phone" size="30" maxbyte="45" maxlength="15" style="width: 155px;"/>
												<input type="text" class="input" name="phone" size="30" maxbyte="45" maxlength="15" style="width: 155px;"/>	
											</td>
										</tr>
										
										<tr>
											<td width="170" class="line"><img src='<spring:message code="img.mem.zip" text="우편번호"/>'/></td>
											<td class="join" align="left" colspan="2"><input type="text" id="zipcode" name="zipcode" class="input" maxlength="7" maxbyte="9" required="required" style="width: 155px;"/></td>
										</tr>
										<tr>
											<td width="170" class="line"><img src='<spring:message code="img.mem.address" text="주소"/>'/></td>
											<td class="join" align="left" colspan="2"><input type="text" name="addr" class="input" maxbyte="180"  maxlength="60" required="required" style="width: 440px;"/></td>
										</tr>
									</table>
									<table cellpadding="0" cellspacing="0" border="0" style="padding-top: 20px;"  align="center">
										<tr>
											<td>
												<img src='<spring:message code="img.mem.ok.btn" text="가입"/>' onclick="checkVal()" style="cursor: pointer;"/>&nbsp;&nbsp;
												<a href="/main.do"><img src='<spring:message code="img.mem.cancel.btn" text="가입하지않음"/>'/></a>
											</td>
											<td></td>
										</tr>
									</table>
									<!-- main content end -->
								</form>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp" />
<ytcares:msg/>
</body>
</html>
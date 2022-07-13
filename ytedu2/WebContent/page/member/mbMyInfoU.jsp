<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core" %>
<jsp:include page="/page/common/cmSiteInclude_f.jsp" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YTCares</title>
<link href="${ctxPath}/css/style.css" rel="stylesheet" type="text/css" />
<script src="${ctxPath}/js/commonValidation.js"></script>
<script src="${ctxPath}/js/commonUtil.js"></script>
<script src="${ctxPath}/js/userValidation.js"></script>
<script src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">

/*
 * 화면 초기 표시 처리
 */
function init(){		
	cmYTCaresInit();
}
function checkVal(){
	var form = document.frm;
	var agencyChkVal = document.frm.agencyChkFlg.value;
	var idChkVal = document.frm.idChkFlg.value;
	if(!cmChkForm2("frm"))return false;
	if(!cmNameValChk(form.user_name))return false;
	if(!cmAgencyNmValChk(form.agency_name))return false;
	if(!cmIdValChk(form.user_id))return false;
	if(!cmPassWdValChk(form.user_pass))return false;
	if(form.userNewPass.value!=""&&form.userNewPass.value!=null){
		if(!cmPassWdValChk(form.userNewPass))return false;
		if(form.user_pass.value != form.passWordTemp.value){
			alert('<spring:message code="error.require.check.now.pw" text="현재 비밀번호가 맞지 않습니다."/>');
			form.user_pass.focus();
			return false;
		}else{
			if(form.userNewPass.value != form.userPassChk.value){
				alert('<spring:message code="error.require.check.pw" text="비밀번호를 다시 확인해주십시오."/>');
				form.userNewPass.focus();
				return false;
				}
			}
		}
	if(form.user_pass.value != form.passWordTemp.value){
		alert('<spring:message code="error.require.check.pw" text="현재 비밀번호가 맞지 않습니다."/>');return false;	
	}
	if(form.cell_phone.value == "" && form.phone.value ==""){
		alert('<spring:message code="error.require.insert.tel" text="핸드폰번호나 전화번호 중 하나는 필수입력 입니다."/>');return false;}
	if(!cmCellPhoneValChk(form.cell_phone))return false;
	if(!cmPhoneValChk(form.phone))return false;
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
</script>
</head>

<body onload="init();">
<!-- 상단메뉴 -->
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp" />

<table class="ytcares-content" width="900" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td>
			<jsp:include page="/page/member/mbMemberMenu_f.jsp"/>
		</td>
	</tr>
	<tr>
		<td valign="top" style="padding-top: 20px;">
			<form name="frm" method="post" action="/MbMyPageService/userUpdateMyinfo.do" onsubmit="return check();">
			<input type="hidden" name="chk"	value="0">
			<input type="hidden" name="idChkFlg" value=""/>
			<input type="hidden" name="agencyChkFlg" value=""/>
			<input type="hidden" name="passWordTemp" value="${userInfo.user_pass}"/>
				<!-- main content -->
			<table class="ytcares-detail" cellpadding="0" cellspacing="0" border="0" >
				<colgroup>
					<col width="120"/>
					<col width="400"/>
					<col width="*"/>
				</colgroup>
				<tr>
					<td class="det-label"><spring:message code="lbl.name" text="이름"/></td>
					<td class="det-value"><input type="text" value="${userInfo.user_name}" name="user_name" maxbyte="30" maxlength="10" required="required" readonly="readonly"/></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.agency.name" text="가맹점명"/></td>
					<td class="det-value"><input type="text" value="${userInfo.agency_name}" name="agency_name" maxbyte="45" maxlength="15" required="required"  readonly="readonly"/></td>
					<td><div id="agency_dupl"></div></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.referee" text="추천인"/></td>
					<td class="det-value"><input type="text" name="rcmmd_id" readonly="readonly" value="${userInfo.rcmmd_id}"/></td>
					<td></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.id" text="아이디"/></td>
					<td class="det-value"><input type="text" name="user_id" value="${userInfo.user_id}" maxbyte="36" maxlength="12" required="required" readonly="readonly"/></td>
					<td><div id="id_dupl"></div></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.now.pw" text="현재비밀번호"/></td>
					<td class="det-value"><input type="password" name="user_pass" value="${userInfo.user_pass}" maxbyte="48" maxlength="16" required="required"/></td>
					<td></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.new.pw" text="변경비밀번호"/></td>
					<td class="det-value"><input type="password" name="userNewPass" value="" maxbyte="48" maxlength="16"/></td>
					<td></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.new.pw.conf" text="변경비밀번호 확인"/></td>
					<td class="det-value"><input type="password" name="userPassChk" value="" maxbyte="48" maxlength="16"/></td>
					<td></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.zipcode" text="우편번호"/></td>
					<td class="det-value"><input type="text" name="zipcode" value="${userInfo.zipcode}" maxlength="7" maxbyte="9" required="required"/></td>
					<td></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.phone" text="연락처"/></td>
					<td class="det-value"><input type="text" name="cell_phone" value="${userInfo.cell_phone}" maxbyte="45" maxlength="15"/></td>
					<td></td>
				</tr>
				<tr>
					<td class="det-label">&nbsp;</td>
					<td class="det-value"><input type="text" name="phone" value="${userInfo.phone}" maxbyte="45" maxlength="15"/></td>
					<td></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.email" text="이메일"/></td>
					<td class="det-value">
						<input type="text" name="email1" value="${email1}" style="width:100px" maxbyte="90" maxlength="30" required="required" title="이메일주소입력"/>@
						<input type="text" name="email2" value="${email2}" style="width:100px" maxbyte="90" maxlength="30" required="required" title="이메일서비스입력"/>	
						<select name="email_list" style="width:107px; height:22px" onchange="check_pw_mail_unreal(this.form);">
							<option selected="selected"><spring:message code="lbl.select.check" text="선택해주세요"/></option>
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
							<option value="self"><spring:message code="lbl.insert.direct" text="직접입력"/></option>
						</select>
					</td>
					<td></td>
				</tr>
				<tr>
					<td class="det-label"><spring:message code="lbl.address" text="주소"/></td>
					<td class="det-value"><input type="text" name="addr" value="${userInfo.addr}" style="width:390px;" maxbyte="180"  maxlength="60" required="required""/></td>
					<td></td>
				</tr>
				<tr height="30"><td></td></tr>
				<tr>
					<td colspan="3" align="right"><img src="<spring:message code='img.board.modify'/>" style='cursor:pointer;' onclick="checkVal()" /></td>
				</tr>
			</table>
			<!-- main content end -->
			</form>
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp" />
<ytcares:msg/>
</body>
</html>
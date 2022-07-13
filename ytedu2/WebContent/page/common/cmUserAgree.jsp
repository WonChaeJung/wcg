<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags" %>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function getFocus()
{
	ch1 = document.getElementById('check1');
	ch2 = document.getElementById('check2');
	if( !ch1.checked ) { location.href = "#pos1"; return; }
	if( !ch2.checked ) { location.href = "#pos2"; return; }
	location.href = "#pos3"; return;
}

function check_accept()
{
	if(document.getElementById('check1').checked){return true;}
	else{
		alert("<spring:message code='error.require.check.agree' text='이용약관을 읽어보시고 동의해주십시오.'/>");
		return false;
	}
}

function submitArgChk(){
	if(!check_accept())return false;
	document.formPvt.submit();
}
</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp" />
<table width="900" height="100" align="center" border="0" cellpadding="0" cellspacing="0">
	<tr valign="top">
		<td colspan="2">
			<img src='<spring:message code="img.member.bg" text="타이틀이미지"/>'/>
		</td>
	</tr>
	<tr valign="top">
		<td>
			<table width="184" align="center" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
						<jsp:include page="/page/common/cmUserLeftMenu_f.jsp"/>
					</td>
				</tr>
			</table>
		</td>
		<td>
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
						<img src='<spring:message code="img.mem.agree.title" text="타이틀"/>'/>
					</td>
				</tr>
				<tr>
					<td>
						<img src='<spring:message code="img.mem.agree.step" text="스텝"/>'/>
					</td>
				</tr>
				<tr>
					<td>
						<img src='<spring:message code="img.mem.agree.info" text="설명"/>'/>
					</td>
				</tr>
				<tr>
					<td align="left" width="100%">
						<div id="wrap">
							<div id="content">
								<form method="post" name="formPvt" action="/CmUserService/callUserJoin.do">
									<a name="pos1"></a>
									<fieldset style="margin:0 0 10px 0;">
										<!--<legend>会员注册协议</legend>-->
										<font color="#7b7b7c">
										<div style="position:relative; font-size:14px; height:151px; padding:20px 18px 0 20px; margin:0 0 8px 0; border:1px solid #e5e5e5; overflow:auto; scrollbar-base-color: #d9d9d9; scrollbar-3dlight-color: #d9d9d9; scrollbar-darkshadow-color: #d9d9d9; scrollbar-face-color: #d9d9d9; scrollbar-highlight-color: #d9d9d9; scrollbar-shadow-color: #d9d9d9; scrollbar-track-color: #f2f2f2;-webkit-overflow-scrolling:touch">
											<h3>在以下条款中，“用户”是指申请注册成为YTcares会员的个人或者单位</h3>
											<p>用户同意此在线注册条款之效力如同用户亲自签字、盖章的书面条款一样，对用户具有法律约束力.</p>
											<p>用户进一步同意，用户进入YTcares会员注册程序即意味着用户同意了本注册条款的所有内容且只有用户完全同意所有服务条款并完成注册程序，才能成为YTcares的正式网购会员.</p>
											<p>本注册条款自用户注册成功之日起在用户本注册条款自用户注册成功之日起在用户与YTcares之间产生法律效力</p>
											
											<h3>第一条 用户身份保证</h3>
											<ul>
											<li>①用户承诺并保证自己是具有完全民事行为能力和完全民事权利能力的自然人、法人、实体和组织.&nbsp;用户在此保证所填写的用户信息是真实、准确、完整、及时的，并且没有任何引人误解或者虚假的陈述，且保证YTcares可以通过用户所填写的联系方式与用户取得联系.</li>
											<li>②用户应根据YTcares对于相关服务的要求及时提供相应的身份证明等资料，否则YTcares有权拒绝向该会员或用户提供相关服务.</li>
											<li>③用户承诺将及时更新其用户信息以维持该等信息的有效性.</li>
											<li>④如果用户提供的资料或信息包含有不正确、不真实的信息，YTcares保留取消用户会员资格并随时结束为该用户提供服务的权利.</li>
											<li>⑤以代理人身份代理其他自然人或者单位进行注册用户必须向YTcares提供代理人和被代理人的详细资料和信息及授权书面文件，未向YTcares提供上述资料信息及文件的，YTcares将视注册者为会员.</li>
											</ul>
											<h3>第二条 会员身份确认</h3>
											<ul>
											<li>①用户注册成功后将得到一个用户名和密码，用户凭用户名和密码享受YTcares向其会员用户提供的商品和服务.</li>
											<li>②用户将对用户名和密码安全负全部责任，并且用户对以其用户名进行的所有活动和事件负全责.用户有权根据YTcares规定的程序修改密码.</li>
											<li>③非经YTcares书面同意，用户名和密码不得擅自转让或者授权他人使用，否则用户应承担由此造成的一切后果.</li>
											<li>④用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告YTcares.</li>
											</ul>
											<h3>第三条 用户的权利和义务</h3>
											<ul>
											<li>①用户有权利拥有自己在YTcares的用户名和密码并有权利使用自己的用户名和密码随时登录YTcares网站的会员专区.</li>
											<li>②用户有权利享受YTcares提供的互联网技术和信息服务，并有权利在接受YTcares提供的服务时获得YTcares的技术支持、咨询等服务，服务内容详见YTcares相关产品介绍.</li>
											<li>③用户保证不会利用技术或其他手段破坏及扰乱YTcares网站以及YTcares其他客户的网站.</li>
											<li>④用户应尊重YTcares据及其他第三方的知识产权和其他合法权利，并保证在发生上述事件时尽力保护YTcares及其股东、雇员、合作伙伴等免于因该等事件受到影响或损失； YTcares保留用户侵犯YTcares知识产权时终止向该用户提供服务并不退还任何款项的权利及提出索赔的权利.</li>
											<li>⑤对由于用户向YTcares提供的联络方式有误以及用户用于接受YTcares邮件的电子邮箱安全性、稳定性不佳而导致的一切后果，用户应自行承担责任，包括但不限于因用户未能及时收到YTcares的相关通知而导致的后果和损失.</li>
											<li>⑥用户保证其使用YTcares服务时将遵从国家、地方法律法规、行业惯例和社会公共道德，不会利用YTcares提供的服务进行存储、发布、传播如下信息和内容：违反国家法律法规政策的任何内容（信息）；违反国家规定的政治宣传和/或新闻信息；涉及国家秘密和/或安全的信息；封建迷信和/或淫秽、色情、下流的信息或教唆犯罪的信息；博彩有奖、赌博游戏；违反国家民族和宗教政策的信息；防碍互联网运行安全的信息；侵害他人合法权益的信息和/或其他有损于社会秩序、社会治安、公共道德的信息或内容.用户同时承诺不得为他人发布上述不符合国家规定和/或本服务条款约定的信息内容提供任何便利，包括但不限于设置URL、BANNER链接等.用户承认 YTcares有权在用户违反上述时有权终止向用户提供服务，因用户上述行为给YTcares造成损失的，用户应予赔偿.</li>
											</ul>
											<h3>第四条 YTcares的权利和义务</h3>
											<ul>
											<li>①YTcares应根据用户选择的服务以及交纳款项的情况向用户提供合格的产品.</li>
											<li>②YTcares承诺对用户资料采取对外保密措施，不向第三方披露用户资料，不授权第三方使用用户资料，除非：
												<ol>
												<li>1.依据本协议条款或者用户与YTcares之间其他服务协议、合同、在线条款等规定可以提供；</li>
												<li>2.依据法律法规的规定应当提供；</li>
												<li>3.行政、司法等有权部门要求YTcares提供；</li>
												<li>4.用户同意YTcares向第三方提供；</li>
												<li>5.YTcares解决举报事件、提起诉讼而提交的；</li>
												<li>6.YTcares为防止严重违法行为或涉嫌犯罪行为发生而采取必要合理行动所必须提交的；</li>
												<li>7.YTcares为向用户提供产品、服务、信息而向第三方提供的，包括YTcares通过第三方的技术及服务向用户提供产品、服务、信息的情况.</li>
												</ol>
											</li>
											<li>③YTcares有权使用用户资料.</li>
											<li>④YTcares有权利对用户进行审查并决定是否接受用户成为YTcares会员或是否与用户进行某一交易.</li>
											<li>⑤YTcares保留在用户违反国家、地方法律法规规定或违反本在线注册条款的情况下终止为用户提供服务并终止用户帐号的权利，并且在任何情况下，YTcares对任何间接、偶然、特殊及继起的损害不负责任.</li>
											</ul>
											<h3>第五条 邮件沟通</h3>
											<ul>
											<p>用户充分理解YTcares将通过电子邮件的方式与注册会员保持联络及沟通，用户在此同意YTcares通过电子邮件方式向其发送包括会员信息、YTcares商品及服务信息在内的相关商业及非商业联络信息.</p>
											</ul>
											<h3>第六条 服务条款的修改和服务体系修订</h3>
											<p>YTcares有权在必要时修改服务条款，YTcares据服务条款一旦发生变动，将会在重要页面上提示修改内容.如果不同意所改动的内容，用户可以主动取消获得的网络服务.如果用户继续享用YTcares网络服务，则视为接受服务条款的变动.YTcares保留随时修改其服务体系和价格而不需通知用户的权利，YTcares修改其服务和价格体系之前用户就具体服务与YTcares达成协议并已按照约定交纳费用的，YTcares将按照已达成的协议执行至已交纳费用的服务期期满.</p>
											<h3>第七条 服务的终止</h3>
											<ul>
											<li>①用户有权随时申请终止其会员资格或其在YTcares申请的一项或多项服务.</li>
											<li>②YTcares有权根据实际情况决定取消为用户提供的一项或多项服务，但应退还用户为该服务所交纳款项的剩余部分，除此之外YTcares不承担任何责任.</li>
											<li>③用户申请成为YTcares会员后应当遵守YTcares不时作出的关于反垃圾邮件的决议，用户承诺不会利用YTcares的服务进行任何涉及垃圾邮件的行为，包括但不限于用户利用YTcares服务器发送垃圾邮件；用户发送垃圾邮件中包含YTcares服务器或IP地址的相关信息；用户所有的网站中包含出售邮件列表、邮件地址搜索软件、邮件群发软件等支持垃圾邮件服务的内容；用户发送的垃圾邮件中包含其在YTcares注册域名信息等可能使国内及国际反垃圾邮件组织认为YTcares或YTcares用户与垃圾邮件事件有关的内容或信息.用户理解一旦发生垃圾邮件事件将对YTcares及其所有用户造成不可挽回的巨大损失，因此YTcares发现用户有涉及垃圾邮件的行为将立即停止为该用户提供任何服务，无论用户在YTcares享有的服务是收费或者免费亦无论该服务是否直接与发送垃圾邮件的行为相关，YTcares有权在用户涉及垃圾邮件事件时取消该用户的YTcares会员资格并保留对因用户涉及垃圾邮件给YTcares造成损失索赔的权利.</li>
											</ul>
											<h3>第八条 争议解决及法律适用</h3>
											<ul>
											<li>①因本服务条款有关的一切争议，双方当事人应通过友好协商方式解决.如果协商未成，双方同意向YTcares主要经营地的人民法院起诉.</li>
											<li>②本注册条款的效力、解释、履行和争议的解决均适用中华人民共和国法律法规和计算机、互联网行业的规范.</li>
											</ul>
											<h3>第九条 不可抗力</h3>
											<ul>
											<li>①因不可抗力或者其他意外事件，使得本条款履行不可能、不必要或者无意义的，遭受不可抗力、意外事件的一方不承担责任.</li>
											<li>②不可抗力、意外事件是指不能预见、不能克服并不能避免且对一方或双方当事人造成重大影响的客观事件，包括但不限于自然灾害如洪水、地震、瘟疫流行和风暴等以及社会事件如战争、动乱、政府行为等.</li>
											<li>③用户同意鉴于互联网的特殊性，黑客攻击、互联网连通中断或者系统故障等属于不可抗力，由此给用户或者第三方造成的损失不应由YTcares承担.</li>
											</ul>
											<h3>第十条 附则</h3>
											<ul>
											<li>①本注册条款中有关条款若被权威机构认定为无效，不应影响其他条款的效力，也不影响本服务条款的解释、违约责任及争议解决的有关约定的效力.</li> 
											<li>②一方变更通知、通讯地址或其他联系方式，应自变更之日起及时将变更后的地址、联系方式通知另一方，否则变更方应对此造成的一切后果承担责任.用户同意，YTcares的有关通知只需在YTcares有关网页上发布即视为送达用户.</li>
											<li>因YTcares上市、被收购、与第三方合并、名称变更等事由，用户同意YTcares可以将其权利和/或义务转让给相应的YTcares权利/义务的承受者.</li>
											</ul>
											<ul>
											<li>用户在此再次保证已经完全阅读并理解了上述网购会员注册条款并自愿正式进入YTcares会员在线注册程序，接受上述所有条款的约束. </li>
											</ul>
										</div>
										</font>
									</fieldset>
									<a name="pos2"></a>
									<div style="margin:0 20px 10px 0;">
										<input name="check1" id="check1" type="checkbox" value="1"">
										<label for="check1"><font color="#7B7B7C"><b><spring:message code='lbl.agree.use' text='이용약관에 동의합니다.'/></b></font></label>
									</div>
								</form>
							</div>
						</div>	
					</td>
				</tr>
				<tr>
					<td align="center">
						<table border="0">
							<tr>
								<td align="center"">
									<img src='<spring:message code="img.mem.agree.ok.btn" text="동의"/>' onclick="submitArgChk()" style="cursor: pointer;"/>
									&nbsp;&nbsp;
									<img src='<spring:message code="img.mem.agree.cancel.btn" text="동의하지않음"/>' onclick="javaScript:location='/main.do'" style="cursor: pointer;"/>
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
</body>
</html>

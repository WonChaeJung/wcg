/*-------------------------------------------------------------------
 * 작성일 : 2012-04-26 
 * 파일명 : commonUtil.js
 * 작성자 : 정원채
 * 내   용 : 입력폼 유효성체크 (ID, PASSWD, EMAIL, NAME)
 *		    팝업관련함수  (POPUP)
 *		    기타(입력제한,공백제거)
 * 버   전 : 1.0.0 // 2012-04-26 // 최초 작성 
 *-------------------------------------------------------------------*/
try{
	if(navigator.appVersion.indexOf("MSIE")&&(navigator.appName.indexOf("Opera")==-1)){ 
		document.execCommand("BackgroundImageCache",false,true);
	}
}catch(err){
		
}

function cmBindKeyDownSrch(table){
	var inputs = table.getElementsByTagName('input');
	if (inputs.length != 0) {
		if(!inputs[0].form) return;
		var frm = inputs[0].form;
		var srchBtn = null;
		var objArr = new Array();
		for(var i =0; i < frm.elements.length; i++){
			var obj = frm.elements[i];
			if (obj.style.display == 'none' || obj.style.visibility == 'hidden') {
				continue;
			}
			if (obj.hasAttribute('disabled')) {
				continue;
			}
			if (obj.hasAttribute('class') && obj.getAttribute('class').indexOf('search-btn') != -1) {
				srchBtn = obj;
			}
			
			if (obj.nodeName.toLowerCase() == 'input') {
				var type = obj.getAttribute('type');
				if (type == 'button' || type == 'hidden' || type == 'submit' || type == 'image') {
					continue;
				} else {
					objArr[objArr.length] = obj;
				}
			} else {
				objArr[objArr.length] = obj;
			}
		}
		if (srchBtn) {
			if (srchBtn.onclick) {
				for(var j =0; j < objArr.length; j++){
					
					var obj = objArr[j];
					if (obj) {
					var userkeydown = obj.onkeydown;
					if (userkeydown) {
						obj.onkeydown = new Function("e", "("+userkeydown+")(e);var keyCode = 0; if(e){keyCode=e.which;}else{keyCode=event.keyCode;} if(keyCode == 13){("+srchBtn.onclick+")(e);}");
					} else {
						obj.onkeydown = function(e){var keyCode = 0; if(e){keyCode=e.which;}else{keyCode=event.keyCode;} if(keyCode == 13){srchBtn.click();}};
					}
					}
				}
			}
		}
	}
}
function cmBindFocus(obj) {
	if (obj == null || obj == undefined) return;
	if (obj.style.display == 'none' || obj.style.visibility == 'hidden') return;
	if (obj.hasAttribute('readonly') || obj.hasAttribute('disabled')) return;
	var useronfocus = obj.onfocus;
	var useronblur	= obj.onblur;
	if (useronfocus) {
		obj.onfocus = new Function("e", "this.style.border = '1px solid #b85c00'; ("+useronfocus+")(e);");
	} else {
		obj.onfocus = function(e){this.style.border = '1px solid #b85c00';};
	}
	if (useronblur) {
		obj.onblur = new Function("e", "this.style.border = '1px solid #ccccff'; ("+useronblur+")(e);");
	} else {
		obj.onblur = function(e){this.style.border = '1px solid #ccccff';};
	}
}

function cmBindKeyPress(obj) {
	if (obj == null || obj == undefined) return;
	if (obj.style.display == 'none' || obj.style.visibility == 'hidden') return;
	if (obj.hasAttribute('readonly') || obj.hasAttribute('disabled')) return;
	
	var chkType = null;
	var useronkeypress = obj.onkeypress;
	if (obj.hasAttribute('chkType')) {
		chkType = obj.getAttribute('chkType');
	}
	
	if (chkType == 'num') {
		if (useronkeypress) {
			obj.onkeypress = new Function("e", "("+useronkeypress+")(e); return cmNumOnly(e);");
		} else {
			obj.onkeypress = function(e){cmNumOnly(e);};
		}
		//obj.style.textAlign = 'right';
		obj.style.imeMode	= 'disabled';
	} else if (chkType == 'alnum') {
		if (useronkeypress) {
			obj.onkeypress = new Function("e", "("+useronkeypress+")(e); return cmAlnumOnly(e);");
		} else {
			obj.onkeypress = function(e){cmAlnumOnly(e);};
		}
		obj.style.imeMode	= 'disabled';
	} else if (chkType == 'alpha') {
		if (useronkeypress) {
			obj.onkeypress = new Function("e", "("+useronkeypress+")(e); return cmAlphaOnly(e);");
		} else {
			obj.onkeypress = function(e){cmAlphaOnly(e);};
		}
		obj.style.imeMode	= 'disabled';
	} else if (chkType == 'date') {
		if (useronkeypress) {
			obj.onkeypress = new Function("e", "("+useronkeypress+")(e); return cmDateOnly(e);");
		} else {
			obj.onkeypress = function(e){cmDateOnly(e);};
		}
		obj.style.imeMode	= 'disabled';
	}
}

function cmYTCaresInit() {
	var frms = document.forms;
	for (var f = 0; f < frms.length; f++) {
		var frm = frms[f];
		for(var i =0; i < frm.elements.length; i++){
			var obj = frm.elements[i];
			var nodeName = obj.nodeName;
			var type	 = null;
			try {
				if (obj.hasAttribute('type')) {
					type = obj.getAttribute('type');
				}
				if (nodeName.toLowerCase() == 'input') {
					if (type == 'text') {
						cmBindKeyPress(obj);
					}
					
					if (type == 'text' || type == 'password') {
						cmBindFocus(obj);
					}
				} else if (nodeName.toLowerCase() == 'textarea') {
					cmBindFocus(obj);
				}
			} catch (err) {
			}
			
		}
	}
	
	var tabs = document.getElementsByTagName('table');
	for (var t = 0; t < tabs.length; t++) {
		var table = tabs[t];
		try {
		if (table.hasAttribute('class')) {
			if (table.getAttribute('class').indexOf('ytcares-search') != -1) {
				//검색영역인 경우
				cmBindKeyDownSrch(table);
			} else if (table.getAttribute('class').indexOf('ytcares-list') != -1) {
				//리스트
				if (cmChkIE()) {
					var trs = (table.getElementsByTagName('tbody')[0]).childNodes;
					for(var r = 0; r < trs.length; r++) {
						
						if (trs[r].nodeName.toLowerCase() == 'tr') {
							if (trs[r].getElementsByTagName('th').length != 0) continue;
						
						if (r % 2 == 1) {
							//trs[r].style.backgroundColor = '#ffffff';
							trs[r].setAttribute('style', trs[r].getAttribute('style')+';background-color:#ffffff;');
							//trs[r].setAttribute('class', trs[r].getAttribute('class')+' tr-bgcolor-odd');
						} else {
							//trs[r].style.backgroundColor = '#f5f5ff';
							trs[r].setAttribute('style', trs[r].getAttribute('style')+';background-color:#FAFAFF;');
							//trs[r].setAttribute('class', trs[r].getAttribute('class')+' tr-bgcolor-even');
						}
						
						var usermouseover = trs[r].onmouseover;
						if (usermouseover){
							trs[r].onmouseover = new Function('('+usermouseover+')(); this.style.backgroundColor = "#FFFFEE";');//#fffcf8
						} else {
							trs[r].onmouseover = function(e) {this.style.backgroundColor = '#FFFFEE';};
						}
						var usermouseout = trs[r].onmouseout;
						if (usermouseout){
							if (r % 2 == 1) {
								trs[r].onmouseout = new Function('('+usermouseout+')(); this.style.backgroundColor = "#ffffff";');
							} else {
								trs[r].onmouseout = new Function('('+usermouseout+')(); this.style.backgroundColor = "#FAFAFF";');
							}
						} else {
							if (r % 2 == 1) {
								trs[r].onmouseout = function(e) {this.style.backgroundColor = '#ffffff';};
							} else {
								trs[r].onmouseout = function(e) {this.style.backgroundColor = '#FAFAFF';};
							}
						}
					}
					}
				}
			}
		}
		}catch(err) {
		}
	}
}

/*-------------------------------------------------------------------
 * 설   명 : 폼유효성 체크 ( 필수항목, MaxLength, MaxByte, chkType (hasAttribute사용)
 * 인자값 : formName
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function cmChkForm2(formName){
	if (formName == undefined || formName == null ||'' == formName) return false;
	var frm = null;
	if ((typeof formName == 'object') && (formName.nodeName.toLowerCase() == 'form')) {
		frm = formName;
	} else if (typeof formName == 'string') {
		frm = eval("document." + formName);
	}
	if(frm){
		for(var i =0;i<frm.elements.length; i++){
			var obj = frm.elements[i];
			if (obj.value != '') {
				if (obj.nodeName.toLowerCase() != 'input' || obj.getAttribute('type') != 'file') {
					obj.value = obj.value.replace(/^\s+/, '').replace(/\s+$/g, '');
				}
			}
			try {
			var errmsg = '';
			if (obj.hasAttribute('errmsg')) {
				errmsg = obj.getAttribute('errmsg');
			}
			if(obj.hasAttribute('required')){
					if(obj.value==""||obj.value==null){
					alert((errmsg == ''?'该项目为必填项':errmsg)); //필수 입력항목입니다.
					if (obj.style.display != 'none' && obj.style.visibility != 'hidden') {
						obj.focus();
					}
					return false;
				}
			}
			
			if (obj.value != null && obj.value != '') {
				if(obj.hasAttribute('maxlength')){
					var len = obj.getAttribute('maxlength');
					if(len != undefined && len != null && len != ''){
						if(obj.value.length>len){
							alert((errmsg == ''?'已超出输入范围':errmsg)); //입력가능 길이를 초과하였습니다.
							if (obj.style.display != 'none' && obj.style.visibility != 'hidden') {
								obj.select();
							}
							return false;
						}
					}
				}
				if(obj.hasAttribute('maxbyte')){
					var bytes = obj.getAttribute("maxbyte");
					if (bytes != undefined && bytes != null && bytes != ''){
						if(cmAL32Len(obj.value) > bytes){
							alert((errmsg == ''?'已超出可输入字段':errmsg)); //입력가능 바이트를 초과하였습니다.
							if (obj.style.display != 'none' && obj.style.visibility != 'hidden') {
								obj.select();
							}
							return false;
						}
					}
				}
				if(obj.hasAttribute('chkType')){
					var chkType = obj.getAttribute('chkType');
					
					if(chkType=="num"){
						if(!/^[0-9]+$/.test(obj.value)){
							alert((errmsg == ''?'请输入数字':errmsg)); //숫자만 입력해 주십시오.
							if (obj.style.display != 'none' && obj.style.visibility != 'hidden') {
								obj.select();
							}
							return false;
						}
					} else if(chkType=="alnum"){
						if(!/^[.a-zA-Z0-9-]+$/.test(obj.value)){
							alert((errmsg == ''?'请输入数字或英文字母':errmsg)); //영어 혹은 숫자만 입력해 주십시오.
							if (obj.style.display != 'none' && obj.style.visibility != 'hidden') {
								obj.select();
							}
							return false;
						}
					} else if(chkType=="alpha"){
						if(!/^[a-zA-Z]+$/.test(obj.value)){
							alert((errmsg == ''?'请输入英文字母':errmsg)); //영어만 입력해 주십시오.
							if (obj.style.display != 'none' && obj.style.visibility != 'hidden') {
								obj.select();
							}
							return false;
						}
					} else if(chkType=='date') {
						var isDate = false;
						if (/^[0-9]{8}$/.test(obj.value)) {
							isDate = true;
						} else if (/^[0-9]{4}[^0-9]{1}[0-9]{2}[^0-9]{1}[0-9]{2}[^0-9]?$/.test(obj.value)) {
							isDate = true;
						} else {
							
							//var date = new Date(obj.value);
							//
							//if (Object.prototype.toString.call(date) == '[object Date]' && date.toString() != 'Invalid Date') {
								//isDate = true;
							//}
						}
						
						if (!isDate) {
							alert((errmsg == ''?'请输入日期':errmsg)); //날짜 형식으로 입력해 주십시오.
							if (obj.style.display != 'none' && obj.style.visibility != 'hidden') {
								obj.select();
							}
							return false;
						}
					} else {
						if (chkType.charAt(0) == '/' && chkType.substr(chkType.length -1) == '/') {
							var regexp = eval(chkType);
							if (Object.prototype.toString.call(regexp) == '[object RegExp]') {
								if(!regexp.test(obj.value)) {
									alert((errmsg == ''?'该字母包含了非法字符，请重新输入':errmsg)); //입력 가능한 형식에 맞지 않습니다.
									if (obj.style.display != 'none' && obj.style.visibility != 'hidden') {
										obj.select();
									}
									return false;
								}
							}
						}
					}
				}
			}
			}catch(err){}
		}
	} return true;
}

/**
 * <pre>
 * 구매상세정보표시
 * 파라미터로 전달된 구매정보를 팝업으로 표시
 * 구매정보에 대한 권한문제는 서비스에서 체크
 * </pre>
 * @param {String} prchs_seq_no 구매일련번호
 * @return {void}
 */
function cmOpenPrchsDetail(prchs_seq_no) {
	
	var frm		= document.createElement('form');
	frm.setAttribute('name', '_ytcares_form_');
	frm.setAttribute('action', '/CmUserService/userSelectPrchsDetail.do');
	frm.setAttribute('method', 'post');
	frm.setAttribute('target', 'prchsDetailWin');
	
	var hidden	= document.createElement('input');
	hidden.setAttribute('type',		'hidden');
	hidden.setAttribute('name',		'prchs_seq_no');
	hidden.setAttribute('value',	prchs_seq_no);

	frm.appendChild(hidden);

	var body = document.getElementsByTagName('body')[0];
	body.appendChild(frm);

	var win = cmOpenPopup('', 'prchsDetailWin', 800, 450, 'no');
	document._ytcares_form_.submit();
	try {
		win.focus();
	}catch(err){
		
	}
	
	body.removeChild(frm);
}

/*-------------------------------------------------------------------
 * 설   명 : NAVIGATOR객체에서 OS정보취득 
 * 인자값 : 없음
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function cmChkXp()
{
	var agent = window.navigator.userAgent;
	if(agent.indexOf("MSIE")!=-1&& agent.indexOf("5.1") !=-1)
		return true; //SP1
	else
		return false;
}
function cmChkXPSP2() // OS정보 취득 (XP 서비스팩2) 
{
	var tmp_MSIE=window.navigator.userAgent.indexOf("MSIE");
	if(tmp_MSIE && window.navigator.userAgent.indexOf("SV1") > tmp_MSIE){
		return true;     //SP2
	}else{
		return false;
	}
}
function cmChkIE7() // 브라우저 정보 취득 ( IE7.0 )
{
	var agent = window.navigator.userAgent;
	if(agent.indexOf("MSIE 7")!= -1)
		return true;
	else
		return false;
}
function cmChkIE8() // 브라우저 정보 취득 ( IE8.0 )
{
	var agent = window.navigator.userAgent;
	if(agent.indexOf("MSIE 8")!= -1)
		return true;
	else
		return false;
}
function cmChkIE9() // 브라우저 정보 취득 ( IE9.0 )
{
	var agent = window.navigator.userAgent;
	if(agent.indexOf("MSIE 9.0")!= -1){
		alert("true");
		return true;
	}else alert("false");return false;
	
}
function cmChkIE() {
	var agent = window.navigator.userAgent;
	if(agent.indexOf("MSIE")!= -1)
		return true;
	else
		return false;
}
/*********************************************** 팝업생성 및 조작관련 ***********************************************/ 
function cmOpenPopup(sURL, sWindowName, w, h, sScroll) {
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
function openNameWindow(vUrl, vName, vWidth, vHeight, sScroll)	{//인스턴스이름	있는 창	열기.
	var	mdWindow = null;
	var	x	=	(screen.width	-	vWidth)/2;
	var	y	=	(screen.height - vHeight)/2;
	var	opt;
	if (sScroll ==	"" ||	sScroll ==	null)	sScroll = 0;
	opt	=			"width=" + vWidth	+	",height=" + vHeight;
	opt	=	opt	+	",scrollbars=" + sScroll	+	",toolbar=0,menubars=0,locationbar=0,historybar=0,statusbar=0";
	opt	=	opt	+	",outerWidth=" + vWidth	+	",outerHeight="	+	vHeight	+	",resizable=0";
	opt	=	opt	+	",left=" + x + ",top=" + y;
	opt	=	opt	+	",channelmode=no,	titlebar=no";
	var	mdWindow = window.open(vUrl, vName,	opt, false);
	if(!mdWindow){
		alert("Please disable popup blocking!");
		return false;
	}
	mdWindow.focus();
}
/*-------------------------------------------------------------------
 * 설   명 : 브라우저의 크기를 X와 Y로 조절한다.
 * 인자값 : X : WIDTH값 , Y : HEIGHT값 (INT X,Y) 
 * 반환값 : Void
 *-------------------------------------------------------------------*/
function cmWinReSize(x,y){
	// 스크롤 없애기
	document.body.style.overflow='hidden';
	var foxHeight = 80;
	var ieHeight  = 60;
	var ie7Height = 80;
	var ie8Height = 90;
	if (navigator.userAgent.indexOf("MSIE")!=-1)
	{
		if(cmChkIE7()) {window.resizeTo(x, y + ie7Height);}
		else if(cmChkIE8()){window.resizeTo(x, y + ie8Height);}
		else {window.resizeTo(x, y + ieHeight);}
	}
	else{
		window.resizeTo(winWidth, winHeight + foxHeight);
	}
}
/*********************************************** 데이터체크를위한함수 ************************************************/
/*-------------------------------------------------------------------
 * 설   명 : 입력값의 바이트 길이 리턴
 * 인자값 : 입력받은 문자열
 * 반환값 : BYTE LENGTH
 *-------------------------------------------------------------------*/
function cmAL32Len(obj){
	var ch, size = 0;
	for (x = 0; x<obj.length; x++){
		ch = obj.charCodeAt(x);
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

/*-------------------------------------------------------------------
 * 설   명 : 입력받은파라미터값에서 공백을 제거함
 * 인자값 : 입력받은문자열
 * 반환값 : String
 *-------------------------------------------------------------------*/
function cmTrimStr(obj){

	var chkVal = obj.value;
	chkVal = chkVal.replace(/^\s+/, ""); /*공백문자는 ""로 치환 */
	chkVal = chkVal.replace(/\s+$/g, ""); /*\s = space , g = global match */
	return chkVal;
}
/*-------------------------------------------------------------------
 * 설   명 : Enter,숫자,BackSpace,탭키만 입력되도록 키이벤트무효화시킴.
 * 인자값 : INPUT BOX에서 입력되는 값
 * 반환값 : Boolean
 *-------------------------------------------------------------------*/
function cmNumOnly(e){
	var evCode=(window.netscape)?e.which:event.keyCode;
	if (!(evCode==0||evCode==8||evCode==9||(evCode>=48&&evCode<=57)||(evCode==13))){
		if(window.netscape){
			e.preventDefault(); 
		}else{
			event.returnValue=false;
		}
	}
}
/*-------------------------------------------------------------------
 * 설   명 : Enter,영문,BackSpace,탭키만 입력되도록 키이벤트무효화시킴.(cmYTCaresInit 내부사용)
 *-------------------------------------------------------------------*/
function cmAlphaOnly(e){
	var evCode=(window.netscape)?e.which:event.keyCode;
		if (!(evCode==0||evCode==8||evCode==9||(evCode>=65&&evCode<=90)||(evCode>=97&&evCode<=122)||(evCode==13))){
		if(window.netscape){
			e.preventDefault(); 
		}else{
			event.returnValue=false;
		}
	}
}
/*-------------------------------------------------------------------
 * 설   명 : Enter,숫자,영문,BackSpace,탭키만 입력되도록 키이벤트무효화시킴.(cmYTCaresInit 내부사용)
 *-------------------------------------------------------------------*/
function cmAlnumOnly(e){
	var evCode=(window.netscape)?e.which:event.keyCode;
		if (!(evCode==0||evCode==8||evCode==9||(evCode>=48&&evCode<=57)||(evCode>=65&&evCode<=90)||(evCode>=97&&evCode<=122)||(evCode==13))){
		if(window.netscape){
			e.preventDefault(); 
		}else{
			event.returnValue=false;
		}
	}
}
/*-------------------------------------------------------------------
 * 설   명 : Enter,숫자,하이픈,슬래쉬,도트,BackSpace,탭키만 입력되도록 키이벤트무효화시킴.(cmYTCaresInit 내부사용)
 *-------------------------------------------------------------------*/
function cmDateOnly(e){
	var evCode=(window.netscape)?e.which:event.keyCode;
	if (!(evCode==0||evCode==8||evCode==9||(evCode>=45&&evCode<=57)||(evCode==13))){
		if(window.netscape){
			e.preventDefault(); 
		}else{
			event.returnValue=false;
		}
	}
}
/************************************************** 기타공통함수 ***************************************************/
/* 설  명  : InputBox OnFocus시 BorderStyle변경*/
function cmInfcs(obj) {
	obj.style.border='1px solid #7a3d00';
	//(id).style.padding='3px 0 3px 5px';
}
/* 설  명  : InputBox OnBlur시 BorderStyle변경*/
function cmOutfcs(obj) {
	obj.style.border='1px solid #ccccff';
	//(id).style.padding='3px 0 3px 5px';
}
/* 설  명  : 개체ID값을 전달받아 개체속성을 디스플레이속성을 BLOCK으로 지정 */
function cmOnTooltip(id) {
	document.getElementById(id).style.display='block';
}
/* 설  명  : 개체ID값을 전달받아 개체속성을 디스플레이속성을 NONE으로 지정 */
function cmOffTooltip(id) {
	document.getElementById(id).style.display='none';
}

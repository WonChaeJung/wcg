<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core"%>
<%@taglib prefix="spring" 	uri="http://www.springframework.org/tags"%>
<jsp:include page="/page/common/cmSiteInclude_f.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/jquery-ui.min.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/style.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath}/css/ytcares-admin.css"/>
<script type="text/javascript" src="${ctxPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/jquery-ui-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctxPath}/js/commonUtil.js"></script>

<script type="text/javascript">
function clearSrchForm() {
	$('#srch_mcode_cd').val('');
	clearMcodeInfo();
}

function clearMcodeInfo() {
	//input요소 초기화
	$('#mcode_cd').val('');
	$('#mcode_nm').val('');
	$('#rmrks').val('');

	//버튼 초기화
	$('#mcode_cd').attr('readonly', false);
	$('#modMcode').attr('disabled', true).hide();
	$('#delMcode').attr('disabled', true).hide();
	$('#addMcode').attr('disabled', false).show();

	//하단 리스트에서 헤더를 제외한 ul태그의 자식 모두 제거하여 ul을 empty태그로 만듬
	$('div.ytcares-list>ul').not('.header').children().remove();
}

function doAjaxMcode(qData, isAsynch) {
	$.ajax({
		url: '${ctxPath}/YTCaresAjaxUpdate.do',
		asynch:isAsynch,
		cache:false,
		dataType: 'json',
		type:'POST',
		data:qData,
		success: function(json){
			return json.length;
		},
		error:function(jqXHR, textStatus, err) {
			alert(err);
			return 0;
		}
	});
}

function checkDcodeDup(obj) {
	//상세코드 input요소의 값취득
	var dcode = obj.value;
	if (dcode != '') {
		var isBreak = false;
		
		$('.ytcares-list>.item>li:nth-child(2)').each(function() {
			//ytcares-list클래스의 ul.item 자식노드인 두번째 li요소에 대하여 다음을 수행
			
			if(isBreak) return;
			if (this.parentNode.id != $(obj).parents('ul.item').prop('id')) {
				//해당 요소가 이벤트가 발생한 input 요소가 아닌 경우
				
				if ($(this).find('input').length != 0) {
					//li 자식노드에 input요소가 있는 경우(수정,삭제,추가)
					if ($(this).find('input:first').val() == dcode) {
						//해당 input의 값이 입력한 상세코드와 동일한 경우
						isBreak = true;
					}
				} else {
					//텍스트로 표시되고 있는 경우
					if ($(this).text() == dcode) {
						isBreak = true;
					}
				}

				if(isBreak) {
					alert('<spring:message code="error.overlap.code" text="상세코드는 중복될 수 없습니다."/>');
					obj.focus();
					return;
				}
			}
		});
	}
}
function addDcode() {
	if ($('#mcode_cd').val() == '') {
		alert('<spring:message code="error.require.select.master.code" text="마스터코드를 선택해 주십시오."/>');
		return false;
	}
	
	var $ul = $('.ytcares-list ul.item:empty').eq(0);
	var date = new Date();
	var html = new Array();

	html[html.length] = '<ul id="'+$('#mcode_cd').val()+'-'+date.getTime()+'" class="item">';
	html[html.length] = '<li><input type="hidden" name="sqlAction" value="insert"/></li>\n';
	html[html.length] = '<li class="w50" style="text-align:center;" initval=""><input type="text" name="dcode_cd" value="" onblur="checkDcodeDup(this)" size="5" maxlength="15" maxbyte="15" style="width:45px;text-align:center" required="required"/></li>\n';
	html[html.length] = '<li class="w90" style="text-align:left;" initval=""><input type="text" name="code_nm1" value="" size="5" maxlength="15" maxbyte="100" style="width:85px;" required="required"/></li>\n';
	html[html.length] = '<li class="w90" style="text-align:center;" initval=""><input type="text" name="code_nm2" value="" size="5" maxlength="100" maxbyte="100" style="width:85px;"/></li>\n';
	html[html.length] = '<li class="w90" style="text-align:center;" initval=""><input type="text" name="code_nm3" value="" size="5" maxlength="100" maxbyte="100" style="width:85px;"/></li>\n';
	html[html.length] = '<li class="w90" style="text-align:center;" initval=""><input type="text" name="code_nm4" value="" size="5" maxlength="100" maxbyte="100" style="width:85px;"/></li>\n';
	html[html.length] = '<li class="w90" style="text-align:center;" initval=""><input type="text" name="code_nm5" value="" size="5" maxlength="100" maxbyte="100" style="width:85px;"/></li>\n';
	html[html.length] = '<li class="w90" style="text-align:center;" initval=""><input type="text" name="code_nm6" value="" size="5" maxlength="100" maxbyte="100" style="width:85px;"/></li>\n';
	html[html.length] = '<li class="w50" style="text-align:center;" initval=""><input type="text" name="order_no" value="" size="3" maxlength="3" style="width:35px;text-align:center" required="required"/></li>\n';
	html[html.length] = '<li style="float:right;padding-right:10px;"><img class="dcode_delete" src="<spring:message code="img.board.delete" text="삭제"/>" onclick="deleteDcode(this)" mode="delete"/></li>\n';
	html[html.length] = '</ul>';
	if ($ul.length == 0) {
		$('.ytcares-list').append(html.join(''));
	} else {
		$ul.replaceWith(html.join(''));
	}
}

function modifyDcode(dcodeCd, btnValue) {
	var $ul = $('#' + $('#mcode_cd').val()+'-'+dcodeCd);
	if ($ul.length == 1) {
		var $sqlAction	= $ul.find('li:first input[name=sqlAction]').eq(0);
		
		var $dcode_cd	= $ul.find('li').eq(1);
		var $code_nm1	= $ul.find('li').eq(2);
		var $code_nm2	= $ul.find('li').eq(3);
		var $code_nm3	= $ul.find('li').eq(4);
		var $code_nm4	= $ul.find('li').eq(5);
		var $code_nm5	= $ul.find('li').eq(6);
		var $code_nm6	= $ul.find('li').eq(7);
		var $order_no	= $ul.find('li').eq(8);

		var $updButton	= $ul.find('li').eq(9).find('img').eq(0);
		var $delButton	= $ul.find('li').eq(9).find('img').eq(1);
		
		if ($updButton.attr('mode') == 'update') {
			$ul.find('li:not(:first):not(:last)').removeClass('deleted-item');
			var dcode = $dcode_cd.text();
			//수정모드 진입인 경우
			if ($dcode_cd.find('input').length != 0) {
				dcode = $dcode_cd.attr('initval');
			}
			
			$dcode_cd.html('<input type="text" name="dcode_cd" value="'+dcode+'" size="5" maxbyte="15" style="width:45px;text-align:center" readonly="readonly"/>');
			$code_nm1.html('<input type="text" name="code_nm1" value="'+$code_nm1.text()+'" size="5" maxlength="100" maxbyte="100" style="width:75px;" required="required"/>');
			$code_nm2.html('<input type="text" name="code_nm2" value="'+$code_nm2.text()+'" size="5" maxlength="100" maxbyte="100" style="width:75px;"/>');
			$code_nm3.html('<input type="text" name="code_nm3" value="'+$code_nm3.text()+'" size="5" maxlength="100" maxbyte="100" style="width:75px;"/>');
			$code_nm4.html('<input type="text" name="code_nm4" value="'+$code_nm4.text()+'" size="5" maxlength="100" maxbyte="100" style="width:75px;"/>');
			$code_nm5.html('<input type="text" name="code_nm5" value="'+$code_nm5.text()+'" size="5" maxlength="100" maxbyte="100" style="width:75px;"/>');
			$code_nm6.html('<input type="text" name="code_nm6" value="'+$code_nm6.text()+'" size="5" maxlength="100" maxbyte="100" style="width:75px;"/>');
			$order_no.html('<input type="text" name="order_no" value="'+$order_no.text()+'" size="3" maxlength="3" style="width:35px;text-align:center"/>');

			$delButton.attr('mode', 'delete');
			$delButton.prop('src', '<spring:message code="img.board.delete" text="삭제"/>');
			$updButton.attr('mode', 'cancel');
			$updButton.prop('src', '<spring:message code="img.board.cancel" text="취소"/>');

			$sqlAction.val('update');
		} else {
			$dcode_cd.html($dcode_cd.attr('initval'));
			$code_nm1.html($code_nm1.attr('initval'));
			$code_nm2.html($code_nm2.attr('initval'));
			$code_nm3.html($code_nm3.attr('initval'));
			$code_nm4.html($code_nm4.attr('initval'));
			$code_nm5.html($code_nm5.attr('initval'));
			$code_nm6.html($code_nm6.attr('initval'));
			$order_no.html($order_no.attr('initval'));
			$updButton.attr('mode', 'update');
			$updButton.prop('src', '<spring:message code="img.board.modify" text="수정"/>');

			$sqlAction.val('normal');
		}
	}
}

function deleteDcode(dcodeCd) {
	
	if (typeof dcodeCd == 'object') {
		$(dcodeCd).parents('ul.item').replaceWith('<ul class="item"></ul>');
		return;
	}
	
	var $ul = $('#' + $('#mcode_cd').val()+'-'+dcodeCd);
	
	if ($ul.length == 1) {
		var $sqlAction	= $ul.find('li:first input[name=sqlAction]').eq(0);
		
		var $dcode_cd	= $ul.find('li').eq(1);
		var $code_nm1	= $ul.find('li').eq(2);
		var $code_nm2	= $ul.find('li').eq(3);
		var $code_nm3	= $ul.find('li').eq(4);
		var $code_nm4	= $ul.find('li').eq(5);
		var $code_nm5	= $ul.find('li').eq(6);
		var $code_nm6	= $ul.find('li').eq(7);
		var $order_no	= $ul.find('li').eq(8);

		var $updButton	= $ul.find('li').eq(9).find('img').eq(0);
		var $delButton	= $ul.find('li').eq(9).find('img').eq(1);
		
		if ($delButton.attr('mode') == 'delete') {
			$ul.find('li:not(:first):not(:last)').addClass('deleted-item');
			
			$dcode_cd.html('<input type="text" name="dcode_cd" value="'+$dcode_cd.attr('initval')+'" size="5" maxbyte="15" style="width:45px;text-align:center" readonly="readonly"/>');
			$code_nm1.html($code_nm1.attr('initval'));
			$code_nm1.append('<input type="hidden" name="code_nm1" value="'+$code_nm1.attr('initval')+'"/>');
			$code_nm2.html($code_nm2.attr('initval'));
			$code_nm2.append('<input type="hidden" name="code_nm2" value="'+$code_nm2.attr('initval')+'"/>');
			$code_nm3.html($code_nm3.attr('initval'));
			$code_nm3.append('<input type="hidden" name="code_nm3" value="'+$code_nm3.attr('initval')+'"/>');
			$code_nm4.html($code_nm4.attr('initval'));
			$code_nm4.append('<input type="hidden" name="code_nm4" value="'+$code_nm4.attr('initval')+'"/>');
			$code_nm5.html($code_nm5.attr('initval'));
			$code_nm5.append('<input type="hidden" name="code_nm5" value="'+$code_nm5.attr('initval')+'"/>');
			$code_nm6.html($code_nm6.attr('initval'));
			$code_nm6.append('<input type="hidden" name="code_nm6" value="'+$code_nm6.attr('initval')+'"/>');
			$order_no.html($order_no.attr('initval'));
			$order_no.append('<input type="hidden" name="order_no" value="'+$order_no.attr('initval')+'"/>');
			
			$updButton.attr('mode', 'update');
			$updButton.prop('src', '<spring:message code="img.board.modify" text="수정"/>');
			$delButton.attr('mode', 'cancel');
			$delButton.prop('src', '<spring:message code="img.board.cancel" text="취소"/>');

			$sqlAction.val('delete');
		} else {
			$ul.find('li:not(:first):not(:last)').removeClass('deleted-item');
			$dcode_cd.html($dcode_cd.attr('initval'));
			$code_nm1.html($code_nm1.attr('initval'));
			$code_nm2.html($code_nm2.attr('initval'));
			$code_nm3.html($code_nm3.attr('initval'));
			$code_nm4.html($code_nm4.attr('initval'));
			$code_nm5.html($code_nm5.attr('initval'));
			$code_nm6.html($code_nm6.attr('initval'));
			$order_no.html($order_no.attr('initval'));
			
			$delButton.attr('mode', 'delete');
			$delButton.prop('src', '<spring:message code="img.board.delete" text="삭제"/>');

			$sqlAction.val('normal');
		}
	}
}

function rgstDcodeList() {
	if ($('#mcode_cd').val() == '') {
		alert('<spring:message code="error.require.select.master.code" text="마스터코드를 선택해 주십시오."/>');
		return;
	}
	
	if (!cmChkForm2('dcodeForm')) return;
	
	var $sqlCnt = $('.ytcares-list .item input[name="sqlAction"]').not('[value="normal"]');
	if ($sqlCnt.length == 0) {
		alert('<spring:message code="error.require.change.file" text="변경된 항목이 존재하지 않습니다."/>');
		return;
	}

	if (confirm('<spring:message code="confirm.insert" text="등록하시겠습니까?"/>')) {
		//파라미터의 개수를 맞추기 위해 normal인 항목은 폼에서 제외
		$('.ytcares-list .item input[name="sqlAction"][value="normal"]').remove();
		
		var $f = $('form[name=dcodeForm]:first');
		$f.prop('action', '/AdCodeService/adminUpdateDCodeList.do');
	
		$f.submit();
	}
}

$(document).ready(function(){
	$('#modMcode').attr('disabled', true).hide();
	$('#delMcode').attr('disabled', true).hide();
	
	//검색용 마스터코드 체인지이벤트
	$('#srch_mcode_cd').change(function(){
		var $sqlCnt = $('.ytcares-list .item input[name="sqlAction"]').not('[value="normal"]');
		if ($sqlCnt.length != 0) {
			if (!confirm('<spring:message code="confirm.code.update.skip" text="상세코드를 편집중에 있습니다. 계속 진행하시겠습니까?"/>')) return;
		}
		
		clearMcodeInfo();
		$('form[name=dcodeForm]:first :hidden[name=mcode_cd]:first').val($(this).val());
		
		if ($(this).val() != '') {
			refDcodeList($(this).val());
		}
	});

	$('#addMcode').click(function(){
		if (!cmChkForm2('srchForm')) return;
		
		var mcode_cd = $('#mcode_cd').val();
		var mcode_nm = $('#mcode_nm').val();
		var rmrks	 = $('#rmrks').val();
		if ($('#srch_mcode_cd option[value="'+mcode_cd+'"]:first').length == 0) {
			$('#srch_mcode_cd').append('<option value="'+mcode_cd+'" mcode_nm="'+mcode_nm+'" rmrks="'+rmrks+'">'+mcode_cd+' - '+ mcode_nm +'</option>');
	
			$('#srch_mcode_cd').prop('selectedIndex', $('#srch_mcode_cd option').length - 1);
			$('#modMcode').attr('disabled', false).show();
			$('#delMcode').attr('disabled', false).show();
			$('#addMcode').attr('disabled', true).hide();
			
			doAjaxMcode({
				queryId:'mcode.insertMCode',
				mcode_cd:mcode_cd,
				mcode_nm:mcode_nm,
				rmrks:rmrks
			}, false);
		} else {
			alert('<spring:message code="error.overlap.code.name" text="동일한 코드명이 이미 존재합니다."/>');
			return;
		}
		
	});

	$('#modMcode').click(function(){
		if (!cmChkForm2('srchForm')) return;
		
		var mcode_cd = $('#mcode_cd').val();
		var mcode_nm = $('#mcode_nm').val();
		var rmrks	 = $('#rmrks').val();
		var $opt = $('#srch_mcode_cd option[value="'+mcode_cd+'"]:first');
		if ($opt.length == 1) {
			$opt.attr('mcode_nm', mcode_nm);
			$opt.attr('rmrks', rmrks);

			$opt.html(mcode_cd + ' - ' + mcode_nm);

			var result = doAjaxMcode({
				queryId:'mcode.updateMCode',
				mcode_cd:mcode_cd,
				mcode_nm:mcode_nm,
				rmrks:rmrks
			}, false);

			if (result != 0) {
				alert('<spring:message code="msg.success.update" text="수정되었습니다."/>');
			}
		}
	});

	$('#delMcode').click(function(){
		var mcode_cd = $('#mcode_cd').val();
		$('#srch_mcode_cd option[value="'+mcode_cd+'"]:first').remove();
		clearMcodeInfo();

		var result = 0;
		result = doAjaxMcode({
			queryId:'mcode.deleteMCode',
			mcode_cd:mcode_cd
		}, false);
		if (result != 0) {
			result = doAjaxMcode({
				queryId:'code.deleteDcodeList',
				mcode_cd:mcode_cd
			}, false);

			if (result != 0) {
				alert('<spring:message code="msg.success.delete" text="삭제되었습니다."/>');
			}
		}
	});

	if (eval('${!empty param.mcode_cd}')) {
		$('#srch_mcode_cd').val('${param.mcode_cd}');
		refDcodeList('${param.mcode_cd}');
	}
});

function refDcodeList(mcode) {
	var $opt = $('#srch_mcode_cd option[value="'+mcode+'"]:first');
	$('#mcode_cd').val($opt.val());
	$('#mcode_nm').val($opt.attr('mcode_nm'));
	$('#rmrks').val($opt.attr('rmrks'));

	$('#mcode_cd').attr('readonly', true);

	$('#modMcode').attr('disabled', false).show();
	$('#delMcode').attr('disabled', false).show();
	$('#addMcode').attr('disabled', true).hide();
	
	$.ajax({
		url: '${ctxPath}/YTCaresAjax.do',
		asynch:false,
		cache:false,
		dataType: 'json',
		type:'POST',
		data:{
			queryId:'code.selectCodeListAjax',
			mcode_cd:mcode
		},
		success: function(json) {
			var html = new Array();
			for (var i = 0; i < json.length; i++) {
				html[html.length] = '<ul id="'+mcode+'-'+json[i].dcode_cd+'" class="item">';
				html[html.length] = '<li><input type="hidden" name="sqlAction" value="normal"/></li>\n';
				html[html.length] = '<li class="w50" style="text-align:center;" initval="'+json[i].dcode_cd+'">'+json[i].dcode_cd+'</li>\n';
				html[html.length] = '<li class="w80" style="text-align:left;" initval="'+json[i].code_nm1+'">'+json[i].code_nm1+'</li>\n';
				html[html.length] = '<li class="w80" style="text-align:left;" initval="'+json[i].code_nm2+'">'+json[i].code_nm2+'</li>\n';
				html[html.length] = '<li class="w80" style="text-align:left;" initval="'+json[i].code_nm3+'">'+json[i].code_nm3+'</li>\n';
				html[html.length] = '<li class="w80" style="text-align:left;" initval="'+json[i].code_nm4+'">'+json[i].code_nm4+'</li>\n';
				html[html.length] = '<li class="w80" style="text-align:left;" initval="'+json[i].code_nm5+'">'+json[i].code_nm5+'</li>\n';
				html[html.length] = '<li class="w80" style="text-align:left;" initval="'+json[i].code_nm6+'">'+json[i].code_nm6+'</li>\n';
				html[html.length] = '<li class="w40" style="text-align:center;" initval="'+json[i].order_no+'">'+json[i].order_no+'</li>\n';
				html[html.length] = '<li style="float:right;padding-right:10px;"><img src="<spring:message code="img.board.modify"/>" width="43" onclick="modifyDcode(\''+json[i].dcode_cd+'\')" mode="update"/><img src="<spring:message code="img.board.delete"/>" width="43" class="dcode_delete" onclick="deleteDcode(\''+json[i].dcode_cd+'\')" mode="delete"/></li>\n';
				html[html.length] = '</ul>';
			}
			if (json.length < 10) {
				for (var i = 0; i < (10 - json.length);i++){
					html[html.length] = '<ul class="item"></ul>';
				}
			}
			$('div.ytcares-list>ul:gt(0)').remove();
			$('div.ytcares-list').append(html.join(''));
		},
		error:function(jqXHR, textStatus, err) {
			return false;
		}
	});
}
</script>
</head>
<body>
<jsp:include page="/page/common/cmSiteTopMenu_f.jsp"/>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0" style="padding-top:20px;">
	<tr>
		<td width="150" align="center" valign="top">
			<jsp:include page="/page/common/cmAdminLeftMenu_f.jsp"></jsp:include>
		</td>
		<td width="748" valign="top">
			<form name="srchForm" action="/AdCodeService/adminSelectDCodeList.do">
			<input type="hidden" name="admin_menu" value="${param.admin_menu}"/>
			<div class="ytcares-search">
				<ul class="search-condition" style="height: 30px;">
					<li class="code-lable"><spring:message code="lbl.master.code" text="마스터코드"/></li>
					<li class="">
						<select id="srch_mcode_cd" name="srch_mcode_cd">
							<option value=""><spring:message code="lbl.select.master.code" text="마스터코드를 선택하세요"/></option>
						<c:forEach var="mcode" items="${mcodeList}">
							<option value="${mcode.mcode_cd}" mcode_nm="${mcode.mcode_nm}" rmrks="${mcode.rmrks}">${mcode.mcode_cd} - ${mcode.mcode_nm}</option>
						</c:forEach>
						</select>
					</li>
				</ul>
				<ul class="search-condition" style="height: 30px;">
					<li class="code-lable"><spring:message code="lbl.code" text="코드"/></li>
					<li class=""><input type="text" id="mcode_cd" name="mcode_cd" value="" required="required" size="5" maxlength="15" maxbyte="15" ime-mode="disabled" style="ime-mode:disabled;"/></li>
				
					<li class="code-lable"><spring:message code="lbl.code.name" text="코드명"/></li>
					<li class=""><input type="text" id="mcode_nm" name="mcode_nm" value="" required="required" size="10" maxlength="100" maxbyte="100"/></li>
					<li class="code-lable"><spring:message code="lbl.direction" text="설명"/></li>
					<li class=""><input type="text" id="rmrks" name="rmrks" value="" size="20" style="width: 350px;" maxlength="500" maxbyte="500" /></li>

					<li class="crud-btn">
						<img id="modMcode" src='<spring:message code="img.board.modify" text="수정"/>' style="cursor: pointer;"/>
					</li>
					<li class="crud-btn">
						<img id="delMcode" src='<spring:message code="img.board.delete" text="삭제"/>' style="cursor: pointer;"/>
					</li>
					<li class="clear-btn">
						<img src='<spring:message code="img.btn.clear" text="클리어"/>' style="cursor: pointer;" onclick="clearSrchForm()"/>
					</li>
					<li class="crud-btn">
						<img id="addMcode" src='<spring:message code="img.btn.add" text="추가"/>' style="cursor: pointer;"/>
					</li>
				</ul>
			</div>
			</form>
			<form name="dcodeForm" method="post" action="/AdCodeService/adminUpdateDCodeList.do">
			<input type="hidden" name="admin_menu"	value="${param.admin_menu}"/>
			<input type="hidden" name="mcode_cd"	value="${param.mcode_cd}"/>
			<div class="ytcares-list" style="width:748px; padding-top: 2px;border:1px;">
				<ul class="header" style="height: 34px;line-height:30px;">
					<li class="w50"><spring:message code="lbl.code" text="코드"/></li>
					<li class="w80"><spring:message code="lbl.code.name" text="코드명"/>1</li>
					<li class="w80"><spring:message code="lbl.code.name" text="코드명"/>2</li>
					<li class="w80"><spring:message code="lbl.code.name" text="코드명"/>3</li>
					<li class="w80"><spring:message code="lbl.code.name" text="코드명"/>4</li>
					<li class="w80"><spring:message code="lbl.code.name" text="코드명"/>5</li>
					<li class="w80"><spring:message code="lbl.code.name" text="코드명"/>6</li>
					<li class="w60"><spring:message code="lbl.number" text="순서"/></li>
					<li class="w100" style="float:right;padding:4px 4px 0 0;"><img src='<spring:message code="img.btn.detail.add" text="상세추가"/>' onclick="addDcode()" style="cursor: pointer;"></li>
				</ul>
				<c:forEach var="i" begin="1" end="10">
				<ul class="item"></ul>
				</c:forEach>
			</div>
			</form>
			<img src='<spring:message code="img.btn.insert" text="등록"/>' style="float:right;margin-right:5px;margin-top:5px;" onclick="rgstDcodeList()"/>
		</td>
	</tr>
</table>
<jsp:include page="/page/common/cmSiteBottom_f.jsp"/>
<ytcares:msg/>
</body>
</html>
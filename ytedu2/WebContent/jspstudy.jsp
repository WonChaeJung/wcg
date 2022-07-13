<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function factorial(n){
		if(n != 0){
			return n * arguments.callee(n - 1);
		}
		return 1;
	}
	function closure(init){
		var cnt = init;
		return function(){return ++cnt;};
	}
	function test(){
		var str = 'alert("eval함수")';
		eval(str);
	}
	function ch4_07(){
		var obj = function(base, height){return base * height / 2;}
		alert(obj(5,2));
		//obj = 0;
		alert(obj);
	}
	function nameSort(){
		var nameArr = [];
		var list = document.getElementsByClassName('name');
		var str = "";

		for(var i=0; i < list.length; i++){
			nameArr.push(list.item(i).value);
			nameArr.sort();
		}
		str += "<table border='0' align='center'><tr>";
		str += "<td align='center'><input type='button' value='이름' onclick='nameSort()'/></td></tr>";
		for(var i=0; i<nameArr.length; i++){
			str += "<tr><td width='100%'><input type='hidden' class='name' value='"+nameArr[i]+"'>"+nameArr[i]+"</td></tr>";
		}
		str += "</table>";
		var divName = document.getElementById('div_name');
		divName.innerHTML = str;
	}
	function ageSort(){
		var ageArr = [];
		var list = document.getElementsByClassName('age');
		var str = "";

		for(var i=0; i < list.length; i++){
			ageArr.push(list.item(i).value);
			ageArr.sort();
		}
		str += "<table border='0' align='center'><tr>";
		str += "<td align='center'><input type='button' value='나이'/></td></tr>";
		for(var i=0; i<ageArr.length; i++){
			str += "<tr><td width='100%' align='center'>"+ageArr[i]+"</td></tr>";
		}
		str += "</table>";
		var divage = document.getElementById('div_age');
		divage.innerHTML = str;
	}
	function sortTest(){
		var nameTbl = document.getElementById('nameTable');
		var nmTbTbody = nameTbl.firstChild;
		alert(nmTbTbody.nodeName);
	}
	function sel2Add(){
		var sel1 = document.getElementById('sel1');
		var sel2 = document.getElementById('sel2');
		//셀렉트박스 태그 아래의 자식노드취득
		var sel1_child = sel1.childNodes;
		//셀렉트박스의 선택된값의 인댁스값
		var sel1_val = sel1.selectedIndex;
		for(var i=0; i<sel1_child.length; i++){
			if(sel1_child.item(i).selected == true){
				sel2.appendChild(sel1_child.item(i));
			}
		}
	}
	function sel1Add(){
		var sel1 = document.getElementById('sel1');
		var sel2 = document.getElementById('sel2');
		//셀렉트박스 태그 아래의 자식노드취득
		var sel2_child = sel2.childNodes;
		//셀렉트박스의 선택된값의 인댁스값
		var sel2_val = sel2.selectedIndex;
		for(var i=0; i<sel2_child.length; i++){
			if(sel2_child.item(i).selected == true){
				sel1.appendChild(sel2_child.item(i));
			}
		}
	}
	function sel2copy(){
		var sel1 = document.getElementById('sel1');
		var sel2 = document.getElementById('sel2');
		//셀렉트박스 태그 아래의 자식노드취득
		var sel1_child = sel1.childNodes;
		//셀렉트박스의 선택된값의 인댁스값
		var sel1_val = sel1.selectedIndex;
		for(var i=0; i<sel1_child.length; i++){
			if(sel1_child.item(i).selected == true){
				var clone = sel1_child.item(i).cloneNode(true);
				sel2.appendChild(clone);
			}
		}
	}
	function sel1mov(){
	var selValue1 = document.getElementById('sel1').value;
	var div1 = document.getElementById('divSel1');
	var div2 = document.getElementById('divSel2');
	alert(selValue1);
	}
	function modeChange(chkbox){
		//var chk = document.getElementsByName('modeChk');
		//alert(chk);
		if (chkbox.checked) {
			var tr = chkbox.parentNode.parentNode;
			if (tr.nodeName.toLowerCase() == 'tr') {
				var tds = tr.getElementsByTagName('td');
				var val = tds[1].firstChild.nodeValue;
				tds[1].innerHTML = '<input type="text" value="'+val+'" style="width:100%"/>';
				val = tds[2].firstChild.nodeValue;
				tds[2].innerHTML = '<input type="text" value="'+val+'" style="width:100%"/>';
				val = tds[4].firstChild.nodeValue;
				tds[4].innerHTML = '<input name="gender" type="radio" value="1" '+((val=='남')?'checked="checked"':'')+'/>남<input name="gender" type="radio" value="2" '+((val=='여')?'checked="checked"':'')+'/>여';
			}
		} else {
		}
		/*
		for(var i=1; i<chk.length; i++){
			if(chk.item(i).checked){
				var parentNd = chk.item(i).parentNode;
				alert(parentNd.nodeName);
				while(parentNd){
					alert(parentNd.nextSibling.firstChild.setAttrbute());
					parentNd = parentNode.nextSibling;
				}
			}else{}
			
			//alert(chk.item(i).checked);
		}
		*/
	}
	function localTime(){
		var localTime = new Date();
		var HH = localTime.getHours();
		var MM = localTime.getMinutes();
		var SS = localTime.getSeconds();

		var str = HH;
		str += (MM<10?':0':':')+MM;
		str += (SS<10?':0':':')+SS;
		document.getElementById('time').innerHTML=str;
		setTimeout("localTime()",1000);
	}
</script>
</head>
<body onload="localTime()">
	<table width="970" border="1">
		<tr>
			<td width="300">
				<table>
					<tr>
						<td>
							<div id="divSel1">
								<select id="sel1" multiple="multiple" style="width:280px; height: 185px">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>	
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="button" onclick="sel2Add()" value="↓추가"/>
							<input type="button" onclick="sel2copy()" value="↓복사"/>
							<input type="button" onclick="sel1Add()" value="↑추가"/>
							<input type="button" onclick="sel1copy()" value="↑복사"/>
						</td>
					</tr>
					<tr>
						<td>
							<div id="divSel2">
								<select id="sel2" multiple="multiple"  style="width:280px; height: 185px">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
									<option value="F">F</option>
								</select>
							</div>	
						</td>
					</tr>
				</table>
			</td>
			<td>
				<table width="100" align="center" border="0">
					<tr>
						<td align="center">
							<table id="nameTable" border="0" align="center">
								<tr><td align="center"><input type="button"  value="이름" onclick="sortTest()"/></td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="홍길동"/>홍길동</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="임꺽정"/>임꺽정</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="이순신"/>이순신</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="에디슨"/>에디슨</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="마징가"/>마징가</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="강감찬"/>강감찬</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="김정호"/>김정호</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="김두환"/>김두환</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="정약용"/>정약용</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="장영실"/>장영실</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="허영생"/>허영생</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="캣츠미"/>캣츠미</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="내물왕"/>내물왕</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="류수영"/>류수영</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="맹자"/>맹자</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="최춘명"/>최춘명</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="심봉사"/>심봉사</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="임정규"/>임정규</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="카이룬"/>카이룬</td></tr>
								<tr><td width="100%"><input type="hidden" class="name" name="" value="이원호"/>이원호</td></tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td>
				<table width="100">
					<tr>
						<td align="center">
							<table id="ageTable" border="0" align="center">
								<tr><td align="center"><input type="button"  value="나이" onclick="ageSort()"/></td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="35"/>35</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="23"/>23</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="26"/>26</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="44"/>44</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="19"/>19</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="65"/>65</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="21"/>21</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="20"/>20</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="49"/>49</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="20"/>20</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="40"/>40</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="32"/>32</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="26"/>26</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="33"/>33</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="44"/>44</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="18"/>18</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="70"/>70</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="22"/>22</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="38"/>38</td></tr>
								<tr><td align="center" width="100%"><input type="hidden" class="age" name="" value="49"/>49</td></tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td>
				<table width="470">
					<tr valign="top" height="100%">
						<td>
							<table width="100%" align="center" border="1">
								<tr>
									<td align="center" ><input type="checkbox" name="modeChk" onclick="modeChange()"/></td>
									<td align="center" >번호</td>
									<td align="center" >이름</td>
									<td align="center" >나이</td>
									<td align="center" >성별</td>
									<td align="center" >삭제</td>
								</tr>
								<tr>
									<td align="center" width=""><input type="checkbox" name="modeChk" onclick="modeChange(this)"/></td>
									<td align="center" width="">111</td>
									<td align="center" width="" >jung</td>
									<td align="center" width="" >28</td>
									<td align="center" width="" >남</td>
									<td align="center" width="" ><input type="button" value="삭제" onclick="delMode()"/></td>
								</tr>
								<tr>
									<td align="center" ><input type="checkbox" name="modeChk" onclick="modeChange()"/></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ><input type="button" value="삭제" onclick="delMode()"/></td>
								</tr>
								<tr>
									<td align="center" ><input type="checkbox" name="modeChk" onclick="modeChange()"/></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ><input type="button" value="삭제" onclick="delMode()"/></td>
								</tr>
								<tr>
									<td align="center" ><input type="checkbox" name="modeChk" onclick="modeChange()"/></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ><input type="button" value="삭제" onclick="delMode()"/></td>
								</tr>
								<tr>
									<td align="center" ><input type="checkbox" name="modeChk" onclick="modeChange()"/></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ><input type="button" value="삭제" onclick="delMode()"/></td>
								</tr>
								<tr>
									<td align="center" ><input type="checkbox" name="modeChk" onclick="modeChange()"/></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ></td>
									<td align="center" ><input type="button" value="삭제" onclick="delMode()"/></td>
								</tr> 
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="4" width="970">
				<table width="100%" border="1">
					<tr>
						<td>
							<div id="time"></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
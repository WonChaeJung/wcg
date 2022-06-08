/**
 * 최종수정일 : 7.0.0.0-20141124-14
 * ibsheetObject object class.
 * @id ibsheetObject
 * @class ibsheetObject
 * @constructor
 * @alias ibsheetObject.prototype
 * @return {ibsheetObject}
 * 
 */
function ibsheetObject(){};
/**
* GetActionMenu :  컬럼 팝업과 같이 특정 컬럼에 값을 바꾸기 위해 사용하는 메뉴팝업이 아니라 전반적으로 어떤 Action을 처리하기 위해 사용하는 메뉴를 설정하거나 확인한다
*  @example 
*  // 메뉴만 설정					
*  mySheet.GetActionMenu();					
* @returns {String(Object)}  설정된 팝업메뉴 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetActionMenu = function()			{};
	
	/**
* SetActionMenu :  컬럼 팝업과 같이 특정 컬럼에 값을 바꾸기 위해 사용하는 메뉴팝업이 아니라 전반적으로 어떤 Action을 처리하기 위해 사용하는 메뉴를 설정하거나 확인한다
*  @param {String} 설정할 팝업메뉴 문자열
*  @param {String} 설정할 팝업메뉴 코드 문자열 Default=텍스트 문자열
*  @example 
*  // 메뉴만 설정					
*  mySheet.SetActionMenu(입력|행복사|*-|행삭제|Clear|엑셀다운로드);					
*  // 메뉴와 코드 설정					
*  var Text = 입력|행복사|*-|행삭제|Clear|엑셀다운로드;					
*  var Code = Ins|Copy||Del|Clear|Download;					
*  mySheet.SetActionMenu(Text, Code);					
*  // JSON 객체 설정					
*  var Menu = [					
*  {Text: 입력, Code: Ins},					
*  {Text: 행복사, Code: Copy},					
*  {Text: *-},					
*  {Text: 행삭제, Code: Delete},					
*  {Text: Clear, Code: Clear},					
*  {Text: 엑셀다운로드, Code: Download}					
*  ];					
*  mySheet.SetActionMenu(Menu);					
*  // JSON 객체 계층구조설정					
*  var Menu = [					
*  {Text: 입력, Code: Ins, 					
*    Items : [					
*    { Text: 첫행입력, Code: FIns},					
*    { Text: 마지막행입력, Code: LIns}					
*  ]					
*  },					
*  {Text: 행복사, Code: Copy},					
*  {Text: *-},					
*  {Text: 행삭제, Code: Delete},					
*  {Text: Clear, Code: Clear},					
*  {Text: 엑셀다운로드, Code: Download}					
*  ];					
*  mySheet.SetActionMenu(Menu);					
*/
	ibsheetObject.prototype.SetActionMenu = function(Text, Code)			{};
	
	/**
* GetAllowCheck :  사용자가 체크박스의 값 변경시, 값의 변경을 수용할 지의 여부를 설정하거나 확인한다
*  @example 
*  // 체크박스의 값을 확인한다.				
*  mySheet.GetAllowCheck(); 				
* @returns {Boolean}  설정된 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetAllowCheck = function()		{};
	
	/**
* SetAllowCheck :  사용자가 체크박스의 값 변경시, 값의 변경을 수용할 지의 여부를 설정하거나 확인한다
*  @param {Boolean} 값의 변경 수용여부. Default=true
*  @example 
*  // 체크박스의 값의 변경을 하지 않는다.				
*  mySheet.SetAllowCheck(false); 				
*/
	ibsheetObject.prototype.SetAllowCheck = function(Val)		{};
	
	/**
* AllowEvent4CheckAll :  전체선택 기능을 실행할 때 OnChange Event를 실행할지 여부를 지정한다
*  @param {Boolean} OnChange Event 발생여부
*  @example 
*  // 전체선택시 이벤트 발생안함				
*  sheetObj.AllowEvent4CheckAll(0);				
* @returns None.
*/
	ibsheetObject.prototype.AllowEvent4CheckAll = function(Val)			{};
	
	/**
* GetAllowExpand :  OnBeforeExpand 이벤트가 발생한 직후에 실제로 트리를 펼치거나 접혀지는 것을 막고싶은 경우 사용한다
*  @example 
*  mySheet.GetAllowExpand();				
* @returns {Boolean}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetAllowExpand = function()		{};
	
	/**
* SetAllowExpand :  OnBeforeExpand 이벤트가 발생한 직후에 실제로 트리를 펼치거나 접혀지는 것을 막고싶은 경우 사용한다
*  @param {Boolean} 트리의 펼쳐짐 여부
*  @example 
*  function mySheet_OnBeforeExpand(Row,Expand) {				
*  if(Row == 1 && Expand == 2) {				
*  mySheet.SetAllowExpand(0);				
*  alert(1 행에서는 펼칠 수 있지만 접을 수 없습니다.);				
*  }				
*  }				
*/
	ibsheetObject.prototype.SetAllowExpand = function(Expand)		{};
	
	/**
* GetAutoRowHeight :  데이터 행의 높이를 자동으로 조정할지 여부를 확인하거나 설정한다
*  @example 
*  // 설정값 확인				
*  mySheet.GetAutoRowHeight();				
* @returns {Boolean}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetAutoRowHeight = function()		{};
	
	/**
* SetAutoRowHeight :  데이터 행의 높이를 자동으로 조정할지 여부를 확인하거나 설정한다
*  @param {Boolean} 데이터행의 높이 자동조정 여부 Default=1
*  @example 
*  // 높이를 자동으로 조정하지 않고, 한줄 높이로 고정한다.				
*  mySheet.SetAutoRowHeight(0);				
*/
	ibsheetObject.prototype.SetAutoRowHeight = function(Flag)		{};
	
	/**
* GetAutoSumPosition :  전체 합계/평균의 표시 위치를 설정하거나 확인한다
*  @example 
*  //합계 행을 상단에 표시				
*  mySheet.GetAutoSumPosition();				
* @returns {Integer}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetAutoSumPosition = function()		{};
	
	/**
* SetAutoSumPosition :  전체 합계/평균의 표시 위치를 설정하거나 확인한다
*  @param {Integer} 합계행의 위치 값
*  @example 
*  //합계 행을 상단에 표시				
*  mySheet.SetAutoSumPosition(0);				
*/
	ibsheetObject.prototype.SetAutoSumPosition = function(Position)		{};
	
	/**
* GetBasicImeMode :  Edit 가능한 셀에 포커스가 들어갔을 때 한/영 키보드 상태를 설정하거나 확인한다
*  @example 
*  //기본 한글 입력 키보드 상태 사용				
*  mySheet.GetBasicImeMode();				
* @returns {Integer}  설정값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetBasicImeMode = function()		{};
	
	/**
* SetBasicImeMode :  Edit 가능한 셀에 포커스가 들어갔을 때 한/영 키보드 상태를 설정하거나 확인한다
*  @param {Integer} ImeMode 값
*  @example 
*  //기본 한글 입력 키보드 상태 사용				
*  mySheet.SetBasicImeMode(1);				
*/
	ibsheetObject.prototype.SetBasicImeMode = function(Val)		{};
	
	/**
* GetCellAlign :  셀에 대한 정렬을 설정하거나 확인한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  // 해당 셀의 정렬 값을 확인한다.				
*  var align = mySheet.GetCellAlign(1, 1);				
*  alert(셀의 정렬 값은  + align + 입니다.);				
* @returns {String}  현재 정렬 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCellAlign = function(Row, Col)		{};
	
	/**
* SetCellAlign :  셀에 대한 정렬을 설정하거나 확인한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {String} 정렬 값
*  @example 
*  // 해당 셀을 가운데 정렬로 변경한다.				
*  mySheet.SetCellAlign(1, 1, Center);				
*/
	ibsheetObject.prototype.SetCellAlign = function(Row, Col, Align)		{};
	
	/**
* GetCellBackColor :  셀의 배경색을 설정하거나 확인한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  // 설정된 색상 값을 확인한다.				
*  var color = mySheet.GetCellBackColor(1,1);				
*  alert(셀의 색상 값은  + color + 입니다.);				
* @returns {String}  설정된 색상값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetCellBackColor = function(Row, Col)		{};
	
	/**
* SetCellBackColor :  셀의 배경색을 설정하거나 확인한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {String} 색상 값
*  @example 
*  //헤더행의 첫번째 셀의 배경색을 빨간색으로 변경				
*  mySheet.SetCellBackColor(0, 0, #FF0000);       // WebColor				
*  //데이터행의 셀의 배경색을 헤더행의 첫번째 셀의 배경색과 동일하게 설정				
*  mySheet.SetCellBackColor(1,0, mySheet.GetCellBackColor(0, 0));				
*  //헤더행의 SaveName이 amt인 셀의 배경색을 빨간색으로 변경				
*  mySheet.SetCellBackColor(0,amt, #FF0000);				
*/
	ibsheetObject.prototype.SetCellBackColor = function(Row, Col, Color)		{};
	
	/**
* CellComboItem :  특정 셀의 Combo 항목만 다른 경우 Combo항목을 개별 설정한다
*  @param {Long} 특정 셀의 Row Index
*  @param {Long / String} 특정 셀의 Column Index 또는 SaveName
*  @param {Object} 변경할 Combo item 내용을 구분자 |로 연결된 문자열을 만들어 ComboCode와 ComboText로 값을 설정
*  @example 
*  //특정 셀의 콤보 항목 바꾸기				
*  var info = {ComboCode:사장|과장|대리,ComboText:A|B|C};				
*  mySheet.CellComboItem(1,2,info);				
*/
	ibsheetObject.prototype.CellComboItem = function(Row, Col,info)			{};
	
	/**
* GetCellEditable :  셀의 Edit 가능 여부를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  //1행 2컬럼이 Edit 가능이면 3컬럼도 Edit 가능으로 변경한다.				
*  if(mySheet.GetCellEditable(1, 2) == 1) { 				
*      mySheet.SetCellEditable(1, 3, 1); 				
*  }				
*/
	ibsheetObject.prototype.GetCellEditable = function(Row, Col)		{};
	
	/**
* SetCellEditable :  셀의 Edit 가능 여부를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {Boolean} 편집 가능 여부
*  @example 
*  //1행 2컬럼이 Edit 가능이면 3컬럼도 Edit 가능으로 변경한다.				
*  if(mySheet.GetCellEditable(1, 2) == 1) { 				
*      mySheet.SetCellEditable(1, 3, 1); 				
*  }				
* @returns {Boolean}  편집 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.SetCellEditable = function(Row, Col, Edit)		{};
	
	/**
* GetCellFont :  특정 셀 또는 영역의 글꼴, 크기, 글자색, 기울임, 볼드, 밑줄 등을 확인하거나 설정한다
*  @param {String} 폰트 속성
*  @param {Long} 영역 시작 셀의 Row Index
*  @param {Long / String} 영역 시작 셀의 Column Index 또는 SaveName
*  @param {Long} 영역 마지막 셀의 Row Index
*  @param {Long / String} 영역 마지막 셀의 Column Index 또는 SaveName
*  @example 
*  //글자크기가 10보다 큰 경우 9사이즈로 변경한다.				
*  if (mySheet.GetCellFont(FontSize, 2,1,2,1) >= 10) {				
*   mySheet.SetCellFont(FontSize, 2,1,2,1,9));				
*  }				
* @returns {Boolean / String}  설정한 속성 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCellFont = function(Flag, Row1, Col1, Row2, Col2)		{};
	
	/**
* SetCellFont :  특정 셀 또는 영역의 글꼴, 크기, 글자색, 기울임, 볼드, 밑줄 등을 확인하거나 설정한다
*  @param {String} 폰트 속성
*  @param {Long} 영역 시작 셀의 Row Index
*  @param {Long / String} 영역 시작 셀의 Column Index 또는 SaveName
*  @param {Long} 영역 마지막 셀의 Row Index
*  @param {Long / String} 영역 마지막 셀의 Column Index 또는 SaveName
*  @param {Boolean / String} 폰트속성에 설정할 값
*  @example 
*  //영역에 글자 Bold 설정				
*  mySheet.SetCellFont(FontBold, 1,1,2,3,1) ;				
*  //영역에 글자 취소선 설정				
*  mySheet.SetCellFont(FontStrike, 1,1,2,3,1) ;				
*/
	ibsheetObject.prototype.SetCellFont = function(Flag, Row1, Col1, Row2, Col2, Value)		{};
	
	/**
* GetCellFontBold :  특정 셀의 글자 Bold(굵은 글자체) 여부를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  //특정 셀의 Bold 처리 여부를 확인한다. 				
*  alert(mySheet.GetCellFontBold(1, 1));				
* @returns {Boolean}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCellFontBold = function(Row, Col)		{};
	
	/**
* SetCellFontBold :  특정 셀의 글자 Bold(굵은 글자체) 여부를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {Boolean} Bold 여부
*  @example 
*  //특정 셀에 글자를 Bold 처리한다.				
*  mySheet.SetCellFontBold(1, 1,1)				
*/
	ibsheetObject.prototype.SetCellFontBold = function(Row, Col, Bold)		{};
	
	/**
* GetCellFontColor :  셀의 글자 색을 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  //금액이 0보다 작으면 숫자는 붉은색으로 표시한다.				
*  if(mySheet.GetCellValue(1, 2) < 0 ) {				
*      mySheet.SetCellFontColor(1,2,#FF0000) ;				
*  //금액이 0보다 크면 숫자는 검은색으로 표시한다.				
*  } else {				
*      mySheet.SetCellFontColor(1,2, #000000);				
*  }				
* @returns {String}  설정된 색상값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetCellFontColor = function(Row, Col)		{};
	
	/**
* SetCellFontColor :  셀의 글자 색을 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {String} 색상 값
*  @example 
*  //금액이 0보다 작으면 숫자는 붉은색으로 표시한다.				
*  if(mySheet.GetCellValue(1, 2) < 0 ) {				
*      mySheet.SetCellFontColor(1,2,#FF0000) ;				
*  //금액이 0보다 크면 숫자는 검은색으로 표시한다.				
*  } else {				
*      mySheet.SetCellFontColor(1,2, #000000);				
*  }				
* @returns None 
*/
	ibsheetObject.prototype.SetCellFontColor = function(Row, Col, Color)		{};
	
	/**
* GetCellFontItalic :  특정 셀의 글자 이탤릭(기울임 글자체) 여부를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  //특정 셀의 이탤릭체 여부를 확인한다. 				
*  alert(mySheet.GetCellFontItalic(1, 1));				
* @returns {Boolean}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCellFontItalic = function(Row, Col)		{};
	
	/**
* SetCellFontItalic :  특정 셀의 글자 이탤릭(기울임 글자체) 여부를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {Boolean} 이탤릭 여부
*  @example 
*  //특정 셀에 글자를 이탤릭체로 설정한다.				
*  mySheet.SetCellFontItalic(1, 1,1)				
*/
	ibsheetObject.prototype.SetCellFontItalic = function(Row, Col, Italic)		{};
	
	/**
* GetCellFontName :  특정 셀에 대해 글자체를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  //글자체를 확인한다				
*  alert(mySheet.GetCellFontName(1, 1));				
* @returns {String}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCellFontName = function(Row, Col)		{};
	
	/**
* SetCellFontName :  특정 셀에 대해 글자체를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {String} 글자체
*  @example 
*  //글자체를 궁서체로 바꾼다.				
*  mySheet.SetCellFontName(1, 1, Gungsuh)				
*/
	ibsheetObject.prototype.SetCellFontName = function(Row, Col, FontName)		{};
	
	/**
* GetCellFontSize :  특정 셀에 대해 글자 크기를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  // 셀의 글자 크기를 확인한다.				
*  alert(mySheet.GetCellFontSize(1,1));				
* @returns {Integer}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCellFontSize = function(Row, Col)		{};
	
	/**
* SetCellFontSize :  특정 셀에 대해 글자 크기를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {Integer} 설정하고자 하는 글자크기
*  @example 
*  // 글자크기를 20px로 바꾼다.				
*  mySheet.SetCellFontSize(1, 1, 20)				
*  // SaveName이 sName 인 셀의 글자크기를 20으로 바꾼다.				
*  mySheet.SetCellFontSize(1,sName, 20);				
*/
	ibsheetObject.prototype.SetCellFontSize = function(Row, Col, FontSize)		{};
	
	/**
* GetCellFontStrike :  특정 셀 글자에 취소선을 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  // 셀의 글자 취소선 설정여부를 확인한다.				
*  alert(mySheet.GetCellFontStrike(1,1));				
* @returns {Integer}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCellFontStrike = function(Row, Col)		{};
	
	/**
* SetCellFontStrike :  특정 셀 글자에 취소선을 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {Integer} 설정하고자 하는 글자크기
*  @example 
*  // 글자 취소선을 설정한다.				
*  mySheet.SetCellFontStrike(1, 1, 1)				
*  // SaveName이 sName 인 셀의 글자에 취소선을 설정한다.				
*  mySheet.SetCellFontStrike(1,sName, 1);				
*/
	ibsheetObject.prototype.SetCellFontStrike = function(Row, Col, FontStrike)		{};
	
	/**
* GetCellFontUnderline :  셀의 글자의 밑줄을 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  //금액이 0보다 작으면 언더라인 표시한다.				
*  if(mySheet.GetCellValue(1, 2) < 0 ) {				
*      mySheet.SetCellFontUnderline(1, 2, 1);				
*  //금액이 0보다 크면 언더라인을 표시하지 않는다.				
*  } else {				
*      mySheet.SetCellFontUnderline(1, 2, 0);				
*  }				
* @returns {Boolean}  현재 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCellFontUnderline = function(Row, Col)		{};
	
	/**
* SetCellFontUnderline :  셀의 글자의 밑줄을 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {Boolean} 밑줄 여부
*  @example 
*  //금액이 0보다 작으면 언더라인 표시한다.				
*  if(mySheet.GetCellValue(1, 2) < 0 ) {				
*      mySheet.SetCellFontUnderline(1, 2, 1);				
*  //금액이 0보다 크면 언더라인을 표시하지 않는다.				
*  } else {				
*      mySheet.SetCellFontUnderline(1, 2, 0);				
*  }				
*/
	ibsheetObject.prototype.SetCellFontUnderline = function(Row, Col, Underline)		{};
	
	/**
* GetCellImage :  Type이 Image이거나 Image 속성을 사용한 경우 해당 셀의 이미지를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*   // 데이터 행을 신규 생성 하고 셀의 이미지와 문자열을 변경한다.				
*    var Row=mySheet.DataInsert();				
*  mySheet.GetCellImage(Row, 1);				
* @returns {String}  설정된 이미지 경로 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCellImage = function(Row, Col)		{};
	
	/**
* SetCellImage :  Type이 Image이거나 Image 속성을 사용한 경우 해당 셀의 이미지를 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {String} 실제 이미지 경로
*  @example 
*   // 데이터 행을 신규 생성 하고 셀의 이미지와 문자열을 변경한다.				
*    var Row=mySheet.DataInsert();				
*  mySheet.SetCellImage(Row, 1, ../image/myImage1.jpg);				
*    // 1컬럼의 SaveName이 btnAction인 경우				
*    mySheet.SetCellImage(Row ,btnAction, ../image/myImage1.jpg);				
*/
	ibsheetObject.prototype.SetCellImage = function(Row, Col, Image)		{};
	
	/**
* CellSaveName :  Row, Col 인자의 데이터 셀에 대한 SaveName을 확인 한다
*  @param {Number} 해당 셀의 Row Index
*  @param {Number} 해당 셀의 Column Index
*  @example 
*  function mySheet_OnClick(Row, Col, Value, CellX, CellY, CellW, CellH) {				
*  // 클릭한 셀의 SaveName을 확인한다.				
*  var saveName = mySheet.CellSaveName(Row, Col);				
*  }				
* @returns {String}  해당 셀의 SaveName 
*/
	ibsheetObject.prototype.CellSaveName = function(Row, Col)			{};
	
	/**
* CellSearchValue :  셀이 조회되었던 당시의 값을 확인한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  // 조회되었던 셀 값을 확인하고, 해당 셀 값을 원래 값으로 되돌린다.				
*  var OrgValue = mySheet.CellSearchValue(Row, Col);				
*  if(OrgValue != mySheet.GetCellValue(Row, Col)) {				
*      mySheet.SetCellValue(Row, Col, OrgValue);				
*  }				
* @returns {String}  조회당시 셀 값 
*/
	ibsheetObject.prototype.CellSearchValue = function(Row, Col)			{};
	
	/**
* GetCellVAlign :  셀 세로 정렬을 설정하거나 확인한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  // 특정 셀의 세로 정렬 설정을 확인한다.				
*  alert(mySheet.GetCellVAlign(1,1));				
* @returns {String}  세로 정렬 설정값 
*/
	ibsheetObject.prototype.GetCellVAlign = function(Row, Col)		{};
	
	/**
* SetCellVAlign :  셀 세로 정렬을 설정하거나 확인한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {String} 셀 세로 정렬 설정값 (top / middle / bottom)
*  @example 
*  // 특정 셀에 세로 정렬을 top으로 설정한다.				
*  mySheet.SetCellVAlign(1, 1, top);				
*  // 특정 셀에 세로 정렬을 bottom 으로 설정한다.				
*  mySheet.SetCellVAlign(1, 1,  bottom);				
*/
	ibsheetObject.prototype.SetCellVAlign = function(Row, Col, valign)		{};
	
	/**
* GetCellText :  셀의 값을 Format이 적용된 형태로 화면에 보여지는 값 그대로 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  //날짜 셀, 확인 값은 2011/07/15				
*  alert(mySheet.GetCellText(1,1)); 				
* @returns {String}  셀에 설정된 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCellText = function(Row, Col)		{};
	
	/**
* SetCellText :  셀의 값을 Format이 적용된 형태로 화면에 보여지는 값 그대로 확인하거나 설정한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {String} 셀에 설정할 값
*  @example 
*  //공백 설정				
*  mySheet.SetCellText(1, 0, " );              				
*  //날짜 셀에 값 설정				
*  mySheet.SetCellText(1, 1, 2011/07/15);				
*  //숫자 셀에 값 설정 				
*  mySheet.SetCellText(1, 2, 1,234,567);				
*  //콤보 셀에 콤보코드가 아닌 콤보텍스트 설정				
*  mySheet.SetCellText(1, 3, 원화); 				
*/
	ibsheetObject.prototype.SetCellText = function(Row, Col, Text)		{};
	
	/**
* GetCellValue :  셀에 값을 설정하거나 확인한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  //날짜 셀에 값 확인, 결과는 2011/07/15임				
*  alert(mySheet.GetCellValue(1, 4)); 				
* @returns {String}  셀에 설정된 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCellValue = function(Row, Col)		{};
	
	/**
* SetCellValue :  셀에 값을 설정하거나 확인한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long /String} 해당 셀의 Column Index 또는 SaveName
*  @param {String} 셀에 설정할 값
*  @param {Boolean} OnChange 이벤트 발생 여부 (Default=1)
*  @example 
*  //상태 셀을 삭제 상태로 설정				
*  mySheet.SetCellValue(1, 0, D);				
*  //CheckBox에 체크되도록 설정				
*  mySheet.SetCellValue(1, 1, 1); 				
*  //숫자 셀에 값 설정, 표시되는 값은 12,345임				
*  mySheet.SetCellValue(1, 2, 12345);				
*  //콤보 셀에 값 설정, 표시되는 값은 콤보 텍스트 임				
*  mySheet.SetCellValue(1, 3, 01); 				
*  //날짜 셀에 값 설정, 표시되는 값은 2011/07/15 임				
*  mySheet.SetCellValue(1, 4, 2011/07/15);				
*  //소수점 숫자 셀에 값 설정, 소수점 3자리이면 표시되는 값은 123.450 임				
*  // OnChange 이벤트 발생				
*  mySheet.SetCellValue(1,5, 123.450);				
*  // OnChange 이벤트 발생하지 않음 				
*  mySheet.SetCellValue(1,5, 123.450, 0); 				
*/
	ibsheetObject.prototype.SetCellValue = function(Row, Col, Value)		{};
	
	/**
* CheckAll :  CheckBox가 존재하는 컬럼의 모든 CheckBox를 전체 Check하거나 UnCheck 처리한다
*  @param {Long / String} 특정 컬럼의 Column Index 또는 SaveName
*  @param {Integer} 0 : 전체체크해제, 1 : 전체체크, 그외 : 이전값 반대
*  @param {Boolean} OnChange 이벤트 발생 여부 Default=1
*  @example 
*  // 모두 선택하기				
*  mySheet.CheckAll(1, 1);				
*  // 모두 선택 취소하기 				
*  mySheet.CheckAll(1, 0);       				
*/
	ibsheetObject.prototype.CheckAll = function(Col, Value, OnChangeEvent)			{};
	
	/**
* CheckedRows :  해당 컬럼에 존재하는 체크박스 중 체크된 행의 개수를 반환한다
*  @param {Long / String} 특정 컬럼의 Column Index 또는 SaveName
*  @example 
*  var RowCnt1 = mySheet.CheckedRows(1);				
*  alert(체크된 행의 개수는  + RowCnt1 + 개 입니다.);				
*  var RowCnt2 = mySheet.CheckedRows(chkData);				
*  alert(체크된 행의 개수는  + RowCnt2 + 개 입니다.);				
* @returns {Long}  특정 컬럼에 체크된 행의 개수
*/
	ibsheetObject.prototype.CheckedRows = function(Col)			{};
	
	/**
* CheckReverse :  특정 컬럼에 존재하는 체크박스에 체크된 것은 체크를 풀어주고, 체크되지 않은것은 체크한다
*  @param {Long / String} 특정 컬럼의 Column Index 또는 SaveName
*  @param {Boolean} 편집가능 불가능을 확인하여 편집가능일때만 변경한다. Default=0
*  @param {Boolean} 체크가 바뀔때 OnChange 이벤트를 발생할것인가 여부, Default=0
*  @example 
*  // 1컬럼의 체크를 반전한다.				
*  mySheet.CheckReverse(1);				
*  // Edit를 체크하고, Event를 발생시킨다.				
*  mySheet.CheckReverse(1, 1, 1);				
*/
	ibsheetObject.prototype.CheckReverse = function(Col, Editable, Event)			{};
	
	/**
* ClearHeaderCheck :  헤더의 모든 전체체크박스의 값을 언체크로 초기화 한다
*  @example 
*  // RemoveAll 호출전에 전체체크박스를 초기화 한다..				
*  mySheet.ClearHeaderCheck();				
*  mySheet.RemoveAll();				
*/
	ibsheetObject.prototype.ClearHeaderCheck = function()			{};
	
	/**
* ClearSelection :  마우스 드래그를 이용한 선택 영역을 초기화 한다
*  @example 
*  // 선택 영역을 초기화 한다.				
*  mySheet.ClearSelection()				
*/
	ibsheetObject.prototype.ClearSelection = function()			{};
	
	/**
* GetClipCopyMode :  문자열을 선택하고 Ctrl + C 를 하면 선택된 내용이 클립보드에 복사된다
*  @example 
*  mySheet.GetClipCopyMode();				
* @returns {Integer}  설정 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetClipCopyMode = function()		{};
	
	/**
* SetClipCopyMode :  문자열을 선택하고 Ctrl + C 를 하면 선택된 내용이 클립보드에 복사된다
*  @param {Integer} 복사 방법에 따른 설정값
*  @example 
*  // 포커스셀 값이나 선택셀 값 모두 복사 				
*  mySheet.SetClipCopyMode(0);				
*  // 포커스행 복사나 선택셀 값 모두 복사 				
*  mySheet.SetClipPasteMode(1); 				
* @returns None 
*/
	ibsheetObject.prototype.SetClipCopyMode = function(Mode)		{};
	
	/**
* GetClipPasteMode :  문자열을 선택하고 Ctrl + C 를 하면 선택된 내용이 클립보드에 복사된다
*  @example 
*  mySheet.GetClipPasteMode();				
* @returns {Integer}  설정 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetClipPasteMode = function()		{};
	
	/**
* SetClipPasteMode :  문자열을 선택하고 Ctrl + C 를 하면 선택된 내용이 클립보드에 복사된다
*  @param {Integer} 붙여넣기 방법에 따른 설정값
*  @example 
*  // 1개 셀에 붙이기 모드				
*  mySheet.SetClipPasteMode(0);				
*  // 여러개 셀에 붙이기 모드				
*  mySheet.SetClipPasteMode(1); 				
*/
	ibsheetObject.prototype.SetClipPasteMode = function(Mode)		{};
	
	/**
* GetColBackColor :  대상 컬럼 전체의 배경색을 설정하거나 확인한다
*  @param {Long /String} 특정 컬럼의 Column Index 또는 SaveName
*  @example 
*  // 2컬럼 배경색을 확인한다.				
*  mySheet.GetColBackColor(2);				
* @returns {String}  설정된 색상값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetColBackColor = function(Col)		{};
	
	/**
* SetColBackColor :  대상 컬럼 전체의 배경색을 설정하거나 확인한다
*  @param {Long /String} 특정 컬럼의 Column Index 또는 SaveName
*  @param {String} WebColor 색상 값
*  @example 
*  //컬럼 배경색을 회색으로 설정한다.				
*  mySheet.SetColBackColor(1, #ADADAD);				
*   //2컬럼 배경색을 1컬럼 배경색으로 설정한다.				
*  mySheet.SetColBackColor(2, mySheet.GetColBackColor(1));				
*/
	ibsheetObject.prototype.SetColBackColor = function(Col, Color)		{};
	
	/**
* GetColCondProperty :  숫자형 타입에서 특정 컬럼의 각 셀의 데이타값이 조건에 맞을경우 속성을 설정, 설정한 조건을 확인한다
*  @param {Long / String} 대상이 되는 컬럼 index 또는 SaveName
*  @example 
*  // 설정한 조건을 확인한다.				
*  mySheet.GetColCondProperty(13)				
* @returns {String}  설정한 조건 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetColCondProperty = function(Col)		{};
	
	/**
* SetColCondProperty :  숫자형 타입에서 특정 컬럼의 각 셀의 데이타값이 조건에 맞을경우 속성을 설정, 설정한 조건을 확인한다
*  @param {Long / String} 대상이 되는 컬럼 index 또는 SaveName
*  @param {String} 설정할 조건 (예:%d >1000)
*  @param {Object} 설정할 컬럼 속성
*  @example 
*  // 13번째 컬럼의 각 셀 데이터 값이 1000 보다 클경우 				
*  mySheet.SetColCondProperty(13,%d>1000,{BackColorT:#00ff00,FontColorT:#ffff00, EditT : false, BackColorF : #0000ff,FontColorF:#ffffff, EditF : true, CursorT:Pointer, CursorF:Default})				
*/
	ibsheetObject.prototype.SetColCondProperty = function(Col, Cond, Prop)		{};
	
	/**
* GetColEditable :  특정 컬럼의 Edit 가능 여부를 확인하거나 설정한다
*  @param {Long /String} 특정 컬럼의 Column Index 또는 SaveName
*  @example 
*  //5컬럼의 Edit 가능 여부를 확인한다.				
*  mySheet. GetColEditable (5);				
* @returns {Boolean}  Edit 가능 여부 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetColEditable = function(Col)		{};
	
	/**
* SetColEditable :  특정 컬럼의 Edit 가능 여부를 확인하거나 설정한다
*  @param {Long /String} 특정 컬럼의 Column Index 또는 SaveName
*  @param {Boolean} 특정컬럼의 Edit 가능 여부 (Set일때만 사용)
*  @example 
*  //5컬럼의 Edit 가능 여부를 불가로 설정한다.				
*  mySheet.SetColEditable(5,0);				
*  //5컬럼의 Edit 가능 여부를 가능으로 설정한다.				
*  mySheet. SetColEditable (5,1);				
*/
	ibsheetObject.prototype.SetColEditable = function(Col, Editable)		{};
	
	/**
* ColDelete :  특정 컬럼을 삭제 한다
*  @param {Number /String} 대상 컬럼의 Index 또는 SaveName (Default : 마지막 컬럼)
*  @example 
*  // Index값이 3인 컬럼을 삭제 한다.				
*  mySheet.ColDelete(3);				
*  // SaveName이 sText인 컬럼을 삭제 한다.				
*  mySheet.ColDelete(sText);				
*  // 마지막 컬럼을 삭제 한다.				
*  mySheet.ColDelete();				
*/
	ibsheetObject.prototype.ColDelete = function(Col)			{};
	
	/**
* GetColFontBold :  대상 컬럼 전체의 Bold(굵은 글자체)를 설정하거나 확인한다
*  @param {Number /String} 특정 컬럼의 Index 또는 SaveName
*  @example 
*  //인덱스가 1인 컬럼에 Bold 설정여부를 확인한다.				
*  alert(mySheet.GetColFontBold(1));				
* @returns {Boolean}  Bold 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetColFontBold = function(Col)		{};
	
	/**
* SetColFontBold :  대상 컬럼 전체의 Bold(굵은 글자체)를 설정하거나 확인한다
*  @param {Number /String} 특정 컬럼의 Index 또는 SaveName
*  @param {Boolean} Bold 여부
*  @example 
*  //컬럼 전체 글자에 Bold를 설정한다.				
*  mySheet.SetColFontBold(1, 1);				
*/
	ibsheetObject.prototype.SetColFontBold = function(Col, Bold)		{};
	
	/**
* GetColFontColor :  대상 컬럼 전체의 글자색을 설정하거나 확인한다
*  @param {Long /String} 특정 컬럼의 Column Index 또는 SaveName
*  @example 
*  //2컬럼 글자색을 확인한다..				
*  alert(mySheet.GetColFontColor(2));				
* @returns {String}  설정된 색상값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetColFontColor = function(Col)		{};
	
	/**
* SetColFontColor :  대상 컬럼 전체의 글자색을 설정하거나 확인한다
*  @param {Long /String} 특정 컬럼의 Column Index 또는 SaveName
*  @param {String} 색상 값
*  @example 
*  //컬럼 글자색을 회색으로 설정한다.				
*  mySheet.SetColFontColor(1, #FF0000);				
*  //2컬럼 글자색을 1컬럼 글자색으로 설정한다.				
*  mySheet. SetColFontColor(2, mySheet.GetColFontColor(1)); 				
*/
	ibsheetObject.prototype.SetColFontColor = function(Col, Color)		{};
	
	/**
* GetColFontUnderline :  대상 컬럼 전체의 글자 언더라인을 설정하거나 확인한다
*  @param {Number /String} 특정 컬럼의 Index 또는 SaveName
*  @example 
*  //컬럼 전체 글자에 언더라인 설정여부를 확인한다.				
*  alert(mySheet.GetColFontUnderline(1));				
* @returns {Boolean}  밑줄 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetColFontUnderline = function(Col)		{};
	
	/**
* SetColFontUnderline :  대상 컬럼 전체의 글자 언더라인을 설정하거나 확인한다
*  @param {Number /String} 특정 컬럼의 Index 또는 SaveName
*  @param {Boolean} 밑줄 여부
*  @example 
*  //컬럼 전체 글자에 언더라인을 설정한다.				
*  mySheet.SetColFontUnderline(1, 1);				
*/
	ibsheetObject.prototype.SetColFontUnderline = function(Col, Underline)		{};
	
	/**
* GetColHidden :  컬럼의 숨김여부를 설정하거나 확인한다
*  @param {Long /String} 특정 컬럼의 Column Index 또는 SaveName
*  @example 
*  // 컬럼이 숨겨진 여부를 확인하여 숨겨진 경우 표시되도록 설정한다.				
*  if(mySheet.GetColHidden(1) == 1) {				
*  mySheet.SetColHidden(1, 0);				
*  }				
* @returns {Boolean}  숨김 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetColHidden = function(Col)		{};
	
	/**
* SetColHidden :  컬럼의 숨김여부를 설정하거나 확인한다
*  @param {Long /String} 특정 컬럼의 Column Index 또는 SaveName
*  @param {Boolean} 숨김여부
*  @example 
*  // 컬럼이 숨겨진 여부를 확인하여 숨겨진 경우 표시되도록 설정한다.				
*  if(mySheet.GetColHidden(1) == 1) {				
*  mySheet.SetColHidden(1, 0);				
*  }				
*/
	ibsheetObject.prototype.SetColHidden = function(Col, Hidden)		{};
	
	/**
* ColInsert :  특정 위치에 컬럼을 생성 한다
*  @param {Number /String} 생성할 위치의 컬럼 Index 또는 SaveName (Default : 마지막 컬럼)
*  @param {String} 헤더에 설정할 문자열 (헤더가 2줄이상인 경우 구분자 |로 연결한 문자열로 설정) (Default : ")
*  @param {String} 헤더 문자열의 정렬값 (Default : Center)
*  @param {Object} 생성할 컬럼의 설정 속성 집합 객체
*  @example 
*  // 마지막 위치에 기본(Text 컬럼타입) 컬럼을 생성 한다.				
*  var info = {				
*  Header : {Text : 기본타입}				
*  };				
*  mySheet.ColInsert(info);				
*  // Index 3의 위치에 CheckBox 타입의 컬럼을 생성 한다.				
*  var info = {				
*  Pos:3,				
*  Header:{Text: 체크박스,Align: Left},				
*  Col:[{				
*  Type: CheckBox,				
*  Width:60,				
*  SaveName: sCheckBox				
*  }]				
*  };				
*  mySheet.ColInsert(info);				
*/
	ibsheetObject.prototype.ColInsert = function(Info)			{};
	
	/**
* ColLeft :  컬럼의 왼쪽 위치를 확인한다
*  @param {Long /String} 특정 컬럼의 Column Index 또는 SaveName
*  @example 
*  //컬럼의 왼쪽 위치를 파악한다.				
*  var iLeft = mySheet.ColLeft(1);				
* @returns {Long}  특정컬럼 왼쪽 위치 값
*/
	ibsheetObject.prototype.ColLeft = function(Col)			{};
	
	/**
* ColSaveName :  특정 컬럼 Index에 해당하는 InitColumns 함수에서 설정한 SaveName을 확인한다
*  @param {Number} 단위 데이터행의 Index
*  @param {Number} 특정 컬럼의 Index
*  @example 
*  //컬럼의 SaveName을 가져온다.				
*  var sSaveName = mySheet.ColSaveName(0, 1);				
* @returns {String}  특정컬럼의 SaveName
*/
	ibsheetObject.prototype.ColSaveName = function(DataRow, Col)			{};
	
	/**
* ColumnSort :  단일 또는 다중 컬럼의 데이터를 정렬한다
*  @param {Long /} 소트할 컬럼 Index 또는 SaveName을 |로 조합한 문자열
*  @param {String} ASC 또는 DESC, Default =ASC
*  @param {String} 각 컬럼의 소트 방향을 |로 연결한 문자열, Default="
*  @param {Boolean} Cols파라미터에서 지정된 순서대로 소트할 것인지 선택, Default=0
*  @example 
*  //6컬럼만 내림차순으로 정렬				
*  mySheet.ColumnSort(6, DESC)				
*  //4컬럼을 중심으로 먼저 오름차순 정렬하고, 그 안에서 5컬럼 오름차순 정렬				
*  mySheet.ColumnSort(4|5)				
*  //2,3,4컬럼 순서로 정렬하고, 내림차순으로 정렬한다.				
*  mySheet.ColumnSort(2|3|4, DESC);				
*  //3,2,4컬럼을 2,3,4컬럼인덱스 순서대로 내림차순, 오름차순, 오름차순으로 정렬한다.				
*  mySheet.ColumnSort(3|2|4, DESC,ASC|DESC|ASC);				
*  //3,2,4컬럼을 3,2,4컬럼 지정된 순서대로 오름차순, 내림차순, 오름차순으로 정렬한다.				
*  mySheet.ColumnSort(3|2|4,  DESC ,ASC|DESC|ASC, 1);				
*/
	ibsheetObject.prototype.ColumnSort = function(Col, Sort, ColSort,KeepColOrder)			{};
	
	/**
* ColValueDup :  특정 컬럼 내에 중복된 값이 존재하는지 여부를 확인한다
*  @param {Number /} 컬럼의 Index 또는 SaveName의 조합. |로 연결
*  @param {Boolean} 트랜잭션 상태가 삭제인 행을 포함 여부. Default=1
*  @param {Boolean} 대/ 소문자 구분 설정여부, Default=1
*  @param {Boolean} 합계/소계/누계 행 포함 여부. Default=1
*  @example 
*  //1컬럼에 중복된 값이 존재하는 행번을 가져옴				
*  var Row = mySheet.ColValueDup(1);				
*  //2,3,7 컬럼에 중복된 값이 존재하는 행번을 가져옴				
*  var Row = mySheet.ColValueDup(2|3|7);				
*  //삭제된 행을 제외하고 중복 체크하기				
*  var Row = mySheet.ColValueDup(2|3|7, 0);				
* @returns {Long}  행 번호
*/
	ibsheetObject.prototype.ColValueDup = function(ColStr, IncludeDelRow, Division, IncludeSumRow)			{};
	
	/**
* ColValueDupRows :  중복된 모든 행을 ,로 조합하여 문자열로 반환 한다
*  @param {Number/String} 필수
*  @param {Boolean} 트랜잭션 상태가 삭제인 행을 포함 여부.
*  @param {Boolean} 중복된 행의 최초의 행을 포함할지 여부.
*  @param {Number} 중복 검사를 수행 하고자 하는 부분의 첫행의 행index.
*  @param {Number} 중복 검사를 수행 하고자 하는 부분의 마지막행 행index.
*  @param {Boolean} 합계/소계/누계 행 포함 여부.
*  @example 
*  //6컬럼,7컬럼의 글자가 중복된 행들(삭제행포함, 최초행미포함, 전체 데이터 영역 검사)				
*    var duprows1 = mySheet.ColValueDupRows(6|7);				
*    //4컬럼,5컬럼에 대해 첫번째 행부터 50번째 행까지의 중복검사(삭제행제외, 최초행포함, 1행~50행)				
*    var duprows2 = mySheet.ColValueDupRows(4|5,false,true,1,50);				
*    //가져온 행을 배열로 반든다.				
*    var arrRow = duprows1.split(,);				
*    for (idx=0; idx<arrRow.length-1; idx++){ alert(arrRow[idx] + 행); }				
* @returns {String}  중복된 모든 행을 
*/
	ibsheetObject.prototype.ColValueDupRows = function(ColStr, IncludeDelRow, IncludeFirstRow, StartRow, EndRow)			{};
	
	/**
* GetColWidth :  특정 컬럼의 너비를 설정하거나 확인한다
*  @param {Long/ } 특정 컬럼의 Column Index String		또는 SaveName
*  @example 
*  // 1컬럼의 너비값을 확인				
*  mySheet.GetColWidth(1);				
* @returns {Integer}  특정컬럼의 너비 픽셀 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetColWidth = function(Col)		{};
	
	/**
* SetColWidth :  특정 컬럼의 너비를 설정하거나 확인한다
*  @param {Long/ } 특정 컬럼의 Column Index String		또는 SaveName
*  @param {Integer} 너비 픽셀 값
*  @example 
*  //50 픽셀로 너비 수정				
*  mySheet.SetColWidth(1, 50);				
*  //컬럼 내의 최대 글자 너비로 자동 변경				
*  mySheet.SetColWidth(2, 0);				
*  //3컬럼의 너비를 2컬럼의 너비와 동일하게 변경				
*  mySheet.SetColWidth(3, mySheet.GetColWidth(2));				
*/
	ibsheetObject.prototype.SetColWidth = function(Col, Width)		{};
	
	/**
* GetComboOpenMode :  Combo, ComboEdit 컬럼을 한번 클릭으로 펼쳐줄지에 대해 확인하거나 설정한다
*  @example 
*  //ComboOpenMode 설정되어 있는 값을 확인한다.				
*  mySheet.GetComboOpenMode();				
* @returns {Boolean}  현재 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetComboOpenMode = function()		{};
	
	/**
* SetComboOpenMode :  Combo, ComboEdit 컬럼을 한번 클릭으로 펼쳐줄지에 대해 확인하거나 설정한다
*  @param {Boolean} 0 (Default) 1	콤보를 한번 클릭으로 펼친다.
*  @example 
*  //콤보를 한번 클릭으로 연다.				
*  mysheet.SetComboOpenMode(1);				
*/
	ibsheetObject.prototype.SetComboOpenMode = function(mode)		{};
	
	/**
* ComputeSum :  특정 영역의 합계를 계산하여 반환한다
*  @param {String} 계산 공식, 공식에 다른 컬럼값이 사용되는 경우 반드시 |로 감싸서 사용한다.
*  @param {Long} 계산 대상행의 시작 index, Default=-1
*  @param {Long} 계산 대상행의 마지막 index, Default=-1
*  @param {Boolean} 해당 계산식을 소계행도 포함할지의 여부, Default=1 1 : 소계행을 계산식에 포함 0 : 소계행은 계산식에서 제외
*  @example 
*  //3컬럼의 합계를 구한다.				
*  var Sum3 = mySheet.ComputeSum(|3|);				
*  //1행부터 10행까지 3컬럼 * 4컬럼 / 100 한 값들의 합계를 구한다.				
*  var Sum4 = mySheet.ComputeSum(|3| * |4| / 100, 1, 10);				
* @returns {Double}  계산되어진 특정역역의 합계 
*/
	ibsheetObject.prototype.ComputeSum = function(CalcuLogic,FirstRow,LastRow,isFullSum)			{};
	
	/**
* ConfirmOK :  OnMessage Event에서 IsConfirm = 1인 경우 확인창을 표시하고 응답 결과를 Sheet로 되돌려 준다
*  @param {Boolean} 확인창 선택 결과 값
*  @example 
*  //메시지 모드를 설정한다.				
*  mySheet.ShowMsgMode=0;				
*  //OnMessage 이벤트를 처리한다.				
*  Function mySheet_OnMessage(grid,msg, level, isconfirm)				
*  //메시지 표시하기				
*      var win_result = window.showModalDialog(				
*   sheet_message.jsp?Msg= + msg + &IsConfirm= + isconfirm, 				
*          'modalResult', 				
*          'dialogWidth:200px;dialogHeight:200px;center:yes;help:no;status:no;');				
*      //Sheet로 메시지 결과를 반환한다.				
*      if(IsConfirm) mySheet.ConfirmOK(win_result);				
*  </script>				
*/
	ibsheetObject.prototype.ConfirmOK = function(Val)			{};
	
	/**
* GetCountFormat :  보여지는 건수 정보의 포멧을 확인하거나 설정한다
*  @example 
*  //건수 포멧을 확인한다.				
*  mySheet.GetCountFormat();				
* @returns {Sring}  설정된 출력 포맷 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCountFormat = function()		{};
	
	/**
* SetCountFormat :  보여지는 건수 정보의 포멧을 확인하거나 설정한다
*  @param {String} 설정할 출력포맷
*  @example 
*  //건수 포멧을 설정한다.				
*  mySheet.SetCountFormat(현재 BOTTOMDATA건 / 전체 TOTALROWS건);				
*  //포커스로 표시한다.				
*  mySheet.SetCountFormat(선택 SELECTDATAROW행 / 총 ROWCOUNT건);				
*/
	ibsheetObject.prototype.SetCountFormat = function(Format)		{};
	
	/**
* GetCountInfoElement :  건수 정보를 시트 외부의 DOM 엘리먼트에 표현하기 위한 설정을 하거나 설정된 엘리먼트를 확인 한다
*  @example 
*  // 건수정보를 표시할 DOM 엘리먼트 객체를 확인 한다.				
*  Var elem = mySheet.GetCountInfoElement();				
* @returns {object}  설정된 DOM 엘리먼트 객체
*/
	ibsheetObject.prototype.GetCountInfoElement = function()		{};
	
	/**
* SetCountInfoElement :  건수 정보를 시트 외부의 DOM 엘리먼트에 표현하기 위한 설정을 하거나 설정된 엘리먼트를 확인 한다
*  @param {Object/} 설정할 DOM 엘리먼트 객체 또는 Id
*  @example 
*  // 건수정보를 표시할 DOM 엘리먼트를 설정한다.				
*  // (countElem 아이디의 DOM 엘리먼트가 생성되어 있어야 함)				
*  mySheet.SetCountInfoElement(countElem);				
*  }				
*/
	ibsheetObject.prototype.SetCountInfoElement = function(Element)		{};
	
	/**
* GetCountPosition :  건수 정보를 IBSheet의 특정 영역에 보이도록 설정한다
*  @example 
*  // 개수 정보가 표시되지 않고 있다면 개수 정보를 좌측 상단에 표시한다.				
*  if(mySheet.GetCountPosition() == 0) {				
*  mySheet.SetCountPosition(1);				
*  }				
* @returns {Integer}  설정된 출력정보 위치 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCountPosition = function()		{};
	
	/**
* SetCountPosition :  건수 정보를 IBSheet의 특정 영역에 보이도록 설정한다
*  @param {Integer} 설정할 출력정보 위치 값
*  @example 
*  // 개수 정보가 표시되지 않고 있다면 개수 정보를 좌측 상단에 표시한다.				
*  if(mySheet.GetCountPosition() == 0) {				
*  mySheet.SetCountPosition(1);				
*  }				
*/
	ibsheetObject.prototype.SetCountPosition = function(Position)		{};
	
	/**
* CreatePivotTable :  피벗 테이블은 대화형 테이블의 일종으로, 데이터의 나열 형태에 따라서 합계나 카운트 등의 계산을 하는 기능이다
*  @param {json} 피벗 테이블 설정 객체 집합 (세부내용참고)
*  @param {Object} 원본 데이터가 있는 IBSheet의 객체
*  @example 
*  //5,6,7 열을 행 레이블 필드로 설정하고, 8,9,10 열을 열 레이블의 필드로 설정하여, 13 컬럼을 요약정보(합계)에 표시한다.				
*  mySheet2.CreatePivotTable({Rows:'5|6|7', Cols:'8|9|10', Value:'13', ValueType:'Sum'}, mySheet);				
*  // 5,6,7 열을 행 레이블 필드로 설정하고, 2 열을 열 레이블의 필드로 설정하여, 13 컬럼을 요약정보(개수)에 표시한다.				
*  mySheet2.CreatePivotTable({Rows:'5|6|7', Cols:'2', Value:'13', ValueType:'Count'}, mySheet);				
*/
	ibsheetObject.prototype.CreatePivotTable = function(Info, DataSheet)			{};
	
	/**
* GetCumulateBackColor :  누계 행의 배경 색상을 확인하거나 설정한다
*  @example 
*  //누계 행 배경색상을 확인				
*  mySheet.GetCumulateBackColor();				
* @returns {String}  현재 누계 색상 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetCumulateBackColor = function()		{};
	
	/**
* SetCumulateBackColor :  누계 행의 배경 색상을 확인하거나 설정한다
*  @param {String} WebColor 값
*  @example 
*  //누계 행 배경색상을 녹색으로 설정 				
*  mySheet.SetCumulateBackColor(#00FF00);				
* @returns {String}  현재 누계 색상 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.SetCumulateBackColor = function(Color)		{};
	
	/**
* Data2Clipboard :  IBSheet위의 있는 모든 데이터를 클립보드에 복사한다
*  @example 
*  //클립보드에 복사한다.				
*  mySheet.Data2Clipboard();				
* @returns {String}  클립보드에 복사된 문자열
*/
	ibsheetObject.prototype.Data2Clipboard = function()			{};
	
	/**
* GetDataAlternateBackColor :  짝수번째 데이터 행의 기본 배경색을 설정하거나 확인한다
*  @example 
*  // 현재 색상 값을 확인한다.				
*  var color = mySheet.GetDataAlternateBackColor(1,1);				
*  alert(짝수번째행의 색상 값은  + color + 입니다.);				
* @returns {String}  현재 짝수행 색상값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetDataAlternateBackColor = function()		{};
	
	/**
* SetDataAlternateBackColor :  짝수번째 데이터 행의 기본 배경색을 설정하거나 확인한다
*  @param {String} 설정할 색상 값
*  @example 
*  // 짝수번째행의 배경색을 빨간색으로 변경				
*  mySheet.SetDataAlternateBackColor(#FF0000);       // WebColor				
*/
	ibsheetObject.prototype.SetDataAlternateBackColor = function(Color)		{};
	
	/**
* GetDataAutoTrim :  조회 또는 저장 시 데이터의 공백 트림 여부를 확인하거나 설정한다
*  @example 
*  //자동 트림여부 설정 확인하기				
*  mySheet.GetDataAutoTrim();				
* @returns {Boolean}  데이터의 공백Trim 설정값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetDataAutoTrim = function()		{};
	
	/**
* SetDataAutoTrim :  조회 또는 저장 시 데이터의 공백 트림 여부를 확인하거나 설정한다
*  @param {Boolean} 설정할 데이터의 공백Trim값
*  @example 
*  //자동 트림하여 조회하기				
*  mySheet.SetDataAutoTrim(1);				
*  mySheet.DoSearch(list.jsp);				
*  //트림하지 않고 데이터 그대로 저장하기				
*  mySheet.SetDataAutoTrim(0);				
*  mySheet.DoSave(save.jsp);				
*/
	ibsheetObject.prototype.SetDataAutoTrim = function(Trim)		{};
	
	/**
* GetDataBackColor :  홀수번째 데이터 행의 기본 배경색을 설정하거나 확인한다
*  @example 
*  //홀수번째 데이터 행의 배경색을 확인한다.				
*  mySheet.GetDataBackColor();				
* @returns {String}  현재 홀수행 색상값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetDataBackColor = function()		{};
	
	/**
* SetDataBackColor :  홀수번째 데이터 행의 기본 배경색을 설정하거나 확인한다
*  @param {String} 설정할 색상 값
*  @example 
*  //홀수번째 데이터 행의 배경색을 흰색으로 설정한다. 				
*  mySheet.SetDataBackColor(#FFFFFF);				
*/
	ibsheetObject.prototype.SetDataBackColor = function(Color)		{};
	
	/**
* DataCopy :  마지막으로 선택된 데이터 행의 내용을 복사하여 신규 입력 행으로 생성하고, 생성된 행의 Row Index를 반환한다
*  @param {Boolean} 자식 레벨의 행까지 복사하는지 여부 Default=0
*  @example 
*  //행을 복사하고, 복사된 행의 트랜잭션 상태를 조회로 변경한다.				
*  //'Status' 는 상태 컬럼의 SaveName				
*  var Row = mySheet.DataCopy();				
*  mySheet.SetCellValue(Row, Status, R);				
*  //자식 레벨까지 모두 복사하기				
*  mySheet.DataCopy(1);				
* @returns {Long}  복사하여 생성된 행의 Row Index
*/
	ibsheetObject.prototype.DataCopy = function(IncludeChild)			{};
	
	/**
* GetDataFontColor :  모든 데이터 행의 글자색을 설정하거나 확인한다
*  @example 
*  //데이터 행의 글자색을 확인한다.				
*  mySheet.GetDataFontColor();				
* @returns {String}  설정된 글자 색상값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetDataFontColor = function()		{};
	
	/**
* SetDataFontColor :  모든 데이터 행의 글자색을 설정하거나 확인한다
*  @param {String} 설정할 색상 값
*  @example 
*  //데이터 행의 글자색을 빨간색으로 설정한다.				
*  mySheet.SetDataFontColor(#FF0000);				
*/
	ibsheetObject.prototype.SetDataFontColor = function(Color)		{};
	
	/**
* DataInsert :  데이터 행을 신규 생성하고, 생성된 행의 Row Index를 반환한다
*  @param {Long} 생성될 행 위치, Default=마지막 선택 행 바로 아래
*  @param {Long} 생성될 행의 트리 레벨 수준, Default=마지막 선택 행의 레벨보다 1큰 레벨로, 자식으로 생성
*  @example 
*  //첫 행에 생성하기				
*  mySheet.DataInsert(0);				
*  //마지막 행에 생성하기				
*  mySheet.DataInsert(-1);				
*  //현재 선택된 행의 바로 아래에 생성				
*  mySheet.DataInsert();				
*  //7 행에 생성				
*  mySheet.DataInsert(7);				
* @returns {Long}  신규 생성된 행의 Row Index
*/
	ibsheetObject.prototype.DataInsert = function(Row, Level)			{};
	
	/**
* GetDataLinkMouse :  데이터 행의 페이지 링크 여부를 확인하거나 설정한다
*  @param {Number / String} 특정 컬럼의 Index 또는 SaveName
*  @example 
*  //데이터행의 페이지 링크 여부 확인한다.				
*  mySheet.GetDataLinkMouse(1);				
* @returns {Boolean}  설정된 링크 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetDataLinkMouse = function(Col)		{};
	
	/**
* SetDataLinkMouse :  데이터 행의 페이지 링크 여부를 확인하거나 설정한다
*  @param {Number / String} 특정 컬럼의 Index 또는 SaveName
*  @param {Boolean} 링크여부 설정
*  @example 
*  //1,2 컬럼에서만 가능하도록 설정한다.				
*  mySheet.SetDataLinkMouse(1, 1);				
*  mySheet.SetDataLinkMouse(2, 1);				
*/
	ibsheetObject.prototype.SetDataLinkMouse = function(Col, Link)		{};
	
	/**
* DataMove :  데이터 행을 원하는 다른 위치로 이동한다
*  @param {Long} 이동할 위치의 Row Index
*  @param {Long} 선택된 데이터의 Row Index, Default=-1
*  @param {Integer} 이동 후 선택된 데이터의 트리 레벨 Default=원래 레벨 수준
*  @example 
*  //12행을 10행으로 이동한다.				
*  mySheet.DataMove(10, 12);				
* @returns {Long}  이동된 행의 Top Row Index
*/
	ibsheetObject.prototype.DataMove = function(ToRow, FromRow, RowLevel)			{};
	
	/**
* GetDataRowHeight :  모든 데이터 행의 행높이를 설정하거나 확인한다
*  @example 
*  //모든 데이터 행의 높이를 확인한다.				
*  mySheet.GetDataRowHeight();				
* @returns {Integer}  설정된 높이 값(Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetDataRowHeight = function()		{};
	
	/**
* SetDataRowHeight :  모든 데이터 행의 행높이를 설정하거나 확인한다
*  @param {Integer} 설정할 데이터행 높이 값
*  @example 
*  //모든 데이터 행의 높이를 22 픽셀로 설정한다.				
*  mySheet.SetDataRowHeight(22);				
*/
	ibsheetObject.prototype.SetDataRowHeight = function(Height)		{};
	
	/**
* GetDataRowMerge :  모든 데이터 행의 가로 머지 여부를 설정하거나 확인한다
*  @example 
*  //모든 데이터 행의 가로머지를 여부				
*  mySheet.GetDataRowMerge();				
* @returns {Boolean}  설정된 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetDataRowMerge = function()		{};
	
	/**
* SetDataRowMerge :  모든 데이터 행의 가로 머지 여부를 설정하거나 확인한다
*  @param {Boolean} 머지 허용 여부
*  @example 
*  //모든 데이터 행의 가로머지를 허용				
*  mySheet.SetDataRowMerge(1);				
*/
	ibsheetObject.prototype.SetDataRowMerge = function(Merge)		{};
	
	/**
* DirectDown2Excel :  조회된 데이터가 많은 경우 Down2Excel()메서드를 이용하여 엑셀 파일을 다운로드 하면 client에서 조회된 데이터를 서버로 보내는 과정에서 상당한 부하가 걸릴수 있다
*  @param {Boolean} 머지 허용 여부
*  @example 
*  // 서버에서 데이터를 직접 준비하여다운로드 한다.				
*  var param = {URL:/sub/ex/bussDeptList.jsp				
*  ,ExtendParam:DECNO=3422&PartMngNO=982211				
*  ,FileName:OrgList.xls};				
*  mySheet. DirectDown2Excel(param);         				
*/
	ibsheetObject.prototype.DirectDown2Excel = function(parameters)			{};
	
	/**
* DirectLoadExcel :  LoadExcel 처럼 엑셀 문서를 읽어들이는 것은 동일하지만, 엑셀 문서의 내용을 IBSheet 에 담지 않고 서버쪽에서 지정한 페이지로 전달한다
*  @param {String} 엑셀 컬럼 번호 Default="
*  @param {String} 엑셀 로딩완료 행번호 Default=0
*  @param {String} 서버로 전달될 파라미터를 쿼리스트링 형태로 넣음. 특히 저장작업을 수행할 FP는 필수
*  @param {String} 업로드 가능한 파일 확장자 Default="
*  @param {String} 로딩 방식 (헤더매칭등) Default=“HeaderMatch”
*  @param {String} 엑셀 로딩 행번호 Default=1
*  @param {String} 엑셀WorkSheet번호, Default=1
*  @param {String} 엑셀WorkSheet이름 Default="
*  @example 
*  // 참고 함수				
*  function makeExParam(key,data){				
*  return  &+encodeURIComponent(key)+=+encodeURIComponent(data);				
*  }				
*  // 엑셀로 넘어온 내용을 전달할 포워딩 페이지(ContextRoot명은 빼고 적는다.)				
*  var param =makeExParam( “FP ,/bu/MassSave.jsp);				
*  param += makeExParam(sname,chris);				
*  param += makeExParam(date,20091221”);				
*  var parameters = { Mode : mch,  StartRow: 1, ExtendParam:param}				
*  // 엑셀로 로딩하여 서버에서 즉시 처리하기				
*  mySheet. DirectLoadExcel(parameters);				
*  -----------------------------------------------------------------------------------------------------				
*  // MassSave.jsp 페이지 내용				
*  // 1. 엑셀의 내용을 찍어본다. (데이터확인)				
*  String PRINT_STR = ";				
*  ArrayList keys = new ArrayList();				
*  List li = (List)request.getAttribute(SHEETDATA);				
*  for(int i=0;i<li.size();i++){				
*  Map mp = (Map)li.get(i);				
*  // 헤더 한줄만 뿌려주자.				
*  if(i==0){				
*  Iterator it = mp.keySet().iterator();				
*  while(it.hasNext()){				
*  String key = (String)it.next();				
*  PRINT_STR += key+\t;				
*  keys.add(key);				
*  }				
*  PRINT_STR += \\n;				
*  }				
*  // 데이터를 뿌리자				
*  for(int c=0;c<keys.size();c++){				
*  PRINT_STR += mp.get(keys.get(c))+\t;				
*  }				
*  PRINT_STR += \\n;				
*  }				
*  // 서버 콘솔에서 확인				
*  System.out.println(PRINT_STR);				
*  // 2. ExtendParam으로 넘긴 내용도 확인해 본다.				
*  System.out.println(  request.getAttribute(“sname”));				
*  System.out.println(  request.getAttribute(“date”));				
*  // 3. 최종적으로 화면에 결과를 리턴한다.				
*  out.println(“<script>alert(‘총 데이터 건수 :”+li.size()+” 건이\n저장 되었습니다.');</script>”);				
*/
	ibsheetObject.prototype.DirectLoadExcel = function(parameters)			{};
	
	/**
* DoAllSave :  데이터의 트랜잭션 상태에 관계 없이 모든 데이터를 저장 하도록 페이지를 호출한다
*  @param {String} 저장 처리할 페이지 파일 이름
*  @param {Boolean} IBSheet 위의 데이터를 인코딩할지 여부를 설정, Default=1
*  @param {Number} Query String 문자열 조합방법을 설정Mode=1, Mode=2 (Default =1)
*  @param {String} Mode=2일때, 연결될 구분자 설정 (Default =|)
*  @param {Object} 요청헤더 설정 값 객체, Default={}
*  @example 
*  // 모든 내역 저장하기				
*  var Result = mySheet.DoAllSave(save.jsp, { Param : id=khlee&seq=1 });				
*  //저장 실패한 경우 에러 메시지를 표시하고, 성공한 경우 조회처리				
*  if(!Result){				
*      alert(저장 실패했습니다. 다시 시도하세요);				
*  } else {				
*      mySheet.DoSearch(list.jsp);				
*  }				
*  //설정할 선택 인자 json형식으로 속성 설정하기				
*  mySheet.DoAllSave(PageUrl, { UrlEncode:0, Mode:2, Delim:$});				
* @returns {Boolean}  저장 처리여부
*/
	ibsheetObject.prototype.DoAllSave = function(Url, Opt)			{};
	
	/**
* DoPrint :  보여지고 있는 모든 데이터를 인쇄한다
*  @example 
*  // 인쇄 하기				
*  mySheet.DoPrint();				
*/
	ibsheetObject.prototype.DoPrint = function()			{};
	
	/**
* DoRowSearch :  특정 행의 셀 데이터를 조회 한다
*  @param {Long} 대상 행의 Index
*  @param {String} 처리할 페이지 Url
*  @param {String} 조회조건 Query String, Default "
*  @param {Object} 요청헤더 설정 값 객체, Default={}
*  @param {Boolean} 동기 조회 여부 Default=0 (SearchSync 설정 시 SearchSync 값)
*  @param {Boolean} 대기 이미지 표시 여부, Default =1
*  @example 
*  //3컬럼의 데이터가 바뀌었을 때 해당 행의 데이터를 DB에서 읽어옴				
*  function mySheet_OnChange(Row, Col, Value) {				
*  if (Col == 3) {				
*      var opt = { Wait : 1, Sync : 1 };				
*  mySheet.DoRowSearch(Row, grid_rowdata.html,  " , opt);				
*  }				
*  }				
*  // 1. 이미지 미표시, 비동기 조회				
*  var opt = { Wait : 0, Sync : 0 };				
*  mySheet.DoRowSearch(Row, grid_rowdata.html,  " , opt);				
*  // 2. 이미지 표시, 동기 조회				
*  var opt = { Wait : 1, Sync : 1 };				
*  mySheet.DoRowSearch(Row, grid_rowdata.html,  " , opt);				
*/
	ibsheetObject.prototype.DoRowSearch = function(Row, PageUrl, Param, Opt)			{};
	
	/**
* DoSave :  데이터의 트랜잭션 상태 또는 특정 컬럼 데이터에 따라 저장 처리한다
*  @param {String} 저장 처리할 페이지 파일 이름
*  @param {Number / String} 저장 대상이 되는 기준 컬럼의 Index 또는 SaveName Default=상태컬럼(-1)
*  @param {Boolean} 저장 시 확인 메시지 표시 여부 설정, Default=1
*  @param {Boolean} IBSheet 위의 데이터를 인코딩할지 여부를 설정, Default=1
*  @param {Integer} Query String 문자열 조합방법을 설정Mode=1, Mode=2 (Default=1)
*  @param {String} Mode=2일때, 연결될 구분자 설정 (Default=|)
*  @param {Object} 요청헤더 설정 값 객체, Default={}
*  @example 
*  //트랜잭션이 일어난 데이터만 저장하기				
*  mySheet.DoSave(Save.jsp ,{ Param : id=khlee&seq=1 });				
*  //2컬럼의 CheckBox가 체크된것만 저장하기				
*  mySheet.DoSave(Save.jsp ,{ Param : id=khlee&seq=1, Col : 2 });				
*  //설정할 선택 인자 json형식으로 속성 설정하기				
*  mySheet.DoSave(PageUrl, { UrlEncode:0, Mode:2, Delim:$ });				
* @returns {Boolean}  저장 처리여부
*/
	ibsheetObject.prototype.DoSave = function(Url, Opt)			{};
	
	/**
* DoSearch :  조회 페이지를 연결하여 조회 XML을 읽어 들이고, XML의 데이터를 IBSheet 내부에 표현한다
*  @param {String} 조회 XML 페이지 파일 이름
*  @param {String} 조회 조건 Query String, Default=””
*  @param {Boolean} Append 조회 여부, Default=0
*  @param {Number} Append 조회 시 데이터를 붙여넣을 위치 설정
*  @param {Boolean} 포맷팅된 데이터 조회 처리 여부, Default=0
*  @param {Object} 요청헤더 설정 값 객체, Default={}
*  @param {Boolean} 동기 조회 여부 Default=0 (SearchSync 설정 시 SearchSync 값)
*  @example 
*  // 1. 일반조회				
*  mySheet.DoSearch(list.jsp, p1=aa&p2=bb);				
*  // 2. Sync 조회				
*  var opt = { Sync : 1 };				
*  mySheet.DoSearch(list.jsp, p1=aa&p2=bb, opt);				
*  // 3. Append 조회				
*  var opt = { Append : 1 };				
*  mySheet.DoSearch(list.jsp, p1=aa&p2=bb, opt);				
*  // 4. Sync && Append 조회				
*  var opt = { Sync : 1, Append : 1 };				
*  mySheet.DoSearch(list.jsp, p1=aa&p2=bb, opt);				
*  // 5. 요청헤더 설정				
*  Var opt = { ReqHeader : { Prop : “Value} };				
*  mySheet.DoSearch(list.jsp, p1=aa&p2=bb, opt);				
*/
	ibsheetObject.prototype.DoSearch = function(PageUrl, Param, Opt)			{};
	
	/**
* DoSearchChild :  트리 형태의 데이터 구조에서 해당행의 자식을 조회하지 않은 상태에서 OnTreeChild 이벤트 안에서 자식데이타를 조회 페이지를 연결하여 조회 XML, JSON을 읽어 들이고, XML, JSON의 데이터를 자식으로 Append 하여 표현한다
*  @param {Long} OnTreeChild 이벤트에서 받은 행의 Index
*  @param {String} 조회 XML,JSON 페이지 파일 이름
*  @param {String} 조회 조건 Query String, Default="
*  @param {Object} 요청헤더 설정 값 객체, Default={}
*  @param {Boolean} 동기 조회 여부 (동기상태에서는 대기이미지가 표시되지 않음) Default=0 (SearchSync 설정 시 SearchSync 값)
*  @param {Boolean} 대기 이미지 표시 여부, Default=1
*  @example 
*  // 자식데이터 조회하기				
*  <script type=text/Javascript>				
*   function mySheet_OnTreeChild(Row){				
*     var url = ";				
*     // 4컬럼 : 트리컬럼				
*     switch(mySheet.GetCellValue(Row, 4)){				
*      case 서울 : 				
*        url =  type15_dat(1).xml;				
*        break;				
*      case 인천:				
*        url = type15_data(2).xml;				
*        break;				
*     }				
*     var opt = { Wait : 1, Sync : 0 };				
*     mySheet.DoSearchChild(Row, url, ", opt);				
*   }				
*  </script>				
*  // 1. 이미지 표시, 비동기 조회				
*  var opt = { Wait : 1 Sync : 0 };				
*  mySheet.DoSearchChild(Row, url, ", opt);				
*  // 2. 이미지 미표시, 동기 조회 (동기조회 선택시 대기이미지는 보여지지 안음)				
*  var opt = { Wait : 0, Sync : 1 };				
*  mySheet.DoSearchChild(Row, url, ", opt);				
*/
	ibsheetObject.prototype.DoSearchChild = function(Row, PageUrl, Param, Opt)			{};
	
	/**
* DoSearchPaging :  대량 데이터를 조회 하고자 하는 경우 IBSheet 의 스크를 위치의 데이터 일부만을 조회 하여 화면에 표현한다
*  @param {String} 조회 페이지 Url
*  @param {String} 페이지 인덱스를 받을 변수명, Default=ibpage
*  @param {String} 조회 조건 Query String, Default="
*  @param {String} 헤더 정렬 정보를 받을 변수명, Default=iborderby 값은 “SIDO|SIGUNGU ^ASC|DESC” 와 같이 savename 과 정렬 방향이 “^”로 구분되며 각 이름은 “|”로 구분되어 있다.
*  @param {Boolean} WaitImageVisible 설정이 true 일때 2페이지 이상 조회시 대기 이미지 표시 여부. Default=0
*  @param {Object} 요청헤더 설정 값 객체, Default={}
*  @param {Boolean} 동기 조회 여부 Default=0 (SearchSync 설정 시 SearchSync 값)
*  @example 
*  //초기화 설정 (페이지 사이즈를 100으로 설정)				
*  var cfg = {SearchMode:3, Page:100};				
*  mySheet.SetConfig(cfg);				
*  // 실시간 조회				
*  var info = {PageParam: page, OrderbyParam:”orderbyParam”, Param: id=ibleaders&seq=1};				
*  mySheet.DoSearchPaging(list.jsp,info);				
*  // 동기 조회				
*  var info = {PageParam: page, OrderbyParam:”orderbyParam”, Param: id=ibleaders&seq=1, Sync : 1};				
*  mySheet.DoSearchPaging(list.jsp,info);				
*/
	ibsheetObject.prototype.DoSearchPaging = function(Url, Opt)			{};
	
	/**
* Down2Excel :  조회된 데이터가 있는 경우 IBSheet의 내용을 엑셀 파일로 변환하여 다운로드 한다
*  @param {bool} 모든 컬럼을 Text타입으로 다운로드 받을지 여부 Default=0
*  @param {bool} Default=0(컬럼 넓이 자동 조절 안함)
*  @param {String} 체크박스의 체크 해제시의 값 Default=”0”
*  @param {String} 체크박스의 체크시의 값 Default=”1”
*  @param {bool} 콤보의 드롭다운 형식 다운로드 여부 Defualt=0
*  @param {String} 다운로드 받을 열들을 | 로 연결. Default="(모두 받음)
*  @param {String} 콤보의 TEXT/CODE 형태의 다운로드 여부 Default=”TEXT”
*  @param {bool} 헤더의 다운로드 여부 Default=1
*  @param {String} 다운로드 받을 행들을 | 로 연결. Default="(모두 받음)
*  @param {bool} 합계의 다운로드 여부 Default=1
*  @param {bool} 트리의 접혀진 행 다운 여부 Default=0(다운 안받음)
*  @param {Integer} 폰트크기 설정 Default=0
*  @param {String} Default="(사용안함)
*  @param {Integer} 소계/누계 행 제외 여부 1: 소계만 제외 2:누계만 제외 3:소계/누계 모두 제외 Default=0(소계/누계 모두 포함)
*  @param {String} Default="(사용안함)
*  @param {String} Default=GET
*  @param {String} 저장할 파일 명 Default=Excel.xls
*  @param {bool} 열숨김 반영 여부. Default=0
*  @param {bool} KeyField 마크(*)를 다운 여부 Default=1(다운 받음)
*  @param {bool} 머지의 다운로드 적용 여부 Default=0
*  @param {bool} 숫자타입 셀 데이터를 문자 타입으로 다운로드 받을지 여부. 숫자타입 컬럼의 일부 셀에 포맷을 변경하여 문자열을 삽입하는 경우 사용 Default=0
*  @param {bool} 헤더만 머지할지의 여부 Default=0
*  @param {String} 엑셀파일에 타이틀이나 패턴등을 별도의 xml파일을 통해 설정
*  @param {Integer} 디자인 다운로드 적용 여부 Default=0
*  @param {String} 엑셀WorkSheet이름, Default=Sheet
*  @param {Integer} 템플릿으로 사용할 엑셀 WorkSheet 번호. Default=0
*  @param {Integer} 템플릿 적용 다운로드 시 엑셀 파일내 데이터를 쓰기 시작할 컬럼 번호 Default=0
*  @param {Integer} 템플릿 적용 다운로드 시 엑셀 파일내 데이터를 쓰기 시작할 행 번호 Default=0
*  @param {String} 템플릿으로 사용할 엑셀 파일명파일명
*  @param {bool} Text 타입의 엑셀 서식 형식 Default=1(일반)
*  @param {String} Default=center(중앙정렬)
*  @param {String} Default="(사용안함)
*  @param {bool} Default=0(다운 안받음)
*  @param {String} Default="(사용안함)
*  @param {String} Default="(사용안함)
*  @param {bool} Default=1(줄바꿈 허용)
*  @example 
*  // 엑셀로 내려 받기				
*  mySheet.Down2Excel();				
*  // 다운로드할 파일명을 excel2로 하고 워크시트명은 sheet-test 로 정의하여다운로드 받는다.				
*  mySheet.Down2Excel({FileName:'excel2',SheetName:' sheet-test'});				
*  //시트 색상과 머지를 모두 반영하며, 콤보는 코드로, 체크는 Y/N으로 다운로드 받되,헤더와 합계는 제외하고 컬럼은 왼쪽에서 3개의 컬럼만 다운로드 한다.				
*  mySheet.Down2Excel({SheetDesign:1, Merge:1, DownCombo:'CODE', CheckBoxOnValue:'Y', CheckBoxOffValue:'N',  DownRows:'', DownCols:'0|1|2', DownHeader:0, DownSum:0});				
*/
	ibsheetObject.prototype.Down2Excel = function(parameters)			{};
	
	/**
* GetDown2ExcelUrl :  엑셀 다운로드 기능을 처리할 서버 페이지 경로를 확인 및 설정한다
*  @example 
*  // 엑셀 다운로드 설정 경로를 확인한다.				
*  var url = mySheet.GetDown2ExcelUrl();				
* @returns {String}  설정된 경로값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetDown2ExcelUrl = function()		{};
	
	/**
* SetDown2ExcelUrl :  엑셀 다운로드 기능을 처리할 서버 페이지 경로를 확인 및 설정한다
*  @param {String} 설정할 서버 페이지 Url
*  @example 
*  // 엑셀 다운로드 경로를 설정한다.				
*  mySheet.SetDown2ExcelUrl(/jsp/Down2Excel.jsp);				
*/
	ibsheetObject.prototype.SetDown2ExcelUrl = function(Url)		{};
	
	/**
* Down2ExcelBuffer :  여러 개의 시트로부터 1개의 엑셀 문서로 다운로드 받는다
*  @param {bool} 버퍼링 여부
*  @example 
*  //이후로는 버퍼링한다. 아무 동작 안함.				
*  firstSheet.Down2ExcelBuffer(true);  				
*  // 첫번째 워크시트에 담아두기를 예약함.				
*  firstSheet.Down2Excel({FileName:'excel2',SheetName:'sheet1'}); 				
*  // 두번째 워크시트에 담아두기를 예약함.				
*  secondSheet.Down2Excel({FileName:'excel2',SheetName:' sheet2'}); 				
*  // 버퍼링된 모든 엑셀 자료를 1개의 엑셀문서에 모두 모아서 즉시 다운로드 한다.				
*  firstSheet.Down2ExcelBuffer(false); 				
*  DirectDown2Excel 로 여러개의 시트를 다운로드 하는 경우				
*  // 시트에서 Down2ExcelBuffer 통해 DirectDown2Excel 호출				
*  firstSheet.Down2ExcelBuffer(true);				
*  firstSheet.DirectDown2Excel({URL:../jsp/fp.jsp,FileName:IBLeaders.xls});				
*  secondSheet.DirectDown2Excel({URL:../jsp/fp.jsp,FileName:IBLeaders.xls, SheetDesign:1});				
*  firstSheet.Down2ExcelBuffer(false);				
*  // 데이터 생성 파일 (fp.jsp)				
*  request.setAttribute(SHEETDATA, li);				
*  request.setAttribute(SHEETDATA1, li2);				
*/
	ibsheetObject.prototype.Down2ExcelBuffer = function(IsBuffer)			{};
	
	/**
* Down2Pdf :  조회된 데이터가 있는 경우 IBSheet의 내용을 PDF 파일로 변환하여 다운로드 한다
*  @param {String} 다운로드 받을 열들을 | 로 연결. Default="(모두 받음)
*  @param {Integer} 축소/확대 비율. 값이 작을 수록 크게 출력된다. 50~32840 사이 값으로 설정 가능하다. Default = 2000
*  @param {String} 서버로 전달해야 하는 내용이 있는 경우 Get 방식의  QueryString으로 연결하여 설정Default="
*  @param {String} Default="(사용안함)
*  @param {String} Default=GET
*  @param {String} 저장할 파일 명 Default=IBSheet.pdf
*  @param {String} Default = Gothic
*  @param {String} 용지 방향 설정 landscape 또는 portrait Default = landscape
*  @param {String} Default = "
*  @param {String} Default = "
*  @param {String} Default="(사용안함)
*  @example 
*  // PDF 파일로 내려 받기				
*  mySheet.Down2Pdf();         				
*  // 다운로드할 파일명을 text로 정의하여다운로드 받는다.				
*  mySheet.Down2Pdf({FileName:'text' });				
*  // 다운로드할 컬럼을 지정하여 myPDF.pdf로 다운받는다.				
*  mySheet.Down2Pdf({FileName:myPDF, DownCols:7|8|9|4|5|6|10});				
*/
	ibsheetObject.prototype.Down2Pdf = function(parameters)			{};
	
	/**
* GetDown2PdfUrl :  PDF 다운로드 기능을 처리할 서버 페이지 경로를 확인 및 설정한다
*  @example 
*  // PDF 다운로드 설정 경로를 확인한다.				
*  var url = mySheet.GetDown2PdfUrl();				
* @returns {String}  설정된 경로값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetDown2PdfUrl = function()		{};
	
	/**
* SetDown2PdfUrl :  PDF 다운로드 기능을 처리할 서버 페이지 경로를 확인 및 설정한다
*  @param {String} 설정할 서버 페이지 Url
*  @example 
*  // PDF 다운로드 경로를 설정한다.				
*  mySheet.SetDown2PdfUrl(/jsp/Down2Pdf.jsp);				
*/
	ibsheetObject.prototype.SetDown2PdfUrl = function(Url)		{};
	
	/**
* Down2Text :  조회된 데이터가 있는 경우 IBSheet의 내용을 텍스트 파일로 변환하여 다운로드 한다
*  @param {String} 저장할 파일 명 Default=Test.txt
*  @param {String} 행 자료 사이에 표시될 레코드 구분자 Default=”\n” (엔터 형식)
*  @param {String} 셀 자료 사이에 표시될 컬럼 구분자 Default=” ” (공백 형식)
*  @param {String} 다운로드 받을 행들을 | 로 연결. Default="(모두 받음)
*  @param {String} 다운로드 받을 열들을 | 로 연결. Default="(모두 받음)
*  @param {bool} 헤더의 다운로드 여부 Default=1
*  @param {bool} 합계의 다운로드 여부 Default=1
*  @param {String} 콤보의 TEXT / CODE 형태의 다운로드 여부 Default=”TEXT”
*  @param {String} 서버로 전달해야 하는 내용이 있는 경우 Get 방식의  QueryString으로 연결하여 설정Default="
*  @param {bool} 트리의 접혀진 행 다운 여부 Default=0(다운 안받음)
*  @example 
*  // 텍스트 파일로 내려 받기				
*  mySheet.Down2Text();         				
*  // 다운로드할 파일명을 text로 정의하여다운로드 받는다.				
*  mySheet.Down2Text({FileName:'text' });				
*  // 콤보는 코드로 받고, 헤더와 합계는 제외하고 컬럼은 왼쪽에서 3개의 컬럼만 다운로드 한다.				
*  mySheet.Down2Text({DownCombo:'CODE', DownRows:'', DownCols:'0|1|2', DownHeader:0, DownSum:0});				
*/
	ibsheetObject.prototype.Down2Text = function(parameters)			{};
	
	/**
* GetDown2TextUrl :  텍스트 다운로드 기능을 처리할 서버 페이지 경로를 확인 및 설정한다
*  @example 
*  // 텍스트 다운로드 설정 경로를 확인한다.				
*  var url = mySheet.GetDown2TextUrl();				
* @returns {String}  설정된 경로값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetDown2TextUrl = function()		{};
	
	/**
* SetDown2TextUrl :  텍스트 다운로드 기능을 처리할 서버 페이지 경로를 확인 및 설정한다
*  @param {String} 설정할 서버 페이지 Url
*  @example 
*  // 텍스트 다운로드 경로를 설정한다.				
*  mySheet.SetDown2TextUrl(/jsp/Down2Text.jsp);				
*/
	ibsheetObject.prototype.SetDown2TextUrl = function(Url)		{};
	
	/**
* GetDownloadingImage :  파일 다운로드 중 대기 이미지 파일의 위치를 설정하거나 확인한다
*  @example 
*  //현재 설정되어있는 다운로드 중 대기 이미지 경로를 확인한다.				
*  alert(mySheet.GetDownloadingImage());				
* @returns {String}  현재 설정값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetDownloadingImage = function()		{};
	
	/**
* SetDownloadingImage :  파일 다운로드 중 대기 이미지 파일의 위치를 설정하거나 확인한다
*  @param {String} 이미지 URL
*  @example 
*  //다운로드 중 대기 이미지를 변경한다.				
*  mySheet.SetDownloadingImage( /sheet/imgDownload.gif);				
*/
	ibsheetObject.prototype.SetDownloadingImage = function(Url)		{};
	
	/**
* GetDragMode :  마우스 드래깅시 처리 방법을 설정하거나 확인 한다
*  @example 
*  //DragMode 설정 값 확인				
*  var mode = mySheet.GetDragMode();				
* @returns {Boolean}  설정된 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetDragMode = function()		{};
	
	/**
* SetDragMode :  마우스 드래깅시 처리 방법을 설정하거나 확인 한다
*  @param {Boolean} 드래그 처리 설정 값 (Default=0)
*  @example 
*  // DragMode 방식 설정 (마우스 드래깅시 행 드래깅 처리 방식 설정)				
*  mySheet.SetDragMode(1);				
*/
	ibsheetObject.prototype.SetDragMode = function(Mode)		{};
	
	/**
* GetEditable :  전체적인 Edit 허용 여부를 확인하거나 설정한다
*  @example 
*  //Edit 가능 여부 확인				
*  mySheet.GetEditable();				
* @returns {Boolean}  설정된 편집 여부 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetEditable = function()		{};
	
	/**
* SetEditable :  전체적인 Edit 허용 여부를 확인하거나 설정한다
*  @param {Boolean} 설정할 편집 여부 값
*  @example 
*  //초기 로드 시 전체 적인 Edit 가능 설정				
*  mySheet.SetEditable(1);				
*/
	ibsheetObject.prototype.SetEditable = function(Edit)		{};
	
	/**
* GetEditEnterBehavior :  데이터를 Edit 후 Enter 키를 눌렀을 때 동작을 확인하거나 설정한다
*  @example 
*  // Enter키의 동작을 확인한다.				
*  mySheet.GetEditEnterBehavior( );				
* @returns {String}  설정한 속성 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetEditEnterBehavior = function()		{};
	
	/**
* SetEditEnterBehavior :  데이터를 Edit 후 Enter 키를 눌렀을 때 동작을 확인하거나 설정한다
*  @param {String } 편집상태에서 Enter key 입력시 설정할 속성 값. Default=“tab”
*  @example 
*  // Edit 후 Enter를 누르면 무조건 아래로 이동하게 한다.				
*  mySheet.SetEditEnterBehavior( down);				
*/
	ibsheetObject.prototype.SetEditEnterBehavior = function(Mode)		{};
	
	/**
* GetEditableColorDiff :  편집이 불가능한 셀을 색상으로 구분하여 표시할지 여부를 확인하거나 설정한다
*  @example 
*  //편집 불가능한 셀의 표시방법 확인				
*  mySheet.GetEditableColorDiff ();				
* @returns {Integer}  설정 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetEditableColorDiff = function()		{};
	
	/**
* SetEditableColorDiff :  편집이 불가능한 셀을 색상으로 구분하여 표시할지 여부를 확인하거나 설정한다
*  @param {Integer} 설정 값
*  @example 
*  //편집 불가능한 셀을 구분하지 않음				
*  mySheet.SetEditableColorDiff (0);				
*/
	ibsheetObject.prototype.SetEditableColorDiff = function(Mode)		{};
	
	/**
* GetEditArrowBehavior :  편집모드시 화살표키(상,하,좌,우)에 대한 셀의 포커스 이동 동작을 확인하거나 설정한다
*  @example 
*  // 설정값 확인				
*  mySheet.GetEditArrowBehavior();				
* @returns {Integer}  설정된 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetEditArrowBehavior = function()		{};
	
	/**
* SetEditArrowBehavior :  편집모드시 화살표키(상,하,좌,우)에 대한 셀의 포커스 이동 동작을 확인하거나 설정한다
*  @param {Integer} 설정할 동작 값 (Default=1)
*  @example 
*  // 편집모드인 상태에서 화살표키(상,하,좌,우)를 눌렀을때 상하,좌우셀로 포커스이동가능				
*  mySheet.SetEditArrowBehavior(3);				
*/
	ibsheetObject.prototype.SetEditArrowBehavior = function(behavior)		{};
	
	/**
* GetEditTabBehavior :  데이터를 Edit 후 Tab 키를 눌렀을 때 동작을 확인하거나 설정한다
*  @example 
*  // Tab키의 동작을 확인한다.				
*  mySheet.GetEditTabBehavior();				
* @returns {String}  설정한 속성 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetEditTabBehavior = function()		{};
	
	/**
* SetEditTabBehavior :  데이터를 Edit 후 Tab 키를 눌렀을 때 동작을 확인하거나 설정한다
*  @param {Number} 편집상태에서 Tab key 입력시 설정할 속성 값. Default=“0”
*  @example 
*  // Edit 후 Tab을 누르면 무조건 다음 셀로 이동하게 한다.				
*  mySheet.SetEditTabBehavior(1);				
*/
	ibsheetObject.prototype.SetEditTabBehavior = function(Mode)		{};
	
	/**
* GetEllipsis :  말줄임 표시 기능을 사용할 것인지 여부를 설정하거나 확인한다
*  @example 
*  // 설정값 확인 				
*  mySheet.GetEllipsis();				
* @returns {Boolean}  사용가능 여부 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetEllipsis = function()		{};
	
	/**
* SetEllipsis :  말줄임 표시 기능을 사용할 것인지 여부를 설정하거나 확인한다
*  @param {Boolean } 말줄임 표시기능 사용여부, Default=0
*  @example 
*  // 말줄임 기능 사용하기				
*  mySheet.SetEllipsis(1);				
*/
	ibsheetObject.prototype.SetEllipsis = function(Flag)		{};
	
	/**
* GetEnable :  이 속성값을 0로 설정하면 마우스나 키보드를 사용한 User Interface 기능은 모두 사용 불가능하고, 기타 제품이 제공하는 Method나 Property는 코딩으로 호출되므로 사용할수 있다
*  @example 
*  //User Interface 사용가능 여부 값을 확인한다.				
*  mySheet.GetEnable();				
* @returns {Boolean}  사용가능 여부 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetEnable = function()		{};
	
	/**
* SetEnable :  이 속성값을 0로 설정하면 마우스나 키보드를 사용한 User Interface 기능은 모두 사용 불가능하고, 기타 제품이 제공하는 Method나 Property는 코딩으로 호출되므로 사용할수 있다
*  @param {Boolean } User Interface 사용 가능 여부
*  @example 
*  //사용 불가능 상태로 변경한다.				
*  mySheet.SetEnable(0);				
*  //사용 가능 상태로 변경한다.				
*  mySheet.SetEnable(1);				
*/
	ibsheetObject.prototype.SetEnable = function(Enable)		{};
	
	/**
* GetEnterBehavior :  셀에서 포커스를 두고 TAB키를 누르면 옆셀로 포커스가 이동하고, Enter 키를 누르면 Edit를 시작한다
*  @example 
*  //설정을 확인하다.				
*  mySheet.GetEnterBehavior();				
* @returns {String}  설정한 속성 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetEnterBehavior = function()		{};
	
	/**
* SetEnterBehavior :  셀에서 포커스를 두고 TAB키를 누르면 옆셀로 포커스가 이동하고, Enter 키를 누르면 Edit를 시작한다
*  @param {String } Enter key 입력시 설정할 속성 값 Default=“edit”
*  @example 
*  //Enter를 누르면 무조건 옆으로 이동하게 한다. 				
*  mySheet.SetEnterBehavior(“tab”);				
*/
	ibsheetObject.prototype.SetEnterBehavior = function(Mode)		{};
	
	/**
* GetEtcData :  데이터 정보 이외의 정보를 확인하거나 설정한다
*  @param {String} 기타정보 키 이름
*  @example 
*  // XML을 통해서 조회된 기타 정보를 TextBox에 설정한다.				
*  document.form1.txtAge.value = mySheet.GetEtcData(age) 				
*  // 저장 처리 완료 후 기타 정보를 이용하여 페이지를 이동한다.				
*  mySheet.DoSave(“save.html”);				
*  location.href = /site/showmaster.html?keyinfo= + mySheet.GetEtcData(“전표번호”)				
* @returns {String}  키에 설정된 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetEtcData = function(KeyName)		{};
	
	/**
* SetEtcData :  데이터 정보 이외의 정보를 확인하거나 설정한다
*  @param {String} 기타정보 키 이름
*  @param {String} 기타정보 키 값
*  @example 
*  // 기타 정보의 값을 변경한다.				
*  mySheet.SetEtcData(age, 40);				
*  // 새로운 기타정보를 생성한다.				
*  mySheet.SetEtcData(Pay, 2000000); 				
*/
	ibsheetObject.prototype.SetEtcData = function(KeyName, Value)		{};
	
	/**
* EtcDataString :  EtcData 객체에 설정된 키와 값을 모두 조합하여 키이름1=키값1&키이름2=키값2와 같은 QueryString 형태로 반환 한다
*  @param {Boolean} 인코딩 처리 여부 (Default = 0)
*  @example 
*  // EtcData 영역의 값을 문자열로 받는다.				
*  var param = mySheet.EtcDataString();				
*  //저장시 인자로 넘긴다.				
*  mySheet.DoSave(Save.jsp, Param);				
* @returns {String}  EtcData에 설정된 키와 값에 대한 QueryString 문자열
*/
	ibsheetObject.prototype.EtcDataString = function(UrlEncode)			{};
	
	/**
* GetExtendLastCol :  마지막 컬럼의 너비를 전체 너비에 맞게 자동으로 맞출것인지 여부를 확인하거나 설정한다
*  @example 
*  //설정 여부를 확인한다.				
*  mySheet.GetExtendLastCol()				
* @returns {Boolean}  확장 설정 여부 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetExtendLastCol = function()		{};
	
	/**
* SetExtendLastCol :  마지막 컬럼의 너비를 전체 너비에 맞게 자동으로 맞출것인지 여부를 확인하거나 설정한다
*  @param {Boolean} 마지막 컬럼 너비 확장 여부 Default= 0
*  @example 
*  //마지막 컬럼을 전체 너비에 맞춘다..				
*  mySheet.SetExtendLastCol(1)				
*/
	ibsheetObject.prototype.SetExtendLastCol = function(Extend)		{};
	
	/**
* FilteredRowCount :  필터행이 있는 경우 필터가 적용되어 있으면 필터링 된 행의 갯수(출력된 행)를 반환하며 필터가 적용되어 있지 않으면 전체 행 수를 반환한다
*  @example 
*  //필터링 된 행 개수를 가져온다.				
*  alert(mySheet.FilteredRowCount());				
* @returns Inteager. 필터링 된 행 갯수
*/
	ibsheetObject.prototype.FilteredRowCount = function()			{};
	
	/**
* FindCheckedRow :  특정 컬럼을 기준으로 체크된 행번호를 |로 연결하여 반환한다
*  @param {Long / String} 특정 컬럼의 Column Index 또는 SaveName
*  @example 
*  //체크된 행번호를 가져온다.				
*  //인자->1, 결과->1|3|4|5|6				
*  var sRow = mySheet.FindCheckedRow(1);				
*  var sRow = mySheet.FindCheckedRow(pass_yn);				
*  //받은 결과를 배열로 생성한다.				
*  var arrRow = sRow.split(|);				
*  for(idx=0; idx<arrRow.length; idx++){ alert(arrRow[idx]); }				
* @returns {String}  체크된 행번호를 | 연결한 문자열 (Default=")
*/
	ibsheetObject.prototype.FindCheckedRow = function(Col)			{};
	
	/**
* FindStatusRow :  트랜잭션 상태에 해당하는 행번호를 ;로 조합하여 반환한다
*  @param {String} 찾고자 하는 트랜잭션 상태 코드를 |로 연결한 문자열
*  @example 
*  // 수정, 삭제인 행을 알아오기				
*  //인자->U|D, 결과->1;3;4;5;6				
*  var sRow = mySheet.FindStatusRow(U|D);				
*  //받은 결과를 배열로 생성한다.				
*  var arrow = sRow.split(;);				
* @returns {String}  트랜잭션 상태에 해당하는 행번호를 ;로 조합한 문자열(Default=")
*/
	ibsheetObject.prototype.FindStatusRow = function(sStatus)			{};
	
	/**
* FindSubSumRow :  ShowSubSum 함수를 이용하여 표시된 소계의 행 번호를 |로 연결하여 문자열로 반환한다
*  @param {Long/String} 소계를 표시한 기준 컬럼의 컬럼Index 또는 SaveName. Default="(전체컬럼)
*  @example 
*  //표시된 모든 소계의 행 번호를 가져온다.				
*  var sRow = mySheet.FindSubSumRow();				
*  //1컬럼으로 기준으로 표시된 소계 행의 행번호를 가져온다.				
*  var sRow = mySheet.FindSubSumRow(1);				
* @returns {String}  소계의 행 번호를 |로 연결한 문자열 
*/
	ibsheetObject.prototype.FindSubSumRow = function(StdCol)			{};
	
	/**
* FindSumRow :  합계행의 인덱스를 확인한다
*  @example 
*  //합계행의 행 번호를 가져온다.				
*  var sumRow = mySheet.FindSumRow();				
* @returns {String}  합계행의 인덱스 (Default=-1)
*/
	ibsheetObject.prototype.FindSumRow = function()			{};
	
	/**
* FindText :  컬럼내에 특정 텍스트를 찾아서 행번호를 반환한다
*  @param {Number / String} 찾고자 하는 컬럼의 Index 또는 SaveName
*  @param {String} 찾을 문자열
*  @param {Number} 시작 행의 Index, Default=첫행
*  @param {Number} 글자 동일 종류, Default= -1
*  @param {Boolean} 대소문자 구분 여부, Default=1
*  @example 
*  // 2컬럼내에 ‘한국'으로 시작하는 데이터의 행 위치 찾기				
*  var Row1 = mySheet.FindText(2, 한국, 0, 0, 0);				
*  //전체 글자가 한국인 데이터의 행 위치 찾기				
*  var Row1 = mySheet.FindText(2, 한국, 0);				
*  //뒤에 글자가 은행인 데이터의 행 위치 찾기				
*  var Row1 = mySheet.FindText(2, 은행, 0, 1);				
*  //글자 중에 은이라는 글자가 들어가는 행 위치 찾기				
*  var Row1 = mySheet.FindText(2, 은, 0, 2);				
*  //대소문자 구분하지 않고 찾기				
*  var Row1 = mySheet.FindText(2, Bank, 0, 2, 0);				
* @returns {Long}  찾아진 행번호 Default=-1
*/
	ibsheetObject.prototype.FindText = function(Col,SearchText,StartRow,FullMatch, CaseSensitive)			{};
	
	/**
* FitColWidth :  전체 넓이를 기준으로 모든 컬럼의 Width를 재조정하여 수평 스크롤이 생기지 않도록 한다
*  @param {String} 각 컬럼의 %단위 너비의 조합, Default="
*  @example 
*  // 컬럼들의 너비 비율을 유지하며 전체적으로 너비 재조정하기				
*  mySheet.FitColWidth();				
*  // % 단위로 재설정하기				
*  mySheet.FitColWidth(10|20|40|30);				
*/
	ibsheetObject.prototype.FitColWidth = function(Width)			{};
	
	/**
* FitSize :  모든 행의 높이와 모든 컬럼의 너비를 재조정한다
*  @param {Boolean} 행 높이 변경 여부
*  @param {Boolean} 컬럼 너비 변경 여부
*  @example 
*  //행 높이만 재조정하기				
*  mySheet.FitSize(1, 0);				
*  //컬럼 너비만 재조정하기				
*  mySheet.FitSize(0, 1);				
*  //모두 재조정하기				
*  mySheet.FitSize(1, 1);				
*/
	ibsheetObject.prototype.FitSize = function(RowHeight, ColumnWidth)			{};
	
	/**
* FitSizeCol :  대상 컬럼의 너비를 컬럼 내의 가장 넓은 글자의 너비에 맞게 재조정한다
*  @param {Number/ String} 대상 컬럼의 Index 또는 SaveName
*  @example 
*  //SaveName 이 sTarget인 컬럼에 대한 처리				
*  mySheet.FitSizeCol(sTarget);				
*/
	ibsheetObject.prototype.FitSizeCol = function(Col)			{};
	
	/**
* GetFocusAfterProcess :  조회 완료 후 포커스를 데이터 행으로 설정할지 여부를 확인하거나 설정한다
*  @example 
*  //조회 후 포커스 여부				
*  mySheet.GetFocusAfterProcess();				
* @returns {Boolean}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetFocusAfterProcess = function()		{};
	
	/**
* SetFocusAfterProcess :  조회 완료 후 포커스를 데이터 행으로 설정할지 여부를 확인하거나 설정한다
*  @param {Boolean} 포커스 설정 여부 (Default=1)
*  @example 
*  //조회 후 포커스를 두지 않음 				
*  mySheet.SetFocusAfterProcess(0);				
*/
	ibsheetObject.prototype.SetFocusAfterProcess = function(mode)		{};
	
	/**
* GetFocusAfterRowTransaction :  행 추가, 삭제, 이동, 복사 후 포커스를 이동 할지 여부를 확인 하거나 설정 한다
*  @example 
*  // 포커스를 이동 할지 여부를 확인 				
*  mySheet.GetFocusAfterRowTransaction(); 				
* @returns {Boolean}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetFocusAfterRowTransaction = function()		{};
	
	/**
* SetFocusAfterRowTransaction :  행 추가, 삭제, 이동, 복사 후 포커스를 이동 할지 여부를 확인 하거나 설정 한다
*  @param {Boolean} 포커스 설정 여부 (Default=1)
*  @example 
*  // 현재 포커스행 하위로 10개 행을 추가후 맨 마지막 추가된 행에 포커스 설정				
*  mySheet.SetFocusAfterRowTransaction(0); 				
*  var new Row = null;				
*  for (var i = 0; I < 10; i++) {				
*    newRow = mySheet.DataInsert();				
*  }				
*  mySheet.SetSelectRow(newRow);				
*/
	ibsheetObject.prototype.SetFocusAfterRowTransaction = function(mode)		{};
	
	/**
* GetFocusEditMode :  셀에 포커스가 들어갔을 때 Edit 가능한 셀은 기본적으로 단순 포커스 상태로 둘것인지 Edit 상태로 둘것인지 여부를 설정하거나 확인한다
*  @example 
*  //포커스가 갔을 때 Edit 상태로 표시 할지 여부 확인				
*  mySheet.GetFocusEditMode();				
* @returns {Integer}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetFocusEditMode = function()		{};
	
	/**
* SetFocusEditMode :  셀에 포커스가 들어갔을 때 Edit 가능한 셀은 기본적으로 단순 포커스 상태로 둘것인지 Edit 상태로 둘것인지 여부를 설정하거나 확인한다
*  @param {Integer} 설정 여부 (Default=0)
*  @example 
*  // 포커스가 갔을 때 Edit가 아닌 단순 포커스 상태 유지 				
*  mySheet.SetFocusEditMode(0);				
*  //포커스가 갔을 때 Edit 상태로 표시				
*  mySheet.SetFocusEditMode(1);				
*/
	ibsheetObject.prototype.SetFocusEditMode = function(Mode)		{};
	
	/**
* GetFrozenCol :  좌측 고정컬럼을 동적으로 설정 확인한다
*  @example 
*  // 고정컬럼 설정 값을 확인한다.				
*  alert(mySheet.GetFrozenCol());				
* @returns {Integer}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetFrozenCol = function()		{};
	
	/**
* SetFrozenCol :  좌측 고정컬럼을 동적으로 설정 확인한다
*  @param {Integer} 설정할 고정컬럼 개수 (Default=0)
*  @example 
*  // 3개의 고정컬럼을 설정한다. 				
*  mySheet.SetFrozenCol(3);				
*/
	ibsheetObject.prototype.SetFrozenCol = function(Count)		{};
	
	/**
* GetFrozenRows :  고정행 출력 여부 및 출력 옵션을 설정하거나 확인한다
*  @example 
*  // 고정행 설정 값을 확인한다.				
*  alert(mySheet.GetFrozenRows());				
* @returns {Integer}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetFrozenRows = function()		{};
	
	/**
* SetFrozenRows :  고정행 출력 여부 및 출력 옵션을 설정하거나 확인한다
*  @param {Integer} 설정할 고정행 개수 (Default=0)
*  @example 
*  // 3개의 고정행을 설정한다. 				
*  mySheet.SetFrozenRows(3);				
*/
	ibsheetObject.prototype.SetFrozenRows = function(Rows)		{};
	
	/**
* GetCellProperty :  InitColumns 또는 InitCellProperty 에서 설정한 속성의 정보를 확인한다
*  @param {Long} 특정 셀의 Row Index
*  @param {Long / String} 특정 셀의 컬럼 Index 또는 SaveName
*  @param {String} 확인하고자 하는 속성명
*  @example 
*  //데이터 타입을 읽어옴				
*  var iType = mySheet.GetCellProperty(1, 1, Type);				
*  //데이터 SaveName을 읽어옴				
*  var sSaveName = mySheet.GetCellProperty(1, 1, SaveName);				
* @returns {String/ Boolean/ Integer}   설정한 컬럼의 속성값 
*/
	ibsheetObject.prototype.GetCellProperty = function(Row, Col, PropName)			{};
	
	/**
* GetChildNodeCount :  트리구조에서 특정 행의 하위(다음레벨) 노드의 개수를 확인한다
*  @param {Long} 특정 행의 Row Index
*  @example 
*  //1번째행의 하위노드 개수				
*  var childCount = mySheet.GetChildNodeCount(1);				
* @returns {Integer}  하위 노드의 개수
*/
	ibsheetObject.prototype.GetChildNodeCount = function(Row)			{};
	
	/**
* GetChildRows :  트리구조에서 특정 행의 자식행들의 Index를 |로 조합하여 반환한다
*  @param {Long} 대상 행의 Index
*  @param {Integer} 확인할 자식행의 제한 레벨 (-1인 경우 모든 자식행), Default=-1
*  @example 
*  // 2번째 행의 모든 자식행 확인				
*  var childRows = mySheet.GetChildRows(2);				
*  // 2번째 행의 자식레벨중 3레벨까지만 확인				
*  var childRows = mySheet.GetChildRows(2, 3);				
*  // 2번째 행의 레벨기준으로 하위 +2레벨까지 확인				
*  var myLevel = mySheet.GetRowLevel(2);				
*  var childRows = mySheet.GetChildRows(2, myLevel+2);				
* @returns {String}  대상 자식행들의 문자열 조합
*/
	ibsheetObject.prototype.GetChildRows = function(Row, MaxLevel)			{};
	
	/**
* GetComboInfo :  특정 셀의 콤보 정보를 확인한다
*  @param {Long} 특정 셀의 Row Index
*  @param {Long / String} 틀정 셀의 컬럼 Index 또는 SaveName
*  @param {String} Text, Code 선택
*  @example 
*  //콤보코드와 텍스트를 가져온다.				
*  var sText = mySheet.GetComboInfo(0,2, Text);				
*  var sCode = mySheet.GetComboInfo(0,2, Code);				
*  //각각 배열로 구성한다.				
*  var arrText = sText.split(|);				
*  var arrCode = sCode.split(|);				
*  //2행의 2컬럼의 콤보 코드를 이용하여 콤보텍스트를 가져온다.				
*  for(i=0; i<arrCode.length; i++) {				
*      if(mySheet.GetCellValue(2,2) == arrCode[i]) {				
*          alert(arrText[i]);				
*          break;				
*      }				
*  }				
* @returns {String}  콤보 텍스트 또는 코드
*/
	ibsheetObject.prototype.GetComboInfo = function(Row,Col,Flag)			{};
	
	/**
* GetCurrentPage :  조회 방식이 smGeneral 이 아닌 경우 전체데이터를 기준으로 현재 화면 위에 올려진 부분이 몇번째 페이지인지를 리턴한다
*  @example 
*  // 현재 페이지 넘버.				
*  var pageNum = mySheet.GetCurrentPage();				
* @returns {Integer}  현재 페이지 번호
*/
	ibsheetObject.prototype.GetCurrentPage = function()			{};
	
	/**
* GetDataRows :  단위 데이터 행의 설정 개수를 확인 한다
*  @example 
*  // 단위데이터행의 개수를 확인한다.				
*  var dataRows = mySheet.GetDataRows();.				
* @returns {Integer}  설정 되어 있는 단위 데이터 행의 개수
*/
	ibsheetObject.prototype.GetDataRows = function()			{};
	
	/**
* GetEditText :  Edit 중인 글자를 확인한다
*  @example 
*  // 편집중인 글자를 확인한다.				
*  function mySheet_OnKeyUp(Row, Col, KeyCode, Shift){				
*  var editTxt= Edit중인 글자 =  + mySheet.GetEditText();				
*  editTxt += 실제글자 =  + mySheet.GetCellValue(Row,Col);				
*  alert(editTxt);				
*  }				
* @returns {String}  편집중인 글자 (Default=")
*/
	ibsheetObject.prototype.GetEditText = function()			{};
	
	/**
* GetFilterParam :  SearchMode:3 은, 디비에서 부분 데이터를 가져와 조회하는 것이므로 필터링 기능 사용이 불가능하다
*  @param {Boolean} 전체 필터링 여부, Default =0
*  @param {Boolean} UrlEncode 여부, Default= 1
*  @param {사용 안 함} 같다
*  @param {같지 않다} 작은
*  @param {작거나 같은} 큰
*  @param {크거나 같은} 단어로 시작함
*  @param {단어로 시작하지 않음} 단어로 끝남
*  @param {단어로 끝나지 않음} 포함함
*  @example 
*  //필터행 전체 컬럼을 Param 형식의 스트링으로 구해오기.				
*  var FilterStr = mySheet.GetFilterParam(1);				
*  //필터링 된 컬럼들만 Param 형식의 스트링으로 구해오기.				
*  var FilterStr = mySheet.GetFilterParam(0);				
* @returns {String}  조회 조건 Query String
*/
	ibsheetObject.prototype.GetFilterParam = function(AllFilter, UrlEncode)			{};
	
	/**
* GetFirstChildRow :  트리구조에서 특정 행의 첫번째 자식 행의 Index를 확인한다
*  @param {Long} 대상 행의 Index
*  @example 
*  // 2번째 행의 첫번째 자식 행을 확인한다.				
*  var firstChild = mySheet.GetFirstChildRow(2);				
* @returns {Long}  첫번째 자식 행의 Index
*/
	ibsheetObject.prototype.GetFirstChildRow = function(Row)			{};
	
	/**
* GetGroupCol :  현재 설정되어있는 그룹 기준 컬럼을 SaveName확인한다
*  @example 
*  // 그룹행을 설정한다.				
*  mySheet.ShowGroupRow();				
*  // 현재 설정되어 있는 그룹 기준 컬럼을 확인한다				
*  var Cols = mySheet.GetGroupCol();				
* @returns {String}  현재 설정된 그룹 기준 컬럼 정보
*/
	ibsheetObject.prototype.GetGroupCol = function()			{};
	
	/**
* GetLastChildRow :  트리구조에서 특정 행의 마지막 자식 행의 Index를 확인한다
*  @param {Long} 대상 행의 Index
*  @example 
*  // 2번째 행의 마지막 자식 행을 확인한다.				
*  var lastChild = mySheet.GetLastChildRow(2);				
* @returns {Long}  마지막 자식 행의 Index
*/
	ibsheetObject.prototype.GetLastChildRow = function(Row)			{};
	
	/**
* GetMergedEndCell :  전체 머지된 셀중 머지 마지막 셀의 Row와 Col 정보를 Row, Col 형태의 String으로 리턴한다
*  @param {Long} 대상 행의 Index
*  @param {Long / String} 대상이 되는 컬럼 또는 SaveName
*  @example 
*  var endMergeCell = mySheet.GetMergedEndCell(4,5);				
* @returns {String}  Row와 Col 정보를 “Row
*/
	ibsheetObject.prototype.GetMergedEndCell = function(Row, Col)			{};
	
	/**
* GetMergedStartCell :  전체 머지된 셀중 머지 시작 셀의 Row와 Col 정보를 Row, Col 형태의 String으로 리턴한다
*  @param {Long} 대상 행의 Index
*  @param {Long / String} 대상이 되는 컬럼 또는 SaveName
*  @example 
*  var startMergeCell = mySheet.GetMergedStartCell(4,5);				
* @returns {String}  Row와 Col 정보를 “Row
*/
	ibsheetObject.prototype.GetMergedStartCell = function(Row, Col)			{};
	
	/**
* GetNextSiblingRow :  트리구조에서 특정 행에 대한 동일 부모, 동일 레벨상의 다음 행의 Index를 확인 한다
*  @param {Long} 대상 행의 Index
*  @example 
*  // 6번째 행의 동일레벨 상의 다음 행을 확인한다.				
*  var next = mySheet.GetNextSiblingRow(6);				
* @returns {Long}  동일 레벨상 다음 행의 Index
*/
	ibsheetObject.prototype.GetNextSiblingRow = function(Row)			{};
	
	/**
* GetParentRow :  트리구조에서 특정 행의 부모 행의 Index를 확인한다
*  @param {Long} 대상 행의 Index
*  @example 
*  // 5번째 행의 부모행을 확인한다.				
*  var parent = mySheet.GetParentRow(5);				
* @returns {Long}  부모 행의 Index
*/
	ibsheetObject.prototype.GetParentRow = function(Row)			{};
	
	/**
* GetPrevSiblingRow :  트리구조에서 특정 행에 대한 동일 부모, 동일 레벨상의 이전 행의 Index를 확인 한다
*  @param {Long} 대상 행의 Index
*  @example 
*  // 6번째 행의 동일레벨 상의 이전 행을 확인한다.				
*  var previous = mySheet.GetPrevSiblingRow(6);				
* @returns {Long}  동일 레벨상 이전 행의 Index
*/
	ibsheetObject.prototype.GetPrevSiblingRow = function(Row)			{};
	
	/**
* GetSaveData :  저장 페이지를 호출하여 저장 처리를 완료한 후 생성된 결과를 문자열로 반환한다
*  @param {String} 저장 처리할 페이지 URL
*  @param {String} 저장할 Query String, Default="
*  @param {String} 저장 조건 Query String, Default="
*  @param {Object} 요청헤더 설정 값 객체, Default={}
*  @example 
*  //저장 String 가져오기 – 트랜잭션이 발생한 것만 저장할 경우				
*  var SaveStr = mySheet.GetSaveString();				
*  //필수 입력과 같은 확인이 이루어짐				
*  if (mySheet.IsDataModified && SaveStr == ") return;				
*  //저장 처리 결과 읽어오기				
*  var rtnData = mySheet.GetSaveData(save.jsp, SaveStr);				
*  //돌아온 결과를 시트에 반영				
*  mySheet.LoadSaveData(rtnData);				
* @returns {String}  저장 데이터의 문자열
*/
	ibsheetObject.prototype.GetSaveData = function(PageUrl, SaveString, Param, Opt)			{};
	
	/**
* GetSaveJson :  저장 대상의 데이터를 Json 객체로 반환한다
*  @param {Boolean} 전체 저장 여부, (Default =0)
*  @param {Number / String} 대상이 되는 기준 컬럼의 Index 또는 SaveName, (Default =상태 컬럼)
*  @example 
*  //모든 행의 데이터를 객체로 받기				
*  var SaveJson = mySheet.GetSaveJson({AllSave:1});				
*  //저장 대상의 데이터를 객체로 받기 (트랜잭션이 발생한 행) 				
*  var SaveJson = mySheet.GetSaveJson();				
*  // 4번째 컬럼이 Check된 행의 데이터를 객체로 받기				
*  var SaveJson = mySheet.GetSaveJson({StdCol:4});				
* @returns {Object}  저장할 데이터의 Json 객체
*/
	ibsheetObject.prototype.GetSaveJson = function(Option)			{};
	
	/**
* GetSaveString :  저장 시 사용되는 데이터의 Query String을 문자열로 반환한다
*  @param {Boolean} 전체 저장 여부, Default=0
*  @param {Boolean} UrlEncode 여부, Default=1
*  @param {Long / String} 대상이 되는 기준 컬럼 또는 SaveName Default =상태 컬럼
*  @param {String} 저장시 SaveName 앞에 붙이고자 하는 문자열, Default="
*  @param {Integer} Query String 문자열 조합방법을 설정Mode=1, Mode=2 (Default =1)
*  @param {String} Mode=2일때, 연결될 구분자 설정 (Default =|)
*  @example 
*  //DoAllSave 함수 사용과 동일한 저장 String 가져오기				
*  var SaveStr = mySheet.GetSaveString(1);				
*  //DoSave 함수 사용과 동일한 저장 String 가져오기 				
*  //– 트랜잭션이 발생한 것만 저장할 경우				
*  var SaveStr = mySheet.GetSaveString(0);				
*  //DoSave 함수 사용과 동일한 저장 String 가져오기 				
*  //– 4컬럼이 Check된 것만 저장하는 경우				
*  var SaveStr = mySheet.GetSaveString(0, 1, 4);				
*  //DoSave 함수 사용과 동일한 저장 String 가져오기 				
*  // 돌아오는 값은 pre_AA=1&pre_BB=2&pre_CC=3 형태가 된다.				
*  var SaveStr = mySheet.GetSaveString(0, 1, 1, “pre_”);				
*  //설정할 선택인자 json형식으로 속성 설정하기				
*  mySheet.GetSaveString({AllSave : 1, UrlEncode:0, Mode:2, Delim:$})				
*  see also 				
*  GetSaveJson Method				
* @returns {String}  저장할 Query String
*/
	ibsheetObject.prototype.GetSaveString = function(AllSave, UrlEncode, Col, Prefix ,Mode, Delim)			{};
	
	/**
* GetSearchData :  조회 페이지를 호출하여 조회 처리를 완료한 후 생성된 조회결과 데이터를 문자열로 반환한다
*  @param {String} 조회 처리할 페이지 URL
*  @param {String} 조회 조건 Query String, Default="
*  @param {Object} 요청헤더 설정 값 객체, Default={}
*  @example 
*  //조회 데이터 읽어오기				
*  var sXml = mySheet.GetSearchData(list.jsp);				
*  //조회 결과 내용을 표현하기				
*  mySheet.LoadSearchData(sXml);				
* @returns {String}  조회 데이터의 문자열
*/
	ibsheetObject.prototype.GetSearchData = function(PageUrl, Param, Opt)			{};
	
	/**
* GetSelectionCols :  사용자가 드레그한 영역의 열을 구분자로 구분하여 반환한다
*  @param {String} 조합구분자, Default=|
*  @example 
*  // 구분자로 연결하여 선택된 열번 가져오기				
*  var sColStr = mySheet.GetSelectionCols(/);				
*  //자바 스크립트 배열로 만들기				
*  var arr = sColStr.split(/);				
*  for (i=0; i<arr.length(); i++) {				
*      alert(arr[i] +  컬럼이 선택되었음);				
*  }				
* @returns {String}  선택되어있는 행번 조합 문자열
*/
	ibsheetObject.prototype.GetSelectionCols = function(DeliChar)			{};
	
	/**
* GetSelectionRows :  사용자가 드레그를 통해 선택한 영역의 행을 구분자로 구분하여 반환한다
*  @param {String} 조합구분자, Default=|
*  @example 
*  /// 구분자로 연결하여 선택된 행번 가져오기				
*  var sRowStr = mySheet.GetSelectionRows(/);				
*  //자바 스크립트 배열로 만들기				
*  var arr = sRowStr.split(/);				
*  for (i=0; i<arr.length(); i++) {				
*      alert(arr[i] +  행이 선택되었음);				
*  }				
* @returns {String}  선택되어있는 행번 조합 문자열
*/
	ibsheetObject.prototype.GetSelectionRows = function(DeliChar)			{};
	
	/**
* GetSheetHtml :  현재 시트의 Html 소스를 반환한다
*  @example 
*  // 시트 Html 가져오기				
*  var code = mySheet.GetSheetHtml();				
*  document.getElementById(styleText).value = code.style;				
*  document.getElementById(htmlText).value += code.body; 				
* @returns {Object}  (style
*/
	ibsheetObject.prototype.GetSheetHtml = function()			{};
	
	/**
* GoToBaseSheet :  피벗 설정 팝업으로부터 피벗 테이블이 화면에 표시되어 있는 경우 이 기능을 사용하면 해당 피벗 테이블의 원본 시트로 이동 한다
*  @example 
*  // 피벗 테이블의 원본 시트로 이동				
*  mySheet.GoToBaseSheet();				
* @returns None.
*/
	ibsheetObject.prototype.GoToBaseSheet = function()			{};
	
	/**
* GoToFirstPage :  페이징 모드로 설정되어 있는 경우 맨 처음 페이지로 이동한다
*  @example 
*  // 페이징 모드 설정				
*  var cfg = {SearchMode:1, Page:10};				
*  mySheet.SetConfig(cfg);				
*  // 맨 처음 페이지로 이동				
*  mySheet.GoToFirstPage();				
* @returns None.
*/
	ibsheetObject.prototype.GoToFirstPage = function()			{};
	
	/**
* GoToLastPage :  페이징 모드로 설정되어 있는 경우 맨 마지막 페이지로 이동한다
*  @example 
*  // 페이징 모드 설정				
*  var cfg = {SearchMode:1, Page:10};				
*  mySheet.SetConfig(cfg);				
*  // 맨 마지막 페이지로 이동				
*  mySheet.GoToLastPage();				
* @returns Boolean
*/
	ibsheetObject.prototype.GoToLastPage = function()			{};
	
	/**
* GoToNextPage :  페이징 모드로 설정되어 있는 경우 다음 페이지로 이동한다
*  @example 
*  // 페이징 모드 설정				
*  var cfg = {SearchMode:1, Page:10};				
*  mySheet.SetConfig(cfg);				
*  // 다음 페이지로 이동				
*  mySheet.GoToNextPage();				
*/
	ibsheetObject.prototype.GoToNextPage = function()			{};
	
	/**
* GoToPageNum :  페이징 모드로 설정되어 있는 경우 인자로 입력한 페이지로 이동한다
*  @param {Integer} 이동하고자 하는 Page의 Index
*  @example 
*  // 페이징 모드 설정				
*  var cfg = {SearchMode:1, Page:10};				
*  mySheet.SetConfig(cfg);				
*  // 5번째 페이지로 이동				
*  mySheet.GoToPageNum(5);				
*/
	ibsheetObject.prototype.GoToPageNum = function(index)			{};
	
	/**
* GoToPrevPage :  페이징 모드로 설정되어 있는 경우 이전 페이지로 이동한다
*  @example 
*  // 페이징 모드 설정				
*  var cfg = {SearchMode:1, Page:10};				
*  mySheet.SetConfig(cfg);				
*  // 이전 페이지로 이동				
*  mySheet.GoToPrevPage();				
* @returns None.
*/
	ibsheetObject.prototype.GoToPrevPage = function()			{};
	
	/**
* GetHeaderActionMenu :  헤더 컨텍스트 메뉴를 설정하거나 확인한다
*  @example 
*  // 설정된 헤더메뉴 확인				
*  var menu = mySheet.GetHeaderActionMenu();				
*  alert(menu.MenuText); // 설정된 MenuText 확인				
*  alert(menu.MenuCode); // 설정된 MenuCode 확인				
* @returns {Object}  MenuText
*/
	ibsheetObject.prototype.GetHeaderActionMenu = function()		{};
	
	/**
* SetHeaderActionMenu :  헤더 컨텍스트 메뉴를 설정하거나 확인한다
*  @param {String} | 문자로 연결한 메뉴명 문자열
*  @param {String} | 문자로 연결한 메뉴코드 문자열. 시트에서 제공하는 고정 코드를 설정하는 경우 제품내에서 해당 기능을 처리한다.
*  @example 
*  // aaa 메뉴 클릭시 필터를 출력하고, bbb 메뉴 클릭시 필터를 숨기는 헤더 메뉴를 설정한다.				
*  mySheet.SetHeaderActionMenu(aaa|*-|bbb, _ibShowFilter||_ibHideFilter);				
*/
	ibsheetObject.prototype.SetHeaderActionMenu = function(MenuText, MenuCode)		{};
	
	/**
* GetHeaderBackColor :  헤더 행의 바탕색을 설정하거나 확인한다
*  @example 
*  //헤더의 배경색 확인한다.				
*  mySheet.GetHeaderBackColor();				
* @returns {String}  현재 배경 색상 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetHeaderBackColor = function()		{};
	
	/**
* SetHeaderBackColor :  헤더 행의 바탕색을 설정하거나 확인한다
*  @param {String} 헤더행의 배경 색상
*  @example 
*  //헤더의 배경색을 빨간색으로 설정한다.				
*  mySheet.SetHeaderBackColor(#FF0000);				
*/
	ibsheetObject.prototype.SetHeaderBackColor = function(Color)		{};
	
	/**
* GetHeaderCheck :  헤더의 전체체크박스 값을 확인 및 설정 한다
*  @param {Number} 대상 행의 Index
*  @param {Number / String} 대상 컬럼의 Index 또는 SaveName
*  @example 
*  // 헤더의 3번째 컬럼의 전체 체크박스 값을 확인 한다.				
*  var CheckValue = mySheet.GetHeaderCheck(0, 3);				
* @returns {Boolean}  현재 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetHeaderCheck = function(Row, Col)		{};
	
	/**
* SetHeaderCheck :  헤더의 전체체크박스 값을 확인 및 설정 한다
*  @param {Number} 대상 행의 Index
*  @param {Number / String} 대상 컬럼의 Index 또는 SaveName
*  @param {Boolean} 체크박스에 설정하고자 하는 값
*  @example 
*  // 헤더의 3번째 컬럼의 전체 체크박스 값을 언체크 설정 한다..				
*  mySheet.SetHeaderCheck(0, 3, 0);				
*/
	ibsheetObject.prototype.SetHeaderCheck = function(Row, Col, Value)		{};
	
	/**
* GetHeaderFontBold :  헤더 행의 글자 볼드 여부를 설정하거나 확인한다
*  @example 
*  //헤더의 글자 Bold 설정 확인한다.				
*  mySheet.GetHeaderFontBold();				
* @returns {Boolean}  현재 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetHeaderFontBold = function()		{};
	
	/**
* SetHeaderFontBold :  헤더 행의 글자 볼드 여부를 설정하거나 확인한다
*  @param {Boolean} Header행의 Font Bold 여부
*  @example 
*  //헤더의 글자를 Bold로 설정한다.				
*  mySheet.SetHeaderFontBold(1);				
* @returns {Boolean}  현재 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.SetHeaderFontBold = function(Bold)		{};
	
	/**
* GetHeaderFontColor :  헤더 행의 글자색을 설정하거나 확인한다
*  @example 
*  //헤더의 글자색을 검은색으로 설정한다.				
*  mySheet.GetHeaderFontColor();				
* @returns {String}  현재 설정값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetHeaderFontColor = function()		{};
	
	/**
* SetHeaderFontColor :  헤더 행의 글자색을 설정하거나 확인한다
*  @param {String} 설정하고자 하는 WebColor
*  @example 
*  //헤더의 글자색을 검은색으로 설정한다.				
*  mySheet.SetHeaderFontColor(#000000);				
*/
	ibsheetObject.prototype.SetHeaderFontColor = function(Color)		{};
	
	/**
* HeaderRows :  헤더행의 개수를 확인한다
*  @example 
*  //헤더 행의 개수를 확인한다.				
*  alert(헤더 행의 개수는  + mySheet.HeaderRows() + 개 입니다.);				
*/
	ibsheetObject.prototype.HeaderRows = function()			{};
	
	/**
* GetHeaderRowHeight :  헤더 행의 행높이를 설정하거나 확인한다
*  @example 
*  //헤더 행의 높이를 확인				
*  mySheet.GetHeaderRowHeight();				
* @returns {Integer}  현재 설정값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetHeaderRowHeight = function()		{};
	
	/**
* SetHeaderRowHeight :  헤더 행의 행높이를 설정하거나 확인한다
*  @param {Integer} 설정하고자 하는 픽셀값
*  @example 
*  //헤더 행의 높이를 30 픽셀로 설정.				
*  mySheet.SetHeaderRowHeight(30);				
*/
	ibsheetObject.prototype.SetHeaderRowHeight = function(Height)		{};
	
	/**
* HideFilterRow :  IBSheet 상단 고정행의 필터행을 삭제한다
*  @example 
*  //필터행 삭제하기				
*  mySheet.HideFilterRow();				
*/
	ibsheetObject.prototype.HideFilterRow = function()			{};
	
	/**
* HideProcessDlg :  시트에 표시되어 있는 대기중 이미지를 닫는다
*  @example 
*  // 대기중 이미지 닫기				
*  mySheet.HideProcessDlg();				
*/
	ibsheetObject.prototype.HideProcessDlg = function()			{};
	
	/**
* HideSubSum :  ShowSubSum 함수를 호출하면 다음 조회시 조회 데이터 사이에 소계행이 삽입된다
*  @param {Long/String} 소계를 표시한 기준 컬럼의 컬럼Index 또는 SaveName. Default="(전체컬럼)
*  @example 
*  //1컬럼을 중심으로 소계 계산하여 표시하기				
*  var info = [{StdCol:1, SumCols:3|4|5}];				
*  mySheet.ShowSubSum(info);				
*  //표시된 소계 숨기기				
*  mySheet.HideSubSum();				
*/
	ibsheetObject.prototype.HideSubSum = function(StdCol)			{};
	
	/**
* GetHighlightAfterSort :  소트 후 하이라이트 처리 방법을 확인하거나 설정한다
*  @example 
*  //소트 이후 설정 확인				
*  mySheet.GetHighlightAfterSort();				
* @returns {Integer}  현재 설정값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetHighlightAfterSort = function()		{};
	
	/**
* SetHighlightAfterSort :  소트 후 하이라이트 처리 방법을 확인하거나 설정한다
*  @param {Integer} Sort 설정방법 (Default=1)
*  @example 
*  //소트 이후 기존에 선택하고 있던 데이터를 찾아감.				
*  mySheet.SetHighlightAfterSort(1);				
*/
	ibsheetObject.prototype.SetHighlightAfterSort = function(Sort)		{};
	
	/**
* IBCloseCalendar :  외부의 컨트롤에서 사용한 달력팝업을 닫도록 설정한다
*  @example 
*/
	ibsheetObject.prototype.IBCloseCalendar = function()			{};
	
	/**
* IBShowCalendar :  달력 팝업을 외부의 컨트롤에서 사용하도록 설정한다
*  @param {String} 날짜데이터값 (Default=현재날짜)
*  @param {  Object} 기능을 json 형태로 설정한다. 설정값	내용 Close	취소 버튼 Today	오늘일자 입력 버튼 Yesterday	어제일자 입력 버튼 설정값	내용 Left	왼쪽정렬 Center	가운데정렬 (기본값) Right	오른쪽정렬
*  @example 
*  // 날짜데이터값 입력 				
*  var val = document.getElementById(DateText).value;				
*  // 달력 팝업 Dialog 위치 : X, Y 좌표값 사용시 				
*  1.var obj = { Format: Ymd, X:300, Y:600, CallBack: Test };				
*  // 달력 팝업 Dialog 위치 : 마우스 마지막 위치 사용시				
*  2.var obj = { Format: Ymd, Target:Mouse, CallBack: Test };				
*  // 달력 팝업 Dialog 위치 : 달력 버튼 위치 사용시				
*  3.var obj = { Format:Ymd, Target:document.getElementById(DateBtn), CallBack: Test };				
*  // CalButtons 속성 : 달력 닫기 버튼 옵션 설정 사용시				
*  3.var obj = { Format:Ymd, Target:document.getElementById(DateBtn), CallBack: Test , CalButtons : Close};				
*  // 달력 닫기 버튼 옵션 설정 사용시 정렬 설정: 왼쪽 정렬				
*  4.var obj = { Format:Ymd, Target:document.getElementById(DateBtn), CallBack: Test, CalButtons : Close, CalButtonAlign : Left };				
*  // fnName : 함수명으로 function 생성				
*  function Test (date){				
*  // 달력 팝업 Dialog서 날짜 선택시 리턴값				
*  document.getElementById(DateText).value = date;				
*  }				
*/
	ibsheetObject.prototype.IBShowCalendar = function(val, obj)			{};
	
	/**
* GetImageList :  N번째 이미지 파일의 웹서버 경로를 확인하거나 설정한다
*  @param {Integer} Image 인덱스
*  @example 
*  // 해당 인덱스에 설정한 이미지경로 확인 				
*  mySheet.GetImageList(0);				
* @returns {String}  해당 인덱스에 설정한 Image경로
*/
	ibsheetObject.prototype.GetImageList = function(Index)		{};
	
	/**
* SetImageList :  N번째 이미지 파일의 웹서버 경로를 확인하거나 설정한다
*  @param {Integer} Image 인덱스
*  @param {String} 설정할 Image 경로
*  @example 
*  // 0 인덱스에 이미지경로 설정 				
*  mySheet.SetImageList(0, ../image/btn_search.gif”);				
*  // 0 인덱스에 저장된 이미지 사용(Type:Image)				
*  mySheet.SetCellValue(3, 5, 0);				
*  mySheet.SetCellImage(3, 5, 0);				
*  mySheet.SetSearchingImage(0);				
*  mySheet.SetSavingImage(0);				
*  mySheet.SetWaitImage(0);				
*  mySheet.SetKeyFieldImage(0);				
*/
	ibsheetObject.prototype.SetImageList = function(Index, Url)		{};
	
	/**
* InitCellProperty :  조회 또는 행 추가 후 특정 셀의 속성 정의를 기본 컬럼 속성 정의와 다르게 하고자 하는 경우에 이 함수를 사용한다
*  @param {Long} 대상 행의 Index
*  @param {Long / String} 대상이 되는 컬럼 Index 또는 SaveName
*  @param {Object} 셀의 속성 정의 객체
*  @example 
*  // Text 컬럼 타입으로 변경				
*  var info = {Type: Text, Align: Center, Edit: 0};				
*  mySheet.InitCellProperty(2, sCombo, info);				
*  // 허용키, 제외키 설정				
*  var info = {Type:Text,AcceptKeys:N|[abcd!@#], ExceptKeys:[890!]};				
*  mySheet.InitCellProperty(3, 4 ,info);				
*/
	ibsheetObject.prototype.InitCellProperty = function(Row, Col, info)			{};
	
	/**
* InitColumns :  각 컬럼의 데이터 타입, 포맷 및 기능들을 설정한다
*  @param {json} 각 컬럼의 기능을 json 형태로 설정한다.
*  @example 
*  //각 컬럼의 기능을 설정한다.				
*  var cols = [				
*  {Type:Status,Width:60,SaveName:sStatus,Align:Center},				
*  {Type:DelCheck,Width:60,SaveName:sDelete,Align:Center},				
*  {Type:Text,Width:100,SaveName:JOB,Align:Center},				
*  {Type:Combo,Width:100,SaveName:DEPTNO,Align:Center				
*  ,ComboText:comboDataArr[0],ComboCode:comboDataArr[1]},				
*  {Type:Text,Width:60,SaveName:EMPNO,Align:Center},				
*  {Type:Text,Width:150,SaveName:ENAME,Align:"},				
*  {Type:Date,Width:120,SaveName:HIREDATE,Format:Ymd				
*  ,Align:Center,EditLen:8},				
*  {Type:Text,Width:120,SaveName:MGR,Align:Center},				
*  {Type:Int,Width:120,SaveName:SAL,Align:Right,Format:NullInteger},				
*  {Type:Int,Width:60,SaveName:COMM,Align:Right,Format:Integer}				
*  ];				
*  mySheet.InitColumns(cols);				
*/
	ibsheetObject.prototype.InitColumns = function(cols)			{};
	
	/**
* InitComboNoMatchText :  Combo 항목을 표시 시, Combo 항목에 없는 항목을 설정하거나 조회 하였을 경우 보여지는 글자를 설정한다
*  @param {Boolean} 콤보 항목 이외의 글자를 보여줄지 여부를 설정
*  @param {String} 콤보 항목 이외인 경우 표시할 글자, Default ="
*  @param {Boolean} 콤보 항목 이외의 값이 오는 경우 그 값을 해당 셀에 아이템으로 삽입한다. Default=0
*  @example 
*  //Combo 항목이 없는 경우 항목 없음 표시하기				
*  mySheet.InitComboNoMatchText(1, 항목없음);				
*/
	ibsheetObject.prototype.InitComboNoMatchText = function(Show, ShowText, InsertItem)			{};
	
	/**
* InitHeaders :  헤더에 들어갈 타이틀과 헤더기능을 지정한다
*  @param {Object[]} 헤더의 행별 정보를 설정
*  @param {Object} 헤더의 공통 정보를 설정
*  @param {} 설명
*  @param {Text} 헤더에 표시할 Text를 |로 연결한 문자열 Align	String	헤더 텍스트의 정렬방법 Default=Center RowMerge	Boolean	헤더행의 가로머지 허용 여부 Default=1
*  @param {Sort} 헤더 클릭을 통한 컬럼 Sort 허용 여부 Default=1 ColMove	Boolean	헤더 컬럼 이동 가능 여부 Default=1 ColResize	Boolean	컬럼 너비 조정 허용 여부 Default=1 HeaderCheck	Boolean	헤더에 전체 체크 표시 여부 Default=1
*  @example 
*  //2줄 헤더타이틀을 설정한다.				
*  var headers = [ 				
*  {Text:상태|삭제|직원정보|직원정보|직원정보, Align: Center} ,				
*  {Text:상태|삭제|직원명 |직원번호|입사일, Align: Center}				
*  ];				
*  var info = {Sort:1, ColMove:1, ColResize:0, HeaderCheck:0};				
*  mySheet.InitHeaders(headers,info);				
*/
	ibsheetObject.prototype.InitHeaders = function(Headers, Info)			{};
	
	/**
* IsDataModified :  데이터 행의 트랜잭션 여부를 확인한다
*  @example 
*  // 트랜잭션이 발생하지 않은 경우 메시지 표시 후 저장 취소 처리				
*  if(!mySheet.IsDataModified()) {				
*      alert(저장할 내역이 없습니다. 저장은 취소합니다.);				
*  // 트랜잭션이 발생한 경우 저장 처리				
*  } else {				
*      mySheet.DoSave(sheet_save.jsp);				
*  }				
* @returns {Boolean}  데이터 행의 트랜잭션 여부
*/
	ibsheetObject.prototype.IsDataModified = function()			{};
	
	/**
* IsHaveChild :  트리형 데이터에서 특정 행에 Child 레벨의 행이 존재하는지 여부를 확인한다
*  @param {Long} 특정 행의 Row Index
*  @param {Boolean} Child 레벨의 행 중 삭제 상태의 행을 포함할것인가 여부, Default=0
*  @example 
*  //4행의 Child 존재 여부를 확인한다.				
*  if(mySheet.IsHaveChild(4)) {				
*     alert(4행에 자식 레벨이 존재합니다.);				
*  }else{				
*    alert(4행에 자식 레벨이 존재하지 않습니다.);				
*  }				
*  //4행의 삭제된 Child도 포함하여 확인한다.				
*  var bResult = mySheet.IsHaveChild(4, 1);				
* @returns {Boolean}  Child행의 존재 여부.
*/
	ibsheetObject.prototype.IsHaveChild = function(Row, IncludeDelRow)			{};
	
	/**
* GetKeyFieldImage :  필수 입력 항목에 대한 이미지 파일의 위치를 설정하거나 확인한다
*  @example 
*  // 필수 입력 항목 이미지를 확인한다.				
*  mySheet.GetKeyFieldImage();				
* @returns {String}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetKeyFieldImage = function()		{};
	
	/**
* SetKeyFieldImage :  필수 입력 항목에 대한 이미지 파일의 위치를 설정하거나 확인한다
*  @param {String} 설정할 Url
*  @example 
*  // 필수 입력 항목 이미지를 변경한다.				
*  mySheet.SetKeyFieldImage(“/sheet/imgKeyField.gif”);				
*/
	ibsheetObject.prototype.SetKeyFieldImage = function(imgUrl)		{};
	
	/**
* LastCol :  마지막 컬럼의 index를 반환한다
*  @example 
*  //마지막 컬럼의 index를 확인한다.				
*  alert(마지막 컬럼의 index는  + mySheet.LastCol() +  번 입니다.);				
* @returns {Long}  마지막 컬럼 인덱스
*/
	ibsheetObject.prototype.LastCol = function()			{};
	
	/**
* LastRow :  마지막 행의 index를 반환한다
*  @example 
*  //마지막 행의 인덱스를 확인한다.				
*  alert(마지막 행의 index는  + mySheet.LastRow() +  번 입니다.);				
*  // 화면에 보여지는 마지막 행의 인덱스를 확인한다.				
*  alert(화면상 마지막 행의 index는  + mySheet.LastRow(1) +  번 입니다.);				
* @returns {Long}  마지막행의 Index
*/
	ibsheetObject.prototype.LastRow = function(Mode)			{};
	
	/**
* GetLeftCol :  가장 좌측에 표시되는 컬럼을 확인하거나 설정한다
*  @example 
*  //컬럼으로 설정됨을 확인				
*  mySheet.GetLeftCol();				
* @returns {Long}  가장좌측 끝 컬럼 인덱스 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetLeftCol = function()		{};
	
	/**
* SetLeftCol :  가장 좌측에 표시되는 컬럼을 확인하거나 설정한다
*  @param {Long/} 특정컬럼의 Column Index String		또는 SaveName
*  @example 
*  //고정컬럼이 설정되어 있을경우 				
*  //4컬럼을 수평스크롤 가장 좌측에 보이는 컬럼으로 설정 				
*  mySheet.SetLeftCol(4); 				
*  //고정컬럼이 설정되어 있지 않을경우 				
*  //6컬럼을 수평스크롤 가장 좌측에 보이는 컬럼으로 설정 				
*  mySheet.SetLeftCol(6); 				
*/
	ibsheetObject.prototype.SetLeftCol = function(Col)		{};
	
	/**
* LoadSaveData :  저장 데이터를 함수의 인자로 전달 받아 결과를 IBSheet 내부에 처리한다
*  @param {String} 저장XML 또는 저장JSON 문자열
*  @example 
*  //저장 작업 Ajax 처리				
*  var rtnData = mySheet.GetSaveData(Action.do,param);				
*  //저장 결과 표현하기				
*  mySheet.LoadSaveData(rtnData);				
* @returns None.
*/
	ibsheetObject.prototype.LoadSaveData = function(Content)			{};
	
	/**
* LoadSearchChildData :  DoSearchChild 메소드의 기능을 url이 아닌 객체 또는 문자열로 처리하는 기능으로 트리구조에서 자식노드 조회 데이터(xml or json)를 함수의 인자로 전달 받아 아이비시트에 로딩한다
*  @param {Long} 대상 부모의 행 인덱스
*  @param {String} 조회 데이터 문자열 또는 JSON 객체
*  @param { Object} 옵션 인자 기능을 json 형태로 설정한다.
*  @example 
*  //조회 데이터 읽어오기				
*  var Row = mySheet.GetSelectRow();				
*  var Data; 				
*  Data=mySheet.GetSearchData('list2_Child_Json.jsp', 'ChildLevel='+(parseInt(mySheet.GetRowLevel(Row))+1));				
*  var Opt = {Append: 1, WaitDlg: 1};				
*  //조회 결과 내용을 표현하기				
*  mySheet.LoadSearchChildData(Row, Data, Opt);				
* @returns None. 
*/
	ibsheetObject.prototype.LoadSearchChildData = function(Row, Data, Opt)			{};
	
	/**
* LoadSearchData :  조회 데이터(xml or json)를 함수의 인자로 전달 받아 아이비시트에 로딩한다
*  @param {String} 조회XML 또는 조회JSON 문자열
*  @param {Boolean} Append 조회 여부, Default=0
*  @param {Number} Append 조회 시 데이터를 붙여넣을 위치 설정
*  @param {Boolean} 포맷팅된 데이터 조회 처리 여부, Default=0
*  @example 
*  // 아래 두줄은 DoSearch() 함수를 사용하는 것을 두개로 나눈 경우임 				
*  //조회 데이터 읽어오기				
*  var sXml = mySheet.GetSearchData( list.jsp);				
*  //조회 결과 내용을 표현하기				
*  mySheet.LoadSearchData(sXml);				
*  // 조회 결과 내용을 기존데이터에 Append 하여 표현하기				
*  var opt = { Append : 1 };				
*  mySheet.LoadSearchData(sXml, opt);				
* @returns None. 
*/
	ibsheetObject.prototype.LoadSearchData = function(Content, Opt)			{};
	
	/**
* LoadExcel :  엑셀로부터 데이터를 읽어 들여 데이터 영역에 표시한다
*  @param {Boolean} 기존 데이터에 추가 여부 Default=0
*  @param {String} 엑셀 컬럼 번호 Default="
*  @param {String} 엑셀 로딩완료 행번호 Default=0
*  @param {String} 서버로 전달할 추가 파라메터들을 a=1&b=2 형태로 넣어준다. Default="
*  @param {String} 업로드 가능한 파일 확장자 Default="
*  @param {String} 로딩 방식 (헤더매칭등) Default=“HeaderMatch”
*  @param {String} 엑셀 로딩 행번호 Default=1
*  @param {String} 엑셀 로딩 컬럼번호 Default=1
*  @param {String} 엑셀WorkSheet번호 Default=1
*  @param {String} 엑셀WorkSheet이름 Default="
*  @example 
*  // 엑셀로 로딩하기				
*  mySheet.LoadExcel();         				
*  // 헤더타이틀을 서로 비교하여 동일한 컬럼끼리 로딩을 하되 7행부터 9 행까지만 읽어들인다.				
*  mySheet.LoadExcel({Mode:'HeaderMatch',StartRow:'7',EndRow:'9'});				
*  // IBSheet의 첫번째 컬럼에 엑셀의 5번째 컬럼의 값을 로딩하고, IBSheet 의 5번째 컬럼에 엑셀의 1번째 컬럼의 값을 로딩함.				
*  mySheet.LoadExcel({ColumnMapping:'5|4|3|2|1'});				
*/
	ibsheetObject.prototype.LoadExcel = function(parameters)			{};
	
	/**
* LoadExcelBuffer :  1개의 엑셀 문서로부터 여러 개의 시트에 로딩한다
*  @param {bool} 버퍼링 여부
*  @example 
*  // 엑셀 파일 즉시 로딩하기				
*  mySheet.LoadExcel();         				
*  //이후로는 버퍼링한다. 아무 동작 안함.				
*  mySheet.LoadExcelBuffer(true);  				
*  // mySheet에 엑셀파일의 첫번째 시트의 헤더타이틀을 서로 비교하여 동일한 컬럼끼리 로딩을 하되 7행부터 9 행까지만 로딩하기로 예약함				
*  mySheet.LoadExcel({Mode:'HeaderMatch',StartRow:'7',EndRow:'9', WorkSheetNo:1});				
*  // mySheet2에 엑셀파일의 두번째 시트를 IBSheet의 첫번째 컬럼에 엑셀의 5번째 컬럼의 값을 로딩하고, IBSheet 의 5번째 컬럼에 엑셀의 1번째 컬럼의 값을로딩하기로 예약함				
*  mySheet2.LoadExcel({ColumnMapping:'5|4|3|2|1', WorkSheetNo:2});				
*  // 버퍼링된 모든 엑셀 로딩 자료와 파일을 서버로 보내기 위해 파일 업로드창을 띄운다				
*  mySheet.LoadExcelBuffer(false); 				
*/
	ibsheetObject.prototype.LoadExcelBuffer = function(IsBuffer)			{};
	
	/**
* GetLoadExcelUrl :  엑셀 업로드 기능을 처리할 서버 페이지 경로를 확인 및 설정한다
*  @example 
*  // 엑셀 업로드 설정 경로를 확인한다.				
*  var url = mySheet.GetLoadExcelUrl();				
* @returns {String}  설정된 경로값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetLoadExcelUrl = function()		{};
	
	/**
* SetLoadExcelUrl :  엑셀 업로드 기능을 처리할 서버 페이지 경로를 확인 및 설정한다
*  @param {String} 설정할 서버 페이지 Url
*  @example 
*  // 엑셀 업로드 경로를 설정한다.				
*  mySheet.SetLoadExcelUrl(/jsp/LoadExcel.jsp);				
*/
	ibsheetObject.prototype.SetLoadExcelUrl = function(Url)		{};
	
	/**
* LoadText :  텍스트 파일로부터 데이터를 읽어 들여 데이터 영역에 표시한다
*  @param {String} 로딩 방식 (헤더매칭등) Default=“HeaderMatch”
*  @param {String} 데이터의 컬럼 구분자. Default=\t
*  @param {Boolean} 기존 데이터에 추가 여부 Default=0
*  @param {String} 업로드 가능한 파일 확장자 Default="
*  @example 
*  // 텍스트 파일로 로딩하기				
*  mySheet. LoadText();				
*  // 헤더타이틀을 서로 비교하여 동일한 컬럼끼리 로딩을 하며, 컬럼 구분자는'\t' 로 구분되어 있다				
*  mySheet.Load Text({Mode:'HeaderMatch', Deli:'\t'});				
*/
	ibsheetObject.prototype.LoadText = function(parameters)			{};
	
	/**
* GetLoadTextUrl :  텍스트 업로드 기능을 처리할 서버 페이지 경로를 확인 및 설정한다
*  @example 
*  // 텍스트 업로드 설정 경로를 확인한다.				
*  var url = mySheet.GetLoadTextUrl();				
* @returns {String}  설정된 경로값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetLoadTextUrl = function()		{};
	
	/**
* SetLoadTextUrl :  텍스트 업로드 기능을 처리할 서버 페이지 경로를 확인 및 설정한다
*  @param {String} 설정할 서버 페이지 Url
*  @example 
*  // 텍스트 업로드 경로를 설정한다.				
*  mySheet.SetLoadTextUrl(/jsp/LoadText.jsp);				
*/
	ibsheetObject.prototype.SetLoadTextUrl = function(Url)		{};
	
	/**
* GetMergeSheet :  전체적인 머지 종류를 설정하거나 확인한다
*  @example 
*  //머지 방식 확인				
*  mySheet.GetMergeSheet();				
* @returns {Integer}  현재 설정된 머지 종류 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetMergeSheet = function()		{};
	
	/**
* SetMergeSheet :  전체적인 머지 종류를 설정하거나 확인한다
*  @param {Integer} 머지 종류
*  @example 
*  //초기 로드 시 전체 머지 종류를 설정				
*  mySheet.SetMergeSheet( msHeaderOnly);				
*/
	ibsheetObject.prototype.SetMergeSheet = function(Merge)		{};
	
	/**
* GetMaximumValue :  Format이 숫자와 관련된 포멧인 Integer, Float, NullInteger, NullFloat 일때, 편집시 입력할 수 있는 최대값을 확인하거나 설정한다
*  @param {Long} 해당 셀의 행 Index
*  @param {Long/} 해당 셀의 컬럼 Index 또는 String		SaveName
*  @example 
*  //설정된 숫자포멧의 최대값을 확인한다.				
*  mySheet.GetMaximumValue(1, 12);				
* @returns {Long}  설정된 최대값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetMaximumValue = function(Row, Col)		{};
	
	/**
* SetMaximumValue :  Format이 숫자와 관련된 포멧인 Integer, Float, NullInteger, NullFloat 일때, 편집시 입력할 수 있는 최대값을 확인하거나 설정한다
*  @param {Long} 해당 셀의 행 Index
*  @param {Long/} 해당 셀의 컬럼 Index 또는 String		SaveName
*  @param {Long} 설정할 최대값
*  @example 
*  //숫자포멧의 최대값을 설정한다.				
*  mySheet.SetMaximumValue(1, 12, 5000);				
*/
	ibsheetObject.prototype.SetMaximumValue = function(Row, Col, Value)		{};
	
	/**
* GetMinimumValue :  Format이 숫자와 관련된 포멧인 Integer, Float, NullInteger, NullFloat 일때, 편집시 입력할 수 있는 최소값을 확인하거나 설정한다
*  @param {Long} 해당 데이터의 행 Index
*  @param {Long/} 해당 데이터의 컬럼 Index 또는 String		SaveName
*  @example 
*  //설정된 숫자포멧의 최소값을 확인한다.				
*  mySheet.GetMinimumValue(1, 12);				
* @returns {Long}  설정된 최소값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetMinimumValue = function(Row, Col)		{};
	
	/**
* SetMinimumValue :  Format이 숫자와 관련된 포멧인 Integer, Float, NullInteger, NullFloat 일때, 편집시 입력할 수 있는 최소값을 확인하거나 설정한다
*  @param {Long} 해당 데이터의 행 Index
*  @param {Long/} 해당 데이터의 컬럼 Index 또는 String		SaveName
*  @param {Long} 설정할 최소값
*  @example 
*  // 숫자포멧의 최소값을 설정한다.				
*  mySheet.SetMinimumValue(1, 12, 1000);				
*/
	ibsheetObject.prototype.SetMinimumValue = function(Row, Col, Value)		{};
	
	/**
* MouseCol :  마우스가 눌려졌을 때 선택된 컬럼 번호를 반환한다
*  @example 
*  // 마우스가 눌러졌을 때 컬럼 번호를 가져온다.				
*  function mySheet_OnMouseDown(Button, Shift, X, Y) {				
*      // 눌린 컬럼 확인				
*      alert(mySheet.MouseRow() + 행  + mySheet.MouseCol() + 컬럼이 눌림);				
*  }				
* @returns {Long}  마우스위치가 있는 컬럼 인덱스 
*/
	ibsheetObject.prototype.MouseCol = function()			{};
	
	/**
* GetMousePointer :  마우스의 모양을 설정하거나 확인한다
*  @example 
*  //마우스의 모양을 확인한다.				
*  mySheet.GetMousePointer(Default);				
* @returns {String}  마우스 설정 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetMousePointer = function()		{};
	
	/**
* SetMousePointer :  마우스의 모양을 설정하거나 확인한다
*  @param {String} 설정할 마우스 모양
*  @example 
*  function mySheet_OnMouseMove(Button, Shift, X, Y) { 				
*  //마우스 위치가 2컬럼 일때만 마우스 손가락 모양				
*    if(mySheet.MouseCol() == 2) {				
*      mySheet.SetMousePointer(Hand);				
*    } else {				
*      mySheet.SetMousePointer(Default);				
*    }				
*  }				
*/
	ibsheetObject.prototype.SetMousePointer = function(Pointer)		{};
	
	/**
* MouseRow :  마우스가 눌려졌을 때 선택된 행 번호를 반환한다
*  @example 
*  //마우스가 눌러졌을 때 행 번호를 가져온다.				
*  function mySheet_OnMouseDown(Button, Shift, X, Y){				
*   //눌린 행 확인				
*      alert(mySheet.MouseRow() + 행이 눌림);				
*  }				
* @returns {Long}  마우스포인터가 있는 셀의 행 Index
*/
	ibsheetObject.prototype.MouseRow = function()			{};
	
	/**
* GetMouseToolTipText :  마우스에 표시될 풍선도움말을 확인하거나 설정한다
*  @example 
*  //설정된 MouseToolTipText 값을 확인한다.				
*  mySheet.GetMouseToolTipText();				
* @returns {String}  설정된 문자열
*/
	ibsheetObject.prototype.GetMouseToolTipText = function()		{};
	
	/**
* SetMouseToolTipText :  마우스에 표시될 풍선도움말을 확인하거나 설정한다
*  @param {String} 설정할 문자열
*  @example 
*  // MouseMove 이벤트에서 마우스 위치의 X, Y 좌표값을 ToopTip으로 설정 한다.				
*  function mySheet_OnMouseMove(button, shift, x, y) {				
*    var value = 마우스 좌표 =  + x + , + y;				
*    mySheet.SetMouseToolTipText(value);				
*  }.				
*/
	ibsheetObject.prototype.SetMouseToolTipText = function(Value)		{};
	
	/**
* MoveColumnFail :  OnBeforeColumnMove 이벤트 안에서 사용하는 속성이며, 컬럼이동 실패 여부를 설정한다
*  @param {Boolean} 컬럼이동실패여부
*  @example 
*  //0컬럼이 3컬럼 이후의 위치로 이동하고자 할때 컬럼 이동을 취소한다				
*  function mySheet_OnBeforeColumnMove(Col, NewPos) { 				
*  if(Col==0 && NewPos > 3) {				
*  mySheet.MoveColumnFail(1);				
*  }else{				
*  mySheet.MoveColumnFail(0);				
*  }				
*  }				
*/
	ibsheetObject.prototype.MoveColumnFail = function(Flag)			{};
	
	/**
* MoveColumnPos :  특정 컬럼을 새로운 컬럼 위치로 이동한다
*  @param {Long/String} 이동할 컬럼의 Index 또는 SaveName
*  @param {Long/String} 이동될 위치의 컬럼 Index 또는 SaveName
*  @param {Boolean} 이동되면서 발생하는 이벤트인 OnBeforeColumnMove Event와 OnAfterColumn Event를 발생여부, Default=1
*  @example 
*  //1컬럼을 9컬럼으로 이동한다.				
*  mySheet.MoveColumnPos(1, 9);				
*  //각 컬럼의 SaveName으로 설정한 경우				
*  mySheet.MoveColumnPos(stockNm, payAmt);				
* @returns {Boolean}  이동 성공 여부
*/
	ibsheetObject.prototype.MoveColumnPos = function(Col, NewPos, Event)			{};
	
	/**
* GetPagingPosition :  페이지 네비게이션을 사용여부를 설정하거나 확인 한다
*  @example 
*  // 현재 설정된 페이지 네비게이션 설정 위치값을 확인 한다.				
*  mySheet.GetPagingPosition()				
* @returns {Number}  페이지 네비게이션의 설정 위치 값
*/
	ibsheetObject.prototype.GetPagingPosition = function()		{};
	
	/**
* SetPagingPosition :  페이지 네비게이션을 사용여부를 설정하거나 확인 한다
*  @param {Number} 설정할 페이지 네비게이션 위치 값
*  @example 
*  // 페이지 네이게이션을 좌측 상단, 건수 정보를 우측 상단에 표시 한다.				
*  mySheet.SetCountPosition(2);				
*  mySheet.SetPagingPosition(1)				
*/
	ibsheetObject.prototype.SetPagingPosition = function(Position)		{};
	
	/**
* GetPageCount :  조회 모드(SearchMode)에서 사용되는 Page 속성의 값을 설정하거나 확인 한다
*  @example 
*  // 현재 설정된 페이지 개수를 확인 한다..				
*  mySheet.GetPageCount()				
* @returns {Number}  Page 개수 설정값
*/
	ibsheetObject.prototype.GetPageCount = function()		{};
	
	/**
* SetPageCount :  조회 모드(SearchMode)에서 사용되는 Page 속성의 값을 설정하거나 확인 한다
*  @param {Number} 설정할 페이지 개수
*  @example 
*  // 페이지 개수를  50으로 설정 한다.				
*  mySheet.SetPageCount(50);				
*/
	ibsheetObject.prototype.SetPageCount = function(Page)		{};
	
	/**
* PopupButtonImage :  Popup/PopupEdit 타입 컬럼의 특정 셀 팝업버튼 이미지를 변경한다
*  @param {Long} 설정할 셀의 행 인덱스
*  @param {Long/String} 설정할 셀의 컬럼 인덱스 또는 SaveName
*  @param {Long/String} 설정할 이미지 Url 또는 이미지인덱스
*  @example 
*  // 셀의 팝업버튼 이미지를 변경				
*  mySheet.PopupButtonImage(2, 10, /image/ic_popup.gif); 				
*  // sPopup 컬럼의 팝업버튼 이미지를 이미지리스트에 설정한 이미지로 변경				
*  mySheet. PopupButtonImage (4, sPopup, 1);				
* @returns 설정불가능 셀인경우 -1 반환
*/
	ibsheetObject.prototype.PopupButtonImage = function(Row, Col, Image)			{};
	
	/**
* GetRangeBackColor :  셀의 범위 영역의 배경색을 설정하거나 확인한다
*  @param {Long} 범위 시작 셀의 Row Index
*  @param {Long} 범위 시작 셀의 Column Index
*  @param {Long} 범위 종료 셀의 Row Index
*  @param {Long} 범위 종료 셀의 Column Index
*  @example 
*  //영역에 배경색 확인하기				
*  mySheet.GetRangeBackColor(1,0,10,10);				
* @returns {String}  현재 설정값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRangeBackColor = function(Row1,Col1,Row2,Col2)		{};
	
	/**
* SetRangeBackColor :  셀의 범위 영역의 배경색을 설정하거나 확인한다
*  @param {Long} 범위 시작 셀의 Row Index
*  @param {Long} 범위 시작 셀의 Column Index
*  @param {Long} 범위 종료 셀의 Row Index
*  @param {Long} 범위 종료 셀의 Column Index
*  @param {String} WebColor
*  @example 
*  //영역에 배경색 설정하기				
*  mySheet.SetRangeBackColor(1,0,10,10, #FFFF00);				
*/
	ibsheetObject.prototype.SetRangeBackColor = function(Row1,Col1,Row2,Col2,Color)		{};
	
	/**
* GetRangeFontBold :  셀의 범위 영역의 글자볼드 여부를 설정하거나 확인한다
*  @param {Long} 범위 시작 셀의 Row Index
*  @param {Long} 범위 시작 셀의 Column Index
*  @param {Long} 범위 종료 셀의 Row Index
*  @param {Long} 범위 종료 셀의 Column Index
*  @example 
*  //영역 글자 볼드 확인하기				
*  mySheet.GetRangeFontBold(1, 0, 2, 2);				
* @returns {Boolean}  현재 설정값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRangeFontBold = function(Row1, Col1, Row2, Col2)		{};
	
	/**
* SetRangeFontBold :  셀의 범위 영역의 글자볼드 여부를 설정하거나 확인한다
*  @param {Long} 범위 시작 셀의 Row Index
*  @param {Long} 범위 시작 셀의 Column Index
*  @param {Long} 범위 종료 셀의 Row Index
*  @param {Long} 범위 종료 셀의 Column Index
*  @param {Boolean} 볼드 설정 여부
*  @example 
*  //영역 글자 볼드 설정하기				
*  mySheet.SetRangeFontBold(1, 0, 2, 2, 1);				
*/
	ibsheetObject.prototype.SetRangeFontBold = function(Row1, Col1, Row2, Col2, Bold)		{};
	
	/**
* GetRangeFontColor :  셀의 범위 영역의 글자색을 설정하거나 확인한다
*  @param {Long} 범위 시작 셀의 Row Index
*  @param {Long} 범위 시작 셀의 Column Index
*  @param {Long} 범위 종료 셀의 Row Index
*  @param {Long} 범위 종료 셀의 Column Index
*  @example 
*  //영역에 글자색 확인하기				
*  mySheet.GetRangeFontColor(1,0,10,10);				
* @returns {String}  현재 설정값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRangeFontColor = function(Row1, Col1, Row2, Col2)		{};
	
	/**
* SetRangeFontColor :  셀의 범위 영역의 글자색을 설정하거나 확인한다
*  @param {Long} 범위 시작 셀의 Row Index
*  @param {Long} 범위 시작 셀의 Column Index
*  @param {Long} 범위 종료 셀의 Row Index
*  @param {Long} 범위 종료 셀의 Column Index
*  @param {String} WebColor
*  @example 
*  //영역에 글자색 설정하기				
*  mySheet.SetRangeFontColor(1,0,10,10, FF0000);				
*/
	ibsheetObject.prototype.SetRangeFontColor = function(Row1, Col1, Row2, Col2, Color)		{};
	
	/**
* GetRangeText :  특정 영역의 셀값을 Format이 적용된 형태로 화면에 보여지는 값 그대로 확인하거나 설정한다
*  @param {Long} 범위 시작 셀의 Row Index
*  @param {Long} 범위 시작 셀의 Column Index
*  @param {Long} 범위 종료 셀의 Row Index
*  @param {Long} 범위 종료 셀의 Column Index
*  @param {String} 컬럼과 컬럼 사이를 구분하는 구분자. Default=|
*  @param {String} 행과 행 사이를 구분하는 구분자. Default=^
*  @example 
*  //특정 영역의 셀값을 Format이 적용된 형태로 화면에 보여지는 값 그대로 확인한다.				
*  mySheet.GetRangeText(1, 1, 2, 2, |, ^);				
* @returns {String}  현재 문자열값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRangeText = function(Row1,Col1,Row2,Col2,ColSeparator, RowSeparator)		{};
	
	/**
* SetRangeText :  특정 영역의 셀값을 Format이 적용된 형태로 화면에 보여지는 값 그대로 확인하거나 설정한다
*  @param {String} 문자열
*  @param {Long} 범위 시작 셀의 Row Index
*  @param {Long} 범위 시작 셀의 Column Index
*  @param {Long} 범위 종료 셀의 Row Index
*  @param {Long} 범위 종료 셀의 Column Index
*  @param {String} 컬럼과 컬럼 사이를 구분하는 구분자. Default=|
*  @param {String} 행과 행 사이를 구분하는 구분자. Default=^
*  @example 
*  //1,1 셀에 A 를 2,2셀에 D를 설정한다.				
*  mySheet.SetRangeText(A|B^C|D, 1, 1, 2, 2, |, ^);				
*  //1,7 셀부터 5,10 셀까지 ** 로 설정한다.				
*    mySheet.SetRangeText(**, 1, 7, 5, 10);				
*/
	ibsheetObject.prototype.SetRangeText = function(sData,Row1,Col1,Row2,Col2, ColSeparator, RowSeparator)		{};
	
	/**
* GetRangeValue :  특정 영역의 셀값을 Format이 적용되지 않은 실제로 저장 시 사용하는 값으로 확인하고, 설정한다
*  @param {Long} 범위 시작 셀의 Row Index
*  @param {Long} 범위 시작 셀의 Column Index
*  @param {Long} 범위 종료 셀의 Row Index
*  @param {Long} 범위 종료 셀의 Column Index
*  @param {String} 컬럼과 컬럼 사이를 구분하는 구분자. Default=|
*  @param {String} 행과 행 사이를 구분하는 구분자. Default=^
*  @example 
*  // 특정 영역의 셀값을 Format이 적용되지 않은 실제로 저장 시 사용하는 값으로 확인한다.				
*  mySheet.GetRangeValue(A|B^C|D, 1, 1, 2, 2, |, ^);				
* @returns {String}  현재 문자열값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRangeValue = function(Row1,Col1,Row2,Col2,ColSeparator,RowSeparator)		{};
	
	/**
* SetRangeValue :  특정 영역의 셀값을 Format이 적용되지 않은 실제로 저장 시 사용하는 값으로 확인하고, 설정한다
*  @param {String} 문자열
*  @param {Long} 범위 시작 셀의 Row Index
*  @param {Long} 범위 시작 셀의 Column Index
*  @param {Long} 범위 종료 셀의 Row Index
*  @param {Long} 범위 종료 셀의 Column Index
*  @param {String} 컬럼과 컬럼 사이를 구분하는 구분자. Default=|
*  @param {String} 행과 행 사이를 구분하는 구분자. Default=^
*  @example 
*  //1,1 셀에 A 를 2,2셀에 D를 설정한다.				
*  mySheet.SetRangeValue(A|B^C|D, 1, 1, 2, 2, |, ^);				
*  //1,7 셀부터 5,10 셀까지 ** 로 설정한다.				
*  mySheet.SetRangeValue(**, 1, 7, 5, 10);				
*/
	ibsheetObject.prototype.SetRangeValue = function(sData,Row1,Col1,Row2,Col2, ColSeparator,RowSeparator)		{};
	
	/**
* GetRedrawSum :  합계 내용 계산 여부를 확인하거나 설정한다
*  @example 
*  //합계 내용 계산 여부를 확인한다.				
*  mySheet.GetRedrawSum();				
* @returns {Boolean}  설졍 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRedrawSum = function()		{};
	
	/**
* SetRedrawSum :  합계 내용 계산 여부를 확인하거나 설정한다
*  @param {Boolean} 합계행 계산 여부
*  @example 
*  //변경해야 할 데이터가 많은 경우 사용				
*  mySheet.SetRedrawSum(0);				
*  for(var i=1; i<100; i++) mySheet.SetCellValue(i,1, 10000, 0);				
*  //RedrawSum 가 1가 되는 순간 합계와 데이터가 한꺼번에 표시				
*  mySheet.SetRedrawSum(1);				
*/
	ibsheetObject.prototype.SetRedrawSum = function(Redraw)		{};
	
	/**
* RemoveAll :  헤더 행을 제외한 모든 데이터 행을 지운다
*  @example 
*  // 모든 데이터 지우기				
*  mySheet.RemoveAll();				
*/
	ibsheetObject.prototype.RemoveAll = function()			{};
	
	/**
* RenderSheet :  행 추가 또는 컬럼 숨김 기능을 동시에 여러 개 사용하는 경우 속도개선을 위해 랜더링을 마지막에 한꺼번에 처리 하기 위한 기능을 한다
*  @param {Boolean} 렌더링 여부 (Default=1)
*  @example 
*  // 30개의 행추가를 RenderSheet를 이용하여 속도개선 처리				
*  mySheet.RenderSheet(0);				
*  for (var i = 0; i <30; i++) {				
*  mySheet.DataInsert();				
*  }				
*  mySheet.RenderSheet(1);				
*/
	ibsheetObject.prototype.RenderSheet = function(Render)			{};
	
	/**
* RemoveEtcData :  EtcData 객체에 설정되 키와 값을 모두 제가 한다
*  @example 
*  //EtcData에 설정된 모든 데이터 지우기				
*  mySheet.RemoveEtcData();				
*/
	ibsheetObject.prototype.RemoveEtcData = function()			{};
	
	/**
* ReNumberSeq :  데이터 타입이 Seq인 데이터의 순번을 다시 매긴다
*  @example 
*  //컬럼의 Type이 Seq인 컬럼의 숫자를 1부터 다시 메긴다.				
*  mySheet.ReNumberSeq();				
*/
	ibsheetObject.prototype.ReNumberSeq = function()			{};
	
	/**
* Reset :  IBSheet에 설정된 모든 기본 속성을 제거하고 초기상태로 변경한다
*  @param {Boolean} 적용되어 있는 테마 유지 여부, Default=0
*  @example 
*  //초기 상태로 변경하기				
*  mySheet.Reset();				
*/
	ibsheetObject.prototype.Reset = function(KeepTheme)			{};
	
	/**
* ReturnCellData :  조회된 데이터의 특정 셀의 값을 트랜잭션이 발생하기 이전의 조회된 데이터 되돌린다
*  @param {Long} 데이터 셀의 Row Index
*  @param {Long / String} 데이터 셀의 Column Index 또는 SaveName
*  @example 
*  //초기 상태로 변경하기				
*  mySheet.ReturnCellData(Row,Col);				
*/
	ibsheetObject.prototype.ReturnCellData = function(Row,Col)			{};
	
	/**
* ReturnColumnPos :  이동된 컬럼의 위치를 처음 위치로 되돌린다
*  @example 
*  //초기 위치로 되돌린다.				
*  mySheet.ReturnColumnPos();				
*/
	ibsheetObject.prototype.ReturnColumnPos = function()			{};
	
	/**
* ReturnData :  특정 행의 데이터를 조회 상태의 문자열로 변경한다
*  @param {Long} 데이터 행의 Row Index
*  @example 
*  //초기 상태로 변경하기				
*  mySheet.ReturnData(2);				
*/
	ibsheetObject.prototype.ReturnData = function(Row)			{};
	
	/**
* GetRowBackColor :  행 전체의 배경색을 설정하거나 확인한다
*  @param {Long} Row Index
*  @example 
*  //1행의 배경색을 확인한다.				
*  mySheet.GetRowBackColor(1);				
* @returns {String}  배경 색상 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRowBackColor = function(Row)		{};
	
	/**
* SetRowBackColor :  행 전체의 배경색을 설정하거나 확인한다
*  @param {Long} Row Index
*  @param {String} WebColor 색상 값
*  @example 
*  //1행의 배경색을 회색으로 설정한다.				
*  mySheet.SetRowBackColor(1,#C0C0C0);				
*  //3행의 배경색을 빨강색으로 설정한다.				
*  mySheet.SetRowBackColor(1,#FF0000);				
*  //2행 배경색을 1행 배경색으로 설정한다.				
*  mySheet.SetRowBackColor(2, mySheet.GetRowBackColor(1));				
*/
	ibsheetObject.prototype.SetRowBackColor = function(Row,BackColor)		{};
	
	/**
* GetRowBackColorD :  각행의 트렌젝션 상태가 삭제인 행의 배경색을 확인하거나 설정한다
*  @example 
*  //트렌젝션상태가 삭제인 행의 배경색을 확인한다.				
*  mySheet.GetRowBackColorD();				
* @returns {String}  설정색상 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRowBackColorD = function()		{};
	
	/**
* SetRowBackColorD :  각행의 트렌젝션 상태가 삭제인 행의 배경색을 확인하거나 설정한다
*  @param {String} WebColor값
*  @example 
*  //트렌젝션상태가 삭제인 행의 배경색을 회색으로 설정한다.				
*  mySheet.SetRowBackColorD(#C0C0C0);				
*  //트렌젝션상태가 삭제인 행을 1행 배경색으로 설정한다.				
*  mySheet.SetRowBackColorD(mySheet.GetRowBackColor(1));				
*/
	ibsheetObject.prototype.SetRowBackColorD = function(BackColor)		{};
	
	/**
* GetRowBackColorI :  각행의 트랜잭션 상태가 입력인 행의 배경색을 확인하거나 설정한다
*  @param {String} WebColor 색상 값
*  @example 
*  //트렌젝션상태가 입력인 행의 배경색을 확인한다.				
*  mySheet.GetRowBackColorI();				
* @returns {String}  설정 색상 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRowBackColorI = function()		{};
	
	/**
* SetRowBackColorI :  각행의 트랜잭션 상태가 입력인 행의 배경색을 확인하거나 설정한다
*  @param {String} WebColor 색상 값
*  @example 
*  //트렌젝션상태가 입력인 행의 배경색을 회색으로 설정한다.				
*  mySheet.SetRowBackColorI(#C0C0C0);				
*  //트렌젝션상태가 입력인 행을 1행 배경색으로 설정한다.				
*  mySheet.SetRowBackColorI(mySheet.GetRowBackColor(1));				
*/
	ibsheetObject.prototype.SetRowBackColorI = function(BackColor)		{};
	
	/**
* GetRowBackColorU :  각행의 트랜잭션 상태가 수정인 행의 배경색을 확인하거나 설정한다
*  @param {String} WebColor 색상 값
*  @example 
*  //트렌젝션상태가 수정인 행의 배경색을 확인한다.				
*  mySheet.GetRowBackColorU();				
* @returns {String}  설정색상 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRowBackColorU = function()		{};
	
	/**
* SetRowBackColorU :  각행의 트랜잭션 상태가 수정인 행의 배경색을 확인하거나 설정한다
*  @param {String} WebColor 색상 값
*  @example 
*  //트렌젝션상태가 수정인 행의 배경색을 회색으로 설정한다.				
*  mySheet.SetRowBackColorU(#C0C0C0);				
*  //트렌젝션상태가 수정인 행을 1행 배경색으로 설정한다.				
*  mySheet.SetRowBackColorU(mySheet.GetRowBackColor(1));				
*/
	ibsheetObject.prototype.SetRowBackColorU = function(BackColor)		{};
	
	/**
* RowCount :  전체 데이터 행 개수를 확인한다
*  @param {String} 트랜잭션 코드. Default=전체건수
*  @example 
*  alert(전체 건수 는  + mySheet.RowCount() +  건입니다. );				
*  alert(조회 건수 는  + mySheet.RowCount(R) +  건입니다. );				
*  alert(입력 건수 는  + mySheet.RowCount(I) +  건입니다. );				
*  alert(수정 건수 는  + mySheet.RowCount(U) +  건입니다. );				
*  alert(삭제 건수 는  + mySheet.RowCount(D) +  건입니다. );				
* @returns {Long}  전체 또는 특정 트랜잭션 상태의 데이터행 개수
*/
	ibsheetObject.prototype.RowCount = function(Status)			{};
	
	/**
* RowDelete :  특정의 단일 또는 다중 데이터 행을 삭제 한다
*  @param {Number/String} 삭제할 행의 Row Index, 또는 행의 Index를 | 구분자로 연결한 문자열 Default =현재 선택 행
*  @param {Boolean} 삭제 전 메세지 표시 여부 Default=0
*  @example 
*  //확인 메시지 없이 1행 삭제하기				
*  mySheet.RowDelete(1, 0);				
*  // 3, 7, 10번 행 삭제하기				
*  mySheet.RowDelete(3|7|10);				
*/
	ibsheetObject.prototype.RowDelete = function(Row,Confirm)			{};
	
	/**
* GetRowDraggable :  특정 행의 마우스 드래그 가능여부를 설정하거나 확인 한다
*  @param {Long} 행의 Row Index
*  @example 
*  // Drag 가능여부 설정 값 확인				
*  var drag = mySheet.GetRowDraggable(3);				
* @returns {Boolean}  설정된 값 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetRowDraggable = function(row)		{};
	
	/**
* SetRowDraggable :  특정 행의 마우스 드래그 가능여부를 설정하거나 확인 한다
*  @param {Long} 행의 Row Index
*  @param {Boolean} 드래그 가능여부 설정 값 (Default=1)
*  @example 
*  // 3행의 Drag 가능여부 설정 (마우스 드래깅시 행 드래깅 가능여부 설정)				
*  mySheet.SetRowDraggable(3, 1); // 드래그 가능				
*  mySheet.SetRowDraggable(3, 0); // 드래그 불가				
*/
	ibsheetObject.prototype.SetRowDraggable = function(row, drag)		{};
	
	/**
* GetRowEditable :  특정 행의 Edit 가능 여부를 확인하거나 설정한다
*  @param {Long} 해당 행의 Row Index
*  @example 
*  //1행의 Edit 가능 여부를 확인한다.				
*  mySheet.GetRowEditable(1,0);				
* @returns {Boolean}  Edit 가능 여부 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRowEditable = function(Row)		{};
	
	/**
* SetRowEditable :  특정 행의 Edit 가능 여부를 확인하거나 설정한다
*  @param {Long} 해당 행의 Row Index
*  @param {Boolean} 행의 Edit 가능 여부 (Set일때만 사용)
*  @example 
*  //1행의 Edit 가능 여부를 0으로 설정한다.				
*  mySheet.SetRowEditable(1,0);				
*/
	ibsheetObject.prototype.SetRowEditable = function(Row, Editable)		{};
	
	/**
* GetRowExpanded :  트리 형태 일 때 행의 Child Level이 펼쳐져 있는 상태인지 여부를 확인하거나 펼침 여부를 설정한다
*  @param {Long} Row Index
*  @example 
*  //2행의 펼쳐져 있지 않다면, 2행의 트리를 펼친다.				
*  if(mySheet.GetRowExpanded(2) == 0){				
*      mySheet.SetRowExpanded(2, 1);				
*  }				
* @returns {Boolean}  행의 자식행들의 펼쳐짐 여부 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRowExpanded = function(Row)		{};
	
	/**
* SetRowExpanded :  트리 형태 일 때 행의 Child Level이 펼쳐져 있는 상태인지 여부를 확인하거나 펼침 여부를 설정한다
*  @param {Number} 대상 행의 Index
*  @param {Boolean} 자식행의 펼쳐짐 여부
*  @param {Boolean} 관련 이벤트 발생여부 Default = 1
*  @example 
*  //2행의 펼쳐져 있지 않다면, 2행의 트리를 펼친다.				
*  if(mySheet.GetRowExpanded(2) == 0){				
*      mySheet.SetRowExpanded(2, 1);				
*  }				
*/
	ibsheetObject.prototype.SetRowExpanded = function(Row, Expand, Event)		{};
	
	/**
* GetRowFontColor :  행 전체의 글자색을 설정하거나 확인한다
*  @param {Long} Row Index
*  @example 
*  //1행의 글자색을 확인한다.				
*  mySheet.GetRowFontColor(1);				
* @returns {String}  설정 색상 (Get Method 인 경우) 
*/
	ibsheetObject.prototype.GetRowFontColor = function(Row)		{};
	
	/**
* SetRowFontColor :  행 전체의 글자색을 설정하거나 확인한다
*  @param {Long} Row Index
*  @param {String} WebColor 색상 값
*  @example 
*  //1행의 글자색을 회색으로 설정한다.				
*  mySheet.SetRowFontColor(1, 192,192,192);				
*  //2행 글자색을 1행 글자색으로 설정한다.				
*  mySheet.SetRowFontColor(2,mySheet.GetRowFontColor(1));				
*/
	ibsheetObject.prototype.SetRowFontColor = function(Row,Color)		{};
	
	/**
* GetRowHeight :  특정 행의 높이를 설정하거나 확인한다
*  @param {Long} 설정할 행 Index
*  @example 
*  //1행의 높이를 확인한다.				
*  mySheet.GetRowHeight(1);				
* @returns {Integer}  현재 행 높이 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRowHeight = function(Row)		{};
	
	/**
* SetRowHeight :  특정 행의 높이를 설정하거나 확인한다
*  @param {Long} 설정할 행 Index
*  @param {Integer} 설정할 행 높이
*  @example 
*  //50 픽셀로 높이 수정				
*  mySheet.SetRowHeight(1, 50);				
*  //3행의 높이를 2행의 높이와 동일하게 변경				
*  mySheet.SetRowHeight(3, mySheet.GetRowHeight(2));				
*/
	ibsheetObject.prototype.SetRowHeight = function(Row, Height)		{};
	
	/**
* GetRowHeightMax :  모든 데이터 행의 최대 높이를 확인하거나 설정한다
*  @example 
*  //설정한 최소 높이값 확인한다.				
*  mySheet.GetRowHeightMax();				
* @returns {Integer}  행의 최대 높이 (Get Method인 경우)
*/
	ibsheetObject.prototype.GetRowHeightMax = function()		{};
	
	/**
* SetRowHeightMax :  모든 데이터 행의 최대 높이를 확인하거나 설정한다
*  @param {Integer} 해당 행에 설정 할 최대 높이값
*  @example 
*  //최소 높이를 50픽셀로 설정한다.				
*  mySheet.SetRowHeightMax(50);				
*/
	ibsheetObject.prototype.SetRowHeightMax = function(MaxHeight)		{};
	
	/**
* GetRowHeightMin :  모든 행의 최소 높이를 확인하거나 설정한다
*  @example 
*  //설정한 최소 높이값 확인한다.				
*  mySheet.GetRowHeightMin();				
* @returns {Integer}  행의 최소 높이 (Get Method인 경우)
*/
	ibsheetObject.prototype.GetRowHeightMin = function()		{};
	
	/**
* SetRowHeightMin :  모든 행의 최소 높이를 확인하거나 설정한다
*  @param {Integer} 행에 설정 할 최소 높이값
*  @example 
*  //최소 높이를 10픽셀로 설정한다.				
*  mySheet.SetRowHeightMin(10);				
*/
	ibsheetObject.prototype.SetRowHeightMin = function(MinHeight)		{};
	
	/**
* GetRowHidden :  행의 숨기여부를 설정하거나 확인한다
*  @param {Long /String} 특정 행의 Row Index 혹은 구분자 |로 연결된 문자열 (Set에서만 사용)
*  @example 
*  //1행이 숨겨진 여부를 확인하여 숨겨진 경우 표시되도록 설정한다.				
*  if(mySheet.GetRowHidden(1)){				
*   mySheet.SetRowHidden(1,0);				
*  }				
* @returns {Boolean}  설정 값 (Get : 1 이면 숨기 상태
*/
	ibsheetObject.prototype.GetRowHidden = function(Row)		{};
	
	/**
* SetRowHidden :  행의 숨기여부를 설정하거나 확인한다
*  @param {Long /String} 특정 행의 Row Index 혹은 구분자 |로 연결된 문자열 (Set에서만 사용)
*  @param {Boolean} 숨김여부
*  @example 
*  //1행이 숨겨진 여부를 확인하여 숨겨진 경우 표시되도록 설정한다.				
*  if(mySheet.GetRowHidden(1)){				
*   mySheet.SetRowHidden(1,0);				
*  }				
*  //다수의 행을 동시에 숨기는 경우				
*  mySheet.SetRowHidden(2|5|7|10, 1);				
*/
	ibsheetObject.prototype.SetRowHidden = function(Row,Hidden)		{};
	
	/**
* GetRowJson :  행의 데이터를 각 컬럼의 SaveName을 이용하여 Json 객체로 생성하여 반환하거나 설정한다
*  @param {Long} 해당 행의 Row Index
*  @example 
*  // 1행의 Json 객체를 가져온다.				
*  var rowJosn = mySheet.GetRowJson(1);				
* @returns {Object}  해당 행의 데이터 객체
*/
	ibsheetObject.prototype.GetRowJson = function(Row)			{};
	
	/**
* SetRowJson :  행의 데이터를 각 컬럼의 SaveName을 이용하여 Json 객체로 생성하여 반환하거나 설정한다
*  @param {Long} 해당 행의 Row Index
*  @param {Object} 조회JSON 문자열
*  @example 
*  // 1행을 해당 Json 객체로 설정한다.				
*  var data = {Data:[[ {sName:”홍길동”, sAge:20} ]]};				
*  var rowJosn = mySheet.SetRowJson(1, data);				
* @returns {Object}  해당 행의 데이터 객체
*/
	ibsheetObject.prototype.SetRowJson = function(Row, Data)			{};
	
	/**
* GetRowLevel :  행의 트리 레벨을 설정하거나 확인한다
*  @param {Long} 해당 행의 Row Index
*  @example 
*  //1행의 트리 레벨을 확인한다.				
*  mySheet.GetRowLevel(1);				
* @returns {Integer}  현재 행의 트리 레벨  (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRowLevel = function(Row)		{};
	
	/**
* SetRowLevel :  행의 트리 레벨을 설정하거나 확인한다
*  @param {Long} 해당 행의 Row Index
*  @param {Integer} 해당 행의 트리 레벨값(Set)
*  @example 
*  //트리 레벨을 1 증가 시킨다.				
*  mySheet.SetRowLevel(1,mySheet.GetRowLevel(1) +1);				
*/
	ibsheetObject.prototype.SetRowLevel = function(Row,Level)		{};
	
	/**
* GetRowMerge :  행의 가로 머지 여부를 확인하거나 설정한다
*  @param {Long} 해당 행의 Row Index
*  @example 
*  // 첫번째 행의 가로 머지를 허용여부를 확인한다.				
*  mySheet.GetRowMerge(1);				
* @returns {Boolean}  현재 행의 가로 머지 여부 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetRowMerge = function(Row)		{};
	
	/**
* SetRowMerge :  행의 가로 머지 여부를 확인하거나 설정한다
*  @param {Long} 해당 행의 Row Index
*  @param {Boolean} 가로머지 허용 여부
*  @example 
*  // 첫번째 행의 가로 머지를 허용하도록 설정한다.				
*  mySheet.SetRowMerge(1, 1);				
*/
	ibsheetObject.prototype.SetRowMerge = function(Row, Merge)		{};
	
	/**
* RowSaveStr :  행의 데이터를 각 컬럼의 SaveName을 이용하여 저장 시 사용되는 Query String 형태로 조합하여 반환한다
*  @param {Long} 해당 행의 Row Index
*  @example 
*  // 1행의 SaveString을 가져온다.				
*  var RowParam = mySheet.RowSaveStr(1);				
* @returns {String}  행의 데이터
*/
	ibsheetObject.prototype.RowSaveStr = function(Row)			{};
	
	/**
* GetRowSumable :  행의 합계 계산 대상인지 여부를 확인하거나 설정한다
*  @param {Number} 대상 행의 Index
*  @example 
*  //1행에 대한 합계 계산 대상 여부를 확인 한다..				
*  var sumable = mySheet.GetRowSumable(1);				
* @returns {Boolean}  설정 값
*/
	ibsheetObject.prototype.GetRowSumable = function(Row)		{};
	
	/**
* SetRowSumable :  행의 합계 계산 대상인지 여부를 확인하거나 설정한다
*  @param {Number} 대상 행의 Index
*  @param {Boolean} 합계 계산 포함 여부
*  @example 
*  //5행을 합계계산에서 제외 한다.				
*  mySheet.SetRowSumable(5, 0);				
*  }				
*/
	ibsheetObject.prototype.SetRowSumable = function(Row, Sum)		{};
	
	/**
* RowTop :  특정 행의 상단 시작위치의 offsetTop 값을 확인 한다
*  @example 
*  //행의 상단 위치를 파악한다.				
*  var iTop = mySheet.RowTop(1);				
*/
	ibsheetObject.prototype.RowTop = function(Row)			{};
	
	/**
* SaveNameCol :  InitColumns에서 설정된 SaveName을 이용하여 해당하는 컬럼 번호를 확인한다
*  @param {String} 저장 변수명
*  @example 
*  // 변수명으로 컬럼 번호를 가져온다.				
*  var Col = mySheet.SaveNameCol(stockNm);				
* @returns {Long}  컬럼의 Index
*/
	ibsheetObject.prototype.SaveNameCol = function(SaveName)			{};
	
	/**
* GetSavingImage :  저장 중 대기 이미지 파일의 위치를 설정하거나 확인한다
*  @example 
*  //현재 설정되어있는 저장 중 대기 이미지 경로를 확인한다.				
*  alert(mySheet.GetSavingImage());				
* @returns {String}  현재 설정값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSavingImage = function()		{};
	
	/**
* SetSavingImage :  저장 중 대기 이미지 파일의 위치를 설정하거나 확인한다
*  @param {String} 이미지 URL
*  @example 
*  //저장 중 대기 이미지를 변경한다.				
*  mySheet.SetSavingImage( /sheet/imgSave.gif);				
*/
	ibsheetObject.prototype.SetSavingImage = function(Url)		{};
	
	/**
* GetSearchingImage :  조회 중 대기 이미지 파일의 위치를 설정하거나 확인한다
*  @example 
*  //현재 설정되어있는 조회 중 대기 이미지 경로를 확인한다.				
*  alert(mySheet.GetSearchingImage());				
* @returns {String}  현재 설정값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSearchingImage = function()		{};
	
	/**
* SetSearchingImage :  조회 중 대기 이미지 파일의 위치를 설정하거나 확인한다
*  @param {String} 이미지 URL
*  @example 
*  //저장 중 대기 이미지를 변경한다.				
*  mySheet.SetSearchingImage( /sheet/imgSearch.gif);				
*/
	ibsheetObject.prototype.SetSearchingImage = function(Url)		{};
	
	/**
* SearchRows :  조회 XML을 통해서 조회된 전체 행 개수를 확인한다
*  @example 
*  //행 개수 확인				
*  alert(mySheet.SearchRows());				
* @returns {Long}  조회된 전체 행 개수
*/
	ibsheetObject.prototype.SearchRows = function()			{};
	
	/**
* SelectCell :  특정 셀을 선택한다
*  @param {Number} 선택할 셀의 Row Index
*  @param {Number / String} 선택할 셀의 Column Index 또는 SaveName
*  @param {Boolean} 셀 선택시 편집모드 여부를 설정 Default=0
*  @param {String} Edit 속성이 1일때 편집상태의 문자열 설정. Defulat= "
*  @param {Boolean} 편집시 기존 값에 대한 select 처리 여부 Default = 1
*  @param {Boolean} OnSelectCell 이벤트 발생 여부 Default = 1
*  @example 
*  // 2행을 선택하고 그 행 아래에 새로운 행 생성하기				
*  mySheet.SelectCell(2, 0);  				
*  mySheet.DataInsert();				
*/
	ibsheetObject.prototype.SelectCell = function(Row, Col, Opt)			{};
	
	/**
* GetSelectCol :  현재 선택된 셀의 컬럼 Index를 확인하거나 설정한다
*  @example 
*  //선택된 컬럼을 확인한다.				
*  alert(mySheet.GetSelectCol());				
* @returns {Number}  현재 선택된 컬럼 Index (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSelectCol = function()		{};
	
	/**
* SetSelectCol :  현재 선택된 셀의 컬럼 Index를 확인하거나 설정한다
*  @param {Number / String} 현재 선택된 셀의 Column Index 또는 SaveName
*  @param {Boolean} OnSelectCell 이벤트 발생 여부 Default = 1 (이벤트 발생)
*  @example 
*  //인덱스가  2인 컬럼을 선택한다.				
*  mySheet.SetSelectCol(2);				
*/
	ibsheetObject.prototype.SetSelectCol = function(Col, UseEvent)		{};
	
	/**
* GetSelectionMode :  셀 선택 모드를 설정하거나 확인한다
*  @example 
*  // 현재 설정되어 있는 선택 모드를 확인한다.				
*  alert(mySheet.GetSelectionMode());				
* @returns {Integer}  현재 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSelectionMode = function()		{};
	
	/**
* SetSelectionMode :  셀 선택 모드를 설정하거나 확인한다
*  @param {Integer} 선택 모드 종류 (0 : 셀단위, 1 : 행단위)
*  @example 
*  //셀 단위 선택으로 설정한다.				
*  mySheet.SetSelectionMode(0);				
*/
	ibsheetObject.prototype.SetSelectionMode = function(Mode)		{};
	
	/**
* GetSelectionSummaryInfoElement :  선택 요약 정보를 시트 외부의 DOM 엘리먼트에 표현하기 위한 설정을 하거나 설정된 엘리먼트를 확인 한다
*  @example 
*  // 선택요약정보를 표시할 DOM 엘리먼트 객체를 확인 한다.				
*  Var elem = mySheet.GetSelectionSummaryInfoElement();				
* @returns {object}  설정된 DOM 엘리먼트 객체
*/
	ibsheetObject.prototype.GetSelectionSummaryInfoElement = function()		{};
	
	/**
* SetSelectionSummaryInfoElement :  선택 요약 정보를 시트 외부의 DOM 엘리먼트에 표현하기 위한 설정을 하거나 설정된 엘리먼트를 확인 한다
*  @param {Object/} 설정할 DOM 엘리먼트 객체 또는 Id
*  @example 
*  // 선택요약정보를 표시할 DOM 엘리먼트를 설정한다.				
*  // (summaryElem 아이디의 DOM 엘리먼트가 생성되어 있어야 함)				
*  mySheet.SetSelectionSummaryInfoElement(summaryElem);				
*  }				
*/
	ibsheetObject.prototype.SetSelectionSummaryInfoElement = function(Element)		{};
	
	/**
* GetSelectRow :  현재 선택된 셀의 행 Index를 확인하거나 설정한다
*  @example 
*  //선택된 행을 확인한다.				
*  alert(mySheet.GetSelectRow());				
* @returns {Long}  현재 선택된 행 Index (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSelectRow = function()		{};
	
	/**
* SetSelectRow :  현재 선택된 셀의 행 Index를 확인하거나 설정한다
*  @param {Long} 선택할 행 Index
*  @param {Boolean} OnSelectCell 이벤트 발생 여부 Default = 1 (이벤트 발생)
*  @example 
*  //인덱스가 2인 행을 선택한다.				
*  mySheet.SetSelectRow(2);				
*/
	ibsheetObject.prototype.SetSelectRow = function(Row, UseEvent)		{};
	
	/**
* GetSendComboData :  데이터 타입이 Combo일때 서버로 전송되는 데이터를 설정하거나 확인한다
*  @param {Number} 단위 데이터 행 Index
*  @param {Number / String} 대상 컬럼의 Index 또는 SaveName
*  @example 
*  //3컬럼에 대해서 저장시 콤보 전송 형식을 알아온다.				
*    mySheet.GetSendComboData(0,3);				
* @returns {String}  현재 선택된 콤보 컬럼의 전송될 데이터 형식 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSendComboData = function(DataRow, Col)		{};
	
	/**
* SetSendComboData :  데이터 타입이 Combo일때 서버로 전송되는 데이터를 설정하거나 확인한다
*  @param {Long} 단위 데이터 행 Index
*  @param {Long / String} 특정 컬럼의 Column Index 또는 SaveName
*  @param {String} 서버 전송 옵션 설정 (Text 또는 code), Default=code
*  @example 
*  //3컬럼에 대해서 저장시 Code 와 Text 값이 같이 전달되도록 한다.				
*    mySheet.SetSendComboData(0,3,Code|Text);				
*    //Dept 컬럼에 대해서 저장시 Code 대신 Text 값이 전달되도록 한다.				
*    mySheet.SendComboData(0,Dept,Text);				
* @returns {String}  현재 선택된 콤보 컬럼의 전송될 데이터 형식 (Get Method 인 경우)
*/
	ibsheetObject.prototype.SetSendComboData = function(DataRow, Col, Type)		{};
	
	/**
* SetBlur :  시트에 포커스를 뺀다
*  @example 
*  // 시트에서 포커스를 뺀다.				
*  mySheet.SetBlur();				
*/
	ibsheetObject.prototype.SetBlur = function()			{};
	
	/**
* SetCellImageStyle :  Image 속성을 사용하는 경우 해당 셀의 이미지에 대한 설정을 한다
*  @param {Long} 대상 행의 Index
*  @param {Logn/String} 대상 컬럼의 Index 또는 SaveName
*  @param {Object} 셀의 이미지관련 속성 객체
*  @example 
*  //3번째 행의 3번째 컬럼에 이미지를 왼쪽에 표시.				
*  var style = {Image: myImage.gif, ImgHeight:20, ImgAlign:Left};				
*  mySheet.SetCellImageStyle(3, 3, style);				
*  //3번째 행의 3번째 컬럼에 ImageList의 1번째 이미지를 오른쪽에 표시.				
*  mySheet.SetImageList(0, image0.gif);				
*  mySheet.SetImageList(1. image1.gif);				
*  var style = {Image: 1, ImgAlign:Right};				
*  mySheet.SetCellImageStyle(3, 3, style);				
*/
	ibsheetObject.prototype.SetCellImageStyle = function(Row, Col, Style)			{};
	
	/**
* SetColProperty :  InitColums Method를 통해 정의후 특정 컬럼의 속성 정의를 동적으로 변경하여 사용 하고자 하는 경우에 이 함수를 사용한다
*  @param {Number} 단위데이터행 Index
*  @param {Number / String} 대상 컬럼의 Index 또는 SaveName
*  @param {Object} 컬럼의 속성 정의 객체
*  @example 
*  // 3번째 컬럼의 콤보 목록을 변경				
*  var info = {ComboText: “신규|진행중|완료 “, ComboCode: “ 01|02|03” };				
*  mySheet.SetColProperty(0, 3, info);				
*  // 단위데이터행 1번째, 3번째 컬럼의 콤보 목록을 변경				
*  var info = {ComboText: “신규|진행중|완료 “, ComboCode: “ 01|02|03” };				
*  mySheet.SetColProperty(1, 3, info);				
*  // 4번째 컬럼에 허용키, 제외키 설정				
*  var info = {AcceptKeys:N|E|[!$%],ExceptKeys:[123ab]};				
*  mySheet.SetColProperty(0, 4 ,info);				
*/
	ibsheetObject.prototype.SetColProperty = function(DataRow, Col, Prop)			{};
	
	/**
* SetConfig :  시트 초기화시 조회 방식와 틀고정 위치 및 기본적인 설정을 처리한다
*  @param {Object} 전달되는 인자의 형식은 JSON 타입으로 설정 하고자 하는 정보를 JSON 형태로 구성하여 전달한다.
*  @example 
*  //페이징 모드 조회 예제				
*  cfg= {SearchMode:1, Page:20};				
*  mySheet.SetConfig(cfg);				
*/
	ibsheetObject.prototype.SetConfig = function(cfg)			{};
	
	/**
* SetDown2ExcelConfig :  엑셀 다운시 기본적인 설정을 처리한다
*  @param {json} 전달되는 인자의 형식은 JSON 타입으로 설정 하고자 하는 정보를 JSON 형태로 구성하여 전달한다.
*  @param {bool} Default=0(컬럼 넓이 자동 조절 안함)
*  @param {String} 체크박스의 체크 해제시의 값 Default=”0”
*  @param {String} 체크박스의 체크시의 값 Default=”1”
*  @param {bool} 콤보의 드롭다운 형식 다운로드 여부 Defualt=0
*  @param {String} 다운로드 받을 열들을 | 로 연결. Default=””(모두 받음)
*  @param {String} 콤보의 TEXT/CODE 형태의 다운로드 여부 Default=”TEXT”
*  @param {bool} 헤더의 다운로드 여부 Default=1
*  @param {String} 다운로드 받을 행들을 | 로 연결. Default=””(모두 받음)
*  @param {bool} 합계의 다운로드 여부 Default=1
*  @param {Integer} 폰트크기 설정 Default=0
*  @param {String} Default="(사용안함)
*  @param {String} Default="(사용안함)
*  @param {String} Default=GET
*  @param {String} 저장할 파일 명 Default=”Excel.xls”
*  @param {bool} 열숨김 반영 여부. Default=0
*  @param {bool} KeyField 마크(*)를 다운 여부 Default=1(다운 받음)
*  @param {bool} 머지의 다운로드 적용 여부 Default=0
*  @param {bool} 숫자타입 셀 데이터를 문자 타입으로 다운로드 받을지 여부. 숫자타입 컬럼의 일부 셀에 포맷을 변경하여 문자열을 삽입하는 경우 사용 Default=0
*  @param {bool} 헤더만 머지할지의 여부 Default=0
*  @param {bool} 디자인 다운로드 적용 여부 Default=0
*  @param {String} 엑셀WorkSheet이름, Default=”Sheet”
*  @param {Integer} 템플릿으로 사용할 엑셀 WorkSheet 번호. Default=0
*  @param {Integer} 템플릿 적용 다운로드 시 엑셀 파일내 데이터를 쓰기 시작할 컬럼 번호 Default=0
*  @param {Integer} 템플릿 적용 다운로드 시 엑셀 파일내 데이터를 쓰기 시작할 행 번호 Default=0
*  @param {String} 템플릿으로 사용할 엑셀 파일명파일명
*  @param {bool} Text 타입의 엑셀 서식 형식 Default=1(일반)
*  @param {String} Default=””(사용안함)
*  @param {bool} Default=0(다운 안받음)
*  @param {String} Default="(사용안함)
*  @param {String} Default=””(사용안함)
*  @param {bool} Default=1(줄바꿈 허용)
*  @example 
*  // 기본설정				
*  cfg= {FileName:”DownExcel.xls”, Merge:1};				
*  mySheet.SetDown2ExcelConfig(cfg);				
*  mySheet.Down2Excel();				
*/
	ibsheetObject.prototype.SetDown2ExcelConfig = function(cfg)			{};
	
	/**
* SetEndEdit :  셀 편집을 종료 한다
*  @param {Boolean} 편집중인 내용 저장 여부
*  @example 
*  // 저장 관련 로직 처리 함수				
*  var result = mySheet.SetEndEdit(1);				
*  if (!result) {				
*      return;				
*  }				
*  // 저장 처리 로직 진행				
* @returns {Boolean}  종료 성공 여부
*/
	ibsheetObject.prototype.SetEndEdit = function(Save)			{};
	
	/**
* SetFilterOption :  필터행 사용시 컬럼의 필터 옵션값을 설정할 때 사용한다
*  @param {Long} Column Index 또는 SaveName
*  @param {Integer} 설정 할 Option 값
*  @example 
*  // 필터행이 1행일 경우 2컬럼의 필터링 할 값 설정				
*  mySheet.SetCellValue(1, 2, “포함”);				
*  // 필터행 2컬럼의 필터 설정 – 문자열 ‘포함’ 과 같은 단어 필터링.				
*  mySheet.SetFilterOption (2, 1);				
*/
	ibsheetObject.prototype.SetFilterOption = function(Col, Option)			{};
	
	/**
* SetFilterValue :  필터행 사용시 컬럼의 필터값을 설정할 때 사용한다
*  @param {Long} Column Index 또는 SaveName
*  @param {String} 필터에 설정할 값
*  @param {Integer} 설정 할 Option 값
*  @example 
*  // 5컬럼에 “서울”이 포함된 문자열 필터링하기				
*  mySheet.SetFilterValue(5, “서울”, 11);				
*/
	ibsheetObject.prototype.SetFilterValue = function(Col, Value, Option)			{};
	
	/**
* SetFindDialog :  단축키 Ctrl+Shift+F 를 이용한 찾기 다이얼로그의 기본 정보를 설정 한다
*  @param {Boolean} 찾기 다이얼로그 사용 여부
*  @param {Long/String} 찾을 컬럼의 Index 또는 SaveName 빈값인 경우 전체 컬럼, Default=””
*  @param {Integer} 텍스트 일치 종류 설정, Default=-1
*  @param {Boolean} 시작 위치 설정, Default=1
*  @param {Boolean} 대소 구분 설정, Default=0
*  @param {Boolean} 찾기 후 창 닫기 여부 설정, Default=0
*  @example 
*  //찾기창 사용, 대상 컬럼:5, 시작위치:포커스행 다음, 일치종류:가운데일치				
*  mySheet.SetFindDialog(1, 5, 2, 0);				
* @returns None.
*/
	ibsheetObject.prototype.SetFindDialog = function(Show,Col,FullMatch,FirstStart,CaseSensitive, KeepDialog)			{};
	
	/**
* SetFocus :  시트에 포커스를 설정 한다
*  @example 
*  // 시트에 포커스를 설정한다.				
*  mySheet.SetFocus();				
*/
	ibsheetObject.prototype.SetFocus = function()			{};
	
	/**
* SetHeaderMode :  헤더의 모드를 설정한다
*  @param {Boolean} 헤더 컬럼 이동 가능 여부
*  @param {Boolean} 컬럼 너비 ReSize 여부
*  @param {Boolean} 헤더에 전체 체크 표시 여부
*  @param {Boolean} 헤더 클릭 시 소트 가능 여부
*  @example 
*  // 헤더의 마우스 드래그를 이용한 컬럼 이동 및 리사이즈 기능을 제한한다.				
*  mySheet.SetHeaderMode({				
*  ColResize:0,				
*  ColMode:0				
*  });				
*/
	ibsheetObject.prototype.SetHeaderMode = function(Mode)			{};
	
	/**
* SetMergeCell :  특정 셀을 기준으로 인접한 셀과 강제로 머지한다
*  @param {Long} 강제머지할 셀의 Row Index
*  @param {Long} 강제머지할 셀의 Column Index
*  @param {Long} 강제머지할 셀의 Row 개수
*  @param {Long} 강제머지할 셀의 Col 개수
*  @example 
*  // (1,10)부터(2,11)까지 2x2 창문형태의 셀을 강제로 머지하여 표시한다.				
*  mySheet.SetMergeCell(1, 10, 2, 2);				
*/
	ibsheetObject.prototype.SetMergeCell = function(Row, Col, Rows, Cols)			{};
	
	/**
* SetRowHaveChildValue :  트리구조에서 조회시 HaveChild 속성 설정값을 변경한다
*  @param {Long} 대상 행의 Index
*  @param {Boolean} 속성 설정값
*  @example 
*  // 3행의 HaveChild 속성을 0으로 변경한다.				
*  mySheet.SetRowHaveChildValue(3, 0);				
*/
	ibsheetObject.prototype.SetRowHaveChildValue = function(Row, HaveChild)			{};
	
	/**
* SetSplitMergeCell :  셀 병합(머지) 되어 있는 셀 영역을 취소(분할) 처리 한다
*  @param {Number} 대상 셀의 행 Index
*  @param {Number/} 대상 셀의 컬럼 Index 또는 SaveName
*  @example 
*  // (1,1)부터(2,2)까지 2x2 셀 병합 영역을 분할 한다.				
*  mySheet.SetSplitMergeCell(1, 1);				
*/
	ibsheetObject.prototype.SetSplitMergeCell = function(Row, Col)			{};
	
	/**
* GetSheetWidth :  전체 너비를 설정하거나 확인한다
*  @example 
*  // 현재 설정되어있는 전체 너비를 확인한다.				
*  alert(mySheet.GetSheetWidth());				
* @returns {Integer}  설정되어 있는 너비 픽셀값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSheetWidth = function()		{};
	
	/**
* SetSheetWidth :  전체 너비를 설정하거나 확인한다
*  @param {Integer} 설정하고자 하는 시트 너비 픽셀값
*  @example 
*  //전체 너비를 800px로 설정한다.				
*  mySheet.SetSheetWidth(800);				
*/
	ibsheetObject.prototype.SetSheetWidth = function(Width)		{};
	
	/**
* GetSheetHeight :  전체 높이를 설정하거나 확인한다
*  @example 
*  // 현재 설정되어있는 전체 높이를 확인한다.				
*  alert(mySheet.GetSheetHeight());				
* @returns {Integer}  설정되어 있는 높이 픽셀값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSheetHeight = function()		{};
	
	/**
* SetSheetHeight :  전체 높이를 설정하거나 확인한다
*  @param {Integer} 설정하고자 하는 시트 높이 픽셀값
*  @example 
*  //전체 높이를 800px로 설정한다.				
*  mySheet.SetSheetHeight(800);				
*/
	ibsheetObject.prototype.SetSheetHeight = function(Height)		{};
	
	/**
* GetShowButtonImage :  팝업과 콤보의 버튼 이미지를 표시하는 종류를 확인하거나 설정한다
*  @example 
*  // 팝업과 콤보의 버튼 이미지를 표시하는 종류를 확인한다.				
*  mySheet.GetShowButtonImage();				
* @returns {Integer}  현재 설정 값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetShowButtonImage = function()		{};
	
	/**
* SetShowButtonImage :  팝업과 콤보의 버튼 이미지를 표시하는 종류를 확인하거나 설정한다
*  @param {Integer} 설정 값 (Default =3)
*  @example 
*  // Focus가 있을경우만 콤보와, 팝업이미지 표시된다.				
*  mySheet.SetShowButtonImage(0);				
*  // Edit가 가능할 때 팝업이미지가 표시된다.				
*  mySheet.SetShowButtonImage(1);				
*  // 항상 팝업이미지가 표시 된다.				
*  mySheet.SetShowButtonImage(2);				
*  // Edit 가능할때 콤보와 팝업이미지가 표시된다.				
*  mySheet.SetShowButtonImage(3);				
*  // 항상 콤보와 팝업 이미지가 표시된다.				
*  mySheet.SetShowButtonImage(4);				
*/
	ibsheetObject.prototype.SetShowButtonImage = function(type)		{};
	
	/**
* ShowCalendar :  Text 타입의 컬럼에 포맷으로 날짜 포맷을 설정한 경우 OnClick 이벤트에서 ShowCalendar()를 실행하면 해당 컬럼 클릭 시 달력팝업을 출력해준다
*  @example 
*  // 텍스트 타입 컬럼 클릭시 달력 팝업 출력하기				
*  function mySheet_OnClick(Row, Col) {				
*  mySheet.ShowCalendar();				
*  }				
*  // Popup, PopupEdit 컬럼의 OnPopup 버튼 클릭시 달력 팝업 출력하기				
*  function mySheet_OnPopupClick(Row,Col) {				
*  mySheet.ShowCalendar();				
*  }				
*/
	ibsheetObject.prototype.ShowCalendar = function()			{};
	
	/**
* ShowDebugMsg :  디버깅용 메시지의 표시여부를 확인하거나 설정한다
*  @param {Integer} 디버깅용 메시지 표시여부 설정 (Default=0)
*  @example 
*  //저장 처리 과정을 디버깅 메시지를 팝업으로 표시				
*  mySheet.ShowDebugMsg(-1);				
*  //조회				
*  mySheet.DoSearch(“list.xml”);				
* @returns {Boolean}  디버깅용 메시지 표시 여부 
*/
	ibsheetObject.prototype.ShowDebugMsg = function(Msg)			{};
	
	/**
* ShowColumnPopup :  InitColumns 함수를 이용하여 컬럼 팝업 기능이 설정된 컬럼에서 함수를 이용하여 강제로 팝업을 열어주는 기능이다
*  @param {Number} 선택할 셀의 Row Index
*  @param {Number / String} 선택할 셀의 Column Index 또는 SaveName
*  @param {Boolean} 마지막 마우스 위치 사용 여부, Default=1(마지막 위치 사용)
*  @example 
*  //현재 셀 위치에 팝업 열기				
*  mySheet.ShowColumnPopup(1, 4, 0)				
*  //마우스를 클릭한 마지막 위치에서 팝업 열기				
*  mySheet.ShowColumnPopup(1, 4,1)				
*/
	ibsheetObject.prototype.ShowColumnPopup = function(Row, Col, MousePos)			{};
	
	/**
* ShowFilterRow :  IBSheet 상단 고정행으로 필터행을 추가한다
*  @example 
*  //필터행 추가하기				
*  mySheet.ShowFilterRow();				
*/
	ibsheetObject.prototype.ShowFilterRow = function()			{};
	
	/**
* ShowFindDialog :  사용자가 시트에서 ctrl+shift+F 입력시 표시되는 찾기 창을 표시한다
*  @example 
*  //찾기창을 표시한다.				
*  mySheet.ShowFindDialog();				
*/
	ibsheetObject.prototype.ShowFindDialog = function()			{};
	
	/**
* ShowGroupRow :  IBSheet 헤더 상단에 그룹행을 추가한다
*  @param {Long/} 그룹핑 하고자 하는 컬럼의 Index 또는 SaveName을 “|”로 연결한 문자열
*  @example 
*  //그룹행 추가하기				
*  mySheet.ShowGroupRow();				
*  // 인덱스가 1, 3 인 컬럼 기준 그룹행 추가하기				
*  mySheet.ShowGroupRow(“1|3”);				
*  // SaveName이 sName, sDept 인 컬럼 기준 그룹행 추가하기				
*  mySheet.ShowGroupRow(“sName|sDept”);				
*/
	ibsheetObject.prototype.ShowGroupRow = function(Cols)			{};
	
	/**
* GetShowMsgMode :  Sheet에서 발생하는 각종 메시지를 시스템 팝업 형태로 사용할것인지 이벤트 방식을 사용할것인지 설정한다
*  @example 
*  //메시지 모드를 확인한다.				
*  mySheet.GetShowMsgMode();				
* @returns {Boolean}  현재 설정 값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetShowMsgMode = function()		{};
	
	/**
* SetShowMsgMode :  Sheet에서 발생하는 각종 메시지를 시스템 팝업 형태로 사용할것인지 이벤트 방식을 사용할것인지 설정한다
*  @param {Boolean} 메시지 표시 여부
*  @example 
*  //메시지 모드를 설정한다.				
*  mySheet.SetShowMsgMode(0);				
*  //OnMessage 이벤트를 처리한다.				
*  function mySheet_OnMessage(Msg, Level, IsConfirm) {				
*  //메시지 표시하기				
*      var win_result = window.showModalDialog(				
*   “sheet_message.jsp?Msg=” + Msg + “&IsConfirm=” + IsConfirm, 				
*          ‘modalResult’, 				
*          ‘dialogWidth:200px;dialogHeight:200px;center:yes;help:no;status:no;’);				
*      //Sheet로 메시지 결과를 반환한다.				
*      if(IsConfirm) mySheet.ConfirmOK( win_result);				
*  }				
*/
	ibsheetObject.prototype.SetShowMsgMode = function(Mode)		{};
	
	/**
* ShowPivotDialog :  사용자가 시트에서 ctrl+alt+T 입력시 표시되는 피벗 테이블 설정 팝업을 호출 한다
*  @example 
*  //피벗 테이블 설정 팝업을 호출한다.				
*  mySheet.ShowPivotDialog();				
*/
	ibsheetObject.prototype.ShowPivotDialog = function()			{};
	
	/**
* ShowProcessDlg :  시트 중앙에 대기중 이미지를 표시 한다
*  @param {String} 대기 이미지 종류 (Default:Search)
*  @example 
*  // 저장중 대기이미지를 표시 한다..				
*  mySheet.ShowProcessDlg(Search);				
*/
	ibsheetObject.prototype.ShowProcessDlg = function(Type)			{};
	
	/**
* GetShowSortArrow :  헤더를 눌러 소트를 할 때 소트되는 방향을 화살표 이미지로 표시할지 여부를 설정하거나 확인한다
*  @example 
*  // 설정되어 있는 소트 방향 표시여부를 확인한다.				
*  alert(mySheet.GetShowSortArrow());				
* @returns {Boolean}  화살표 이미지 표시여부(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetShowSortArrow = function()		{};
	
	/**
* SetShowSortArrow :  헤더를 눌러 소트를 할 때 소트되는 방향을 화살표 이미지로 표시할지 여부를 설정하거나 확인한다
*  @param {Boolean} 화살표 표시 여부
*  @example 
*  // 소트 방향을 표시한다.				
*  mySheet.SetShowSortArrow(1);				
*/
	ibsheetObject.prototype.SetShowSortArrow = function(Arrow)		{};
	
	/**
* ShowSubSum :  특정 컬럼의 데이터를 기준으로 소계와 누계를 계산하여 표시한다
*  @param {Long/String} 기준 컬럼 Index 또는 SaveName
*  @param {String} 소계가 계산되어야 할 컬럼 Index를 “|”로 연결한 문자열
*  @param {Boolean} 기준 컬럼의 Sort 처리 여부. 소계를 표시 하기 위해 기준 컬럼의 값이 반드시 Sort 되어 있어야 함. Default=1
*  @param {Boolean} 소계에 대한 누계 표시 여부. Default=0
*  @param {Long} 소계 대표 글자인 “소계:” + 기준값을 설정할 컬럼 Default=숨겨지지 않은 첫컬럼
*  @param {String} 소계 대표 글자 포맷을 설정 Default=소계(누계): + 기준값
*  @param {String} 소계 행에 평균으로 계산되어야 할 컬럼 Index를 “|”로 연결한 문자열. Defuault=””
*  @example 
*  //1컬럼(용량)을 중심으로 소계만 계산하여 표시하기				
*  var info = [				
*  {StdCol:1, SumCols:”2|3|4|5|6|7”,  Sort:1}				
*  ];				
*  mySheet.ShowSubSum(info);				
*  // 누계 까지 표시하기				
*  var info = [				
*   {StdCol:1, SumCols:”2|3|4|5|6|7”, ShowCumulate:1,  Sort:1}				
*  ];				
*  mySheet.ShowSubSum(info);				
*/
	ibsheetObject.prototype.ShowSubSum = function(info)			{};
	
	/**
* ShowToolTip :  마우스 커서가 위치한 셀의 내용을 툴팁으로 표현한다
*  @param {Boolean} 툴팁 표시 여부
*  @example 
*  //툴팁 설정				
*  mySheet.ShowToolTip(1);				
*/
	ibsheetObject.prototype.ShowToolTip = function(ToolTip)			{};
	
	/**
* ShowTreeSubSum :  트리구조에서 특정 컬럼의 데이터를 기준으로 소계를 계산하여 표시한다
*  @param {String} 합계가 계산되어야 할 컬럼의 Index또는 SaveName을 “|”로 연결한 문자열. Defuault=””
*  @param {String} 평균이 계산되어야 할 컬럼의 Index 또는 SaveName을 “|”로 연결한 문자열. Defuault=””
*  @param {String} 개수가 계산되어야 할 컬럼의 Index 또는 SaveName을 “|”로 연결한 문자열. Default=””
*  @param {Boolean} 상태값이 “삭제”인 행에 대한 계산 포함 여부. Default=0
*  @param {Boolean} 평균 컬럼에서 Null 값 포함 계산 여부. Default=0
*  @example 
*  //2번째 컬럼에 대한 트리 소계 표현				
*  var info = SumCols:”2};				
*  mySheet.ShowTreeSubSum(info);				
*  // 삭제행은 계산에서 제외하기				
*  var info = {SumCols:”2, SumEx:1};				
*  mySheet. ShowTreeSubSum (info);				
*/
	ibsheetObject.prototype.ShowTreeSubSum = function(Info)			{};
	
	/**
* GetSubSumBackColor :  소계 행의 배경 색상을 확인하거나 설정한다
*  @example 
*  //소계 행 배경색상을 확인한다.				
*  mySheet.GetSubSumBackColor();				
* @returns {String}  현재 설정된 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSubSumBackColor = function()		{};
	
	/**
* SetSubSumBackColor :  소계 행의 배경 색상을 확인하거나 설정한다
*  @param {String} 설정하고자 하는 WebColor 값
*  @example 
*  //소계 행 배경색상을 녹색으로 설정 				
*  mySheet.SetSubSumBackColor(“#00FF00”);				
*/
	ibsheetObject.prototype.SetSubSumBackColor = function(Color)		{};
	
	/**
* ShowSum :  속도개선등의 이유로 합계를 계산하지 않은 경우 AutoSum 컬럼의 합계를 계산하여 한번만 보여주거나 재계산을 한다
*  @example 
*  mySheet.ShowSum();				
*/
	ibsheetObject.prototype.ShowSum = function()			{};
	
	/**
* ShowTreeLevel :  데이터가 트리 형태일 때 보여질 트리 레벨을 설정한다
*  @param {Integer} 보여질 트리 레벨 수준. Default=-1
*  @param {Integer} 보여질 트리 레벨 이하 레벨의 펼침 상태를 설정한다. Default=0
*  @example 
*  //모두 접기				
*  mySheet.ShowTreeLevel(0, 1);				
*  //모두 펼치기				
*  mySheet.ShowTreeLevel(-1);				
*/
	ibsheetObject.prototype.ShowTreeLevel = function(Level, ChildStatus)			{};
	
	/**
* GetSumBackColor :  합계 행의 배경 색상을 확인하거나 설정한다
*  @example 
*  //합계행 배경색상 구하기				
*  mySheet.GetSumBackColor();				
* @returns {String}  WebColor 값(Get Method인 경우)
*/
	ibsheetObject.prototype.GetSumBackColor = function()		{};
	
	/**
* SetSumBackColor :  합계 행의 배경 색상을 확인하거나 설정한다
*  @param {String} WebColor 값
*  @example 
*  //합계 행 배경색상을 녹색으로 설정 				
*  mySheet.SetSumBackColor(“#00FF00”);				
*/
	ibsheetObject.prototype.SetSumBackColor = function(Color)		{};
	
	/**
* GetSumFontBold :  합계 행의 글자를 굵게 할지 여부를 확인하거나 설정한다
*  @example 
*  //합계행 글자 볼드 설정 확인한다.				
*  mySheet.GetSumFontBold();				
* @returns {Boolean}  현재 폰트 굵기 여부 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSumFontBold = function()		{};
	
	/**
* SetSumFontBold :  합계 행의 글자를 굵게 할지 여부를 확인하거나 설정한다
*  @param {Boolean} 폰트 굵기 여부
*  @example 
*  //합계 행의 글자 볼드를 설정한다. 				
*  mySheet.SetSumFontBold(1);				
*/
	ibsheetObject.prototype.SetSumFontBold = function(Bold)		{};
	
	/**
* GetSumFontColor :  합계 행의 글자 색상을 확인하거나 설정한다
*  @example 
*  //합계행 폰트색상을 확인한다.				
*  mySheet.GetSumFontColor();				
* @returns {String}  현재 합계행 글자 색상 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSumFontColor = function()		{};
	
	/**
* SetSumFontColor :  합계 행의 글자 색상을 확인하거나 설정한다
*  @param {String} WebColor 값
*  @example 
*  //합계 행 폰트색상을 녹색으로 설정 				
*  mySheet.SetSumFontColor(“#00FF00”);				
*/
	ibsheetObject.prototype.SetSumFontColor = function(Color)		{};
	
	/**
* GetSumRowHidden :  합계행의 숨기여부를 설정하거나 확인한다
*  @example 
*  //합계행의 숨김 여부를 확인하여 숨겨진 경우 표시되도록 설정한다.				
*  if(mySheet.GetSumRowHidden() == 1) {				
*  mySheet.SetSumRowHidden(0);				
*  }				
* @returns {Boolean}  숨김 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSumRowHidden = function()		{};
	
	/**
* SetSumRowHidden :  합계행의 숨기여부를 설정하거나 확인한다
*  @param {Boolean} 숨김여부
*  @example 
*  //합계행의 숨김 여부를 확인하여 숨겨진 경우 표시되도록 설정한다.				
*  if(mySheet.GetSumRowHidden() == 1) {				
*  mySheet.SetSumRowHidden(0);				
*  }				
*/
	ibsheetObject.prototype.SetSumRowHidden = function(Hidden)		{};
	
	/**
* GetSumValue :  합계 셀의 값을 Format이 적용되지 않은 형태로 확인하거나 설정한다
*  @param {Number} 단위 데이터행의 Index
*  @param {Number / String} 합계 셀의 Column Index 또는 SaveName
*  @example 
*  //첫번째 합계 행의 2컬럼의 값을 읽어온다. 값이 1,234.56 이면 				
*  //1234.56이 반환된다..				
*  alert(“합계는 “ + mySheet.GetSumValue(0, 2) + “입니다.”);				
* @returns {String}  합계 셀의 Value값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetSumValue = function(DataRow, Col)		{};
	
	/**
* SetSumValue :  합계 셀의 값을 Format이 적용되지 않은 형태로 확인하거나 설정한다
*  @param {Number} 단위 데이터행의 Index
*  @param {Number / String} 합계 셀의 Column Index 또는 SaveName
*  @param {Number / String} 포맷 적용 안된 형태의 CellValue 값
*  @example 
*  //첫번째 합계 행의 2컬럼의 값을 5432.12 로 바꾼다.				
*  mySheet.SetSumValue(0, 2, 5432.12);				
*/
	ibsheetObject.prototype.SetSumValue = function(DataRow, Col, Value)		{};
	
	/**
* GetTabBehavior :  셀 선택 상태에서 Tab 키를 눌렀을 때의 동작 모드를 확인하거나 설정한다
*  @example 
*  // Tab키의 동작을 확인한다.				
*  mySheet.GetTabBehavior();				
* @returns {Boolean}  설정한 속성 값
*/
	ibsheetObject.prototype.GetTabBehavior = function()		{};
	
	/**
* SetTabBehavior :  셀 선택 상태에서 Tab 키를 눌렀을 때의 동작 모드를 확인하거나 설정한다
*  @param {Boolean} Tab key 입력시 설정할 속성 값. Default= 1
*  @example 
*  // 편집 가능한 셀에 대해서만 탭 이동을 설정 한다.				
*  mySheet.SetTabBehavior(0);				
*/
	ibsheetObject.prototype.SetTabBehavior = function(Mode)		{};
	
	/**
* GetTheme :  IBSheet 의 테마 디자인을 확인 하거나 설정한다
*  @example 
*  //현재 설정되어 있는 테마를 확인				
*  var Prefix = mySheet.GetTheme();				
* @returns {String}  현재 테마의 Prefix 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetTheme = function()		{};
	
	/**
* SetTheme :  IBSheet 의 테마 디자인을 확인 하거나 설정한다
*  @param {String} 테마의 Prefix 값
*  @param {String} 테마의 폴더 명
*  @example 
*  //Gray 테마를 적용한다.				
*  mySheet.SetTheme(“GG”, “Gray”);				
*/
	ibsheetObject.prototype.SetTheme = function(Prefix, Folder)		{};
	
	/**
* GetToolTipText :  셀의 풍선도움말을 설정하거나 확인한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long / String} 해당 셀의 Column Index 또는 SaveName
*  @example 
*  // 풍선 도움말 설정값을 확인				
*  alert(mySheet.GetToolTipText(1, 1));				
* @returns {String}  현재 설정된 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetToolTipText = function(Row, Col)		{};
	
	/**
* SetToolTipText :  셀의 풍선도움말을 설정하거나 확인한다
*  @param {Long} 해당 셀의 Row Index
*  @param {Long / String} 해당 셀의 Column Index 또는 SaveName
*  @param {String} 풍선 도움말 설정 값
*  @example 
*  //셀에 풍선 도움말 설정				
*  mySheet.SetToolTipText(1,1, “셀의 금액은 “ + mySheet.GetCellText(1,1) + “입니다. “);				
*/
	ibsheetObject.prototype.SetToolTipText = function(Row, Col, ToolTip)		{};
	
	/**
* GetTopRow :  최상단의 행 번호를 확인하거나 설정한다
*  @example 
*  //최상단 행 번호를 확인한다.				
*  mySheet.GetTopRow();				
* @returns {Long}  최상단의 행 번호 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetTopRow = function()		{};
	
	/**
* SetTopRow :  최상단의 행 번호를 확인하거나 설정한다
*  @param {Long} Row Index
*  @example 
*  //최상단 행 번호를 설정한다.				
*  mySheet.SetTopRow(100);				
*/
	ibsheetObject.prototype.SetTopRow = function(Row)		{};
	
	/**
* GetTotalRows :  조회 조건에 따라 전체 조회해야 할 DB의 레코드 건수를 확인하거나 설정한다
*  @example 
*  //전체 데이터 건수를 확인한다.				
*  alert(“전체 데이터 건수는 “ + mySheet.GetTotalRows() + “입니다. “);				
* @returns {Long}  현재 설정된 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetTotalRows = function()		{};
	
	/**
* SetTotalRows :  조회 조건에 따라 전체 조회해야 할 DB의 레코드 건수를 확인하거나 설정한다
*  @param {Long} 전체 건수 설정값
*  @example 
*  //전체 데이터 건수를 1000으로 설정한다.				
*  mySheet.SetTotalRows(1000);				
*/
	ibsheetObject.prototype.SetTotalRows = function(Count)		{};
	
	/**
* GetTreeActionMode :  트리 형태일때 각종 기능 처리 관련 속성을 확인하거나 설정한다
*  @example 
*  //현재 설정되어 있는 TreeActionMode 값 확인한다.				
*  alert(mySheet.GetTreeActionMode());				
* @returns {Integer}  설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetTreeActionMode = function()		{};
	
	/**
* SetTreeActionMode :  트리 형태일때 각종 기능 처리 관련 속성을 확인하거나 설정한다
*  @param {Integer} TreeActionMode 값
*  @example 
*  //삭제 체크를 눌렀을 때 자식레벨까지 삭제되도록 한다.				
*  mySheet.SetTreeActionMode(1);				
*/
	ibsheetObject.prototype.SetTreeActionMode = function(Value)		{};
	
	/**
* GetUnicodeByte :  한글 1자리의 바이트 수를 확인하거나 설정 한다
*  @example 
*  // 설정된 바이트 수를 확인한다.				
*  mySheet. GetUnicodeByte();				
* @returns {Integer}  현재 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetUnicodeByte = function()		{};
	
	/**
* SetUnicodeByte :  한글 1자리의 바이트 수를 확인하거나 설정 한다
*  @param {Integer} 설정할 바이트 수 (Default=1)
*  @example 
*  // 한글 1자리의 바이트수를 3으로 설정한다.				
*  mySheet. SetUnicodeByte(3);				
*/
	ibsheetObject.prototype.SetUnicodeByte = function(byte)		{};
	
	/**
* GetUseDefaultTime :  Format이 “Hms”, “Hm” 인 경우 셀의 값이 공백인 상태에서 편집을 처음 시작하고자 할때 기본적으로 시스템 현재시간을 표시한다
*  @example 
*  //현재 시간을 표시 설정 확인				
*  mySheet.GetUseDefaultTime();				
* @returns {Boolean}  현재 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetUseDefaultTime = function()		{};
	
	/**
* SetUseDefaultTime :  Format이 “Hms”, “Hm” 인 경우 셀의 값이 공백인 상태에서 편집을 처음 시작하고자 할때 기본적으로 시스템 현재시간을 표시한다
*  @param {Boolean} 현재시간 표시 유무 (Default=1)
*  @example 
*  //현재 시간을 표시하지 않도록 설정				
*  mySheet.SetUseDefaultTime(0);				
*/
	ibsheetObject.prototype.SetUseDefaultTime = function(Value)		{};
	
	/**
* GetUserAgent :  조회나 저장시 HTTP 헤더 정보에 포함되어 넘어가는 IBUserAgent의 값을 확인하거나 설정한다
*  @example 
*  // IBUserAgent의 값을 확인한다.				
*  mySheet.GetUserAgent();				
* @returns {String}  현재 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetUserAgent = function()		{};
	
	/**
* SetUserAgent :  조회나 저장시 HTTP 헤더 정보에 포함되어 넘어가는 IBUserAgent의 값을 확인하거나 설정한다
*  @param {String} User-Agent 설정값
*  @example 
*  // HTTP 헤더정보의 IBUserAgent 값을 My Agent Name 으로 전송				
*  mySheet.SetUserAgent(“My Agent Name”);				
*/
	ibsheetObject.prototype.SetUserAgent = function(Value)		{};
	
	/**
* GetUploadingImage :  파일 업로드 중 대기 이미지 파일의 위치를 설정하거나 확인한다
*  @example 
*  //현재 설정되어있는 업로드 중 대기 이미지 경로를 확인한다.				
*  alert(mySheet.GetUploadingImage());				
* @returns {String}  현재 설정값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetUploadingImage = function()		{};
	
	/**
* SetUploadingImage :  파일 업로드 중 대기 이미지 파일의 위치를 설정하거나 확인한다
*  @param {String} 이미지 URL
*  @example 
*  //업로드 중 대기 이미지를 변경한다.				
*  mySheet.SetUploadingImage( “/sheet/imgUpload.gif”);				
*/
	ibsheetObject.prototype.SetUploadingImage = function(Url)		{};
	
	/**
* ValidateFail :  저장 함수를 호출하여 저장 처리 전에 저장할 각 데이터의 Validation 확인을 위한 OnValidation 이벤트에서 유효하지 않은 데이터를 발견하여 저장처리를 중단하고자 할 때 이 속성을 설정하여 처리를 중단한다
*  @param {Number} 저장 처리 중단 여부
*  @param {String} Fail 인자 설정이 2인 경우 표시할 메시지
*  @example 
*  // OnValidation 이벤트에서의 사용				
*  function mySheet_OnValidation(Row, Col, Value) {				
*  if(Col == 2)    {				
*  if(Value==”원화” && mySheet.GetCellValue(Row,Col+1) >= 10000000) {				
*  alert(“통화가 원화일 때 금액은 천만원 이상일수없습니다. “);				
*  mySheet.ValidateFail(1);				
*  mySheet.SelectCell(Row, Col+1);				
*  } else if(Value==”외화” && mySheet.GetCellValue(Row,Col+1) < 10000000) {				
*  alert(“통화가 외화일 때 금액은 천만원 이상이여야 합니다. “);				
*  mySheet.ValidateFail(1);				
*  mySheet.SelectCell(Row, Col+1);				
*  }				
*  }				
*  }				
*  // OnEditValidation 이벤트에서의 사용				
*  function mySheet_OnEditValidation(Row, Col, Value) {				
*   if(Col == 2 && Value > 100) {				
*     // alert 으로 메시지를 표시하고 편집상태를 유지한다.				
*   mySheet.ValidateFail(2, 금액 최대값은 100입니다);				
*  }				
*  }				
*/
	ibsheetObject.prototype.ValidateFail = function(Fail, Message)			{};
	
	/**
* GetVisible :  IBSheet의 표시 여부를 설정하거나 확인한다
*  @example 
*  // 시트 표시 여부를 확인				
*  if(mySheet.GetVisible()){				
*      alert(“IBSheet를 표시함”);				
*  }else{				
*  alert(“숨겨져 있음”);				
*  }				
* @returns {Boolean}  현재 설정 값 (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetVisible = function()		{};
	
	/**
* SetVisible :  IBSheet의 표시 여부를 설정하거나 확인한다
*  @param {Boolean} 화면에 시트 표시 여부
*  @example 
*  // 시트를 안보이게 설정				
*  mySheet.SetVisible(0);				
*/
	ibsheetObject.prototype.SetVisible = function(Visible)		{};
	
	/**
* GetWaitImage :  처리 중 대기 이미지 파일의 위치를 설정하거나 확인한다
*  @example 
*  //처리 중 대기 이미지 위치를 확인한다.				
*  mySheet.GetWaitImage();				
* @returns {String}  현재 설정 되어 있는 URL (Get Method 인 경우)
*/
	ibsheetObject.prototype.GetWaitImage = function()		{};
	
	/**
* SetWaitImage :  처리 중 대기 이미지 파일의 위치를 설정하거나 확인한다
*  @param {String} 이미지 Url
*  @example 
*  //처리 중 대기 이미지를 변경한다.				
*  mySheet.SetWaitImage(“/sheet/imgWait.gif”);				
*/
	ibsheetObject.prototype.SetWaitImage = function(Url)		{};
	
	/**
* GetWaitImageVisible :  각종 처리 중 대기 이미지의 표시여부를 설정하거나 확인한다
*  @example 
*  //처리 중 대기 이미지 표시 여부를 확인한다.				
*  alert(mySheet.GetWaitImageVisible());				
* @returns {Boolean}  현재 설정 값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetWaitImageVisible = function()		{};
	
	/**
* SetWaitImageVisible :  각종 처리 중 대기 이미지의 표시여부를 설정하거나 확인한다
*  @param {Boolean} 각종 대기 이미지 표시 여부
*  @example 
*  //처리 중 대기 이미지를 표시하지 않도록 설정한다..				
*  mySheet.SetWaitImageVisible(0);				
*/
	ibsheetObject.prototype.SetWaitImageVisible = function(Visible)		{};
	
	/**
* GetWaitTimeOut :  서버에 연결하여 응답을 대기하는 시간을 확인하거나 설정한다
*  @example 
*  // 서버에 연결하여 응답을 대기하는 시간을 확인				
*  alert(mySheet.GetWaitTimeOut());				
* @returns {Integer}  현재 설정 값(Get Method 인 경우)
*/
	ibsheetObject.prototype.GetWaitTimeOut = function()		{};
	
	/**
* SetWaitTimeOut :  서버에 연결하여 응답을 대기하는 시간을 확인하거나 설정한다
*  @param {Integer} 설정할 초시간 (Default=60)
*  @example 
*  // 서버에 연결하여 응답을 대기하는 시간을 확인하거나 설정				
*  mySheet.SetWaitTimeOut(120);				
*/
	ibsheetObject.prototype.SetWaitTimeOut = function(time)		{};
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ytcares" 	uri="http://www.backsaninfo.com/jsp/core"%>
<html>
<head>
<title>YTCaresFileUploadResult</title>
<meta content="text/html; charset=utf-8" http-equiv="content-type"/>
</head>
<body>
<c:if test="${empty requestScope['com.ytcares.message.obj']}">
	<script>
		window.parent.CKEDITOR.tools.callFunction('${param.CKEditorFuncNum}', 'http://${pageContext.request.localName}:${pageContext.request.localPort}${fileName}');
		history.go(-1);
		//var dialog = window.parent.CKEDITOR.dialog.getCurrent();
		//if (dialog != null && dialog != undefined) {
			//dialog.setValueOf('info', 'txtUrl', 'http://${pageContext.request.localName}:8080/ytcares/upload/'+escape('${fileName}'));
			//dialog.selectPage('info');
		//}
	</script>
</c:if>

<c:if test="${!empty requestScope['com.ytcares.message.obj']}">
<ytcares:msg/>
<script>
	history.go(-1);
</script>
</c:if>
</body>
</html>

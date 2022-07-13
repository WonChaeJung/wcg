<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>
<html>
<head>
<title>CKEditor Sample</title>
<meta content="text/html; charset=utf-8" http-equiv="content-type"/>
<link type="text/css" rel="stylesheet" href="/ckeditor/_samples/sample.css" />
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
</head>
<body>
CHKditor사용법(js include)<br/>
&lt;script type="text/javascript" src="/ckeditor/ckeditor.js"&gt;&lt;/script&gt;

<pre class="samples">
1. class 이름을 ckeditor로 지정
&lt;textarea class="<b>ckeditor</b>" name="editor1"&gt;&lt;/textarea&gt;
</pre>
<textarea class="ckeditor" name="editor1"></textarea>

<pre class="samples">
2. CKEDITOR.replace('텍스트영역아이디');
&lt;script&gt;
CKEDITOR.replace('editor2', {width:400,height:300,readOnly:true,resize_enabled:false});
&lt;/script&gt;
</pre>
<textarea cols="80" id="editor2" name="editor2" rows="10">&lt;p&gt;This is some &lt;strong&gt;sample text&lt;/strong&gt;. You are using &lt;a href="http://ckeditor.com/"&gt;CKEditor&lt;/a&gt;.&lt;/p&gt;</textarea>
<script type="text/javascript">
var editor2 = CKEDITOR.replace('editor2', {width:400,height:300,readOnly:true,resize_enabled:false});
</script>

<pre class="samples">
3. 커스텀태그사용(화면당 하나밖에 사용못함, js로 에디터 생성시 복수가능);
&lt;%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %&gt;
&lt;ckeditor:replace replace="텍스트영역아이디" basePath="/ckeditor/" /&gt;
</pre>

</body>
</html>

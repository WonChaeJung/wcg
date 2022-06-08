<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.HashMap,com.fasterxml.jackson.databind.ObjectMapper" %>
<% 
HashMap mp = new HashMap();
mp.put("Code", -1);
mp.put("Message",request.getAttribute("exceptionMessage"));
HashMap Result = new HashMap();
Result.put("Result",mp);
out.print(new ObjectMapper().writer().writeValueAsString(Result));
%>

   
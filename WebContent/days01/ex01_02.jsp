<!-- page 디렉티브 -->
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Date now = new Date();
	String name = "이지은";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 19. 오전 10:34:51</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<%-- 
쿼리 문자열(querystring)
?age =100 
표현 언어 : EL 3.0
 <h3> ${ param.age }</h3>
--%> 
표현 언어 : EL 3.0
<h3> ${ param.age }</h3>
지금 : <%= now %> - <%= name %>
 <br>

 Now : <% 
 		out.print(now);
 		out.print(" - ");
 		out.print(name);
 		%>
 		
<!-- 액션 태그 --> 		
<%-- <jsp:include page=""></jsp:include> --%>


<script>
$(function(){});
</script>
</body>
</html>
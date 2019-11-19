<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 19. 오후 2:27:06</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- MethodServlet 서블릿 선언 -->
<%
	String contextPath = request.getContextPath();
%>

<!-- GET 방식 요청 -->
<a href="<%=contextPath %>/method">get_method</a>
<br>

<!-- POST방식 요청 -->
<form action="<%=contextPath %>/method" method="post">
	<input type="submit">
</form>

<!--
HTTP는  
GET, POST, HEAD, PUT, DELETE 방식 지원
-->

<script>
$(function(){});
</script>
</body>
</html>
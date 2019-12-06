<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 6. 오후 12:10:38</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- ex06.jsp -->
<%
	// 쿠키 어떤 값 저장
	Cookie cookie = Cookies.createCookie("user", "admin");
	response.addCookie(cookie);
	
	cookie = Cookies.createCookie("id", "hong");
	response.addCookie(cookie);
	
	cookie = Cookies.createCookie("name", "kim");
	response.addCookie(cookie);

%>

<a href="ex06_ok.jsp">ex06_ok.jsp</a>



<script>
$(function(){});
</script>
</body>
</html>
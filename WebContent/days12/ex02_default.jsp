<%@page import="days12.Member"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 4. 오전 9:26:04</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<%
	String id = (String)session.getAttribute("auth");
	Member member = (Member)session.getAttribute("member");
%>

[<%=id %>]님 로그인했습니다. <br />
<a href="ex02_logout.jsp">로그아웃</a>

<script>
$(function(){});
</script>
</body>
</html>
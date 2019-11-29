<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="/error/viewErrorMessage.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오후 2:39:17</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>ex13.jsp</h3>
현제 페이지에서 에러가 발생하면 지정된 예외 처리 페이지로 이동
<%
	// 일부로 예외 발생 시킴
	String name =request.getParameter("name").toUpperCase();
%>
name : <%=name %>

<script>
$(function(){});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 2. 오전 10:31:10</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>


<%
	/* String name = request.getParameter("name");
	response.sendRedirect("ex03_03.jsp"); */
	/* 
	String path = "ex03_03.jsp";
	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	dispatcher.forward(request, response);
	*/
%>

<!-- jsp에서 포워딩 하는 방법 -->
<jsp:forward page="ex03_03.jsp">
	<jsp:param value="25" name="age"/>
	
</jsp:forward>

<script>
$(function(){});
</script>
</body>
</html>
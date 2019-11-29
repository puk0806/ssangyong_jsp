<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오후 2:32:58</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
	p140에러 처리
-->
<%
	try{
		String name =request.getParameter("name").toUpperCase();
%>		
<%		
	}catch(Exception e){
%>		예외 처리 할거야! <br />
		예외 페이지로 이동 할거야!!! <br />
<%	}
	
	
%>
<%-- name = <%=name %> <br /> --%>


<script>
$(function(){});
</script>
</body>
</html>
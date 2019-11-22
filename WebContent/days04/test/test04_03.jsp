<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 22. 오후 12:26:18</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");		// 받을때 디코딩 하는 방법 설정
response.setContentType("text/html; charset=UTF-8");	// 보낼때 인코딩 하는 방법 설정
%>
<h3>test04_03.jsp</h3>
	이름 : ${param.name } <br />
	주소 : ${param.address } <br />


<script>
$(function(){});
</script>
</body>
</html>
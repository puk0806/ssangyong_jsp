<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 4. 오전 9:17:45</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>ex02.jsp</h3>
<form action="<%= request.getContextPath() %>/days12/ex02_logon.jsp">
	아이디 : <input type="text" name="id" /> <br />
	비밀번호 : <input type="text" name="pass" /> <br />
	<input type="submit" />
</form>
	

<script>
$(function(){});
</script>
</body>
</html>
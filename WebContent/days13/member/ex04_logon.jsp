<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 5. 오후 3:21:24</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>ex04_logon.jsp</h3>
<form action="/jspPro/days13/member/ex04_logon_ok.jsp">
	아이디 : <input type="text" name="id" value="admin"/>
	비밀번호 : <input type="text" name="pass" value="1234"/>
	<input type="submit" value="로그인"></inptu>
</form>


<script>
$(function(){});
</script>
</body>
</html>
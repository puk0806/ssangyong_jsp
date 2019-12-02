<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 2. 오전 11:20:47</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>ex06.jsp</h3>
반드시 name 속성은 MemberInfo클래스의 필드명으로 지정
<form action="ex06_ok.jsp">
	아이디 : <input type="text" name="id" value="admin"/> <br />
	이름 : <input type="text" name="name" value="관리자"/> <br />
	비밀번호 : <input type="text" name="password" value="1234"/> <br /> 
	이메일 : <input type="text" name="email" value="admin@daum.net"/> <br />
	<!-- 등록일 : <input type="text" name="registerDate" value=""/> <br /> -->
	<input type="submit" />
	<input type="reset" />
</form>

<script>
$(function(){});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 12. 오전 11:36:22</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<form action="login.do" method="post">
	<c:if test="${errors.idOrPwNotMatch }">
		아이디와 암호가 일치하지 않습니다.
	</c:if>

	<p>
		아이디 : <br /> <input type="text" name="memberid" value="${param.memberid }" />
		<c:if test="${errors.memberid }">ID를 입력하세요</c:if>
	</p>
	<p>
		암호 : <br /> <input type="password" name="password"/>
		<c:if test="${errors.password }">ID를 입력하세요</c:if>
	</p>
	<input type="submit" value="로그인" />
</form>


<script>
$(function(){});
</script>
</body>
</html>
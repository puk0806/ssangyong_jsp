<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 2. 오후 3:02:20</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<form action="ex08_create_cookie_ok.jsp">
	생성할 쿠키 이름 :	<input name="c_name" type="text" value="name" required="required"/> <br />
	생성할 쿠키 값 : 	<input name="c_value" type="text" value="한지민" required="required"/> <br />
	도메인 : 		<input name="c_domain" type="text" /> <br />
	경로 : 		<input name="c_path" type="text" value="/" /> <br />
	유효 기간 : 	<input name="c_maxage" type="text" value="-1" /> <br />
	<input type="submit" />
</form>

<script>
$(function(){});
</script>
</body>
</html>
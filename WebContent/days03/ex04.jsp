<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 21. 오후 2:34:47</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<h3>ex04.jsp</h3>
<!-- 서블릿 ForWard 생성 -->
<form action="/jspPro/forward">
	메시지 : <input type="text" name="msg"  value="한글로 ...."/>
	<input type="submit" />
</form>

<hr />

<form action="/jspPro/forward" method="post">
	메시지 : <input type="text" name="msg"  value="한글로 ...."/>
	<input type="submit" />
</form>

<script>
$(function(){});
</script>
</body>
</html>
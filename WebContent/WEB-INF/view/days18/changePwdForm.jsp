<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 12. 오후 2:20:47</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<form action="changePwd.do" method="post">
<p>
	현재 암호:<br/><input type="password" name="curPwd">
	<c:if test="${errors.curPwd}">현재 암호를 입력하세요.</c:if>
	<c:if test="${errors.badCurPwd}">현재 암호가 일치하지 않습니다.</c:if>
</p>
<p>
	새 암호:<br/><input type="password" name="newPwd">
	<c:if test="${errors.newPwd}">새 암호를 입력하세요.</c:if>
</p>
<input type="submit" value="암호 변경">
</form>


<script>
$(function(){});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 10.-오후 3:09:35)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>
<div style="margin: 0 auto;width:800px">
	<form method="post">
	<c:if test="${errors.idOrPwNotMatch}">
	아이디와 암호가 일치하지 않습니다.
	</c:if>
	<p>
		아이디:<br/><input type="text" name="memberid" value="${param.memberid}">
		<c:if test="${errors.memberid}">ID를 입력하세요.</c:if>
	</p>
	<p>
		암호:<br/><input type="password" name="password">
		<c:if test="${errors.password}">암호를 입력하세요.</c:if>
	</p>
	<input type="submit" value="로그인">
	</form>
</div>
</body>
</html>












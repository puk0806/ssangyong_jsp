<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 26. 오전 9:00:59</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
	파일 업로드 : jQuery + Ajax 처리 + drag drop 
	(반드시 기억 전송시 설정) 
	1. method = post
	2. enctype="multipart/form-data"
	
-->
<form action="ex01_01.jsp" method="post" enctype="multipart/form-data">
	<h3>ex01_01.jsp</h3>
	이름 : <input type="text" name="name" value="홍길동"/> <br />
	파일 : <input type="file" name="upload" /> <br />
	<input type="submit" />
</form>
<hr />
<form action="ex01_02.jsp" method="post" enctype="multipart/form-data">
	<h3>ex01_02.jsp</h3>
	이름 : <input type="text" name="name" value="홍길동"/> <br />
	파일 : <input type="file" name="upload" /> <br />
	<input type="submit" />
</form>
<hr />
<form action="ex01_03.jsp" method="post" enctype="multipart/form-data">
	<h3>ex01_03.jsp</h3>
	이름 : <input type="text" name="name" value="홍길동"/> <br />
	파일 : <input type="file" name="upload" /> <br />
	<input type="submit" />
</form>


<script>
$(function(){});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 13.-오후 4:29:01)</title>
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
	<p>
		제목:<br/><input type="text" name="title" value="${param.title}">
		<c:if test="${errors.title}">제목을 입력하세요.</c:if>
	</p>
	<p>
		내용:<br/>
		<textarea name="content" rows="5" cols="30">${param.title}</textarea>
	</p>
	<input type="submit" value="새 글 등록">
	</form>
</div>
</body>
</html>












<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오후 2:12:31</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
requestScope : name : ${name } <br />
requestScope : age : ${age } <br />
applicationScope : tel : ${tel } <br />
<hr>

requestScope : name : ${requestScope.name } <br />
sessionScope : age : ${sessionScope.age } <br />
applicationScope : tel : ${applicationScope.tel } <br />


<!-- 
	p254 EL 기본 객체

 -->

<script>
$(function(){});
</script>
</body>
</html>
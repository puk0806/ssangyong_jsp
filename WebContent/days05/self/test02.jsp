<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 25. 오후 7:16:36</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>test02.jsp EL -JSTL</h3>

<c:if test="${empty elist}">
	<h3>사원이 존재 하지 않습니다.</h3>
</c:if>

<c:if test="${!empty elist }">
	<c:forEach items="${elist }" var="dto">
		<h2>${dto.ename }(${dto.empno })</h2>
		${dto.deptno } 중간 생략...<br />
		 
	</c:forEach>

</c:if>

<script>
$(function(){});
</script>
</body>
</html>
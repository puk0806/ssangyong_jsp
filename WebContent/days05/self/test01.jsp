<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 25. 오후 7:02:58</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>test01.jsp EL-JSTL</h3>

<select name="deptno" id="deptno">
	<option>선택하시오</option>
	<c:forEach items="${dlist }" var="dto">
		<option value="${dto.deptno }">${dto.deptno }</option>
	
	</c:forEach>

</select>
<script>
$(function(){
	$("#deptno").change(function(){
		// selfEmpServlet 보내기
		location.href = "/jspPro/self/employee.do?deptno="+$(this).val();
	});
});
</script>
</body>
</html>
<%@page import="java.util.Iterator"%>
<%@page import="days03.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 25. 오전 9:03:43</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>test01.jsp - JSTL/EL</h3>
<select name="deptno" id="deptno" >
	<option value="">선택하세요</option>
	
	<c:forEach items="${dlist }" var="dto">
		<option value="${dto.deptno }">${dto.dname }</option>
	</c:forEach>
	
</select>


<script>
$(function(){
	$("#deptno").change(function(){
		location.href = "/jspPro/test/employee.do?deptno="+$(this).val();	// EmpServlet호출
	});
});
</script>
</body>
</html>
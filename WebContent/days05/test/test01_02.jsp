<%@page import="java.util.Iterator"%>
<%@page import="days03.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	ArrayList<DeptDTO> dlist = (ArrayList<DeptDTO>)request.getAttribute("dlist");
%>
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
<h3>test01.jsp</h3>
<select name="deptno" id="deptno">
	<option value="선택하세요"></option>
	<%
		Iterator<DeptDTO> ir = dlist.iterator();
		while(ir.hasNext()){
			DeptDTO dto = ir.next();
	%>			
			<option value="<%= dto.getDeptno()%>"><%= dto.getDname()%></option>	
	<%	}
	
	%>
</select>




<script>
$(function(){});
</script>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="days03.DeptDTO"%>
<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ArrayList<DeptDTO>list =  (ArrayList<DeptDTO>)request.getAttribute("list");	// object타입 반환 다운케스팅

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 21. 오후 4:41:20</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<ol>
	<%
		Iterator<DeptDTO> ir = list.iterator();
		while(ir.hasNext()){
			DeptDTO dto = ir.next();
	%>		
		<li><%=dto.getDname() %>(<%=dto.getDeptno() %>)</li>
	<%		
		}
	%>
</ol>


<script>
$(function(){});
</script>
</body>
</html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="days03.DeptDTO"%>
<%@page import="days03.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%
	Map<DeptDTO,ArrayList<EmpDTO>> map = (Map<DeptDTO,ArrayList<EmpDTO>>)request.getAttribute("map");
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 25. 오전 11:47:10</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<%
	Set<Entry<DeptDTO, ArrayList<EmpDTO>>> set = map.entrySet();
	Iterator<Entry<DeptDTO, ArrayList<EmpDTO>>> ir = set.iterator();
	
	while (ir.hasNext()) {
	   Map.Entry<DeptDTO, ArrayList<EmpDTO>> entry = ir.next();
	   DeptDTO deptDTO = entry.getKey();
%>	   
	   <h3><%=deptDTO.getDeptno() %>[<%=deptDTO.getDname() %>]-<%=deptDTO.getEmpCnt() %>명</h3>
	      
<%	   ArrayList<EmpDTO> empList = entry.getValue();
	   Iterator<EmpDTO> ir2= empList.iterator();
%>
	 <ol>   
<%	   while(ir2.hasNext()) {
	      EmpDTO empDTO = ir2.next();
	      int empno = empDTO.getEmpno();
	      String ename = empDTO.getEname();
%>	      
		<li><%=empno %> / <%=ename %></li>	         
<%	      
	   }
%>
</ol>
<%
	}
%>


<script>
$(function(){});
</script>
</body>
</html> 
<%@page import="days03.EmpDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="days03.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	ArrayList<DeptDTO> dlist = (ArrayList<DeptDTO>)request.getAttribute("dlist");
	ArrayList<EmpDTO> elist = (ArrayList<EmpDTO>)request.getAttribute("elist");
%>
<%

  String [] deptnos = request.getParameterValues("deptno");
%>
<%!
  public String setChecked(String [] deptnos, String deptno){
	for(int i=0; i<deptnos.length; i++)
		if( deptnos[i].equals(deptno)) return "checked";	
	return "";
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 22. 오후 2:09:52</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<form action="/jspPro/days04/deptemp">
<h3>test03_info.jsp</h3>

<%
	if(dlist.size()==0){
%>		부서가 존재하지 않습니다.
		
<%	}else{
		Iterator<DeptDTO> ir =  dlist.iterator();
%>				
		
<%		while(ir.hasNext()){
			DeptDTO dto = ir.next();
%>			
		<input type="checkbox" name="deptno" value="<%= dto.getDeptno()%>" <%=setChecked(deptnos, dto.getDeptno()+"") %> /><%=dto.getDname() %> <br />		
<%	} 
}
%>

<hr>

<%
	if(elist.size()==0){
%>		부서가 존재하지 않습니다.
		
<%	}else{
	
%>
<ol>	
<%		Iterator<EmpDTO> ir =  elist.iterator();
%>				
		
<%		while(ir.hasNext()){
			EmpDTO dto = ir.next();
%>			


	<li> <%=dto.getDeptno() %>/ <a href="<%=dto.getEmpno() %>"><%=dto.getEname() %> ( <%=dto.getJob() %> )</a> / <%=dto.getHiredate() %> / <%=dto.getSal() %></a></li>
<%	}	
%>
</ol>
<%
}
%>

<hr>
<button>해당 부서원 확인</button>
<script>
$(function(){});
</script>


</form>
</body>
</html>
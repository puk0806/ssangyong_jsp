<%@page import="java.util.Iterator"%>
<%@page import="days03.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<EmpDTO> elist =  (ArrayList<EmpDTO>)request.getAttribute("elist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 25. 오전 10:23:32</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}
</style>
</head>
<body>
<h3>test02.jsp</h3>

<%
	System.out.print(elist.size());
	if(elist == null){
%>		사원이 존재하지 않습니다.		
<%	}else{
		Iterator<EmpDTO> ir = elist.iterator();
		while(ir.hasNext()){	
			EmpDTO dto = ir.next();
%>		
			<div class="row"> 
			  <div class="column">
			    <div class="card">
			      <img src="/jspPro/images/img_avatar2.png" alt="<%= dto.getEname() %>" style="width:100%">
			      <div class="container">
			        <h2><%= dto.getEname() %>(<%= dto.getEmpno() %>)</h2>
			        <p class="title"><%= dto.getDeptno() %>-<%= dto.getJob() %></p>
			        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
			        <p><%= dto.getHiredate() %></p>
			        <p><button class="button">Contact</button></p>
			      </div>
			    </div>
			  </div> 
			</div>
<%		}	
	}
%>


<script>
$(function(){});
</script>
</body>
</html>
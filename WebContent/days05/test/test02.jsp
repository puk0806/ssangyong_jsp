<%@page import="java.util.Iterator"%>
<%@page import="days03.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<h3>test02.jsp - JSTL EL</h3>

<!-- if else구문이 없어서 if문 두개 사용 -->
<c:if test="${empty elist }">
	사원이 존재하지 않습니다.
</c:if>
<c:if test="${!empty elist }">
	<c:forEach items="${elist }" var="dto">
		<div class="row"> 
		  <div class="column">
		    <div class="card">
		      <img src="/jspPro/images/img_avatar2.png" alt="${dto.ename }" style="width:100%">
		      <div class="container">
		        <h2>${dto.ename }(${dto.empno } )</h2>
		        <p class="title">${dto.deptno }-${dto.job }</p>
		        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
		        <p>${dto.hiredate }</p>
		        <p><button class="button">Contact</button></p>
		      </div>
		    </div>
		  </div> 
		</div>
	</c:forEach>	
</c:if>



<script>
$(function(){});
</script>
</body>
</html>
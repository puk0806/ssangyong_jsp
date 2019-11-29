<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오후 2:03:33</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 
	p132 JSP 기본 객체와 영역 (Scope)
	1. page Scope(영역) - pageContext 기본객체
	2. request Scope - request 기본 객체
	3. session Scope - session 기본 객체
	4. application Scope - application 기본 객체
-->

<%
	String name = "admin";
	// request name 변수는 
	request.setAttribute("name",name);		// setAttribute해야지 EL 사용 가능
	
	String path = "ex10_02.jsp";
	response.sendRedirect(path);	
	/* 
	RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	dispatcher.forward(request, response);
 	*/

 	// sessionScope - 윈도우 창이 닫힐떄까지
 	int age = 20;
 	session.setAttribute("age", age);		
 	
 	// pageScope - 현재 페이지 에서만 살아있는 기억공간 
 	String addr = "서울 강남구";
 	pageContext.setAttribute("addr", addr);
 	
 	// applicationScope - 어플리 케이션 안에서
 	 application.setAttribute("tel", "010-1234-2345");
 	
%>

표현식 name : <%=name %> <br />
EL name : ${name } <br />

표현식 addr : ${addr } <br />




<script>
$(function(){});
</script>
</body>
</html>
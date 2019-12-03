<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String empno = (String)session.getAttribute("empno");

	if(empno== null){		// 로그인 안됬으면(ex03 로그인 페이지라고 가정)
		String location = "ex03.jsp";
		response.sendRedirect(location);
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 3. 오후 3:37:38</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
	세션 empno : <%=empno %> <br />
	세션 ename : ${ sessionScope.ename } <br />
	<!-- 앞에 아무것도 쓰지 않으면 page-> request -> session -> application Scope 순으로 찾는다.-->
	세션 ename : ${ ename } <br />
	<a href="ex03_logout.jsp">접속 종료 !! == 세션 종료</a>
<script>
$(function(){});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오후 2:41:05</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- name, age, email -->
<%-- 
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String email = request.getParameter("email");
	
%>
이름 : <%=name %> <br />
나이 : <%=age %> <br />
이메일 : <%=email %> <br />
 --%>

<!-- EL (표현 언어) -->
이름 :  ${param.name }<br />
나이 : ${param.age } <br />
이메일 ${param.email }<br />




<script>
$(function(){});
</script>
</body>
</html>
<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 6. 오후 12:10:50</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<%
	String user,id,name;
	Cookies cookies = new Cookies(request);
	user = cookies.getValue("user");
	id = cookies.getValue("id");
	name = cookies.getValue("name");
%>

user : <%=user %> <br />
id : <%=id %> <br />
name : <%=name %> <br />


user : ${cookie.user.value } <br />
id : ${cookie.id.value } <br />
name : ${cookie.name.value } <br />

<h3>쿠키 목록 출력</h3>
<c:forEach items="${cookie }" var="c">
	<li>${c.key } - ${c.value }</li>
</c:forEach>




<script>
$(function(){});
</script>
</body>
</html>
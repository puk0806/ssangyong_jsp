<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오후 2:28:23</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
	<%
		// p135 표 5.8
		request.setAttribute("name", "한지민");
		String name = (String)request.getAttribute("name");
		// request.removeAttribute("name");
		request.setAttribute("age", 20);
	
	%>
	name : <%=name %>
	<hr />
	<%
		Enumeration<String> en = request.getAttributeNames();
		while(en.hasMoreElements()){
			String n = en.nextElement();
	%>		<li><%=n %></li>
	<%
		}
	%>

<script>
$(function(){});
</script>
</body>
</html>
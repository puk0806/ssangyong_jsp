<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 6. 오전 10:24:25</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<%
	// include 지시자
	// 인코딩 필터 : 모든 페이지 요청 p568 com.filter.characterEncodingFilter

	//request.setCharacterEncoding("utf-8");	

	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<a href="ex04.jsp">ex04.jsp</a>
이름 : <%=name %>
나이 : <%=age %>

<script>
$(function(){});
</script>
</body>
</html>
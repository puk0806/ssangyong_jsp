<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 6. 오후 12:07:15</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<%
	String uri = request.getRequestURI();
%>
	uri : <%=uri %> <br />
	<!-- EL 기본객체에는 request 없어서 pageContext.request를 통해서 얻어옴 -->
	EL-uri : ${pageContext.request.requestURI } <br />

<script>
$(function(){});
</script>
</body>
</html>
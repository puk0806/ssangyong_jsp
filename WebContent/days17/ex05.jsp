<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 11. 오전 10:19:28</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<c:set var="dateEL" value="<%=new Date().toLocaleString() %>"></c:set>
<h3>${dateEL }</h3>
<hr />

<tf:out>
	<jsp:body>
		<u>현재 시간</u>은 <b>${dateEL }</b>
	</jsp:body>
</tf:out>


<script>
$(function(){});
</script>
</body>
</html>
<%@  page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="days15.JumsuChange" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 9. 오전 11:13:19</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
	<c:set var="m" value="<%=new int[]{1,5,3,2,4,} %>"></c:set>
	<c:forEach items="${m }" var="n" varStatus="status">
		m[${status.index }]= ${n} <br />
	</c:forEach>
	배열 크기 : ${JumsuChange.getLength(m) } <br />
	배열 크기 : ${fn:length(m) } <br />
	
	
	<a href="ex10.jsp?path=days15/ex01.jsp">ex10?path=days15/ex01.jsp</a>
<script>
$(function(){});
</script>
</body>
</html>
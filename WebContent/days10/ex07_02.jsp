<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 2. 오후 12:16:18</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>쿠키 목록</h3>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length >0){
		for(int i=0 ; i< cookies.length;i++){
		%>
			<%=cookies[i].getName() %> = <%= URLDecoder.decode( cookies[i].getValue(),"UTF-8") %> <br />
		<%}
	}else{
		%>
			쿠키 존재 X
	<%}
%>

<a href="ex07.jsp">ex07.jsp</a>

<hr>

<h3>EL + JSTL 쿠키 목록 출력</h3>
<c:forEach items="${cookie }" var="entry">
	${entry.key }= ${entry.value.getValue() } <br>

</c:forEach>


<script>
$(function(){});
</script>
</body>
</html>
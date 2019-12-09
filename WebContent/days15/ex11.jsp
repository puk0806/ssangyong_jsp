<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 9. 오전 11:46:47</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<%
	// 예외 처리
	try{
		
		
	}catch(Exception e){
		
	}
%>
<c:catch var="e">
	name 파라미터의 값 =<%=request.getParameter("name") %>
	<% if(request.getParameter("name").equals("test")){ %>
		${param.name }은 test입니다.
	<%} %>
</c:catch>
<p></p>
<c:if test="${e != null }">
	예외 발생 br
	${e }
</c:if>




<hr />
<script>
$(function(){});
</script>
</body>
</html>
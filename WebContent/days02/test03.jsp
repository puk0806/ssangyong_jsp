<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오전 9:33:14</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
 context root or context path 를 얻어와서 출력하는 JSP 코딩
<%
	String contextPath = request.getContextPath();	
	out.print(contextPath);
%>


<script>
$(function(){});
</script>
</body>
</html>
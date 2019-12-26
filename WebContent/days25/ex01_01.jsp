<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 26. 오전 9:01:28</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<%
	// 파일 업로드 : request.getParameter() 전송되어져 오는 파라미터를 얻어올수 없다.
	String name = request.getParameter("name");
	String upload = request.getParameter("upload");
%>
	
	전송된 이름 : <%= name %> <br />
	전송된 파일 : <%= upload %> <br />
	<hr />
	
	${param.name } <br />
	${param.upload } <br />
	



<script>
$(function(){});
</script>
</body>
</html>
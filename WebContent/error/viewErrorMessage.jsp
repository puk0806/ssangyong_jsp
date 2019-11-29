<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오후 2:42:13</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
	요청 처리 과정에서 에러가 발생하였습니다. <br />
	빠른 시간 내에 문제를 해결하도록 하겠습니다. 
	<p>
		에러 타입 : <%=exception.getClass().getName() %> <br />
		에러 메시지 : <b><%= exception.getMessage() %></b> 
	</p>

<script>
$(function(){});
</script>
</body>
</html>
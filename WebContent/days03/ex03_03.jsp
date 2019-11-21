<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 21. 오후 2:04:38</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>ex03_03.jsp</h3>

<%
	String msg = request.getParameter("msg");
	if(msg != null){
%>		msg = <%=msg %>		
<%	}else{
%>		msg송신 안됨		
<%	}
%>

<script>
$(function(){});
</script>
</body>
</html>
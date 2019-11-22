<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 21. 오후 2:40:42</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<h3>ex04_ok.jsp</h3>
<%
	request.setCharacterEncoding("utf-8");		// 받을때 디코딩 하는 방법 설정
	response.setContentType("text/html; charset=UTF-8");	// 보낼때 인코딩 하는 방법 설정
	String msg = request.getParameter("msg");
	// server.xml에		URIEncoding= "UTF-8" 써주면 ->	post방식 디코딩 방식 설정
%>
전달된 메시지 : <%=msg %> <br />
전달된 메시지 (EL) : ${param.msg} <br />



<script>
$(function(){});
</script>
</body>
</html>
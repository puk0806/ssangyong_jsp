<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 21. 오후 2:04:20</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<%
	/* 
	// 리타이렉트
	String location = "ex03_03.jsp";
	location +="?msg="+URLEncoder.encode(request.getParameter("msg"));
	response.sendRedirect(location);
 	*/
 	
 	// 포워딩(forwarding)
 	
 	String path = "ex03_03.jsp";
 	// request 요청 + Dispatcher 발송하다/ 보내다 배치 담당자
 	RequestDispatcher dispatcher= request.getRequestDispatcher(path);
 	dispatcher.forward(request, response);
 	
%>


<script>
$(function(){});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 4. 오전 9:05:26</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>days12.ex01.jsp</h3>
<!--
	[p 241 세션(session)]
	request.getSession() 세션 객체를 얻어올수 있다.  
-->
<%
	// JSP 페이지
	// session - 기본객체
	// 1번 == 2번 : 세션을 얻어오는 데 세션 존재하면 세션객체를 반환 존재하지 않으면 새로운 세션 객체를 생성해서 반환
	// 3번 : 세션을 얻어오는데 세션 존재하면 세션 객체를 반환 존재하지 않으면 NULL반환
	// 1. request.getSession();			 
	// 2. request.getSession(true);		 
	// 3. request.getSession(false);		 
	
	HttpSession httpSession =  request.getSession();
	if(httpSession == null){	// 이런경우는 존재하지 않는다.
		
	}
	
	httpSession =  request.getSession(false);
	
%>


<script>
$(function(){});
</script>
</body>
</html>
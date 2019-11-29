<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오전 10:12:17</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 
	p119 pageContext기본 객체
	1) 기본 객체 얻어옴
	2) 속성 처리
	3) 페이지 흐름 제어
	4) 에러 데이터 구하기
	
	pageContext 객체를 직접 사용하는 경우는 없다.
 -->
 
<%
	//pageContext.getRequest() == request 			// JSP 에서는request 그냥 호출해도됨,EL에서 사용
	request.getParameter("age");
	// pageContext.getRequest().getParameter("age");
	HttpServletRequest htRequest= (HttpServletRequest)pageContext.getRequest();
%>

<script>
$(function(){});
</script>
</body>
</html>
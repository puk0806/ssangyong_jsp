<!-- page 디렉티브 -->
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 19. 오전 10:34:51</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
 

<%--  
JSP 페이지의 구성요소
1. 디렉티브 (지시자 @)
	<%@ page %> : page 디렉티브 지시자 3가지, 현재 jsp 페이지에 대한 정보를 알려주는/ 설정 역할
2. 기본 객체 (9가지)
	- out
3. 표현 언어
	- ex01_02확인		?age=100  
4. 스크립트 요소
	- <%= %>	(표현식)
	- <% %>		(스크립트릿)
5. 표준 액션 태그 와 태그 라이브러리(JSTL)
	- <jsp:include page=""></jsp:include> 
 --%>
 

<%-- 스크립트 요소 : 3가지 종류 (표현식=),출력 표현 --%> 
 지금 : <%= new Date() %>
 <br>
<!-- 스크립트 요소 : 3가지 종류(스크립트릿) : 자바코딩 -->
 Now : <% out.print(new Date()); %>

<a href="ex01_02.jsp?age=100">ex01_02.jsp?age=100</a>

<script>
$(function(){});
</script>
</body>
</html>
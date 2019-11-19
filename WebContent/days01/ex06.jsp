<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib 태그 라이브러리에 대한 환경 설정 지정 %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 19. 오후 4:06:30</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<%--  
	p52 JSP 페이지 구성요소
	1. 디렉티브(directive)
		- JSP 페이지에 대한 설정 정보를 지정할 때 사용하는 지시자.
		- 형식
			<%~~~ %>
		- 디렉토리의 종류
			1) <%@  page   	page 지시자
			2) <%@	taglib	taglib 지시자
			3) <%@	include	include 지시자
				ex)<%@ include file="" %> 파일 포함
	
--%>

<%-- 
	p53 스크립트 요소
	1. JSP 페이지에서 문서 내용을 동적으로 생성하기 위해서 사용된 것
	2. 스크립트 요소의 종류
		- 표현식 ( Expression )		: 값을 출력 할 때 사용		<%= 값을 출력 %>
		- 스크립트릿 ( Scriptlet )		: 자바 코딩 할때 사용			<% 자바코딩 %>
		- 선언부 ( Declaration )		: 변수나 메소드를 선언 부분	<%! 변수,메서드 %>
--%>


<%
	// 스크립트릿 (Scriptlet)
	int sum = 0 ; 
	for (int i =1 ; i <= 10 ; i ++){
		//out.print(i+"+");
		sum += i ; 
	}
	//out.print("="+sum);
	
%>
<!-- 
JSP 기본 내장 객체 : out 객체
out.print(); -> 표현식 수정
-->
<%
	sum = 0 ; 
	for (int i =1 ; i <= 10 ; i ++){
%>
		<%=i +" +" %>
<%
		sum += i ; 
	}
%>
	<%="="+sum %>



<script>
$(function(){});
</script>
</body>
</html>
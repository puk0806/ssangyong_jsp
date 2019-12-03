<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 3. 오후 3:08:10</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>ex03.jsp</h3>
<!--
	p232 클라이언트와의 대화 1 : 쿠키(cookie) == 상태관리 
	p232 클라이언트와의 대화 2 : 세션(session) == 상태관리
		1. session 기본 객체와 세션
		2. session 속성
		3. session을 사용해서 로그인 처리 !!!!!!!
		
		ㄱ. 상태관리하는 방법 : 쿠키, 세션
			- 쿠키 (클라이언트)
			- 세션 (서버==톰캣)
		ㄴ. 세션은 [웹 컨테이너]에 정보를 보관할 때 사용한다.
		ㄷ. 그림 10.1
		ㄹ. 웹 컨테이너는 기본적으로 한 웹 브라우저마다 한 세션을 생성한다.\
		ㅁ. 세션 생성하기 - session = true
-->
		
세션 ID :  <%=session.getId() %> <br />			<!-- 쿠키 저장 : JSESSIONID -->

<%
	Date time = new Date();
	String pattern = "yyyy.MM.dd HH:mm:ss";
	SimpleDateFormat sdf = new SimpleDateFormat(pattern);
	
	time.setTime(session.getCreationTime());
%>
	세션이 생성 시간 : <%= sdf.format(time) %>  <br />
	세션이 생성 시간 : <%= session.getCreationTime() %> <br />
	
<%
	time.setTime(session.getLastAccessedTime());
%>
	최근 접근 시간 : <%= sdf.format(time) %>  <br />

<hr />
<%
	// 첫 요청 접속 : 세션 생성
	session.setAttribute("empno", "7566");	// 세션에 값 저장
	session.setAttribute("ename", "SMITH");	// 세션에 값 저장
%>
	<a href="ex03_02.jsp">ex03_02.jsp</a>

<%
	// 세션 유효 기간 설정하는 두 번째 방법 p240
	// 단위(초)
	session.setMaxInactiveInterval(60*50);	// 50분
	
	// (기억)
	/* <session-timeout>의 값을 0이나 음수로 설정하면 session.invalidate() 메서드를 호출하기 전까지 세션 객체가 서버에서 유지된다. */
	
%>

<script>
$(function(){});
</script>
</body>
</html>
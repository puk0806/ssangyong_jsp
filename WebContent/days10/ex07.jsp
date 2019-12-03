<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 2. 오전 11:42:38</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
	p205 클라이언트와의 대화 1	쿠키
		상태 관리하는 방법(쿠키)
	1. JS 쿠키는 클라리언트(PC)에 텍스트 파일
		document.cooke 속성 : 설정, 얻어오기
		cookie.js 스크립트 파일 : setCookie(), getCookie()
	2. [웹 서버]
		- 웹 서버는 쿠키를 이용해서 웹브라우저에 정보를 전송할 수 있다.
			웹서버	(정보)-> 웹브라우저
			[쿠키생성]			쿠키 텍스트파일
					<-(요청)+쿠키값 
		- 웹서버로부터 쿠키를 전달받은 웹브라우저는 웹서버에 요청을 보낼 때 쿠키도
		- 쿠키( cookie )는 웹 브라우저가 보관하는 데이터이다.
		- 쿠키는 웹 서버(jsp)와 웹브라우저(js) 양쪽에서 사용할 수 있다.
	3. 쿠키 동작 방식
		- 쿠키 생성
			ㄱ. 구성 요소 
				-쿠키 이름
				- 쿠키값
				- 만료시점(유효시간) : 별도로 지정하지 않으면 웹브라우저를 저장할때
				- 도메인(쿠키를 전송할 도메인)
				- 경로( 쿠키를 전송할 요청 경로)
			ㄴ. 쿠키 저장
			ㄷ. 
		- 쿠키 저장
		- 쿠키 전송
 -->
 
 <%
 	// 1. 쿠키 생성
 	String name= "name";
 	// 쿠키값이 한글일 경우 (주의)
 	String value = URLEncoder.encode("홍길동", "UTF-8");
 	// Cookie 클래스 사용해서 생성
 	Cookie cookie = new Cookie(name, value);
 	// 브라우저 닫으면 쿠키 제거
 	cookie.setMaxAge(-1);
 	cookie.setPath("/");		// jspPro/days10 폴더 안에 있는  jsp
 	
 	// 2. 생성된 쿠키를 응답객체에 담아서 웹브라우저에게 전송
 	response.addCookie(cookie);
 	
 %>
 
 쿠키 이름 : <%=cookie.getName() %> <br />
 쿠키 값 : <%=cookie.getValue() %> <br />
 
<a href="ex07_02.jsp">ex07_02.jsp</a>

<script>
$(function(){});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 2. 오후 2:06:30</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
1. 쿠키 생성 : 	Cookie 클래스
			Cookie cookie = new ();
			cookie.setMaxAge(음수) 브라우저 닫히면 자동 쿠키 삭제
2. 쿠키 응답 : response.addCookie()+한글인코딩(기억)
3. 요청+쿠키 : Cookie[] request.getCoolie()+한글디코딩(기억)
4. p210 쿠키값 수정 및 삭제
	- 쿠키값 수정 : 같은 쿠키이름으로 새로 저장
	- 쿠키 삭제 : 만료시점(유효기간) setMaxAge(0)
		(js로 쿠키 삭제할 때는 동일한 쿠키이름으로 저장 만료시점 과거로 설정)
5. 쿠키의 도메인
	- 기본적으로 쿠키는 그 쿠키를 생성한 서버에만 전송된다.
 -->	

<!-- p222 Cookies.java파일 코딩 -->
<a href="ex08_cookie_list.jsp">쿠키리스트 보기</a>				

<script>
$(function(){});
</script>
</body>
</html>
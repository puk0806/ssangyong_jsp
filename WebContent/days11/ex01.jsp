<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 3. 오전 9:01:03</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
	1. 쿠키를 사용하는 로그인 상태관리 p226
	ex01_default.jsp
		ㄱ. 메인페이지
		ㄴ. 로그인 : 인증처리
			id/pwd
			ex01_logon.jsp 이동 -> 입력받은 ID/PWD 맞으면 쿠키(쿠키명:auth)생성 저장 -> ex01_default.jsp 페이지 이동
		      로그아웃 : 
		    ex01_logout.jsp 이동 -> 쿠키 삭제(쿠키명 : auth) -> ex01.default.jsp 이동
		ㄷ. ex01_board.jsp 게시판
		       권한 정하기
			- 게시판 목록 : 로그인 (인증) X
			- 게시글 보기 : 로그인 (인증) X
			- 게시글 쓰기 : 일반사용자로 로그인 인증 O
			- 수정, 삭제 : 관리자, 글쓴이 
		ㄹ. 모든 로그인 여부를 확인하는 반복되는 코딩을
			ex01_cookieAuth.jsp
			
		   
	2. 클라이언트 PC 저장되는 데이터 (텍스트 파일)
		ㄱ. 서버
			1) Cookie 클래스 객체 생성 = 쿠키 이름, 쿠키 값, 
				도메인 - localhost 
				경로 - / 를 줘야지 그 도메인에서 모두 사용가능 
				만료 시점 	- setMaxAge(-1) 브라우저 종료시제거
						- setMaxAge(0) 쿠키 제거
			2) response.addCookie() 응답 객체 쿠키 저장
				- 도메인, 경로에 설정된 기본값 요청에 쿠키값을 자동 -> 서버 전달
			3) request.getCookie()  
		ㄴ. 클라이언트 (JS)
	3. 	Cookie.js = getCookie() setCookies() ~
		Cookies.java
		  생성자 map<쿠키이름,쿠키객체>
		  createCookies()
		  createCookies()
		  createCookies()
		  exist()
		  getCookie
	4. 쿠키 생성 Cookie		- response.addCookie()
	      쿠키 삭제 Cookie		- createCookie("","","/",0)
	      				- response.addCookie()
	      쿠키 수정 				- createCookie("","쿠키값");
	5. 기억(암기)	한글이 쿠키의 값으로 사용될 경우 인코딩(URLEncoder.encode()), 디코딩(URL....)	 
-->




<script>
$(function(){});
</script>
</body>
</html>
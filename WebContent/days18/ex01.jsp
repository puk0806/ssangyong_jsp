<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 12. 오전 9:01:13</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
	chapter 21회원제 게시판 구현
	- 회원 가입
	- 회원 정보 수정
	- 로그인
	- 로그아웃
	
	1. 캐릭터 인코딩 필터
	2. 회원 가입 기능 구현
	3. 로그인/로그아웃 처리
	4. 필터를 이용한 로그인 검사 기능
	5. 암호 변경 기능
	
	- 이렇게 코딩하면 따로 conn을 안닫아줘도 되서 프로젝트시 이렇게 코딩!!
	try(Connection conn = ConnectionProvider.getConnection()){
	}catch(){
	}
	
	테이블  모델 만들고 시작하기
	create table member(
	    memberid VARCHAR2(50) primary key,
	    name varchar2(50) not null,
	    password VARCHAR2(10) not null,
	    regdate date not null
	);
	
	commit;
	 
-->

<a href="/jspPro/join.do">회원가입</a> <br />
<a href="/jspPro/login.do">로그인</a> <br />
<a href="/jspPro/index.do">홈화면가기</a> <br />


<script>
$(function(){});
</script>
</body>
</html>
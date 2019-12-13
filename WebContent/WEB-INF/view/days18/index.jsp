<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/servlet class - k≡n¡k (2019. 5. 10.-오후 3:13:51)</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="">
<style>
</style>
<script>
   $(document).ready(function (){	  
   });
</script>
</head>
<body>
<h3>Index.jsp</h3>

<c:if test="${ ! empty authUser }">
  ${ authUser.name }님, 안녕하세요.<br>
  <a href="/jspPro/logout.do">[로그아웃하기]</a><br>
  <a href="/jspPro/changePwd.do">[암호변경하기]</a><br>
</c:if>
<c:if test="${ empty authUser }">
 <a href="/jspPro/join.do">회원가입하기</a><br>
 <a href="/jspPro/login.do">로그인하기</a><br>
</c:if>

</body>
</html>







<!-- 
	create table member 
	(
	  memberid varchar2(50) primary key
	  ,  name varchar2(50) not null
	  ,  password varchar2(10) not null
	  ,  regdate date default sysdate
	);
 -->


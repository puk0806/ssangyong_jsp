<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 12. 오전 11:46:39</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<%-- 
<c:if test="${!empty authUser }">
	${authUser.name }님 안녕하세요
	<a href="logout.do">[로그아웃하기]</a>
	<a href="changePwd.do">[암호변경하기]</a>
</c:if>

<c:if test="${empty authUser }">
	<a href="/jspPro/join.do">회원가입하기</a>
	<a href="/jspPro/login.do">로그인하기</a>
</c:if>
 --%>
 
<u:isLogin>
	${authUser.name }님 안녕하세요
	<a href="logout.do">[로그아웃하기]</a>
	<a href="changePwd.do">[암호변경하기]</a>
</u:isLogin>
<u:notLogin>
	<a href="/jspPro/join.do">회원가입하기</a>
	<a href="/jspPro/login.do">로그인하기</a>
</u:notLogin>

<script>
$(function(){});
</script>
</body>
</html>
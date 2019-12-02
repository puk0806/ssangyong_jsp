<%@page import="java.util.Date"%>
<%@page import="days08.MemberInfo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 2. 오전 11:09:44</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 아래 객체 생성 코딩과 똑같은 코딩 -->
<!-- scope 영역 : [page], request, session, application -->
<jsp:useBean id="info" class="days08.MemberInfo" scope="page"></jsp:useBean>
<jsp:setProperty value="admin" property="id" name="info"/>
<jsp:setProperty value="관리자" property="name" name="info"/>
<jsp:setProperty value="1234" property="password" name="info"/>
<jsp:setProperty value="admin@daum.net" property="email" name="info"/>
<jsp:setProperty value="<%=new Date() %>" property="registerDate" name="info"/>

아이디 :<jsp:getProperty property="id" name="info"/> <br />
이름 :  <jsp:getProperty property="name" name="info"/> <br />
비밀번호 :  <jsp:getProperty property="password" name="info"/> <br />
이메일 :  <jsp:getProperty property="email" name="info"/> <br />
등록일 :  <jsp:getProperty property="registerDate" name="info"/> <br />


<%-- 
<%
	MemberInfo info = new MemberInfo();
	info.setId("admin");
	info.setName("관리자");
	info.setPassword("1234");
	info.setEmail("admin@daum.net");
	info.setRegisterDate(new Date());
%>
아이디 : <%= info.getId()%> <br />
이름 :  <%= info.getName()%> <br />
비밀번호 :  <%= info.getPassword()%> <br />
이메일 :  <%= info.getEmail()%> <br />
등록일 :  <%= info.getRegisterDate()%> <br />
--%>



<script>
$(function(){});
</script>
</body>
</html>
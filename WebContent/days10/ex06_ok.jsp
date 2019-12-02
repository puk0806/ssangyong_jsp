<%@page import="java.util.Date"%>
<%@page import="days08.MemberInfo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 2. 오전 11:20:53</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>ex06_ok.jsp</h3>


<!-- 아래 코딩과 똑같은 작업 -->
<jsp:useBean id="info" class="days08.MemberInfo" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="info"/>	<!-- 따로 안넣고 *를 사용해서 한번에 넣을수 있다. -->
<jsp:setProperty value="<%=new Date() %>" property="registerDate" name="info"/>

<%--
 아이디 :<jsp:getProperty property="id" name="info"/> <br />
이름 :  <jsp:getProperty property="name" name="info"/> <br />
비밀번호 :  <jsp:getProperty property="password" name="info"/> <br />
이메일 :  <jsp:getProperty property="email" name="info"/> <br />
등록일 :  <jsp:getProperty property="registerDate" name="info"/> <br />
 --%>
 
<jsp:forward page="ex06_last.jsp"></jsp:forward>
 
<%-- 
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	
	MemberInfo info = new MemberInfo();
	info.setId(id);
	info.setName(name);
	info.setPassword(password);
	info.setEmail(email);
%>
아이디 : <%= info.getId()%> <br />
이름 :  <%= info.getName()%> <br />
비밀번호 :  <%= info.getPassword()%> <br />
이메일 :  <%= info.getEmail()%> <br />
 --%>
 
 
 
<script>
$(function(){});
</script>
</body>
</html>
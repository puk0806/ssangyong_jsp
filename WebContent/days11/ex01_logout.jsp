<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 1. auth 쿠키 삭제
	//		setMaxAge(0)
	Cookies cookies = new Cookies(request);
	Cookie cookie = Cookies.createCookie("auth", "","/",0);
	response.addCookie(cookie);
	
	// 2. 경고창 띄우고 + ex01_default.jsp 페이지 이동
	/*
	String location = "ex01_default.jsp?logout=admin";
	response.sendRedirect(location);		// 서버에서 페이지 이동 요청
	*/
%>
<script>
	alert("[admin]님 로그아웃 하셨습니다.")
	location.href = "ex01_default.jsp";	// js에서 페이지 이동 요청
	
</script>
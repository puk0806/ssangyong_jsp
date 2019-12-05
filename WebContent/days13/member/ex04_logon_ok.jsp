<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String referer = request.getHeader("Referer");
	System.out.print("referer : "+referer);
	
	String id = request.getParameter("id");
	// 인증
	session.setAttribute("auth", id);
	
%>
로그인 성공
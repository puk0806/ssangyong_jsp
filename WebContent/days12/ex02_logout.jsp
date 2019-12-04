<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 세션 안의 auth 속성만 제거
	// session.removeAttribute("auth");

	// 세션 객체를 제거
	session.invalidate();
	response.sendRedirect("ex02.jsp");
%>

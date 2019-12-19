<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Thread.sleep(3000);	
	request.setCharacterEncoding("UTF-8");
	String name =request.getParameter("name");
	String age = request.getParameter("age");
	
	String ajaxResult = String.format("hello %s (Ajax)",name);
%>
<%=ajaxResult %>

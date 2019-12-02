<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String c_name = request.getParameter("c_name");
	String c_value = request.getParameter("c_value");
	String c_domian = request.getParameter("C_domain");
	String c_path = request.getParameter("c_path");
	String c_maxage = request.getParameter("c_maxage");
	
	//Cookies cookies = new Cookies(request);	// 스택틱 변수여서 생성없이 클래스로 접근가능
	
	Cookie cookie = Cookies.createCookie(c_name, c_value, "/", -1);
	response.addCookie(cookie);
	
	String location = "ex08_cookie_list.jsp";	// 포워딩 하면 쿠키 생성 X,꼭 리다이렉트 클라이언트를 들러야한다.
	response.sendRedirect(location);
	
%>
<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	String contextPath = request.getContextPath();
	
	String auth = null;
	Cookies cookies = new Cookies(request);	// map
	
	
	if(cookies.exists("auth")){
		auth = cookies.getValue("auth");	//라이브러리안에 만들어논함수
	}
%>
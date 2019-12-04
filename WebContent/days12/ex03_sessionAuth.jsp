<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	// ex03_sessionAuth.jsp -> @include file 포함
	// jsp:include 	액션태그 - 공통모듈 레이아웃
	// include 지시자	지시자    - 공통변수
	
	
	String contextPath = request.getContextPath();
	
	// 2. 세션으로 얻어오기
	String auth = null;
	auth = (String)session.getAttribute("auth");
	
%>
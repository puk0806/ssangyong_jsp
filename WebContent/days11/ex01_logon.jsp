<%@page import="java.util.Iterator"%>
<%@page import="com.util.Cookies"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HashMap<String, String> member = new HashMap<>();
	member.put("admin","1234");	// 관리자 계정
	member.put("han","1234");	
	member.put("hong","1234");	
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	
	Set<Entry<String,String>> set = member.entrySet();
	Iterator<Entry<String,String>> ir = set.iterator();
	boolean isAuth = false;
	while(ir.hasNext()){
		Entry<String,String> entry = ir.next();
		String key = entry.getKey();
		String value = entry.getValue();
		if(id.equals(key) && pass.equals(value)){
			isAuth = true;
			break;
		}
	}
	
	String location = "ex01_default.jsp";
	if(isAuth){
		// auth 쿠키 생성
		Cookie cookie = Cookies.createCookie("auth", id,"/",-1);
		response.addCookie(cookie);	
		
		Cookies cookies = new Cookies(request);
		if (cookies.exists("referer")) {
			location = cookies.getCookie("referer").getValue();
			cookie = Cookies.createCookie("referer", "", "/", 0);
			response.addCookie(cookie); //
		}
		
		
		
	}else{
		location += "?error";
	}
	response.sendRedirect(location);
%>
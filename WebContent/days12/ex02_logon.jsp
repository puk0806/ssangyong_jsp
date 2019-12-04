<%@page import="days12.Member"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	if(id.equals("admin")&&pass.equals("1234")){	// 로그인 성공
		session.setAttribute("auth", id);
		/* 
		session.setAttribute("age", 39);
		session.setAttribute("name", "한지민");
		session.setAttribute("addr", "서울");
	 	*/
	 	
	 	Member member = new Member(id,"한지민",38,"서울");
	 	session.setAttribute("member", member);
	
		String location = "ex02_default.jsp";
		response.sendRedirect(location);
	}else{		// 로그인 실패
%>
	<script>
		alert("로그인 실패");
		history.go(-1);
	</script>	
<%	}

%>

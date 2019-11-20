<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request. getParameter("pw");
	String url;
	
	if(id.equals("admin") && pw.equals("1234")){	// 로그인 성공
		url = "ex08.jsp?ok";
	}else{		// 로그인 실패 
		url = "ex08.jsp?error";
	}
	
	// 리다이렉트 사용
	response.sendRedirect(url);
%>
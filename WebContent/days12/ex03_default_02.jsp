<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="ex03_sessionAuth.jsp" %>

<%
	// 메인페이지를 출력할 때
	// 1) 인증   		+		권한 확인 : 우수,관리자,일반 등...
	//	auth 쿠키이름 / id 쿠키값 
	//	쿠키 확인 방법
	//		Cookies.java : true/ flase	exit(), getCookie
		// include함
		/*
		String contextPath = request.getContextPath();
	
		String auth = null;
		Cookies cookies = new Cookies(request);	// map
		
		
		if(cookies.exists("auth")){
			auth = cookies.getValue("auth");	//라이브러리안에 만들어논함수
		}
		*/
		// ?error
		String error = request.getParameter("error");
		/* 
		로그아웃 경고창 띄우기
		String logout = request.getParameter("logout");
		if(logout!=null){
			out.println("<script>alert('[" + logout + "]님 로그아웃 하셨습니다.');</script>");
		}
		 */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 3. 오전 9:23:35</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	div{
		border: solid 1px gray;
		width: 300px;
		height: 100px;
		padding: 20px;
	}
</style>
</head>
<body>
<h3>ex03_default.jsp</h3>
<%
	if(auth == null){	// 로그인 X
%>		<div id="logon">
			<form action="<%=contextPath %>/days12/ex03_logon.jsp">
				아이디 : <input type="text" name="id" value="admin"/> <br />
				비밀번호 : <input type="password" name="pass" value="1234" /> <br />
				<input type="submit" value="로그인" />
				<input type="submit" value="회원가입" />
				<br />
				<%
					if(error !=null){
				%>
					<span style="color: red;">로그인 실패입니다.</span>		
				<%	}
				%>
			</form>
		</div>					
<%	}else{
%>		<div id="logout">
			[<%=auth %>]님 환영합니다 <br />
			<a href="ex03_logout.jsp">로그아웃</a>
		</div>		
<%	}
%>



<a href="/jspPro/cstvsboard/list.htm">게시판</a> <br />
<a href="ex03_notice.jsp">공지사항</a> <br />
<!-- 로그인을 해야지만 일정관리/자료실 사용할 수 있다. -->
<%
	if(auth!=null){		// 로그인 됬을 경우
%>		<a href="#">일정관리</a> <br />
		<a href="#">자료실</a> <br />
<%	}
%>

<a href="#">도움말</a> <br />
<script>
$(function(){
	$("#logon span").fadeOut(5000);
});
</script>
</body>
</html>
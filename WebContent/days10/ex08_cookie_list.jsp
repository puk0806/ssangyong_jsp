<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>kenik - 2019. 12. 2. 오후 2:36:29</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<form id="form1">
<h3>쿠키 목록 보기</h3>
<!-- Cookie[] cookies =request.getCookies(); -->
<!-- Cookies.java 라이브러리 사용해서 쿠키 목록 보기 -->
<%
    Cookies  c = new Cookies(request);
    // 생성자 호출 -> cookieMap (맵 : 쿠키이름, 쿠키객체)
    Set<Entry<String, Cookie>> set = c.cookieMap.entrySet();
    Iterator<Entry<String, Cookie>> ir = set.iterator();
    while( ir.hasNext() ){
      Entry<String, Cookie> entry = ir.next();
      String cookie_name =  entry.getKey();
      Cookie cookie = entry.getValue();
      String cookie_value = cookie.getValue();
%>
<input type="checkbox" name="ckb_cookie" value="<%= cookie_name %>" />
<%= cookie_name %> = <%=  cookie_value %><br>
<%      
    }
%>
</form>

<hr>
<a href="ex08_create_cookie.jsp">쿠키 생성하기</a>
<a href="ex08_get_cookie.jsp">쿠키 확인하기</a>
<a href="ex08_delete_cookie.jsp" id="deleteLink">쿠키 삭제하기</a>
<a href="ex08_edit_cookie.jsp">쿠키 수정하기</a>

<script>
$(function (){
	$("#deleteLink").click(function (){
		event.preventDefault();
		// (암기)
		var queryString = $("#form1").serialize();	// ckb_cookie=name&ckb_cookie=age 형태로 만들어주는함수
		// alert( queryString );
		
		//location.href= "ex08_delete_cookie.jsp?ckb_cookie=name&ckb_cookie=age";
		location.href = $(this).attr("href")+"?"+queryString;
		
		
	});
	
});
</script>
</body>
</html>

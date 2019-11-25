<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 22. 오후 12:25:51</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");		// 받을때 디코딩 하는 방법 설정
response.setContentType("text/html; charset=UTF-8");	// 보낼때 인코딩 하는 방법 설정

String address  = request.getParameter("address");
%>
<h3>test04_02.jsp</h3>
<form action="test04_03.jsp" method="post">
	주소 : <input type="text" name="address" value="<%=address %>" ><br>
	<input type="button" value="이전" id="prev">
	<input type="submit" value="다음" >
</form>


<script>
$(function(){
	// form 태그 안에 동적으로 hidden 태그 추가 + 값 설정
	$("form").append( $("<input/>").attr({
		type:"hidden",
		name:"name",
		value:'<%=request.getParameter("name")%>'
	}));
	
	$("#prev").click(function(){
		// 이전페이지 가기
		// history.go(-1);	
		// history.back();
		location.href = "test04.jsp";
	});	
});
</script>
</body>
</html>
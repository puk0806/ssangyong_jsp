<%@page import="days07.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 6. 오후 2:02:35</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- EL 문법 : ex09.jsp p261 -->
${true && true} <br />
${true||true } <br />
${!true } <br />

${true and true} <br />
${true or true } <br />
${not true } <br />

${true and true} <br />
${true or true } <br />
${not true } <br />

<!--  EL 문법 -->
empty 널 :  ${empty null } <br />
empty "": ${empty ""} <br />

<!-- ?seq "" null -->
empty 0 : ${empty 0 } <br />

배열 크기가 0 -> true <br />
빈 Map -> true <br />
빈 컬렉션 -> true <br />

<%
	ArrayList<BoardDTO> list = null;
	
	request.setAttribute("list", list);
%>
list 컬렉션 : null - ${empty list } <br />

<%
//	int [] m = null;
	int [] m = new int[0];
%>

${empty m } <br /> true;

<script>
$(function(){});
</script>
</body>
</html>

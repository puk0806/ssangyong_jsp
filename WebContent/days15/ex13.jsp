<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 9. 오후 12:18:52</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<%
	Date now = new Date();
%>
now : <%=now %> <br />
now : <%=now.toLocaleString() %> <br />
<c:set var="now" value="<%=now %>"></c:set>
<fmt:formatDate value="${now }" dateStyle="full"/> <br />
<fmt:formatDate value="${now }" dateStyle="short"/> <br />
<fmt:formatDate value="${now }" type="time"/> <br />
<fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/> <br />


<hr />

<c:set var="d" value="2019년12월09일"></c:set>
<fmt:parseDate value="${d }" pattern="yyyy년MM월dd일" var="date"></fmt:parseDate>
한글 변환 날짜 : ${date }
<script>
$(function(){});
</script>
</body>
</html>
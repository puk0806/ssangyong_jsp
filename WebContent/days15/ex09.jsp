<%@page import="java.util.HashMap"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 9. 오전 11:19:32</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<%
	HashMap<String,String> map = new HashMap<>();
	map.put("id","name");
	map.put("name","홍길동");
	map.put("age","25");
	map.put("addr","서울 강남구");
	
	// request.setAttribute("map", map);
%>
<c:set var="map" value="<%=map %>"></c:set>
<c:forEach items="${map }" var="entry">
	<li>${entry.key } - ${entry.value }</li>
</c:forEach>

<hr />

<!-- p307 예제)use_fortokens_tag.jsp -->

콤마와 점을 구분자로 사용 : 
<c:forTokens items="빨강색,주황색.노란색,초록색.파랑색.남색.보라색" delims=",." var="token">
	${token }
</c:forTokens>

<hr>

<!-- p309 예제) user_url_tag.jsp -->
<c:url value="http://search.daum.net/search" var="searchUrl"></c:url>
	<c:redirect url="${searchUrl}">
		<c:param name="w" value="blog"></c:param>
		<c:param name="q" value="공원"></c:param>
	</c:redirect>
	


<script>
$(function(){});
</script>
</body>
</html>
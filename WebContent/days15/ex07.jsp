<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanh0o - 2019. 12. 9. 오전 11:01:17</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 1~10까지의 합을 구해서 출력 -->
	<c:set value="0" var="sum"></c:set>
	<c:forEach begin="1" end="10" step="1" var="i">
		<c:set var="sum" value="${sum +i}"></c:set>
		${i += (i eq 10 ? "=":"+")}
	</c:forEach>
	${sum}
<script>
$(function(){});
</script>
</body>
</html>
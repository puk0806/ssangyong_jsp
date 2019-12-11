<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 11. 오전 10:30:23</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 1~10 까지의 합 출력 -->
<%-- 
<c:set var="sum" value="0"></c:set>
<c:forEach begin="1" end="10" step="1" var="i">
${i += (i==10?"=":"+")  }
<c:set var="sum" value="${sum +i}"></c:set> 
</c:forEach>
${sum }
--%>
 
<tf:sum begin="1" end="10">
	1~10까지의 합 : ${sum }
</tf:sum>

<script>
$(function(){});
</script>
</body>
</html>
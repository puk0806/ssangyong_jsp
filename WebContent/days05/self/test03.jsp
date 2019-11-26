<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 25. 오후 7:55:22</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>test03.jsp EL-JSTL</h3>
<ul>
	<c:forEach items="${map.keySet() }" var="dto">
		<li><a>${dto.dname }(${dto.empCnt })명</a></li>	
	</c:forEach>
</ul>

<c:forEach items="${map }" var="entry">
	<c:choose>
		<c:when test="${!empty entry.value }">
			
				<c:forEach items="${entry.value }" var="empDTO">
					<li>
						${empDTO.empno },
						${empDTO.ename }
						
					</li>
				</c:forEach>
			
		</c:when>
		<c:otherwise>
			존재 하지 않습니다.
		</c:otherwise>
	</c:choose>
</c:forEach>


<script>
$(function(){});
</script>
</body>
</html>
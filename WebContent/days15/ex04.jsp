<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 9. 오전 10:02:49</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
	p299 흐름제어 if 
-->
<form action="">
	정수 : <input type="text" name="num"/>
</form>
<%-- 
<%
	String pnum = request.getParameter("num");
	int num ; 
	if(pnum !=null){
		num = Integer.parseInt(pnum);
		if(num %2==0){
%>			짝수			
<%		}else{
%>			홀수			
<%		}
	}
%>
--%>

<!-- else if문 없음 주의 -->
<!-- EL은 parameter로 들어온 변수 그냥 인식 못한단 param 사용 주의! -->
<c:set var="num" value="${param.num }"></c:set>
<c:if test="${ !empty num } ">
	<c:if test="${num%2==0}">짝수</c:if>
	<c:if test="${num%2!=0}">홀수</c:if>
</c:if>

<c:if test="${not empty num }">
	<c:choose>
		<c:when test="${(num%2)==0 }">짝수</c:when>
		<c:otherwise>홀수</c:otherwise>
	</c:choose>
</c:if>




<script>
$(function(){});
</script>
</body>
</html>
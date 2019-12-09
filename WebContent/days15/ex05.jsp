<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="days15.JumsuChange" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 9. 오전 10:17:07</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<form action="">
	국어점수 : <input type="text" name="kor"/>
	<input type="submit" />
</form>

<c:set var="kor" value="${param.kor }"></c:set>
<div id="demo">
	<!-- days15.JumsuChange 클래스 선언 국어점수 매개변수입력받아 static메소드 이용 -->
	${JumsuChange.getGrade(empty kor?"0":kor)}
	
	<%-- 
	<c:if test="${not empty kor }">
		<c:if test="${kor<=100&& kor>=90 }">수</c:if>
		<c:if test="${kor<90&& kor>=80 }">우</c:if>
		<c:if test="${kor<80&& kor>=70 }">미</c:if>
		<c:if test="${kor<70&& kor>=60 }">양</c:if>
		<c:if test="${kor<60&&kor>=0 }">가</c:if>
	</c:if>
	
	<c:choose>
		<c:when test="${kor<=100 &&kor>=90 }">수</c:when>
		<c:when test="${kor<90&& kor>=80 }">우</c:when>
		<c:when test="${kor<80&& kor>=70 }">미</c:when>
		<c:when test="${kor<70&& kor>=60 }">양</c:when>
		<c:when test="${kor<60&& kor>=0}">가</c:when>
		<c:otherwise>점수 입력 요망</c:otherwise>
	</c:choose> --%>
</div>


<script>
$(function(){});
</script>
</body>
</html>
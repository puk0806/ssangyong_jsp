<%@page import="days12.Member"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 9. 오전 9:32:13</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
	p 295 표 12.2 코어 태그 라이브러리
	- 변수 지원, 흐름지원, URL 처리
	1. 변수 지원(선언) 	:	c:set		변수 선언(설정)
						c:remove	변수 삭제(제거)
	2. 흐름지원		:	c:if
						c:choose
						c:forEach
						c:forTokens	(구분자로 잘라내기)
	3. URL 처리		:	c:import
						c:redirect
						c:url
	4. 기타				c:catch
						c:out
-->

<%--  
	 var 속성 : 변수명 (EL에서 사용할 변수명)
	 value 속성 : 변수에 저장할 값, (정적데이터, 표현식,EL 사용 가능) 	<%=name %>, ${param.name }
	 target 속성 : 프로퍼티 값을 설정할 대상	(var+value+scope와는 target속성 함께 사용 불가능)
	 property 속성 : 설정할 프로퍼티의 이름을 지정 setName() setter 가 있어야 한다. ex) setName  -> name (으로사용)
	 				(기억)Map 인 경우 Map.ut(프로퍼티이름, 값)을 이요해서 값 설정한다.
	 scope :
	 
 --%>
<% String name = "홍길동"; %>
<c:set var="name" value="홍길동" scope="page"></c:set>
<c:set var="name" scope="page">홍길동</c:set>		<!-- 동일한 코딩 -->
<c:set var="name" scope="session">홍길동</c:set>		<!-- 동일한 코딩 -->
<c:remove var="name"/>			<!-- 모든 스코프의 name 변수 삭제 -->
이름 출력 : ${name }
<%
	Member member = new Member();
%>
<c:set target="<%=member %>" property="name" value="홍길동">




</c:set>
<script>
$(function(){});
</script>
</body>
</html>
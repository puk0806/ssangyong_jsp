<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 25. 오후 3:34:21</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- p89 표 3.6 기본 객체 request의 헤더 관련 메서드 -->
<%
	// request.getHeader(name);
	// request.getHeaderNames();
	// request.getHeaders(name);
	
	Enumeration<String> en = request.getHeaderNames();
	while(en.hasMoreElements()){
		String headerName = en.nextElement();
		String headerValue = request.getHeader(headerName);
%>
		<%= headerName %> : <%=headerValue %>	<br />
		
<%	}
	
	
	// ?name = xx&age=20....
	// request.getParameterNames()	->  getParameterNames : name, age, .... 파라미터명 얻어옴
%>

<!-- 
	p90 response 기본 객체를 통해서 [웹브라우저]클라이언트에 헤더 정보 전송하기
	addDateHeader(name,date)	
	addHeader(name,value)		 
	setDateHeader(name,value)	 
 -->


<!-- 
	p91 웹 브라우저 캐시 제어를 위한 으답 헤더 입력 ...
	웹 브라우저 -> http://localhost/jspPro/days05/empList?deptno=10
	-> (똑같은 요청) 서버X , 로컬 pc  캐시에 있는 응답 결과 : 브라우저 출력
 --> 	


<script>
$(function(){});
</script>
</body>
</html>
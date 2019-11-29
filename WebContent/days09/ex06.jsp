<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오전 10:17:43</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>


<!-- 
	p 121 applilcation 기본 객체 	
		- 웹 어플리케이션(웹 사이트)의 정보를 가지고 있는 객체
		- 웹 사이트 초기화 파라미터를 읽어오기
			- web.xml 파일에 <context-param> 태그를 사용한다.

 -->
 초기화 파라미터 목록 :
 <ul>
   <%
   Enumeration<String> initParamEnum = application.getInitParameterNames();
   while( initParamEnum.hasMoreElements() ){
	   String pname = initParamEnum.nextElement();
    %>
    <li>
      <%= pname %> = <%= application.getInitParameter(pname) %>
    </li>
    <%	   
   }
   %>
 </ul>

<hr>
<!-- 
	현재 사용중인 톰캣[웹 컨테이너 ?]에 대한 정보를 얻어오자
	클라이언트 (요청)-> WAS(톰캣)-> JSP/Servlet ->
					톰캣(==웹컨테이너) 
	                     [Servlet 객체]  
-->

서버 정보:<%= application.getServerInfo() %> <br />
서블릿 규약 메이저 버전 : <%= application.getMajorVersion() %> <br />
서블릿 규약 마이너 버전 : <%= application.getMinorVersion() %> <br />

<script>
$(function(){});
</script>
</body>
</html>
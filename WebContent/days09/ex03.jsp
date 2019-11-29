<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오전 9:24:33</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 
	p 106 웹 어플리케이션 폴더 구성 과 URL 매핑
	
	WEB-INF 폴더 : 웹어플리케시ㅕㄴ의 설정 정보를 담고 있는 폴더
		- 외부에서 접근할 수 없다.
		- 외부에서 접근 못하게 할 때 WEB-INF 폴더 안에 사용자 폴더 + 파일
		ex) WEB-INF 폴더 -> board 폴더
		> web.xml (기억)
		
	WEB-INF/classes 폴더 : 서블릿.java 컴파일 -> 서블릿.class
		> 모든 클래스 파일은 WEB-INF/classes 폴더에 저장
	WEB-INF/lib 폴더 : objdb6.jar, jstl-1.2.jar
		웹 어플리케이션 사용할 jar 파일
 -->
	<%
		String contextPath = request.getContextPath();
	%>
	contextPath = <%=contextPath %> (/jspPro) = 프로젝트명 <br />
						<!-- EL의 pageContext는 jsp 기본 객체 pageContext 객체 -->
	contextPath[EL] = ${ pageContext.request.contextPath } (/jspPro) = 프로젝트명 <br />
 
 	


<script>
$(function(){});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 19. 오전 11:30:39</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
1. 서블릿
	- 정의 : JAVA라는 언어를 사용하는 웹기술 (Servlet, JSP)
			JSP표준이 나오기 전에 만들어진 표준
	- 서블릿 개발 순서(과정)
		1. 서블릿 규약에 따라 자바 코드를 작성
		2. 자바코드를 컴파일해서 클래스 파일을 생성
		3. /WEB-ING/classes 폴더에 클래스파일을 패키지에 알맞게 위치 시킨다.
		4. web.xml DD 파일에 서블릿 등록
		5. 톰캣 실행
		6. 웹 브라우저에서 확인
	- p503 어노테이션으로 매핑하기
		- 서블릿 3.0 버전 부터는 @WebServlet 어노테이션을 사용하면 따로 web.xml에 서블릿을 등록하지 않아도 된다.
	
-->
<br>

<!-- context root or context path or 컨텍스트 패스   == /jspPro -->
<%
	// jsp 페이지 구성 요소 중에 스크립트요소(스크립트릿) - 자바 코딩
	// request 객체는 jsp 페이지의 구성 요소 중에 기본 내장 9가지 객체 중 하나
	String contextPath = request.getContextPath();				// 컨택스 패스 얻어오는 방법!!!!
%>


<a href="hello">HelloServlet 호출</a><br />
<a href="/days01/hello">HelloServlet 호출</a><br />
<a href="/jspPro/days01/hello">HelloServlet 호출</a><br />
<a href="http://localhost/jspPro/days01/hello">HelloServlet 호출</a><br />

<a href="<%=contextPath %>/days01/hello">HelloServlet 호출</a><br />
<a href="http://localhost<%=contextPath %>/days01/hello">HelloServlet 호출</a><br />


<script>
$(function(){});
</script>
</body>
</html>
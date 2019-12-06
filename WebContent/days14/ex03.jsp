<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 6. 오전 11:01:57</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 

	p570 ServletContext Listerner
	Application		청취자 - 이벤트
	서버 시작(초기화) / 종료(마무리)
	A. 접속 -  session
	
	
	톰캣 서버 (웹 컨테이너)는 웹 어플리케이션이 시작되거나 종료되는 시점에 특정 클래스의 메서드를 실행할 수 있는 기능을 제공
		1) ServletContextListener 구현 한 클래스 선언
			@override
			contextInitalized()	- 톰캣시작 호출되는 메서드
				웹사이트 초기화
			contextDestoryed()	- 톰캣 종료 호출되는 메서드
		2) web.xml 등록
	ServletContext getServletContext() == JSP 페이지의 application 기본 객체와 동일하다
	
	<context-param></context-param> 
	
	

-->


<script>
$(function(){});
</script>
</body>
</html>
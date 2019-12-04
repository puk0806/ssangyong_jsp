<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 4. 오전 10:45:06</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 
	p 516 MVC 패턴 구현
		- 모델 1구조/ 모델 2구조(==MVC패턴)
			모델 1구조 : 클라이언트 ,서버 간 서로 요청 응답 
		- MVC 패턴 이해
		- 커맨드 패턴을 사용한 컨트롤러 (Controller) 구현
			command(명령) 패턴
			
			
	2. 모델 2구조(MVC패턴)
	[클라이언트(웹브라우저)] - 모든 요청 
				(DTO)	-> 서블릿클래스(컨트롤러) 1개  				View : JSP페이지
				(DTO)	-> 모델(Model)(요청 처리 로직)(서블릿 X)   	1) 처리 결과물 : ???		2) 응답 페이지 : ???.jsp
				(DTO)	-> Service
				(DTO)	-> DAO
						-> DBMS
-->
<!--
	p520 [컨트롤러 controller 서블릿] 내부 동작 방식
	클라이언트(브라우저) -> http 요청 -> 
								1) 컨트롤러 서블릿 모든요청 받음
								2) 클라이언트가 요구하는 요청(기능) 분석 (게시글 CRUD)
								3) 요청한 로직을 처리할 모델 사용
								4) 처리 결과를 request 또는 session 저장
											포워딩
								5) 알맞은 뷰 선택 후 (???.jsp) 포워딩
								6) <-http응답		출력 버퍼
									
-->
<!-- 
	p 523 컨트롤러 서블릿 클래스 ControllerServlet 코딩.
		days12 패키지 안에 ControllerServlet
 -->
 <!-- /jspPro/days12/simple 서블릿 컨트롤러 못찾음 -->
 <a href="/jspPro/days12/simple">/jspPro/days12/simple</a>
 
 <!-- /jspPro/ex05_simpleView.jsp 뷰(View) 페이지 -->
 <a href="/jspPro/simple">/jspPro/simple</a>
 <a href="/jspPro/simple?type=date">/jspPro/simple?type=date</a>
 <a href="/jspPro/simple?type=now">/jspPro/simple?type=now</a>


<script>
$(function(){});
</script>
</body>
</html>
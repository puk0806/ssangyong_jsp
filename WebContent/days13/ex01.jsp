<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 5. 오전 9:01:28</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
	필터? ==> Spring AOP 기능 동일
	서블릿리스터 ? 이벤트 처리
	EL + JSTL
	사용자 정의 태그
	방명록
	파일업로드 : 자료실
	답변형 게시판
	Ajax + JSP
	JSON
	Chart
	구글맵	
-->
<!-- 
	MVC 패턴 순서
	- 	CommandHandler 인터페이스 구현 클래스
		String process(r,r)
		ㄱ. 로직처리
		ㄴ. request.setAttribute(이름,값)
		ㄷ. *.do
			WEB-INF/view/board/list.jsp		// 한번에 접근하지 못하도록
	-	ㅇㅇㅇ.properties 생성
	1. C 컨트롤러 클래스 선언
-->
<!-- 
	days07/board 게시판 -> days13 MVC패턴 변환
	1) 컨트롤러 만들기
		days13.mvc.controller 패키지....
		days13.mvc.board.ListHandler 클래스 선언
		WEB-INF/view/board/list.jsp	
 -->
 <a href="/jspPro/board/list.do">/jspPro/board/list.do</a>
 <a href="/jspPro/board/write.do">/jspPro/board/write.do</a>
<!--
 삭제하기
 http://localhost/jspPro/board/delete.do?seq=81
  -->
<script>
$(function(){});
</script>
</body>
</html>
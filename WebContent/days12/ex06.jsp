<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 4. 오후 12:11:14</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 
	p 528 커맨드 패턴 기반의 코드
	1. 웹 브라우저를 통해서 명령어를 전달하는 방법은 두가지가 있다.
		 ㄱ. 특정 이름의 파라미터에 명령어 정보를 전달하는 방법
		 ex) /jspPro/controller?cmd=list
		 						cmd 파라미터의 값 게시글 목록(list) 명령어
		컨트롤러 서블릿 클래스에서
			request.getParameter("cmd");
			요청 분석 -> 모델 객체
		 ㄴ. 요청 URL 자체를 명령어로 사용하는 방법
		 ex) /jspPro/Controller/board/list
		 	 /jspPro/Controller/notice/list

		2. 모델객체 (커맨드 핸들러 commandHandler)
		인터페이스 선언 : CommandHandler
			String process()
			
		days12.mvc.command.CommandHandler 인터페이스 선언
		
		// 컨트롤러 서블릿 클래스
		days12.mvc.controller.ControllerUsingFile.java
		// web.xml Ctrl+C Ctrl+V
		// web_20191204.xml

-->

<a href="/jspPro/sist?cmd=hello">/jspPro/sist?cmd=hello</a>
<a href="/jspPro/sist?cmd=now">/jspPro/sist?cmd=now</a>
<a href="/jspPro/hello.do">/jspPro/hello.do</a>

<script>
$(function(){});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 11. 오전 9:10:01</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 
	p469 커스텀 태그 (u:isLogin 태그)
		->(표준화) JSTL
			- 스크립트 요소가 많아지면 JSP 코드는 복잡해지고, 유지, 보수가 어려워진다. 이러한 문제를 해결하기 위해 커스텀 태그 사용		
	p471 커스텀 태그 종류
		(톰켓 버전에 따라 JSP버전에 달라진다)
		1) JSP 1.2 스타일로 구현한 커스텀 태그
		2) JSP 2.0 , 그 이상의 SimpleTag를 사용한 커스텀 태그
		3) JSP 2.0 그 이상 버전의 태그 파일을 사용한 커스텀 태그	
	p472 
		WEB-INF 폴더 밑에 tags 폴더 추가
	p473 태그 파일 기본
		- jsp파일도 클래스 변환 (재스퍼)
		- 태그 파일도 커스텀 태그 클래스로 변환
		
		JSP 파일에서 사용할 수 있는 지시자? taglib, page, include 지시자
	p474 태그파일에서 사용할 수 있는 지시자
		1) tag
		2) taglib
		3) include
		4) attribute
		5) variable
		
	표16.2 tag 지시자의 속성
	
	3.1.1 태그 파일의 위치 
		- WEB-INF/tags 폴더 또는그 하위폴더에 넣어야 된다.
		- .tag 또는 .tagx 확장자를 갖는 태그파일만 인식한다.
		
		JSP기본객체9가지
	p475 태그 파일에서 사용 가능한 기본객체
		jspContext == pageContext
		request
		response
		session
		application == 0
		out
	p475 현재 날짜/시간을 출력하는 태그 파일 선언후 커스텀 태그 사용 (ex02_02,WEB-INF.tags.now)
	p477 태그 파일의 속성 설정 방법
		@attribute 지시자 의미/사용법		(ex03.jsp)
			description/name/required/rtexprvalue/type/fragment 속성
	p481 동적 속성 전달 (ex04.jsp)
	p484 몸체 내용 처리 (ex05.jsp)
		<tf:select> 몸체(content) 커스텀 태그 </tf:select>
	p488 몸체 내용을 반복적으로 사용하기(ex06.jsp)
	
		
			
-->

<script>
$(function(){});
</script>
</body>
</html>
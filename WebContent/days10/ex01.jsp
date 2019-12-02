<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 2. 오전 9:28:41</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>days10.ex01.jsp</h3>
<%-- 
	p155페이지 모듈화와 요청 흐름제어
	jsp:clude(액션 태그)와 include(지시자) 차이점 구별  (p177, 표7.1참고)
					jsp:clude(액션 태그)			include(지시자)
	처리시간		:	요청 시간에 처리					JSP파일을 자바 소스로 변환할 때 처리
	기능			:	별도의 파일로 요청 처리 흐름이동		현재 파일에 삽입시킴
	데이터 전달 방법 :	request(객체),<jsp:param>	페이지 내의 변수를 선언한 후 변수에 값 저장
					을 이용한 파라미터로 전달
	용도			:	화면의 레이아웃의 일부분 모듈화 할때	[다수의 JSP페이지]에 공통 사용된 변수를 지정를 지정하는 코드,문장을 포함
				ex)	TOP/BOTTOM 모듈화				ex) contextpath
 --%>
 <%@ include file="/include/variable.jspf"%>		
 <a href="ex02_main.jsp?age=20">ex02_main.jsp?age=20</a>




<script>
$(function(){});
</script>
</body>
</html>
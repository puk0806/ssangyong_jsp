<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오후 4:01:32</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
p72 JSP 기본 내장 객체 : request
웹브라우저 (클라이언트)	(요청)->	웹(+WAS)서버(톰캣)
	요청 정보를 가지고 있는 객체 : request
웹브라우저 (클라이언트)	<-(응답)	웹(+WAS)서버(톰캣)	
	응답 정보를 가지고 있는 객체 : response
 -->
 
 컨텍스트 경로 : <%= request.getContextPath() %>	<br />
 클라이언트 IP주소 : <%= request.getRemoteAddr() %> <br />

요청 방식 : <%= request.getMethod() %> <br />
요청할 때 사용한 인코딩 정보 : <%= request.getCharacterEncoding() %> <br />


 

<script>
$(function(){});
</script>
</body>
</html>
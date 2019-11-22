<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale = 1">
<title>2019. 11. 22. 오전 10:05:37</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
	문제 1) EL 로 출력하기. test01.jsp
      ㄱ. 클라이언트의 IP 주소 가져와서 출력
      ㄴ. context path 가져와서 출력
      ㄷ. 요청 URL 정보 가져와서 출력
      ㄹ. 요청 URL 정보 가져와서 출력
      ㅁ. 요청 전송 방식 가져와서 출력.
 -->
      ㄱ. 클라이언트의 IP 주소 가져와서 출력
	EL :${ pageContext.request.remoteAddr };<br>
	표현식 : <%= request.getRemoteAddr() %><br>
      ㄴ. context path 가져와서 출력
   	:${ pageContext.request.contextPath };<br>
      ㄷ. 요청 URI 정보 가져와서 출력
    :${ pageContext.request.requestURI };<br>
      ㄹ. 요청 URL 정보 가져와서 출력
    :${ pageContext.request.requestURL };<br>
      ㅁ. 요청 전송 방식 가져와서 출력.
    :${ pageContext.request.method };<br>


<script>
$(function(){});
</script>
</body>
</html>
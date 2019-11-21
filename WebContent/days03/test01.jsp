<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 21. 오전 8:47:07</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

  클라이언트 IP 주소 <%= request.getRemoteAddr() %> <br />
   컨텍스트 경로<%= request.getContextPath() %> <br />
   요청 URI <%= request.getRequestURI() %> <br />
   요청 URL <%= request.getRequestURL()%> <br />
   요청방식:<%= request.getMethod() %>  <br />

<!-- 
p264 2.2 EL의 기본 객체 
pogeContext == JSP pageContext 동일하다.
-->

${pageContext.request.contextPath}<br>
${pageContext.request.remoteAddr}<br>
${pageContext.request.method}<br>
${pageContext.request.requestURI}<br>
${pageContext.request.requestURL}<br>
<script>
$(function(){});
</script>
</body>
</html>
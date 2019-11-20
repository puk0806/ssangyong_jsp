<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오전 9:01:56</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
문제 1) days02폴더에  test01.jsp 파일 추가
       요청 URL -    http://localhost/jspPro/test/hap 
    POST 방식으로 요청   했을 때  
    days02패키지 안에 Test01.java 서블릿을 호출하여
       서버의    시간을    2019년 11월 19일  09시  00분 00초   형식으로 출력
    ( 조건  :  SimpleDateFormat 클래스 사용 )
       
   [서블릿 등록]
      ㄱ. web.xml 
      ㄴ. @WebServlet 애노테이션 사용 
-->

<%
	String contextPath = request.getContextPath();	
%>

<!-- 경로 : context path 시작 -->
<form action="<%=contextPath %>/test/hap" method="post">
	<button type="submit" value="test01">제출</button>
</form>


<script>
$(function(){});
</script>
</body>
</html>
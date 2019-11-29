<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오전 9:37:39</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

	<!-- 
	p114 JSP 기본 내장 객체와 영역(Scope)
	1. request
	2. response
	3. out
		EL, JSP,
	4. page (java.lang.Object) - JSP페이지를 구현한 자바 클래스 인스턴스 
	5. pageContext (javax.servlet.jsp.pageContext) - JSP 페이지에 대한 정보를 저장하고 있는 객체
	6. config (javax.servlet.ServletConfig) - JSP 페이지에 대한 [설정 정보]를 저장하고 있는 객체
	7. application(javax.servlet.ServletContext) - 웹 어플리케이션에 대한 정보를 저장하고 있는 객체 
	8. exception (java.lang.Throwable) - 예외 객체
	9. session - HTTP 세션 정보를 저장한다.
	10.
	-->
	
	<%
		out.println("AAA");
	%>
	BBB
	<%
		out.println("CCC");
	%>
	
	<%
		for(int i=1;i<=10;i++){
			// out.write(chr [] , int, String);
			// out.print(매개변수 기본형)
			// out.append(char, charSequence)
			
			// out.println(i);
			// out.println("<br>");
	%>		
			<%=i %>
			<br />
	<%
		}
	%>
	
	<!-- 
	p117 out 기본 객체의 출력 메서드
	1) print() - 데이터 출력
	2) println() - 데이터 + 줄바꿈문자(\r\n)
	3) newLine() - 줄바꿈 문자(\r\n 또는 \n) 
	-->
	
	버퍼 크기 : <%= out.getBufferSize() %>
	남은 버퍼 크기 : <%= out.getRemaining() %>
	오토플러쉬 : <%= out.isAutoFlush() %>
	


<script>
$(function(){});
</script>
</body>
</html>
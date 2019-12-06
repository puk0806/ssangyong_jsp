<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 6. 오후 12:24:00</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- p 258 연산자 +,-,*,/,%-->
${3+5 } <br />
${3-5 } <br />
${3*5 } <br />
${3/5 } <br />
<%-- ${3 div 5 } <br /> --%>
${3 % 5 } <br />
${3 mod 5 } <br />
<hr />
<%
	String title = "JSP  & Servlet 입문";
	request.setAttribute("title", title);
%>
title = <%=title+"입니다" %> <br />
title = <%=title %>입니다 <br />
title = ${title } <br />
<!-- EL문 문자열 연결 -->
title = ${title += "입니다" } <br />

<hr />
"10"+1 : ${"10"+1 } <br />
"10"+1 : ${"10"+=1 } <br />
"한글"+1 : ${"한글"+=1 } <br />
<%-- null +1 : ${null+1 } <br /> --%>
<script>
$(function(){});
</script>
</body>
</html>
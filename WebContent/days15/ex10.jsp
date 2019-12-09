<%@page import="java.io.FileReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 9. 오전 11:35:24</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<%
	// p 312 FileReader fr = null;
	String path = request.getParameter("path");
	try(FileReader fr = new FileReader(getServletContext().getRealPath(path))){
%>		<pre>
			소스코드 = <%=path %>
			<!-- 
			default 속성 : 출력할 값이 없을 경우 기본값 
			excapeXML 속성 : 특수 문자를 변환할 지의 여부
			-->
			<c:out value="<%=fr %>" default="" escapeXml="true"></c:out>
		</pre>		
<%	}catch(Exception e){
		e.printStackTrace();
	}
	

%>


<script>
$(function(){});
</script>
</body>
</html>
<%@page import="days14.Thermometer"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 6. 오후 2:18:40</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- (중요)EL에서 객체 메서드 호출하는 방법 -->
<%
	Thermometer t = new Thermometer();
	request.setAttribute("t", t);
%>
섭씨 저장 : ${ t.setCelsius("서울",27.3) } <br />
섭씨->화씨변환 : ${ t.getFahrenheit("서울") } <br />

<script>
$(function(){});
</script>
</body>
</html>
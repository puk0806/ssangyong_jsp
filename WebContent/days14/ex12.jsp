<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="elfunc" uri="/WEB-INF/tlds/el-functions.tld" %>
<%
   request.setAttribute("price", 12345);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>kenik - 2019. 12. 6. 오후 2:32:23</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- p 269 EL에서 정적(static)메서드를 사용하는 방법 1 -->
<!-- p 270 com.util.FormatUtil.java -->

오늘은 <b>${ elfunc:formatNumber(price,'#,##0') }</b>입니다.

<script>
$(function (){});
</script>
</body>
</html>
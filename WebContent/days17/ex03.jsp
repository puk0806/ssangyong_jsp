<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 11. 오전 9:39:57</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
	커스터 태그 사용... zttribute 지시자
<h1>텍스트 제목</h1>
<h3>EL 제목</h3>
<h6>표현식 제목</h6>
-->

<tf:header title="텍스트제목"></tf:header>
<tf:header title="${'EL 제목' }" level="3"></tf:header>
<tf:header title='<%="표현식 제목" %>' level="6"></tf:header>


<script>
$(function(){});
</script>
</body>
</html>
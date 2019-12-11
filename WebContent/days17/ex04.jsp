<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 11. 오전 10:07:10</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- select.tag -->
<!-- 태그 속성 동적할당 -->
<tf:select name="code" wb="흑백모드" rgb="RGB모드"></tf:select>
<tf:select name="genre" metal="메탈" ballad="발라드" rock="락"></tf:select>


<script>
$(function(){});
</script>
</body>
</html>
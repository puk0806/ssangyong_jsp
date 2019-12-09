<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 9. 오후 12:03:40</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
p315 p324 숫자 및 날자 포맷팅 처리 태크
fmt:formatNumber(숫자형식), 	fmt:formatDate(날짜형식)
fmt:parseNumber(변환숫자), 	fmt:parseDate(날짜변환)
 -->
 
<c:set var="price" value="12345"></c:set>
<!-- 세자리 마다 콤마 출력 -->
<fmt:formatNumber value="${price }" var="numberType"></fmt:formatNumber>
숫자 : ${numberType }
<!-- 통화량 표시 -->
통화 : <fmt:formatNumber value="${price }" type="currency" currencySymbol="\\"></fmt:formatNumber>
퍼센트 : <fmt:formatNumber value="${price }" type="percent" groupingUsed="false"></fmt:formatNumber>

<hr />
패턴 지정 : <fmt:formatNumber value="${price }" pattern="00000000.00"></fmt:formatNumber>

<hr />
<!-- p326 문자열 "1,100.12" 숫자 변환 -->
<c:set var="money" value="1,100.12"></c:set>
<fmt:parseNumber value="${money }" pattern="0,000.00" var="n"></fmt:parseNumber>
${n }
<script>
$(function(){});
</script>
</body>
</html>
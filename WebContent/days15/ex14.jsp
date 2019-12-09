<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 9. 오후 12:27:17</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
	<c:set var="str1" value="Functions 태그를 사용합니다."></c:set>
	<c:set var="str2" value="사용"></c:set>
	<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10"></c:set> 

	length(str1) = "${fn:length(str1) }" <br />
	toUpperCase(str1) = "${fn:toUpperCase(str1) }" <br />
	toLowerCase(str1) = "${fn:toLowerCase(str1) }" <br />
	substring(str1,3,6) = "${fn:substring(str1,3,6)}" <br />
	substringAfter(str1,str2) = "${fn:substringAfter(str1,str2) }" <br />
	substringBefore(str1,str2) = "${fn:substringBefore(str1,str2) }" <br />
	trim(str1) = ${fn:trim(str1) } <br />
	replace(str1,src,dest) = "${ fn:replace(str1,"","-")} <br />
	indexOf(str1,str2) = "${fn:indexOf(str1,str2) }" <br />
	startsWith(str1,str2) = "${fn:startsWith(str1,'Fun') }" <br />
	endsWith(str1,str2) = "${fn:endsWith(str1,'합니다') }"  <br />
	contains(str1,str2) = "${fn:contains(str1,str2) }" <br />
	containsIgnoreCase(str1,str2) = "${fn:containsIgnoreCase(str1,str2) }" <br />
	
	<c:set var="array" value="${fn:split(tokens,',')}"></c:set>
	
	join(array,"-") = "${fn:join(array,'-')}"  <br />
	excapeXml(str1) = "${fn:escapeXml(str1) }" <br />
	
<script>
$(function(){});
</script>
</body>
</html>
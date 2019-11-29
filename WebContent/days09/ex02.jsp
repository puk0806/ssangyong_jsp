<%@ page buffer="1kb" autoFlush="false"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 29. 오전 9:14:23</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 
버퍼 사용하지 않을 경우 : buffer="none""
1. jsp:forward 태그 사용 X
2. 즉시 클라이언트에게 전달되기에 취소 X
-->

<%
	// 맨위 autoFlush - false여서 (OverFlow 에러 발생)
	for(int i=0 ;i < 1000;i++){
%>	
		1234
<%	
		if(i%20==0){	
			//out.flush();	 // 수동으로 flush작업
			out.clear();	// 수동으로 clear작업
		}
	}
%>




<script>
$(function(){});
</script>
</body>
</html>
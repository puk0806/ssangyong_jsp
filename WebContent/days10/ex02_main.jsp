<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 2. 오전 9:37:33</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>ex02_main.jsp</h3>

<%-- <%@include %> --%>
<!-- 하나의 서브릿 파일을 사요 서블릿 파일을 공유한다. -->

<%@ include file="/include/variable.jspf"%>

<br />
<br />
main.jsp생성한 내용

<br />

<!-- jsp:include -->
<!-- flush =true이면 이전에 있던 응답 버퍼를 한번 출력해서 비우겠다 -->
<!-- flush = false이면 응답 버퍼를 비우지 않고 그대로 사용 (default : false) -->
<!-- 서블릿 클래스는 공유하지 않는다. -->
<!-- 변수 넘겨서 사용가능하다 -->
<jsp:include page="ex02_sub.jsp" flush="false">
	<jsp:param value="${ param.age }" name="age"></jsp:param>		
</jsp:include>
<%-- <%=name %> 	// include안에 있는 변수는 공유 되지 않는다	--%>
<br />
<br />
<br />
<br />
<br />

<script>
$(function(){});
</script>
</body>
</html>
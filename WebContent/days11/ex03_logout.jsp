<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 서버(톰캣) 세션 삭제
	session.invalidate();
%>

<script>
	alert("접속 종료했습니다.");
	location.href = "ex03_02.jsp";
</script>
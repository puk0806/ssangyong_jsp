<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag body-content="scriptless" %>

<%@ attribute name="begin" type="java.lang.Integer" required="true"  %>
<%@ attribute name="end" type="java.lang.Integer" required="true" %>
<!-- jsp 페이지에서 변수를 사용할수 있게 변수 넘겨 주기 -->
<!-- NESTED 값 : 시작태그와 닫기 태그 사이에서 사용할 변수 -->
<%@ variable name-given="sum" variable-class="java.lang.Integer" scope="NESTED" %>

<c:set var="sum" value="0"></c:set>
<c:forEach begin="1" end="10" step="1" var="i">
	${i += (i==10?"=":"+")  }
	<c:set var="sum" value="${sum +i}"></c:set> 
</c:forEach>

<jsp:doBody/>
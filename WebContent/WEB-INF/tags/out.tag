<%@ tag language="java" pageEncoding="UTF-8"%>
<!-- tagdependent 속성은 몸체 내용에 포함된 EL 또는 액션태그를 처리하지 않고 몸체 내용 자체를 텍스트 값으로 사용 -->
<%@ tag body-content="tagdependent"  %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:doBody var="bodyText" scope="page"></jsp:doBody>
<c:out value="${bodyText }" escapeXml="true"></c:out>

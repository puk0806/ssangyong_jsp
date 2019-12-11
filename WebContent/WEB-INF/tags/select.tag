<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="name" required="true" %>

<!-- 동적 속성 받기 -->
<%@ tag dynamic-attributes="optionMap" %>


<select name="${name}">
	<c:forEach items="${optionMap }" var="entry">
		<option value="${entry.key }">${entry.value} </option>
	</c:forEach>
</select>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String name = "hong";
	String age = request.getParameter("age");
%>

<!-- 파라미터 받아서 사용가능하다 -->
<h3>나이 : <%=age %></h3>
<h3>나이 : ${param.age }</h3>

<p>
공통 SUB 메뉴를 가진 부분
공통 SUB 메뉴를 가진 부분
</p>
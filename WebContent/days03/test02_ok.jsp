<%-- 
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
 --%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.*" %>
<%@page import="java.util.Map.*" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- JSTL 라이브러리를 사용하기 위해 지시자 사용  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>kenik - 2019. 11. 21. 오전 10:12:01</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<%-- 
	<%! %>
	<%= %>
	<% %>
 --%>

<!-- p 76  표 3.4 -->

<%-- 
<%
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String pet = request.getParameter("pet");
	String color = request.getParameter("color");
%>
name : <%=name %> <br />
gender : <%=gender %> <br />
pet : <%=pet %> <br />
color : <%=color %> <br />
 --%>
 
 <h3>EL 파라미터 값 출력</h3>
 ${param.name } <br />
 ${param.gender } <br />
 ${param.color } <br />
 
 ${paramValues.pet[0]} / ${paramValues.pet[1]} / ${paramValues.pet[2]}
 
 <hr>
<!-- p 292 표준 태그 라이브러리 (JSTL) : JSP에서 사용하는 흐름 제어하는 태그 -->
<c:forEach items="${paramValues.pet }" var="p">
	<li>${p }</li>
	
</c:forEach>
 
 
 
 <hr>
<%
/* 
http://localhost/jspPro/days03/test02_ok.jsp
?
 name=admin
 &
 gender=m
 &
 pet=pig
 &
 color=blue 
*/
 Enumeration<String> en = request.getParameterNames();
 while( en.hasMoreElements() ){
	 String p_name = en.nextElement();
	 //out.println( p_name );
%>
<%= p_name %><br>
<%	 
 }
%>



 
<hr>
<%
  // key(파라미터이름) value(값)
  Map<String, String[]> map =  request.getParameterMap();
  Set<Entry<String, String[]>> set = map.entrySet();
  Iterator<Entry<String, String[]>> ir = set.iterator();
  while( ir.hasNext() ){
	  Entry<String, String[]>  entry = ir.next();
	  String p_name = entry.getKey();
	  String[] p_values = entry.getValue();
	  
%>
  > <%= p_name %> :
  <%
    for( int i=0; i< p_values.length; i++)
    {
  %>
      <%= p_values[i] %> / 
  <%
    }
  %>  
  <br>
<%	  
  }
%>

<%
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	// URLEncoder.encode : url 넘길때 한글 인코딩 필요
	String url = String.format("test02_02.jsp?name=%s&gender=%s",URLEncoder.encode( name,"UTF-8"),gender);
	response.sendRedirect(url);
%>

<script>
$(function (){});
</script>
</body>
</html>

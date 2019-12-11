<%@tag import="java.util.Calendar"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="empty"  %>

<%
	Calendar cal =  Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	int day = cal.get(Calendar.DATE);
%>

<%=year %>년 <%=month %>월 <%=day %>일
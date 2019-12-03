<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 3. 오후 3:03:54</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<h3>ex02_03.jsp</h3>
<%
	Connection conn = null;
	try{
		conn = ConnectionProvider.getConnection();
%>		conn : <%=conn %>
<%	}catch (Exception e){
		e.printStackTrace();
	}finally{
		if(conn !=null) conn.close();
	}
	
%>


<script>
$(function(){});
</script>
</body>
</html>
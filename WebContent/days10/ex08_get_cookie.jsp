<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 2. 오후 3:18:41</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<%
	String c_name = request.getParameter("c_name");
	// if(c_name==null||c_name.equals(""))	return;		// F12로 body밑에 아무것도 없는거 확인()
	//if(!(c_name==null||c_name.equals(""))){		// 쿠키가 비어있지 않다면(존재한다면)
%>		
<form>
  확인할 쿠키 이름 : 	<input type="text" value="" name="c_name" required="required" /><br>
 <input type="submit" />
</form>
<%
	//}
%>

<%
   // ?XXXXX
   if( c_name != null && !c_name.equals("") ){	// 쿠키가 널이 아니거나 비어있지 않다면
	   Cookies cookies = new Cookies(request);
	   String c_value = cookies.getValue(c_name);
	   if( c_value == null){	// 검색 쿠키가있다면 없다면
		   %>
		  존재하지 않는 쿠키 입니다.
		   <%   
	   }else{					// 검색 쿠키가 존재한다면
		   %>
		   쿠키 값 :	<input type="text" value="<%= c_value %>" name="c_value" /><br>
		   <%		   
	   }
 	   
   }
%>



<script>
$(function(){});
</script>
</body>
</html>
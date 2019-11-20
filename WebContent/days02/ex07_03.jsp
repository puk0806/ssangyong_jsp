<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String getGender(String mw){
		String gender = "여자";
		if(mw.equals("m")) gender = "남자";
		return gender;
	}
%>

<%
	String gender = request.getParameter("gender"); 
	String[] pets = request.getParameterValues("pet");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오후 4:12:25</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

이름 : <%=name %> <br />
나이 : <%=age %> <br />
성별 : <%= getGender(gender) %> <br />
동물 : <%
		for(int i =0 ; i < pets.length; i++){
			%><%=pets[i] %>/<%
		}
	%>
	
	
	

<script>
$(function(){});
</script>
</body>
</html>
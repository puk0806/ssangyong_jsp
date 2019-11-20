<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// referer 참조자
	String prevURL = request.getHeader("referer");
	System.out.printf("이전페이지 %s\n",prevURL);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오전 9:39:47</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

	<%
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
	%>
	

이름은 : "<%=name %>"이고, 나이는 <%=age %>살 입니다.



</script>
</body>
</html>
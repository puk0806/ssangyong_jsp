<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ok = request.getParameter("ok");
	String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오후 4:41:01</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 
p 97 책 정독
p 93 리다이렉트를 이용해서 페이지 이동하기
-->
<a href="ex08_02.jsp">ex08_02.jsp</a>
<button>ex08_02.jsp</button>	<!-- JS함수 이용 -->

<h3>ex08.jsp</h3>
<form action="ex08_02.jsp">
	<%
		if(ok!= null){	// 값이 넘어오면
	%>		로그인 성공
	<%	}else if(error != null){
	%>
		로그인 실패 <br />
	
		id : <input type="text" name="id" value="admin"/> <br />
		pw : <input type="password" name="pw" value="1234"/> <br />
		<input type="submit">			
	<%	}else{
	%>		id : <input type="text" name="id" value="admin"/> <br />
			pw : <input type="password" name="pw" value="1234"/> <br />
			<input type="submit">			
	<%	}
	%>
	

</form>



<script>
$(function(){
	$("button").on("click",function(){
		location.href = "ex08_02.jsp";
	});
});
</script>
</body>
</html>
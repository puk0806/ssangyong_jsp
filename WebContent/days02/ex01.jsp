<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	// 전역 변수로 선언하기
	int n1;
	int n2;
	double result;
	String op = "+";
	
%>
<%
	// [scriptlet] 자바코딩

	try{
		n1 = Integer.parseInt(request.getParameter("num1"));
		n2 = Integer.parseInt(request.getParameter("num2"));
		op = request.getParameter("op");
		
		
		switch(op){
			case "+" : result = n1 +n2; break;
			case "-" : result = n1 -n2; break;
			case "*" : result = n1 *n2; break;
			case "/" : result = n1 /n2; break;
			case "%" : result = n1 %n2; break;
		}	
	}catch(Exception e){	
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오후 12:30:10</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<form>
	<input type="text" name = "num1" autofocus="autofocus" value="<%=n1 %>" />
	<select name="op" id="op">
		<option value="+" <%if(op.equals("+")){%>selected<%}%>>+</option>
		<option value="-" <%if(op.equals("-")){%>selected<%}%>>-</option>
		<option value="*" <%if(op.equals("*")){%>selected<%}%>>*</option>
		<option value="/" <%if(op.equals("/")){%>selected<%}%>>/</option>
		<option value="%" <%if(op.equals("%")){%>selected<%}%>>%</option>
	</select>
	
	<input type="text" name = "num2" autofocus="autofocus"  value="<%=n2 %>"/>
</form>

<p id="demo"><%=result %></p>


<script>
$(function(){
	$("form input:eq(1)").on("keyup",function(){
		if(event.which ==13){
			// 유효성 검사해서 ...
			$("form").submit();
		}
	});
});
</script>
</body>
</html>
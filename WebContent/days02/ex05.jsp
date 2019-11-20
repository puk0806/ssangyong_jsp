<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오후 3:32:22</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<%-- 
p65 스크립트 요소
1. 표현식	<%= %> 		!= 표현 언어 ${param.name}
2. 스크립트릿
3. 선언부	<%! %>	전역변수, 메서드 선언 부분
 --%>
 
 <%! 
 	int age;
 	public void dsip(){	
 		System.out.println("disp()~");
 	}
 %>
 <%!
 	String name ; 
	public int hap(int a, int b){
			return a+b;
	}
 %>
 
 <%
 	name = "한지민";
 	age = 38;
 %>
 
 이름 : <%= name %> <br />
 나이 : <%= hap(26,12) %>
 
 
 
 
<script>
$(function(){});
</script>
</body>
</html>
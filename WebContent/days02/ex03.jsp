<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오후 2:32:20</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>


<!-- ex03.jsp p50 -->
<%--
<%@ %>			-> 지시자
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
				<%@ page  	-> 페이지 지시자
				페이지의 설정
				1) contentType="text/html; charset=UTF-8"
					- contentType 속성 : JSP 페이지에서 생성할 문서 지정 
						(text/html : 텍스트형식의 html문서를 생성)
					- charset : 인코딩 형식
						(UTF-8, utf-8)
				2) pageEncoding="UTF-8"%>
p53 지시자의 종류
	1) page 지시자
	2) taglib 지시자
	3) include 지시자
	
p54 표현 언어(EL)

 --%>
<form action="ex03_ok.jsp">
	이름 : <input type="text" name="name" /><br />
	나이 : <input type="text" name="age" /><br />
	이메일 : <input type="text" name="email" /><br />
	<input type="submit" />
</form>





<script>
$(function(){});
</script>
</body>
</html>
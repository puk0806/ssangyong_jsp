<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오후 4:12:20</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<form action="ex07_03.jsp">

성별 : 
<input type="radio" name="gender" value="m" />
<input type="radio" name="gender" value="w" checked="checked"/> <br />
좋아하는 동물 : 
<input type="checkbox" name="pet" value="dog"/>강아지
<input type="checkbox" name="pet" value="cat"/>고양지
<input type="checkbox" name="pet" value="lion"/>사자
<input type="checkbox" name="pet" value="pig"/>돼지
<br />
<input type="button" value="prev" />
<input type="submit" value="next" />

<!-- 히든으로 숨겨둠 -->
<input type="hidden" name="name" value="${param.name }"/>	<!-- 이렇게 사용하면 위에 선언안해도 바로 사용 가능하다 -->
<input type="hidden" name="age" value="<%= age%>"/>

</form>


<script>
$(function(){});
</script>
</body>
</html>
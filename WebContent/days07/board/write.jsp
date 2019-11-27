<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 26. 오후 3:35:47</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
table, td, th {
	border: solid 1px gray;
}

table {
	border-spacing: 3px;
	border-collapse: separate;
}

table, tr, td {
	/* border-radius: 3px; */
	/* padding:3px;  */
	
}
</style>

</head>
<body>
<h3>write.jsp</h3>

<div align="center">
	<h2>새글쓰기</h2>
	<!-- [중요사항] action 속성 X -->
       <!-- Write 서블릿 post 호출 -->
	<form name="/jspPro/cstvsboard/write.htm" method="post">
		<table style="padding: 2px; width: 600px">
			<tr>
				<td colspan="2" align="center"><b>글을 적어주세요</b></td>
			</tr>
			<tr>
				<td align="center">이름</td>
				<td><input type="text" name="writer" size="15"
					autofocus="autofocus" required="required"></td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td><input type="password" name="pwd" size="15" required="required"></td>
			</tr>
			<tr>
				<td align="center">Email</td>
				<td><input type="email" name="email" size="50"></td>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td><input type="text" name="title" size="50" required="required"></td>
			</tr>
			<tr>
				<td align="center">내용</td>
				<td><textarea name="content" cols="50" rows="10"></textarea></td>
			</tr>
			<tr>
				<td align="center">HTML</td>
				<td><input type="radio" name="tag" value="1" checked>적용
					<input type="radio" name="tag" value="0">비적용</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				  <input type="submit" value="작성 완료">
				  &nbsp;&nbsp;&nbsp; 
				  <input type="reset" value="다시 작성">
				  &nbsp;&nbsp;&nbsp; 
				  <a href="/jspPro/board/list">Home</a>
				</td>
			</tr>
		</table>
	</form>
</div>


	<script>
$(function (){
	// emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/ ;
		 emailRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i 
	// $("[type='email']").attr("pattern", emailRegex)		
});

</script>
</body>
</html>
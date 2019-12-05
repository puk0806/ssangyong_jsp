<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 27. 오후 2:09:05</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
 table , td, th {
   border:solid 1px gray;
 }
 table{
     border-spacing: 3px;
     border-collapse: separate;
   }
   table,  tr, td {
    /* border-radius: 3px; */
    /* padding:3px;  */
   }
 table{
    width: 600px;
 }
</style>

</head>
<body>
<h3>delete.jsp</h3>
<div align="center">
  <h2>삭제하기</h2>
  <form action="/jspPro/board/delete.do" method="post">
<table>
  <tr>
    <td colspan="2" align="center"><b>글을 삭제합니다</b></td>
  </tr>
  <tr>
    <td align="center">비밀번호</td>
    <td>
      <input type="password" name="pwd" size="15" autofocus="autofocus">
    </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="submit" value="삭제">&nbsp;&nbsp;
      <!-- <input type="button" onClick="javascript:history.back();" value="취소"> -->
      <input type="button" id="cancel" value="취소">
    </td>
  </tr>
</table> 

<input type="hidden" name="seq" value="${param.seq }">

</form>
</div>

<!-- request.setAttribute("error", "비밀번호가 틀립니다."); -->
<c:if test="${not empty error }">
	<script>
		alert("${error}");
	</script>
</c:if>


<script>
$(function(){
	$("#cancel").click(function(){
		location.href = "/jspPro/board/content.do?seq=${param.seq}";
	});
	
});
</script>
</body>
</html>
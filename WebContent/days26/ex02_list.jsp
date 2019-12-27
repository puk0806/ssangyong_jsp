<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>kenik - 2019. 12. 27. 오전 8:05:49</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<h3 style="text-align:center">FileList - list.jsp</h3>
<table style="width:600px" border="1" align="center">
  <tr>
    <td align="right" colspan="4">
       <a href="write.do">WRITE</a>
    </td>
  </tr>
  <tr>
    <td align="center" width="50">글번호</td>
    <td align="left" >제목</td>
    <td align="center" width="200">첨부파일</td>
    <td align="center" width="50">삭제</td>
  </tr>
  <c:forEach items="${ list }" var="dto">
	  <tr>
	    <td align="center" width="50">${ dto.num }</td>
	    <td align="left" >${ dto.subject }</td>
	    <td align="center" width="200">
   <a href="/days26/upload/${ dto.filesystemname}">
   ${ dto.originalfilename}
   </a>
	      </td>
	    <td align="center" width="50">
	       <a href="delete.do?num=${ dto.num }&filesystemname=${ dto.filesystemname}">삭제</a>
	       <a href="update.do?num=${ dto.num }&filesystemname=${ dto.filesystemname}">수정</a>
	    </td>
	  </tr>
  </c:forEach>
</table>



<script>
$(function (){});
</script>
</body>
</html>
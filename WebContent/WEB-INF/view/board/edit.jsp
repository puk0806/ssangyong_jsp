<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 28. 오전 9:44:42</title>
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
    /*  padding:3px;  */
   }
	table{
	  width:600px;
	}
</style>
</head>
<body>
	<h3>edit.jsp</h3>
	
	<div align="center">
	    <h2>수정하기</h2>
	    <!-- [중요사항] action 속성 X -->
	  <form name="editForm" method="post">
	<table>
	  <tr>
	    <td colspan="2" align="center"><b>글을 수정합니다</b></td>
	  </tr>
	  <tr>
	    <td align="center">이름</td>
	    <td>
	      <input type="text" name="writer" size="15" value="${ dto.writer }">
	      ${ dto.writer }
	    </td>
	  </tr>
	  <tr>
	    <td align="center">Email</td>
	    <td>
	      <input type="text" name="email" size="50" value="${ dto.email }">
	      ${ dto.email }
	    </td>
	  </tr>
	  <tr>
	    <td align="center">제목</td>
	    <td>
	      <input type="text" name="title" size="50" value="${dto.title }">
	      ${dto.title }
	    </td>
	  </tr>
	  <tr>
	    <td align="center">내용</td>
	    <td>
	      <textarea name="content" cols="50" rows="10">${dto.content }</textarea>
	   </td>
	  </tr>
	 <tr>
	   <td align="center">HTML</td>
	   <td>
	   		<input type="radio" name="tag" value="1" >적용
	      	<input type="radio" name="tag" value="0">비적용      
	    </td>
	  </tr>
	 <tr>
		    <td align="center">비밀번호</td>
		    <td>
		      <input type="password" name="pwd" size="15">
		    </td>
	</tr>
	  <tr>
	  
	    <td colspan="2" align="center">
	      <input type="submit" value="작성 완료">&nbsp;&nbsp;
	      <input type="button" onClick="javascript:history.back();" value="이전으로">
	    </td>
	  </tr>
	</table> 
	 </form> 
	</div>
	
<script>
	// tag값 설정 스크립트 
	$(":radio[value=${dto.tag}]").attr("checked","checked");
	
	
</script>
</body>
</html>
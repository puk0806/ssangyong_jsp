<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 27. 오전 9:22:06</title>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"></script> -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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

  tbody tr  td:nth-of-type(2){
    text-align: left;
  }
  
  a{
     text-decoration: none;
     color:black;
  }
  a:hover{
     color:red;
  }
</style>
<!-- 페이징 처리 style -->
<style>
.pagination{
   margin: 0 auto;
    display: flex;
    justify-content: center;
}
.pagination a {
  color: black;
  float: left;
  padding: 4px 8px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: dodgerblue;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
<style>
 .serachWord{
   background-color: yellow;
   color:red;
 }
</style>
</head>
<body>
<h3>list.jsp</h3>


<div align="center">
 <h2>목록보기</h2>
 <table style="width:600px;" class="table">
   <thead>
	   <tr align="center">
	     <td>번호</td>
	     <td>제목</td>
	     <td>작성자</td>
	     <td>등록일</td>
	     <td>조회</td>
	  </tr>
  </thead>
  <tbody>
  <c:if test="${ empty list }">
     <tr align="center">
	    <td colspan="5" height="300px" align="center">등록된 게시가 없습니다</td>
	  </tr>
  </c:if>
  
  <c:if test="${ not empty list }">
    <c:forEach items="${ list }" var="dto">
	    <tr align="center">
		   <td>${ dto.seq }</td>
		    <td>
		       <a href="/jspPro/cstvsboard/content.htm?seq=${ dto.seq }"  class="subjectLink">${ dto.title }</a>
		    </td>
		    <td> 
		       <c:if test="${ dto.writer eq '한지민' }">
		         <img alt="" src="/jspPro/images/jimin.jpg" width="15px" height="">
		       </c:if>
		       <a href="mailto:${ dto.email }">${ dto.writer }</a>
		    </td> 
		    <td>${ dto.writeDate }</td>
		    <td>${ dto.readed }</td>
		    
		    
		  </tr>
	  </c:forEach>
		  
  </c:if> 
  </tbody>
  <tfoot>
    <tr>
      <td colspan="5" align="center">
         <div class="pagination"> 
		  <c:if test="${pageBlock.prev }">
		  	<a href="jspPro/cstvsboard/list.htm?currentPage=${pageBlock.start-1 }">&laquo;</a>
		  </c:if>
		  <c:forEach begin="${pageBlock.start}" end="${pageBlock.end}" step="1" var="i">
		  	
		  	
		  	<%--
		  	서버단에서 처리 
		  	<c:choose>
		  		<c:when test="${i eq pageBlock.currentPage }">
		  			<a href="#">${i }</a>		
		  		</c:when>
		  		<c:otherwise>
		  			<a href="/jspPro/cstvsboard/list.htm?currentPage=${i }">${i }</a>
		  		</c:otherwise>
		  	</c:choose> 	
		  	--%>
		  	<a href="/jspPro/cstvsboard/list.htm?currentPage=${i }">${i }</a>
		  </c:forEach>
		  <c:if test="${pageBlock.next }">
		  	<a href="jspPro/cstvsboard/list.htm?currentPage=${pageBlock.end+1 }">&raquo;</a>
		  </c:if>
		</div>
      </td>
    </tr>
    <tr>
      <td colspan="5" align="center">
      <form action="/jspPro/cstvsboard/list.htm">
         <select name="searchCondition" id="searchCondition">
         	<option value="1">title</option>
         	<option value="2">content</option>
         	<option value="3">writer</option>
         	<option value="4">title + content</option>
         </select>
         <input type="text" name="searchWord" id="searchWord" value="${ searchWord }">
         <input type="submit" value="search">
      </form>   
      </td>
    </tr>
  </tfoot>
 </table>
 
  <a href="/jspPro/cstvsboard/write.htm">글쓰기</a><br>
</div>



<script>
	// 현재 페이지는 #이동되는  페이지 
	$(".pagination a")
		.eq("${pageBlock.currentPage-1}")
		.addClass("attive")
		.attr("href","#");
</script>
</body>
</html>
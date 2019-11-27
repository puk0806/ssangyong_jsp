<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 27. 오후 12:21:29</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
<style>
  table{
     border-spacing: 3px;
     border-collapse: separate; 
   }
   table,  tr, td {
   	 border : solid; 
     border-radius: 3px; 
     padding:3px;   
   }
   
 #tblContent{
   width:600px;
 }
 
</style>

</head>
<body>
<h3>content jsp</h3>


<div align="center">
  <h2>내용보기</h2>
  <table id="tblContent" class="table">
   <tr>
       <td>이름</td>
       <td>${ dto.writer }</td>
       <td>등록일</td>
       <td>${ dto.writeDate }</td>
   </tr>
   <tr>
       <td>Email</td>
       <td><a href="mailto:${ dto.email }">${ dto.email }</a></td>
       <td>조회</td>
       <td>${ dto.readed }</td>
   </tr>
   <tr>
        <td>제목</td>
        <td colspan="3">${ dto.title }</td>
   </tr>
   <tr>
       <td colspan="4" style="padding:15px;height: 200px;text-align: left;vertical-align: top">${ dto.content }</td>
   </tr>
   <tr>
       <td colspan="4" align="center">
           <a href="/jspPro/cstvsboard/edit.htm?seq=${ dto.seq }" id="editLink">수정하기</a>
           <a href="/jspPro/cstvsboard/delete.htm?seq=${ dto.seq }" id="deleteLink">삭제하기</a>
           <a href="/jspPro/cstvsboard/list.htm" id="homeLink">Home</a>
           
           <input type="button" id="btnModalDelete" value="모달창으로 글 삭제">       
           
           <div align="center" id="dialog-form">
			  <h2>삭제하기</h2>
			  <form action="/jspPro/cstvsboard/delete.htm" method="post">
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
           
       </td>
   </tr>
</table>
</div>


<script>
$(function(){
	
	$("#cancel").click(function(){
		dialog.dialog("close");
	});
	
	$("#btnModalDelete").click(function(){
		dialog.dialog("open");	
	});
	
	function addUser(){
		
	}
	
	/* dialog함수는 jquery 함수가 아니라 jquery-ui의 함수이다!~!@#!@#@!#!@#! */
	dialog = $( "#dialog-form" ).dialog({
	      autoOpen: false,
	      height: 400,
	      width: 350,
	      modal: true,
	      
	      buttons: {
	        /* "Create an account": addUser,
	        Cancel: function() {
	          dialog.dialog( "close" );
	        } */
	      },
	      
	      close: function() {
	         form[ 0 ].reset();
	        //allFields.removeClass( "ui-state-error" );
	      }
	 });
	form = dialog.find( "form" )
});
</script>
</body>
</html>
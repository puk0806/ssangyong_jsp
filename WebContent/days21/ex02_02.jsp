<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 18. 오전 9:44:35</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
Now : <%=new Date().toLocaleString() %>

<hr />
<input id="btnAjax" type="button" value="jquery Ajax" /> <br />
<div id="demo"></div>




<script>
$(function(){
	$("#btnAjax").on("click",function(){
		// load() jQuery 함수 : Ajax처리 후 로딩 함수
		$("#demo").load("ex02_sample.txt",function (response,status,xhr){
			if(status=="error"){
				alert("요청 실패");
			}else if(status=="success"){
				alert("요청 성공");
			}
		});
	});
	
});
</script>
</body>
</html>
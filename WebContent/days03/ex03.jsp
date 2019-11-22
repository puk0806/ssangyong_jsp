<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 21. 오후 2:03:54</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
ex03.jsp
respose.sendredirect() / forward (포워드) 파이점
-->
메시지 : <input type="text" id="msg" name="msg" value="한글 메시지....." /> <br />
<a href="ex03_02.jsp" id="link">ex03_02.jsp</a>
<script>
$(function(){
	$("#link").on("click",function(){
		// alert("test");
		var msg = $("#msg").val();
		$(this).attr("href",function(i,val){
			// alert(val);	//ex03_02.jsp
			return val+"?msg="+msg;
		});
		// event.preventDefault();		// 기본 이벤트 제거
		
	});
	
});
</script>
</body>
</html>
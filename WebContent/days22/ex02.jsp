<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 19. 오전 9:10:53</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="httpRequest.js"></script>
<script>

	var timer ;
	function getEmpTopFive(){
		// js Ajax 처리
		var url = "ex02_empTopFive.jsp";
		var param = null;
		var method = "GET";
		sendRequest(url,param,callback,method)
		
		timer = setTimeout(getEmpTopFive,5000);
		
	}
	
	function callback(){
		if(httpRequest.readyState == 4){	// 데이터를 완전하게 전달받았으면
			if(httpRequest.status ==200){	// 요청을 성공받음
				document.getElementById("demo").innerHTML=httpRequest.responseText;
			}else{
				alert("JS Ajax 요청 실패"+httpRequest.status);
			}
		
		}
		
	}
</script>
<style>
</style>
</head>
<body>
<h3>ex02.jsp</h3>

<input type="button"  value="emp Top 5" onclick="getEmpTopFive()"/>
<hr />
<div id="demo"> </div>

<script>
$(function(){});
</script>
</body>
</html>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 18. 오전 10:30:09</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
<script>

	var httpRequest;
	
	function getXMLHttpRequest(){
		  if( window.ActiveXObject ){   		// 브라우저 Explore 인가 확인
	     	  try{
	     	     return new ActiveXObject("Msxml2.XMLHTTP");   // 
	     	  }catch(e){
	     		  try{
	     		    return new ActiveXObject("Microsoft.XMLHTTP");
	     		  }catch(e){
	     			  return null;
	     		  }
	     	  }
	       }else if( window.XMLHttpRequest ){	// 브라우저 Explore가 아닐경우
	     	  return new XMLHttpRequest();
	       }else{
	     	  return null;
	       }
	  }

	function jsAjax_click() {
		var name = document.getElementById("name").value;
		var age = document.getElementById("age").value;
		var url = "ex03_ajax.jsp?name=" + name+"&age="+age;
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = callback;
		httpRequest.open("GET", url, true);
		httpRequest.send(null);

	}
	
	function callback(){
		if(httpRequest.readyState == 4){	// 데이터를 완전하게 전달받았으면
			if(httpRequest.status ==200){	// 요청을 성공받음
				alert(httpRequest.responseText);
				document.getElementById("demo").innerHTML = httpRequest.responseText; 
			}
		}else{
			// alert("JS Ajax 요청 실패"+httpRequest.status);
		}
		
		
	}

</script>
</head>
<body>

<!-- 
	ex03.jsp 페이지에서 GET Ajax 요청
	
	요청 URL : ex03_ajax.jsp
	파라미터 값 있는 Ajax 요청
-->

NOW = <%= new Date().toLocaleString() %> <br />
<form action="" id="form1">
	name : <input type="text" id="name" name="name" value="홍길동" />
	age : <input type="text" id="age" name="age" value="20" />
	<input type="button" value="js ajax" onclick="jsAjax_click()"/> 
</form>
<div id="demo"></div>



<script>
$(function(){});
</script>
</body>
</html>
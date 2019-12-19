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

	
	function load(url) {
		// Ajax처리
		// 1. XMLHttpRequest 객체
		httpRequest = getXMLHttpRequest();
		// 4. 콜백함수 등록
		httpRequest.onreadystatechange = callback;
		// 2. open()
		httpRequest.open("GET",url,true);
		// 3. send()
		httpRequest.send(null);
	
	}
	
	function callback(){
		// 0,1,2,3,4(데이터 서버로 부터 전부 완전하게 전달받은 상태)
		if(httpRequest.readyState == 4){	// 데이터를 완전하게 전달받았으면
			if(httpRequest.status ==200){	// 요청을 성공받음
				alert(httpRequest.responseText);
			}
		}else{
			alert("JS Ajax 요청 실패"+httpRequest.status);
		}
		
	}
	
	
	
</script>
</head>
<body>
Now : <%=new Date().toLocaleString() %>

<hr />
<input type="button" value="javascript Ajax"  onclick="load('ex02_sample.txt')"/> <br />
<div id="demo"></div>




<script>
$(function(){});
</script>
</body>
</html>
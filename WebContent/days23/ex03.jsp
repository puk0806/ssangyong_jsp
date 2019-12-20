<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
	
	  $("#tags").keyup(function(){
		  var params = $("#form1").serialize();
		  $.ajax({
			url:"ex03_autocomplete.jsp"
			, dataType:"json"
			, type:"get"
			, data:params
			,cache:false
			,success: function(data){
				console.log(data);	// 데이터 확인작업
				$("#tags").autocomplete({
					source:data
					
				});
			}
		    ,error:function(){
		    	alert("에러~!");
		    }
		  
		  });
		  
	  });
	  
  
  
  } );
  </script>
</head>
<body>
 
<form action="" id="form1">
	<div class="ui-widget">
	  <label for="tags">Tags: </label>
	  <input id="tags" name="searchWord">
	</div>
</form>
 
 
</body>
</html>
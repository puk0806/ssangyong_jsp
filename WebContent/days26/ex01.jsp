<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 27. 오전 9:02:22</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<select id="cnt" name="cnt">
  <option>1</option>
  <option>2</option>
  <option>3</option>
  <option>4</option>
  <option>5</option>
</select>

<form action="ex01_ok.jsp" 
  method="post" enctype="multipart/form-data">
<div id="box">  
 <input type='file' name='attach1'><br> 
</div>
 <input type="submit" />
</form>


<script>
$(function (){
	$("#cnt").change(function(event) {
		var n = $(this).val();
		$("#box").empty();
		for( i=1; i<=n; i++){
			$("#box").append("<input type='file' name=attach"+i+" ><br>");
		}		
	});	
	
});
</script>


<script>
$(function(){});
</script>
</body>
</html>
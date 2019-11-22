<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 21. 오전 9:00:40</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- 
문제 2) test02.jsp  서브밋 버튼을 클릭하면  test02_ok.jsp
    페이지에서 입력파라미터 값을 출력하는  코딩. 
 -->
<form action="test02_ok.jsp">

	이름 : <input type="text" name="name" value="한지민"/> <br />
	성별 : <input type="radio" name="gender" value="m"/>남자
		  <input type="radio" name="gender" value="w" checked="checked"/>여자 <br />
	좋아하는 동물
	<input type="radio" name="pet" value="개" checked="checked"/>개
	<input type="radio" name="pet" value="돼지"/>돼지
	<input type="radio" name="pet" value="고양이"/>고양이 <br />
	좋아하는 색
	<select name="color" id="color">
		<option value="red">red</option>
		<option value="green" selected="selected">green</option>
		<option value="blue">blue</option>
	</select> 		  
	<br />
	<input type="submit" value="submit"/>
	<input type="button" value="reset"/>
</form>


<script>
$(function(){});
</script>
</body>
</html>
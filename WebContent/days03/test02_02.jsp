<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 21. 오전 11:14:00</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<%!
	String name;
	String gender;
%>
<%
	name = request.getParameter("name");
	gender = request.getParameter("gender");
%>
 
"<%=name %>"님 환영합니다 
<%=gender %>


<hr>
<%-- 
성별 : 	<input type="radio" name="gender" value="남자" checked="<%if(gender.equals("남자")){%>checked<%}%>"/>남자
		<input type="radio" name="gender" value="여자" checked="<%if(gender.equals("여자")){%>checked<%}%>"/>여자 <br />
 --%>
 
성별 :
<input type="radio" name="gender" value="m" />남자
<input type="radio" name="gender" value="w" />여자 <br />
		
좋아하는 동물
<input type="radio" name="pet" value="개" />개
<input type="radio" name="pet" value="돼지"/>돼지
<input type="radio" name="pet" value="고양이"/>고양이 <br />

<script>
$(function(){
	
	var url = location.href;	
	// http://localhost/jspPro/days03/test02_02.jsp?name=%ED%95%9C%EC%A7%80%EB%AF%BC&gender=w
	// alert(url); 
/* 
	var index = url.indexOf("gender");
	var startIndex = index + "gender".length+1;
	var gender = url.substr(startIndex, 1);
 */
 	var gender = '<%=gender%>'
 	alert(gender);
	if(gender =="m"){
		$(":radio:first").attr("checked","checked");
	}else{
		$(":radio:last").attr("checked","checked");
	}
	
	
});
</script>
</body>
</html>
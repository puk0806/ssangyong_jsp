<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 19. 오전 9:38:09</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

Now : <%= new Date().toLocaleString() %> <br />
<input type="button" id="btn1" value="jquery +ajax +json" />
<div id="demo"></div>

<script>
$(function(){
	$("#btn1").on("click",function(event){
		// get(), post(), getJSON(), getScript(), [load()]
		// ajax()

		$.ajax({
			url : "ex03_emp_json.jsp"
			,dataType:"json"
			,type : "GET"
			,cache : false		// 캐시 사용 false 중요!@!
			,success:function(data){	
				$(data.emp).each(function(index,element){
					var empno = element.empno;
					var ename = element.ename;
					$("#demo").append("<div>"+empno+" / "+ename+"</div>")
				});
			}
			,error:function(){
				alert("에러~")
			}
		});
		
	});
	
});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 20. 오전 9:02:21</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- emp 테이블에 사원 추가 페이지 -->
<form action="ex02_ok.jsp">
	deptno :  
	<select>
		<option value="10">ACCOUNTING</option>
		<option value="20" selected="selected">RESEARCH</option>					
		<option value="30">SALES</option>					
		<option value="40">OPERATIONS</option>					
	</select> <br />
	
	ename : <input type="text" name="ename" value="admin"/> <br />
	job : 	<input type="text" name = "job" value="SALESMAN"/> <br />
	empno : <input type="text" name="empno" id="empno" />
			<input type="button" value="empno 중복체크" id="empnoCheck" /> <br />
	<p id="notice"></p>
	<input type="submit" value="회원가입" />			
</form>

<script>
$(function(){
	
	
	$("#empnoCheck").on("click",function(){
		/*
		var empno = $("#empno").val();
		var params = "?empno="+empno;		// 얻어온 empno 가공해서 넘기기
		*/
		var params = $("form").serialize();	// 파라미터 가공해서 받아오기(여러개 파라미터받기가능)
		$.ajax({
			url:"ex02_idcheck.jsp"
			,dataType:"json"
			,type:"get"
			,data: params		
			,cache : false
			,success:function(data){	// {"count":1} 형태
				if(data.count==0){	// 사용가능한 empno
					$("#notice")
						.css("color","black")
						.text("사용가능한 empno입니다.")
				}else{				// 사용불가능한 empno
					$("#notice")
						.css("color","red")
						.text("사용중인 empno입니다.")
				}
			}
		});
	});
});
</script>
</body>
</html>
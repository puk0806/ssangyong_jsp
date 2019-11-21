<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String success = request.getParameter("success");
	String failure = request.getParameter("failure");
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 21. 오전 9:14:11</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	div{
		border: solid 1px gray;
		padding: 30px;
		width: 300px;
		
	}
</style>
</head>
<body>

<!--
  문제 3) test03.jsp 아이디와 비밀번호를 입력받아서 서브밋 될 때
test03_ok.jsp 에서 아이디가  "홍길동" 이고 비밀번호가
"1234"가 맞으면   test03.jsp?success 로 리다이렉트하고
test03 페이지에서 "홍길동"님 로그인 성공 이라 출력하고.       
로그인 실패시     test03.jsp?failure   로 리다이렉트하여
로그인 실패 경고창( alert )을 띄우고 다시 로그인 할 수 있도록 처리      
 -->        
 
 <%
 	if(success!=null){	// 로그인 실패 처음 방문 -> login 보이기			
%>		<div id="logout">
			<form action="">
				"홍길동"님 환영합니다 <br />
				<input type="submit" value="로그아웃" />
			</form>
		</div>
 				
<% 	}else{
%>	<div id="login">
		<form action="test03_ok.jsp">
			아이디 : <input type="text" name="id" value="홍길동" /> <br />
			비밀번호 : <input type="password" name="pw" value="1234"/> <br />
			<input type="submit" />
		</form>
	</div> 		
<% 	}
 
 %>     


		

<%-- 
	<%
		if(success!=null){
	%>	<%=id %>로그인성공입니다. <br />		
	<%	}else if(failure!=null){
	%>		로그인 실패입니다 다시시도하세요 <br />
			<form action="/jspPro/days03/test03_ok.jsp" method="post">
			아이디 : <input type="text" name="id"/>
			비밀번호  <input type="password" name="pw" />
			
			<button type="submit"></button>
			</form>
			
	<%	}else{		
	%>		<form action="/jspPro/days03/test03_ok.jsp">
			아이디 : <input type="text" name="id"/>
			비밀번호  <input type="password" name="pw" />
			
			<button type="submit" value="제출하기">제출하기</button>
			</form>	
			
	<%	}
	
	%>

 --%>


<script>
$(function(){
	// $("div#logout").hide();
	  if( '<%= failure %>' === "" ){
		  $("<span></span")
		    .appendTo($("#login"))
		    .text("> 다시 입력하세요.")
		    .css("color","red")
		    .show()
		    .fadeTo(3000, 0 , function (){
		    	$(this).remove();
		    	alert("로그인 실패!!!");  	
		    });	  
	  }
});
</script>
</body>
</html>
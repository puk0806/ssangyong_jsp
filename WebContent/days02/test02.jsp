<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	// 스크립트 요소 3가지
	// 	표현식 = 
	//	스트립트릿
	//	선언부	! : 변수, 메서드 선언
	int n;	// 클래스의 필드로 선언되어지고 초기화하지 않아도 자료형 기본값으로 초기화됨
%>
<%
	// 쿼리스트링(queryString ?num=10)
	String num =  request.getParameter("num"); 
	if(num != null){
		n = Integer.parseInt(num);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 20. 오전 9:19:45</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- 문제 2) days02폴더에  test02.jsp 파일 추가
    <input type="text">  입력 텍스트박스에 정수를 입력받아서
        서브밋 하면
        서버에서   1에서 입력 받은 정수의 합을 <div></div>요소에 출력해서
        응답하는 코딩.
    ( 조건 : 스크립트 요소 사용 - Expression, Scriptlet )
 -->
 
 <!-- action 비어있으면 자기자신 -->
<form action="" >
	<!-- name 속성으로 넘어감 -->
	<input type="text" name="num"  id="num" value="<%=n %>"><br>
	<button type="submit">제출 </button>
</form>

<span></span>
<div style="border: solid 1px gray; color: green;">
<%-- <%=n %> --%>
<%-- 
<%
	if(num!=null){
		out.print(n);
	}
%>
--%>
<%
	if(num!=null){
		int sum =0;
		for(int i = 1; i<=n;i++){
%><%= i%><%if(i!=n){
		%>+<%		
	}
	sum += i;			
	}%>=<%=sum%>
<%
} 
%>


</div>



<script>
$(function(){
	$("form").submit(function () {
		// 입력 받은 값에 대해 유효성 검사를 한 후
		// 숫자(정수)만 입력 [0-9]+
		var pattern = /^\d+$/ 
		var num = $("#num").val();
		
		if(pattern.test(num)) return;
		alert("test");
		
		$("span")
			.text("Not Valid")
			.css("color","red")
			.show()
			.fadeOut(3000);
		$("#num").select();
		event.preventDefault();	// js 이벤트 취소
	});
});

</script>
</body>
</html>
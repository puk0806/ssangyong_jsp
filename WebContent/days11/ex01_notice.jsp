<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="ex01_cookieAuth.jsp" %>
<%
/* 
	String contextPath = request.getContextPath();
	
	String auth = null;
	Cookies cookies = new Cookies(request);	// map
 */	
	
	if(cookies.exists("auth")){
		auth = cookies.getValue("auth");	//라이브러리안에 만들어논함수
	}
	else{
		// 로그인 하지 않은 경우 경고창 띄우고 로그인 페이지 이동
		out.println("<script>");
		out.println("alert('로그인 후 공지사항 사용 가능합니다.')");		
		out.println("location.href='ex01_default.jsp'");
		out.println("</script>");
		out.close();	// 출력 닫기
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 3. 오전 11:42:48</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<h3>공지사항</h3>

<ol>
	<li>Lorem ipsum dolor sit amet, consectetur adipisicing.</li>
	<li>Fugiat qui doloremque minima non dolorum dolorem.</li>
	<li>Maxime autem consequatur dolorum dignissimos modi aspernatur!</li>
	<li>Veniam voluptatum deserunt vero eveniet nihil reprehenderit.</li>
	<li>Tenetur dicta eaque iste nemo culpa facilis!</li>
	<li>Error exercitationem earum sit cupiditate tempora molestias.</li>
	<li>Natus ullam cupiditate esse labore officiis placeat!</li>
	<li>Consectetur similique harum incidunt facilis nostrum possimus!</li>
	<li>Rem natus incidunt amet porro aut fugiat.</li>
	<li>Quas deleniti quae inventore nulla nesciunt natus!</li>
	<li>Officiis doloremque facilis nulla eos officia eaque.</li>
	<li>Fuga praesentium odio ab temporibus architecto earum!</li>
	<li>Animi et eligendi voluptas dolorem maxime dicta.</li>
	<li>Excepturi minus earum soluta eius deleniti obcaecati!</li>
	<li>Doloremque quibusdam enim natus ut omnis possimus.</li>
	<li>Hic iusto vitae sequi reiciendis odit minus.</li>
	<li>Totam deserunt illo quisquam dicta voluptas assumenda!</li>
	<li>Tempore eos eveniet voluptas maxime veritatis deleniti.</li>
	<li>Autem delectus nobis excepturi labore quod assumenda!</li>
	<li>Perspiciatis rerum necessitatibus ad perferendis maiores nostrum.</li>
	<li>Eos in eius ab labore doloremque atque!</li>
	<li>Dolores non sit debitis nesciunt officiis quas.</li>
	<li>Quas libero atque ratione provident ullam rem.</li>
	<li>Ex veniam illo facilis illum exercitationem pariatur!</li>
	<li>Voluptate aperiam cum totam alias enim beatae.</li>
	<li>Sed id non voluptates omnis quibusdam quas.</li>
	<li>Repellat officia sapiente. Atque sit libero ab.</li>
	<li>Voluptatibus dolores accusantium voluptas assumenda accusamus quos.</li>
	<li>Nulla commodi amet laborum optio voluptatibus adipisci!</li>
	<li>Sint tempore impedit beatae magni incidunt minima!</li>
</ol>

<script>
$(function(){});
</script>
</body>
</html>
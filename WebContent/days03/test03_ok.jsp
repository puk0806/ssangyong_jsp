<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String location;
	
	if(id.equals("홍길동") && pw.equals("1234")){
		location = "test03.jsp?success&id="+id;
	}else{
		location = "test03.jsp?failure";
%>		
		<!-- 스크립트 태그는 클라이언트에서 실행 리다이렉트는 서버단 그래서 script태그는 실행되지 않는다. -->
		<script>
			alert("실패");
		</script>	
<%		
	}
	response.sendRedirect(location);
	
%>
<%@page import="oracle.net.aso.e"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="days03.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="days03.DeptDTO"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ksoob 2019. 11. 25. - 오전 11:47:00</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
   $(function() {
      $("#tabs").tabs();
   });
</script>
</head>
<body>
<h3>ex04.jsp EL+JSTL</h3>
	 <div id="tabs">
		  <ul>
		    <!-- map 키 반복해서 li -->
		    <c:forEach items="${map.keySet() }" var="dto">    	
	    		<li><a href="#tabs-${dto.deptno}">${dto.dname }(${dto.empCnt })명</a></li>
		    </c:forEach>
		  </ul>	
		   <div id="tabs-${dto.deptno } ">
		  	<p>
		  		<c:forEach items="${map}" var="entry">
		  			<div id="tabs-${entry.key.deptno }">
		  				<c:choose>
		  					<c:when test="${not empty entry.value }">	<!-- entry값이 존재한다면 -->
		  						<c:forEach items="${entry.value }" var="empDTO">
		  							<li>
			  							${empDTO.empno },
			  							${empDTO.ename },
		  							</li>		  						
		  						</c:forEach>
		  					</c:when>
		  					<c:otherwise>								<!-- entry 값이 존재하지 않는다면 -->
		  						존재 하지 않습니다.
		  					</c:otherwise>
		  				</c:choose>
		  			</div> 
		  		</c:forEach>
		  	</p>
		  	
		   </div>
	  </div>
	


   <script>
      $(function() {
      });
   </script>
</body>
</html>








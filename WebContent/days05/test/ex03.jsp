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
<%
   Map<DeptDTO, ArrayList<EmpDTO>> map = (Map<DeptDTO, ArrayList<EmpDTO>>) request.getAttribute("map");
%>
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
	 <div id="tabs">
	  <ul>
	    <!-- map 키 반복해서 li -->
	    <%
	      Set<DeptDTO> kset = map.keySet();
	      Iterator<DeptDTO> key_ir = kset.iterator();
	      while( key_ir.hasNext() ){
	    	  DeptDTO dto = key_ir.next();
	    %>
	      <li><a href="#tabs-<%= dto.getDeptno() %>"><%= dto.getDname() %>(<%= dto.getEmpCnt() %>)</a></li> 
	    <%	  
	      }
	    %>
	       
	       
	       
	  
	  </ul>
	  <%
	   Set<Entry<DeptDTO, ArrayList<EmpDTO>>> set = map.entrySet();
	   Iterator<Entry<DeptDTO, ArrayList<EmpDTO>>> s_ir=  set.iterator();
	   while(   s_ir.hasNext()  ){
		  Entry<DeptDTO, ArrayList<EmpDTO>> entry = s_ir.next();
		  DeptDTO dto = entry.getKey();
		  ArrayList<EmpDTO> elist = entry.getValue();
	  %>
	  <div id="tabs-<%= dto.getDeptno() %>">
	    <p>    
	    <%
	       Iterator<EmpDTO> e_ir =  elist.iterator();
	       if( e_ir.hasNext() ){
	    	   do{
	        	   EmpDTO empDTO = e_ir.next();
	        %>
	           <li>
	             <%= empDTO.getEmpno() %> /
	             <%= empDTO.getEname() %> /  
	           </li>
	        <%	   
	           }while( e_ir.hasNext());
	           
	        }else{
	    %>
	           <li>사원이 존재하지 않습니다.</li>
	    <%	   
	       }
	    %>    
	    </p>
	  </div>
	  <%	  
	   }
	  %>
	  
	  
	</div>
	


   <script>
      $(function() {
      });
   </script>
</body>
</html>








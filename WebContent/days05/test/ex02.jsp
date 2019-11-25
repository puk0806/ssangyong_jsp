<%@page import="java.util.Set"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@page import="days03.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="days03.DeptDTO"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 Map<DeptDTO, ArrayList<EmpDTO>> map
  = (Map<DeptDTO, ArrayList<EmpDTO>>)request.getAttribute("map");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>kenik - 2019. 11. 25. 오전 11:46:50</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>
  #accordion-resizer {
    padding: 10px;
    width: 350px;
    height: 220px;
  }
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#accordion" ).accordion({
      heightStyle: "fill"
    });
 
    $( "#accordion-resizer" ).resizable({
      minHeight: 140,
      minWidth: 200,
      resize: function() {
        $( "#accordion" ).accordion( "refresh" );
      }
    });
  } );
  </script>
</head>
<body>

<div id="accordion-resizer" class="ui-widget-content">
  <div id="accordion">
  
<%
Set<Entry<DeptDTO, ArrayList<EmpDTO>>> set = map.entrySet();

Iterator<Entry<DeptDTO, ArrayList<EmpDTO>>> ir = set.iterator();

while (ir.hasNext()) {
Map.Entry<DeptDTO, ArrayList<EmpDTO>> entry =	ir.next();

  DeptDTO deptDTO = entry.getKey();
%>

    <h3><%= deptDTO.getDeptno() %>[ <%= deptDTO.getDname() %> ] 
  - <%= deptDTO.getEmpCnt() %>명</h3>
    <div>
      <p>
      <ol>  
		<%
		// 사원 정보 출력
		ArrayList<EmpDTO> empList = entry.getValue();
		Iterator<EmpDTO> ir2 = empList.iterator();
		while (ir2.hasNext()) {
		EmpDTO empDTO = ir2.next();
		
		int empno = empDTO.getEmpno();
		String ename = empDTO.getEname();
		%>
		   <li><%=empno %> / <%= ename %></li>
		<%
		}
		%>
		</ol>
      </p>
      
    </div>
 <%
  }
  %> 
</div>
</div> 



<script>
$(function (){});
</script>
</body>
</html>

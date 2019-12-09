<%@page import="com.util.ConnectionProvider"%>
<%@page import="com.util.DBConn"%>
<%@page import="days03.DeptDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String sql = "select deptno, dname, loc from dept";
	ArrayList<DeptDTO> list = null;
	
	//  Connection conn =DBConn.getConnection();
	Connection conn = ConnectionProvider.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		pstmt = conn.prepareStatement(sql);
		rs =pstmt.executeQuery();
		if(rs.next()){
			int deptno;
			String dname,loc;
			DeptDTO dto;
			list = new ArrayList<>();
			 
			do{
				dto = new DeptDTO();
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				dto.setDeptno(deptno);
				dto.setDname(dname);
				dto.setLoc(loc);
				 
				list.add(dto);
			 }while(rs.next());
			
			request.setAttribute("list", list);
		 }
	}catch(Exception e){
		System.out.println("ex06.jsp \n"+e.toString());
	}
	
	conn.close();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 12. 9. 오전 10:35:51</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>

<!-- p303 c:forEach 흐름제어 -->
<table border="1" width="500px">
	<tr>
		<th>seq</th>
		<th>deptno</th>
		<th>dname</th>
		<th>loc</th>
	</tr>
	<c:choose>
		<c:when test="${not empty list }">
			<c:forEach items="${list}" var="dto" varStatus="status">
				<tr>
					<td>${status.index }/${status.count }/${status.first }/${status.last }</td>
					<td>${dto.deptno }</td>
					<td>${dto.dname }</td>
					<td>${dto.loc }</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="4">부서 존재 X</td>
			</tr>
		</c:otherwise>
	</c:choose>
</table>

<b>${list.size() }</b>

<script>
$(function(){});
</script>
</body>
</html>
<%@page import="java.util.Calendar"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  String sql = "with temp as ("
		  +"   select empno, ename, sal, "
		  +"          rank() over(order by sal desc) r "
		  +"   from emp "
		  +")"
		  +" select * from temp "
		  +" where r <= 5 ";
  
  Calendar cal = Calendar.getInstance();
  String now = String.format("%tT", cal);
  
  String responseText = "<h3>" + now + "</h3>";
  try{
	  conn =  ConnectionProvider.getConnection();
	  pstmt = conn.prepareStatement(sql);
	  rs =  pstmt.executeQuery();
	  responseText += "<ol>";
	  while(rs.next()){
		  int rank = rs.getInt("r");
		  int empno = rs.getInt("empno");
		  String ename = rs.getString("ename");
		  double sal = rs.getDouble("sal");
		  responseText +=String.format("<li>[%d] %d %s\t\t(%.2f)</li>"
				  , rank, empno, ename, sal);
	  } 
	  responseText +="</ol>";
  }catch(Exception e){
	  e.printStackTrace();
  }finally{
	  try{
		  pstmt.close();rs.close();conn.close();
	  }catch(Exception e){}
  }
%>
<%= responseText %>

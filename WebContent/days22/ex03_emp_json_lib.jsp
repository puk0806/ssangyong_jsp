<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
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
   String sql = "select empno, ename, sal "
			   + " from emp "
			   + " order by sal desc";
   // 자동으로 JSON객체 생성 라이브러리 사용
   JSONObject jsonData = null;

    
   try{
     conn = ConnectionProvider.getConnection();
     pstmt = conn.prepareStatement(sql);
     rs = pstmt.executeQuery();
     
   
     
     jsonData = new JSONObject();
   
     JSONArray empArray = new JSONArray();
     while( rs.next() ){
    	int empno = rs.getInt("empno");
    	String ename = rs.getString("ename");
		
    	JSONObject emp = new JSONObject();
    	emp.put("empno",empno);
    	emp.put("ename",ename);
    	
    	empArray.add(emp);
     }
     
     jsonData.put("emp",empArray);
       
     
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   pstmt.close();
	   rs.close();
	   conn.close();
   }
%>
<%= jsonData %>

<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String empno = request.getParameter("empno");
   String sql = "select count(*) cnt from emp where empno = ?";
   // 0 사용 가능   1 사용 불가능 
   // Ajax 는 테스트후 사용!!(비동기여서 찾기힘듬)
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   JSONObject data = null;  
   try{
	   conn = ConnectionProvider.getConnection();
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, empno);
	   rs =  pstmt.executeQuery();
	   
	   rs.next();
	   int cnt = rs.getInt("cnt");	   
	   data = new JSONObject();
	   data.put("count", cnt); // {"count":1} JSON 객체 형태로 반환
   }catch(Exception e){
	   e.printStackTrace();
   }finally{
	   try{
		   pstmt.close();		   rs.close();		   conn.close();
	   }catch(Exception e){}
   }
%>
<%= data %>


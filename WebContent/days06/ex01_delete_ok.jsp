<%@page import="java.util.Arrays"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
  public String arrayJoin(String glue, String array[]) {
    String result = "";
    for (int i = 0; i < array.length; i++) {
      result += array[i];
      if (i < array.length - 1) result += glue;
    }
    return result; // "10,20"
  }
%>

<%
	// 삭제할 사원 번호들
	String empno = request.getParameter("empno");

	
	Connection con = null;
	Statement stmtEmp;
	
	try {
		// 1
		String sql = String.format( "delete from tbl_emp where empno in (%s) ",empno);	
		
		con = DBConn.getConnection();
		stmtEmp = con.createStatement();
		int result = stmtEmp.executeUpdate(sql);
		stmtEmp.close();
		
		if( result != 0 ){
			//  
		}			
		DBConn.close();
		
	} catch (Exception e) {  // 
		e.printStackTrace();
	} 
	String params="";
	
	String[] deptnos = request.getParameterValues("deptno");
	if( deptnos != null ){
		for (int i = 0; i < deptnos.length; i++) {
			params += "deptno="+ deptnos[i]+"&";
		}
		params = params.substring(0, params.length()-1);
	}

	
	 
	 
	String location = "ex01.jsp?"+params; 		 
	response.sendRedirect(location);
%>

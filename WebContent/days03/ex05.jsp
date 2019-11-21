<%@page import="java.util.Iterator"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="days03.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sql = "select deptno, dname, loc from dept";
	ArrayList<DeptDTO> list = null;
	
	Connection conn =DBConn.getConnection();
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
		 }
	}catch(Exception e){
		System.out.println("ex05.jsp \n"+e.toString());
	}
	
	DBConn.close();
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 21. 오후 3:32:22</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
}

.alert.success {background-color: #4CAF50;}
.alert.info {background-color: #2196F3;}
.alert.warning {background-color: #ff9800;}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
</style>
</head>
<body>

<h3><a href="/jspPro/dept">/jspPro/dept</a></h3>



<ol>
	<%
		Iterator<DeptDTO> ir = list.iterator();
		while(ir.hasNext()){
			DeptDTO dto = ir.next();
	%>		
		<li><%=dto.getDname() %>(<%=dto.getDeptno() %>)</li>
	<%		
		}
	%>
</ol>

<hr>

	<%
		ir = list.iterator();
		while(ir.hasNext()){
			DeptDTO dto = ir.next();
	%>	
		<input type="checkbox" id="" value=" <%=dto.getDeptno() %>" />
		<%=dto.getDname() %>(<%=dto.getLoc() %>) <br />
	<%		
		}
	%>

<hr />

<select name="deptno" id="deptno">
	<%
		ir = list.iterator();
		while(ir.hasNext()){
			DeptDTO dto = ir.next();
	%>		
		<option value="<%=dto.getDname() %>">
			<%=dto.getDeptno() %>
		</option>
		
	<%		
		}
	%>
</select>

<hr>
<div style="width: 400px">
	<%
		ir = list.iterator();
		while(ir.hasNext()){
			DeptDTO dto = ir.next();
	%>		
		<div class="alert">
	  		<span class="closebtn">&times;</span>  
	  		<strong><%=dto.getDeptno() %></strong><%=dto.getDname() %>
		</div>
	<%		
		}
	%>
</div>


<hr />

<table>
	<%
		ir = list.iterator();
		while(ir.hasNext()){
			DeptDTO dto = ir.next();
	%>		
		<tr>
			<td><%=dto.getDeptno() %></td>
			<td><%=dto.getDname() %></td>
			<td><%=dto.getLoc() %></td>
		</tr>		
	<%		
		}
	%>
</table>


<script>
/* 
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
  close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
}
 */
 $(function(){
	 $(".closebtn").on("click",function(){
		 $(this).parent().css("opacity","0");
		 setTimeout(() =>{
			 $(this).parent().css("display","none")
		 },600); 
	 });
 });
 </script>

</body>
</html>
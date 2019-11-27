<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.util.DBConn"%>
<%@page import="days03.DeptEmpDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="days03.DeptDTO"%>
<%@page import="java.util.ArrayList"%>
<%!
public String arrayJoin(String glue, String array[]) {
	// ?deptno=10&deptno=30....	넘어옴
	// glue - 구분자로 ',' 들어올 예정
    String result = "";
    for (int i = 0; i < array.length; i++) {
      result += array[i];
      if (i < array.length - 1) result += glue;
    }
    return result; // "10,20"
}
%>

<%
	String[] deptnos = request.getParameterValues("deptno");
	// request.setAttribute("deptnos", deptnos);
	String result =  deptnos == null ? "10,20,30,40" : arrayJoin(",", deptnos);
	//
	Connection con = null;
	Statement stmtDept , stmtEmp, stmtJob;
	ResultSet rsDept, rsEmp, rsJob;
	ArrayList<DeptDTO> deptList = null;
	ArrayList<DeptEmpDTO> empList = null;
	ArrayList<String> jobList = null;
	
	try {
		// 1
		String sql = "select deptno, dname from dept";	
		con = DBConn.getConnection();
		stmtDept = con.createStatement();
		rsDept = stmtDept.executeQuery(sql);
		if( rsDept.next()){
			deptList = new ArrayList<>();
			do{					
				DeptDTO dto = new DeptDTO(); 
					dto.setDeptno( rsDept.getInt("deptno") );
					dto.setDname( rsDept.getString("dname") );
					deptList.add(dto);
			}while(rsDept.next());
		}
		rsDept.close();
		stmtDept.close();
		
		request.setAttribute("deptList", deptList);
		//
		// 2
		sql = "select d.deptno, d.dname,  e.empno, e.ename, e.mgr , job " 
			     +" ,to_char( e.hiredate, 'yyyy/MM/dd') hiredate,  sal, comm , sal+nvl(comm, 0) pay " 
			     +"  from tbl_emp e join dept d on e.deptno = d.deptno "
			     //+" where d.deptno in (10,20,30,40) "
			     +" where d.deptno in (" + result + ")"
			     +" order by d.deptno asc ";
		stmtEmp = con.createStatement();
		rsEmp = stmtEmp.executeQuery(sql);
		if( rsEmp.next()){
			empList = new ArrayList<>();
			do{					
				DeptEmpDTO dto = new DeptEmpDTO(); 
					dto.setEmpno( rsEmp.getInt("empno") );
					dto.setEname( rsEmp.getString("ename") );
					dto.setMgr( rsEmp.getInt("mgr") );
					dto.setJob( rsEmp.getString("job"));
					dto.setHiredate(rsEmp.getString("hiredate"));
					dto.setSal(rsEmp.getDouble("sal"));
					dto.setComm(rsEmp.getDouble("comm"));
					dto.setPay(rsEmp.getDouble("pay"));
					
					dto.setDeptno( rsEmp.getInt("deptno") );
					dto.setDname( rsEmp.getString("dname") );	
				
				empList.add(dto);
			}while(rsEmp.next());
		}
		
		request.setAttribute("empList", empList);
		
		rsEmp.close();
		stmtEmp.close();
		
		// 3
		sql  = "select  distinct job from emp order by job asc";
		stmtJob = con.createStatement();
		rsJob = stmtJob.executeQuery(sql);
		
		if( rsJob.next()){
			jobList = new ArrayList<>();
			do{	 
				String job = rsJob.getString("job") ; 
				jobList.add(job);
			}while(rsJob.next());
		}
		
		request.setAttribute("jobList", jobList);
		
		stmtJob.close();
		rsJob.close();
		
		DBConn.close();	 
	} catch (Exception e) {  // 
		e.printStackTrace();
	} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>chanho - 2019. 11. 27. 오전 8:22:11</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
/* The container */
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

#allDeptno:checked ~ .checkmark
{
  background-color: red;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
</style>
<!-- table style -->
<style>
#employees {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#employees td, #employees th {
  border: 1px solid #ddd;
  padding: 8px;
}

#employees tr:nth-child(even){background-color: #f2f2f2;}

#employees tr:hover {background-color: #ddd;}

#employees th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
<!-- exec style -->
<style>
.exec {
  display: block;
  width: 100%;
  border: none;
  background-color: #4CAF50;
  color: white;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}

.exec:hover {
  background-color: #ddd;
  color: black;
}
</style>
</head>
<body>
<form action="">
<h3>부서선택</h3>
	<label class="container">
		모두선택
		<input type="checkbox" id="allDeptno" />
		<span class="checkmark"></span>	
	</label>
	
	<c:forEach items="${deptList }" var="dto">
		<label class="container">
			<input type="checkbox" name="deptno" value="${dto.deptno }"/>${dto.dname }
			<span class="checkmark"></span>
		</label>
	</c:forEach>
	<button type="submit" class="exec" id="dept_ok">확인버튼</button>
</form>

<!-- 부서 선택 관련 스크립트 -->
<script>
	// 모두 선택 체크 버튼 눌렀을때 -> 부서 체크 상태 변화
	/* $("#allDeptno").change(function(){
		if($("#allDeptno").is(":checked")){
			$(".container :checkebox[name='deptno']").prop("checked","checked");
		}else{
			$(".container :checkbox[name='deptno']").prop("checked","");
		}
	}); */
	$("#allDeptno").change(function(){
		if($("#allDeptno").is(":checked")){
			$(".container :checkbox[name='deptno']").prop("checked","checked");	
		}else{
			$(".container :checkbox[name='deptno']").prop("checked","");
		}
	});
	
	// 부서 체크 버튼 눌럿을때 -> 모두 선택 체크 상태 변화
	$(".container :checkbox[name='deptno']").change(function(){
		var cnt = $(":checkbox[name='deptno']").length;
		var checkCnt = $(":checkbox[name='deptno']:checked").length;
		if(checkCnt == cnt){
			$("#allDeptno").prop("checked","checked");
		}else{
			$("#allDeptno").prop("checked","");	
		}
	});
	
	
</script>

<h3>사원 출력</h3>
<table id="employees">
	<thead>
		<tr>
			<th><input type="checkbox" /></th>
		    <th>no</th>
		    <th>deptno</th>
		    <th>dname</th>
		    <th>empno</th>
		    <th>ename</th>
		    <th>mgr</th>
		    <th>job</th>
		    <th>hiredate</th>
		    <th>sal</th>
		    <th>comm</th>
		    <th>pay</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${empty empList }">
				<tr>
					<td colspan="12" style="height: 100px;text-align: center;">사원이 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${empList }" var="dto" varStatus="status">
					<tr>
						<td><input type="checkbox" value="${ dto.empno }" name="empno"/></td>
						<td>${status.count}</td>		<!-- foreach문에서 순서 번호 주기 -->
						<td>${ dto.deptno }</td>
						<td>${ dto.dname }</td>
						<td>${ dto.empno }</td>
						<td>${ dto.ename }</td>
						<td>${ dto.mgr }</td>
						<td>
							<select id="${dto.empno }">
								<c:forEach items="jobList" var="job">
									<c:choose>
										<c:when test="${dto.job eq job }">
											<option value="${job }" selected="selected">${job }</option>
										</c:when>
										<c:otherwise>
											<option value="${job }">${job } </option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</td>
						<td>${ dto.hiredate }</td>
			   			<td>${ dto.sal }</td>
			   			<td>${ dto.comm }</td>
			   			<td>${ dto.pay }</td>
			   		</tr>		
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

</body>
</html>
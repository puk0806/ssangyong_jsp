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
<title>chanho - 2019. 11. 26. 오전 8:34:46</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- checkbox style -->
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
<form action="/jspPro/days06/ex01.jsp">
<h3>부서 선택 :</h3>  

<label class="container"> 모두 선택
 <input type="checkbox" id="allDeptno" >
 <span class="checkmark"></span>
</label>

<c:forEach items="${deptList }" var="dto">
  <label class="container">
	  <input type="checkbox" name="deptno"  value="${dto.deptno}"> ${dto.dname }
	  <span class="checkmark"></span>
  </label>
</c:forEach>


<button type="submit" class="exec" id="dept_ok">확인 버튼</button>
</form>

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
    <c:when test="${ empty empList }">
       <tr>
	     <td colspan="12" style="height: 100px;text-align: center;">사원이 존재하지 않습니다.</td>
	   </tr>
    </c:when>
    <c:otherwise>
       <c:forEach items="${ empList }" var="dto" varStatus="status">
         <tr>
           <td><input type="checkbox" value="${ dto.empno }" name="empno"/></td>
		   <td>${status.count}</td>		<!-- foreach문에서 순서 번호 주기 -->
		   <td>${ dto.deptno }</td>
		   <td>${ dto.dname }</td>
		   <td>${ dto.empno }</td>
		   <td>${ dto.ename }</td>
		   <td>${ dto.mgr }</td>
		   <td>
		   <!-- 직업이 똑같은거 선택하게 하기  -->

			<!--	풀이 1 --> 
		   	<select id="${dto.empno }">
		   		<c:forEach items="${jobList }" var="job">
		   			
		   			<%-- <option value="${job }" ${dto.job == job ? "selected" : ""}>${job }</option> --%>
		   			<c:choose>
		   				<c:when test="${ dto.job eq job}">			
		   					<option value="${job }" selected="selected">${job }</option>
		   				</c:when>
		   				<c:otherwise>
		   					<option value="${job }" >${job }</option>
		   				</c:otherwise>
		   			</c:choose>
		   		</c:forEach>
		   	</select>
		   	 
		   	 <%-- 풀이 2 
		   	 
		   	 <div id="demo">
		   		<h3>types of job</h3>
			   		<select class="job">
			   			<c:forEach items="${jobList }" var="job">
			   				<option value="${job }">${job }</option>
			   			</c:forEach>
			   		</select>

		   	 </div>
 			--%>
<!-- 
  <option>ANALYST</option>
  <option>ARTIST</option>
  <option>CLERK</option>
  <option>MANAGER</option>
  <option>PRESIDENT</option>
  <option>SALESMAN</option>
   -->
</select>
</div>
		   	 
		   	 
		   </td>   
		   <td>${ dto.hiredate }</td>
		   <td>${ dto.sal }</td>
		   <td>		   
		   ${ dto.comm }
		   </td>
		   <td>${ dto.pay }</td>
		</tr>
       </c:forEach>
    </c:otherwise>
  </c:choose>  
  </tbody>
  <tfoot>
    <tr>
      <td colspan="12">
	     <form action="ex01_delete_ok.jsp" id="form1">
	          <input type="hidden" id="h_empno" name="empno" value="" /> 
	          <input type="button" id="delbtn" value="delete" />
	      </form>
      </td>
    </tr>
  </tfoot>
</table>

<script>
// '모두선택'체크 선택박스 선택하면 모두 선택되는 스크립트
	$("#allDeptno").change(function(){
		if($("#allDeptno").is(":checked")){
			$(".container :checkbox[name='deptno']").prop("checked","checked");	
		}else{
			$(".container :checkbox[name='deptno']").prop("checked","");
		}
	});
	
	// 체크 선택박스에 의해서 '모두선택' 체크 바뀌는 스크립트
	$(":checkbox[name='deptno']").change(function(){
		var cnt = $(":checkbox[name='deptno']").length;
		var checkCnt = $(":checkbox[name='deptno']:checked").length;
		if(checkCnt == cnt){
			$("#allDeptno").prop("checked",true);
		}else{
			$("#allDeptno").prop("checked",false);
		}
	});
</script>
<script>
	// 확인버튼 눌러도 남겨두는 스크립트
	var url = location.href;
		var pattern = /[?&]/;
		var result = url.split(pattern);			// 패턴으로 자르기
		for (var i = 1; i < result.length; i++) {
		   if(result[i].indexOf("deptno") != -1) {
		      deptno = result[i].replace("deptno=",""); // 10,30 번만남음
		      $(":checkbox[value="+deptno+"]").prop("checked",true);
		   }
		}
</script>
<script>
	// 직업 맞게 선택되는 스크립트
	/* 	
		풀이2
	$("employees tbody tr").each(function(){
		var job =$('td:eq(7)',this).html();		// td의 7번째(job의 위치)
		var empno = $('td:eq(4)',this).html();	// empno값 가져오기
		
		var cmb = $(".job")						// job클래스 복사
					.clone()
					.removeClass("job")
					.prop("id",empno)
					.val(job);
		$("td:eq(7)",this)
					.empnty()
					.prepend(cmb);		// prepend: 자식으로 추가
		
	}); 
	*/
	// 각 tr 태그 안의 부서select 변경시 실제 DB도 수정
	$("#employees tbody tr select").change(function(){
		var empno = $(this).attr("id");
		var job = $(this).val();
		// alert(job);
		var deptnos = location.href.substr(location.href.indexOf("?")+1);		// 뒤에 deptno들 잘라오기
		// alert(deptnos);
		var params = "empno="+empno+"&job="+job+"&"+deptnos;
		location.href="/jspPro/days06/ex01_edit_ok.jsp?"+params;
	});
</script>

<script>
	// 체크된거 val로 넣어주는 스크립트
	$(":checkbox[name=empno]").change(function(){
		var del_empnos =[];
		$(":checkbox[name=empno]:checked").each(function(){
			del_empnos.push($(this).val());	
		});
		$(":hidden").val(del_empnos.join(","));
		
	});


</script>

<script>
	// delete해도 체크 버튼 유지되게하는 스크립트
	$("#delbtn").click(function(){
		var url = $("#form1").attr("action");
		var deptnos = location.href.substr(location.href.indexOf("?"));
		url += deptnos;
		url +="&empno="+$("#h_empno").val();
		alert(url);
		// $(this).attr("action",url);
		location.href=url;
		
	});
</script>




</body>
</html>
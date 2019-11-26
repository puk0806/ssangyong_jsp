package days05;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days03.DeptDTO;
import days03.EmpDTO;

/**
 * Servlet implementation class SelfMapServlet
 */
@WebServlet("/days05/self/map.do")
public class SelfMapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelfMapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<DeptDTO,ArrayList<EmpDTO>> map = new LinkedHashMap<DeptDTO, ArrayList<EmpDTO>>();
		
		Connection conn = null;
		PreparedStatement pstmtDept= null , pstmtEmp = null;
		ResultSet rsDept = null, rsEmp = null;
		String sql =null;
		
		
		
		try {
			conn = DBConn.getConnection();
			sql = "select deptno, dname,loc,(select count(*) from emp where deptno = dept.deptno)n from dept";
			
			pstmtDept = conn.prepareStatement(sql);
			rsDept = pstmtDept.executeQuery();
			
			DeptDTO dept =null;
			int deptno;
			if(rsDept.next()) {
				
				do {
					dept = new DeptDTO();
					deptno = rsDept.getInt("deptno");
					dept.setDeptno(deptno);
					dept.setEmpCnt(rsDept.getInt("n"));
					dept.setDname(rsDept.getString("dname"));
					dept.setLoc(rsDept.getString("loc"));
					
					sql = "select * from emp where deptno ="+deptno;
					pstmtEmp = conn.prepareStatement(sql);
					rsEmp = pstmtEmp.executeQuery();
					
					ArrayList<EmpDTO> elist = new ArrayList<EmpDTO>();
					if(rsEmp.next()) {
						
						int empno,mgr,sal,comm;
						String ename,job;
						Date hiredate;
						EmpDTO emp;
						do {
							empno = rsEmp.getInt("empno");
							mgr = rsEmp.getInt("mgr");
							sal = rsEmp.getInt("sal");
							comm = rsEmp.getInt("comm");
							ename = rsEmp.getString("ename");
							job =rsEmp.getString("job");
							hiredate = rsEmp.getDate("hiredate");
							
							emp = new EmpDTO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
							elist.add(emp);
						}while(rsEmp.next());
						
					}
					map.put(dept, elist);
				}while(rsDept.next());
			}
			
			rsEmp.close();
			rsDept.close();
			pstmtEmp.close();
			pstmtDept.close();
			DBConn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		request.setAttribute("map", map);
		String path= "/days05/self/test03.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

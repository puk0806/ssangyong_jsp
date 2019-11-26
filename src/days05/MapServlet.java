package days05;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
 * Servlet implementation class MapServlet
 */
@WebServlet("/days05/map.do")
public class MapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<DeptDTO, ArrayList<EmpDTO>> map = new LinkedHashMap<DeptDTO, ArrayList<EmpDTO>>();
		Connection conn = DBConn.getConnection();
		Statement stmtDept = null, stmtEmp = null;
		ResultSet rsDept = null, rsEmpt = null;

		StringBuffer sql = new StringBuffer();
		sql.append("select deptno, dname,loc ,(select count(*) from emp where deptno = dept.deptno ) n from dept");

		try {
			stmtDept = conn.createStatement();
			rsDept = stmtDept.executeQuery(sql.toString());

			int deptno, empCnt;
			String dname, loc;

			DeptDTO dept = null;
			while (rsDept.next()) {
				deptno = rsDept.getInt("deptno");
				empCnt = rsDept.getInt("n");
				dname = rsDept.getString("dname");
				loc = rsDept.getString("loc");

				dept = new DeptDTO();
				dept.setDeptno(deptno);
				dept.setDname(dname);
				dept.setEmpCnt(empCnt);
				dept.setLoc(loc);

				sql.setLength(0);
				sql.append(String.format("select * from emp where deptno = %d", deptno));

				stmtEmp = conn.createStatement();
				rsEmpt = stmtEmp.executeQuery(sql.toString());

				int empno, mgr, sal, comm;
				String ename, job;
				Date hiredate;

				ArrayList<EmpDTO> list = null;
				list = new ArrayList<EmpDTO>();
				if (rsEmpt.next()) {
					
					
					EmpDTO temp = null;
					do {
						empno = rsEmpt.getInt("empno");
						mgr = rsEmpt.getInt("mgr");
						sal = rsEmpt.getInt("sal");
						comm = rsEmpt.getInt("comm");
						ename = rsEmpt.getString("ename");
						job = rsEmpt.getString("job");
						hiredate = rsEmpt.getDate("hiredate");

						temp = new EmpDTO(empno, ename, job, mgr, hiredate, sal, comm, deptno);

						list.add(temp);
						
					} while (rsEmpt.next());

					
				}
				map.put(dept, list);
				System.out.println(map.size());
				
			}
			
			
			rsEmpt.close();
			stmtEmp.close();
			rsDept.close();
			stmtDept.close();
			DBConn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("map", map);
		String path = "/days05/test/ex03_02.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

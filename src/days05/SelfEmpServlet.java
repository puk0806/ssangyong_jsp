package days05;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days03.EmpDTO;

/**
 * Servlet implementation class selfEmpServlet
 */
@WebServlet("/self/employee.do")
public class SelfEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelfEmpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<EmpDTO> elist = null;
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String deptno = request.getParameter("deptno");
		String sql = "select * from emp where deptno = "+deptno;
		
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			elist = new ArrayList<EmpDTO>();
			if(rs.next()) {
				int empno,mgr;
				String ename,job;
				Date hiredate;
				double sal, comm;
				
				EmpDTO dto ;
				do {
					empno = rs.getInt("empno");
					mgr = rs.getInt("mgr");
					ename = rs.getString("ename");
					job = rs.getString("job");
					hiredate = rs.getDate("hiredate");
					sal = rs.getDouble("sal");
					comm = rs.getDouble("comm");
					
					dto = new EmpDTO(empno, ename, job, mgr, hiredate, sal, comm, Integer.parseInt(deptno));
					
					elist.add(dto);
				}while(rs.next());
			}
			rs.close();
			pstmt.close();
			DBConn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("elist", elist);
		String path = "/days05/self/test02.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

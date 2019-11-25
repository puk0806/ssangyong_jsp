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
 * Servlet implementation class EmpServlet
 */
@WebServlet("/test/employee.do")
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public EmpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<EmpDTO> elist = null;
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String deptno = request.getParameter("deptno");
		String sql = 	"select * from emp where deptno in "+deptno;
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				elist = new ArrayList<EmpDTO>();
				int empno,mgr;
				String ename,job;
				Date hiredate ;
				double sal,comm;
				int no;
				EmpDTO dto;

				do {
					empno = rs.getInt("empno");
					mgr = rs.getInt("mgr");
					ename = rs.getString("ename");
					job = rs.getString("job");
					hiredate = rs.getDate("hiredate");
					sal = rs.getDouble("sal");
					comm = rs.getDouble("comm");
					no = Integer.parseInt(deptno); 
					
					dto = new EmpDTO(empno, ename, job, mgr, hiredate, sal, comm, no);
					
					elist.add(dto);
					
				}while(rs.next());
				
				rs.close();
				pstmt.close();
				DBConn.close();
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("elist",elist);
		
		String path = "/days05/test/test02.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

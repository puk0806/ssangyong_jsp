package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

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
 * Servlet implementation class DeptEmpServlet
 */
@WebServlet({ "/DeptEmpServlet", "/days04/deptemp" })
public class DeptEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeptEmpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html; charset=UTF-8");
		
		
		ArrayList<DeptDTO> dlist = null;
		ArrayList<EmpDTO> elist = null;
		
		
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		
		try {
			conn = DBConn.getConnection();
			sql = "select * from dept";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dlist= new ArrayList<DeptDTO>();
				int deptno;
				String dname, loc;
				DeptDTO dto;
				
				
				do{
					dto = new DeptDTO();
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");
					dto.setDeptno(deptno);
					dto.setDname(dname);
					dto.setLoc(loc);
					
					dlist.add(dto);
				 }while(rs.next());
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConn.close();
		try {
			
			conn = DBConn.getConnection();
			String[] deptnos = request.getParameterValues("deptno");
			String args = "10";
			if(deptnos !=null) {
				args = "";
				for (int i = 0; i < deptnos.length; i++) {
					args +=  deptnos[i]+",";
				}
				args = args.substring(0, args.length()-1);
			}
		
			sql = String.format("select * from emp where deptno in (%s)", args);
			System.out.println(sql);
			System.out.println(args);
			
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			elist= new ArrayList<EmpDTO>();
			if(rs.next()) {
				
				int deptno,empno;
				String ename, job;
				Date hiredate;
				double sal;
				EmpDTO dto;
				
				
				do{
					empno = rs.getInt("empno");
					ename = rs.getString("ename");
					job = rs.getString("job");
					deptno = rs.getInt("deptno");
					sal = rs.getDouble("sal");
					hiredate = rs.getDate("hiredate");
		
					dto = new EmpDTO(empno, ename, job, 0, hiredate, sal, 0, deptno);
					
					elist.add(dto);
				 }while(rs.next());
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConn.close();

		request.setAttribute("dlist", dlist);
		request.setAttribute("elist", elist);
		
		String path = "/days04/test/test03_info.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}	

}

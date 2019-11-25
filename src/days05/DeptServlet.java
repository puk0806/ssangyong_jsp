package days05;

import java.io.IOException;
import java.sql.Connection;
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

import days03.DeptDTO;

/**
 * Servlet implementation class ex01Servlet
 */
// @WebServlet("/days05/test/dept.do")
public class DeptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeptServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<DeptDTO> dlist = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from dept";
			conn= DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dlist = new ArrayList<DeptDTO>();
				int deptno;
				String dname,loc;
				DeptDTO dto ;
				do {
					dto = new DeptDTO();
					dto.setDeptno(rs.getInt("deptno"));
					dto.setDname(rs.getString("dname"));
					dto.setLoc(rs.getString("loc"));			
					
					dlist.add(dto);
				}while(rs.next());	
			}
			
			rs.close();
			pstmt.close();
			DBConn.close();
		} catch (SQLException e) {
			System.out.println("DeptServlet.doget() 에러");
			e.printStackTrace();
		}

		
			request.setAttribute("dlist", dlist);
		
			String path = "/days05/test/test01.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

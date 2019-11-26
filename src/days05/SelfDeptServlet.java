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
 * Servlet implementation class SelfDeptServlet
 */
@WebServlet("/days05/self/dept.do")
public class SelfDeptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SelfDeptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<DeptDTO> dlist = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from dept";
		
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			dlist = new ArrayList<DeptDTO>();
			if(rs.next()) {
				int deptno;
				String dname,loc;
				DeptDTO dto;
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
			e.printStackTrace();
		}
		
		request.setAttribute("dlist", dlist);
		
		String path = "/days05/self/test01.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

/**
 * Servlet implementation class Dept
 */
@WebServlet("/dept")
public class Dept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		//  request인잡값으로 담아서 보냄
		request.setAttribute("list", list);	
		
		String path = "/days03/ex06.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		
		dispatcher.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

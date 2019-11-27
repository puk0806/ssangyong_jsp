package days07.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

@WebServlet("/cstvsboard/delete.htm")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Delete() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path ="/days07/board/delete.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//
		int seq = Integer.parseInt(  request.getParameter("seq")  ); 
		String p_pwd = request.getParameter("pwd");
	
		Connection con = null;
		PreparedStatement pstmt = null;		
		int resultCnt = 0 ;
		
		try {
			// seq의 password select
			String sql = "select pwd "
								+ "from cstvsboard "
								+ "where seq = ?";
			con = DBConn.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String o_pwd  = rs.getString("pwd");
			rs.close();
			if( !o_pwd.equals(p_pwd) ) {
				request.setAttribute("error", "비밀번호가 틀립니다.");
				doGet(request, response);
				DBConn.close();
				return;
			}
			
			//
			sql = "delete from cstvsboard "
					+ " where seq = ?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, seq);
			resultCnt = pstmt.executeUpdate();
			pstmt.close();
			DBConn.close();
		} catch (Exception e) {  // 
			e.printStackTrace();
		} 


		// 글 목록 페이지 이동
		//     /board/list GET요청 -> List.java -> days05/list.jsp 응답
		String location="/jspPro/cstvsboard/list.htm";		
		if( resultCnt == 1 ) {			location += "?delete=success";		}
		response.sendRedirect(location);	
	}

}

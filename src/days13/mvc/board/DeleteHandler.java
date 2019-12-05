package days13.mvc.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days13.mvc.command.CommandHandler;

public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		String viewPage = null;
		if(method.equals("GET")) {
			viewPage = doGet(request, response);
		}else if(method.equals("POST")) {
			doPost(request, response);
		}
		return viewPage;
	}
	
	
	protected String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		return "delete";
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
				String location="/jspPro/board/delete.do?delete=fail&seq="+seq;		
				response.sendRedirect(location);
				
				return ;
			}
		
		
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


		String location="/jspPro/board/list.do?delete=success";		
		response.sendRedirect(location);	
	}

}

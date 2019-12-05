package days13.mvc.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days07.board.BoardDTO;
import days13.mvc.command.CommandHandler;

public class EditHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 일반 클래스 이기떄문에 get,post 여부를 코딩으로 물어봐야한다.
				String method = request.getMethod(); // 요청 방식 얻어오기(get,post)
				String viewPage = null;

				if (method.equals("GET")) { // GET방식일 경우
					viewPage = doGet(request, response);
				} else if (method.equals("POST")) { // POST방식일 경우
					doPost(request, response);
					return null;
				}
				return viewPage;

	}
	
	
	protected String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("edit doget호출");
		
		String pSeq = request.getParameter("seq");
		int seq = 0;
		if(pSeq !=null) seq = Integer.parseInt(pSeq);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO dto = null;
		
		
		try {
			String sql = "select * ";
			sql += "from cstvsboard ";
			sql += "where seq = ? ";
			
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setSeq(seq);
				dto.setWriter(rs.getString("writer"));
				dto.setEmail(rs.getString("email"));
				dto.setTitle(rs.getString("title"));
				dto.setTag(rs.getInt("tag"));
				dto.setContent(rs.getString("content"));
				dto.setWriteDate(rs.getDate("writedate"));
				dto.setReaded(rs.getInt("readed"));
			}
		} catch (SQLException e) {
			System.out.println("Edit서블릿 doget 에러");
			e.printStackTrace();
		}finally {
			try {
				if(rs!= null) rs.close();
				if(pstmt!=null)	pstmt.close();
				DBConn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("dto", dto);
		
		
		return "edit";		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("Edit dopost 호출");
		
		request.setCharacterEncoding("UTF-8");
		int resultCnt =0;
		
		String seq = request.getParameter("seq");
		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String tag = request.getParameter("tag");
		
		BoardDTO boardDto = new BoardDTO();
		boardDto.setSeq(Integer.parseInt(seq));
		boardDto.setWriter(writer);
		boardDto.setPwd(pwd);
		boardDto.setEmail(email);
		boardDto.setTitle(title);
		boardDto.setContent(content);
		boardDto.setTag(Integer.parseInt(tag));
		
		Connection con = null;
		PreparedStatement pstmt = null;
				
		try {
			String sql="update cstvsboard " +
					" set writer=? ,email =? , title = ? , content = ? , tag = ? "+
					"where seq = ? and pwd = ? ";	
			
			con = DBConn.getConnection();
			pstmt = con.prepareStatement(sql);			
						
			pstmt.setString(1, boardDto.getWriter());
			pstmt.setString(2, boardDto.getEmail());
			pstmt.setString(3, boardDto.getTitle());
			pstmt.setString(4, boardDto.getContent());
			pstmt.setInt(5, boardDto.getTag());
			pstmt.setInt(6, boardDto.getSeq());
			pstmt.setString(7, boardDto.getPwd());
			
			resultCnt = pstmt.executeUpdate();
			System.out.println("> resultCnt : " + resultCnt);
			pstmt.close();
			DBConn.close();
		} catch (Exception e) {  // 
			System.out.println("edit.java doPost() 예외 발생");
			e.printStackTrace();
		} 
		
		
		
		String location = "/jspPro/board/content.do?seq"+seq+"&edit=success";
		response.sendRedirect(location);
		
	}

}

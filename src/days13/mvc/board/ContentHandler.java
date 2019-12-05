package days13.mvc.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days07.board.BoardDTO;
import days13.mvc.command.CommandHandler;

public class ContentHandler implements CommandHandler{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		int seq = Integer.parseInt(request.getParameter("seq"));
	 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO dto = null;
		
		// request.setAttribute("list", list);
		
		String sql = "update cstvsboard ";
		sql += "set readed = readed+1 ";
		sql += "where seq = ? ";
		
		
		try {
			// 조회수 1증가
			conn = DBConn.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			
			int cnt  = pstmt.executeUpdate();
			// 해당 게시글 set
			sql = "select seq, writer, email, title, content, readed, writedate, pwd, tag ";
			sql += "from cstvsboard ";
			sql += "where seq = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setSeq(seq);
				dto.setWriter(rs.getString("writer"));
				dto.setEmail(rs.getString("email"));
				
				dto.setTag(rs.getInt("tag"));
				dto.setWriteDate(rs.getDate("writedate"));
				dto.setReaded(rs.getInt("readed"));
				// html태그 적용X
				String title =  rs.getString("title");
				title =  title.replace("<", "&lt;");
				title = title.replace(">", "&gt;");
				dto.setTitle(title);
				
				
				String content = rs.getString("content");
				content = content.replace("\r\n", "<br>");
				if(rs.getInt("tag") != 1) {
					content =  content.replace("<", "&lt;");
					content = content.replace(">", "&gt;");
				}
				dto.setContent(content);
				
				
			}
			
			
		} catch (SQLException e) {
			System.out.println("List.java doGet() 예외 발생");
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
		// 포워딩
		
		request.setAttribute("dto", dto);
		return"content";
	}
	
	
	
}

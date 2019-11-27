package days07.board;

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


@WebServlet("/cstvsboard/content.htm")
public class Content extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Content() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("Content.doGet호출");
		// 1. seq 해당 게시글 조회수 1증가
		// 2. seq 해당 게시글 select -> BoardDTO dto -> setAtt...
		
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
				dto.setTitle(rs.getString("title"));
				dto.setTag(rs.getInt("tag"));
				dto.setContent(rs.getString("content"));
				dto.setWriteDate(rs.getDate("writedate"));
				dto.setReaded(rs.getInt("readed"));
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
		String path = "/days07/board/content.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

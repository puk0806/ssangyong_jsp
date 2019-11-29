package copy.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days07.board.BoardDTO;

/**
 * Servlet implementation class CopyWrite
 */
@WebServlet("/cstvsboard/copywrite.htm")
public class CopyWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CopyWrite() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/copydays07/board/write.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String tag = request.getParameter("tag");

		BoardDTO boardDto = new BoardDTO();
		boardDto.setWriter(writer);
		boardDto.setPwd(pwd);
		boardDto.setEmail(email);
		boardDto.setTitle(title);
		boardDto.setContent(content);
		boardDto.setTag(Integer.parseInt(tag));
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultCnt = 0;
		String sql = null;
		
		
		try {
			sql="insert into cstvsboard " +
				" ( seq, writer, pwd, email, title, content, tag) "+
				" values "+
				" ( seq_cstvsboard.nextval,?,?,?,?,?,?)";	
			
			
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, boardDto.getWriter());
			pstmt.setString(2, boardDto.getPwd());
			pstmt.setString(3, boardDto.getEmail());
			pstmt.setString(4, boardDto.getTitle());
			pstmt.setString(5, boardDto.getContent());
			pstmt.setInt(6, boardDto.getTag());
			
			resultCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("copywrite dopost()호출");
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			
		String location ="/jspPro/cstvboard/copylist.htm";
		if(resultCnt == 1) location += "?write=succeess";
		response.sendRedirect(location);
		
	}

}

package days13.mvc.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.Cookies;
import com.util.DBConn;

import days07.board.BoardDTO;
import days13.mvc.command.CommandHandler;

public class WriteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 일반 클래스 이기떄문에 get,post 여부를 코딩으로 물어봐야한다.
		String method = request.getMethod(); // 요청 방식 얻어오기(get,post)
		String viewPage = null;

		if (method.equals("GET")) { // GET방식일 경우
			viewPage = doGet(request, response);
		} else if (method.equals("POST")) { // POST방식일 경우
			viewPage = doPost(request, response);
			String location="/jspPro/board/list.do?write=success";
			response.sendRedirect(location);	
			return null;
		}
		return viewPage;

	}

	protected String doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		return "write";
			
	
	}

	// 입력 값을 가지고 DB inserting -> 글목록 페이지로 이동
	protected String doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		//
		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String tag = request.getParameter("tag");

		//
		BoardDTO boardDto = new BoardDTO();
		boardDto.setWriter(writer);
		boardDto.setPwd(pwd);
		boardDto.setEmail(email);
		boardDto.setTitle(title);
		boardDto.setContent(content);
		boardDto.setTag(Integer.parseInt(tag));
		//
		Connection con = null;
		PreparedStatement pstmt = null;
		int resultCnt = 0;
		try {
			String sql = "insert into cstvsboard " + " ( seq, writer, pwd, email, title, content, tag) " + " values "
					+ " ( seq_cstvsboard.nextval,?,?,?,?,?,?)";

			con = DBConn.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, boardDto.getWriter());
			pstmt.setString(2, boardDto.getPwd());
			pstmt.setString(3, boardDto.getEmail());
			pstmt.setString(4, boardDto.getTitle());
			pstmt.setString(5, boardDto.getContent());
			pstmt.setInt(6, boardDto.getTag());

			resultCnt = pstmt.executeUpdate();
			System.out.println("> resultCnt : " + resultCnt);
			pstmt.close();
			DBConn.close();
		} catch (Exception e) { //
			System.out.println("Writer.java doPost() 예외 발생");
			e.printStackTrace();
		}

		// 글 목록 페이지 이동
		// /board/list GET요청 -> List.java -> days05/list.jsp 응답
		return "list.do?write=success";
			
	}

}

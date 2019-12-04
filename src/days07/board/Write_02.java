package days07.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.Cookies;
import com.util.DBConn;

// @WebServlet("/cstvsboard/write.htm")
public class Write_02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Write_02() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.print("Write doget호출");
		/*
		  String location = "/jspPro/days07/board/write.jsp";
		  response.sendRedirect(location);
		*/
		
		// [로그인 인증] 받았는 지 확인 후에 X
		// ex01_default.jsp 로그인 페이지로 이동
		// auth 쿠키값이 존재하는지 확인
		
		String auth = null;
		Cookies cookies = new Cookies(request); // map
		if(  cookies.exists("auth") ){		// 로그인 되어있다면
			   auth = cookies.getValue("auth");  
			   //
				String path = "/days07/board/write.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);	
		}else {								// 로그인 되어있지 않다면
			String location = "/jspPro/days11/ex01_default.jsp";
			/*
			 String path = "/days11/ex01_default.jsp"; 
			 RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			 dispatcher.forward(request, response);
			 */
			String referer = request.getRequestURI();	// 돌아갈 URL
			Cookie cookie = Cookies.createCookie("referer", referer, "/", -1);
			response.addCookie(cookie);
			
			response.sendRedirect(location);
			
		}
	}

	// 입력 값을 가지고 DB inserting -> 글목록 페이지로 이동
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("> Register.doPost()...");
		// 한글 깨짐 처리 : ( POST 방식 )
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
		int resultCnt = 0 ;
		try {
			String sql="insert into cstvsboard " +
					" ( seq, writer, pwd, email, title, content, tag) "+
					" values "+
					" ( seq_cstvsboard.nextval,?,?,?,?,?,?)";	
			
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
		} catch (Exception e) {  // 
			System.out.println("Writer.java doPost() 예외 발생");
			e.printStackTrace();
		}	
		
		// 글 목록 페이지 이동
		//     /board/list GET요청 -> List.java -> days05/list.jsp 응답
		String location="/jspPro/cstvsboard/list.htm";		
		if( resultCnt == 1 ) {			location += "?write=success";		}
		response.sendRedirect(location);		
	}

}

package days01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NowServlet extends HttpServlet{

	// 서블릿 규약
	// 1. 접근 지정자 : public
	// 2. HttpServlet 클래스를 상속
	// 3. service(), doGet(), dePost() 구현
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// super.doGet(req, resp);
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		                                                                   
		out.println("<!DOCTYPE html>                                           ");
		out.println("<html>                                                    ");
		out.println("<meta charset='UTF-8'>");
		out.println("	<head>                                                   ");
		out.println("		<title>chanho - 2019. 11. 19. 오전 11:30:39</title>  ");
		out.println("	</head>                                                  ");
		out.println("	<body>                                                   ");
		
		/*지금 <%= new Date() %>*/
		Date now = new Date();
		out.println("지금 : "+ now);
		
		out.println("	</body>                                                  ");
		out.println("</html>                                                   ");
		
	}
	/*
	 * @Override protected void doPost(HttpServletRequest req, HttpServletResponse
	 * resp) throws ServletException, IOException { // super.doPost(req, resp); }
	 * 
	 * @Override protected void service(HttpServletRequest request,
	 * HttpServletResponse response) throws ServletException, IOException { //
	 * super.service(req, resp);
	 * 
	 * }
	 */
	
	
	
}

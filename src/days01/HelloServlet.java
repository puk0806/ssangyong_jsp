package days01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* @WebServlet(urlPatterns = "/days01/hello")*/

@WebServlet(urlPatterns = { "/hello", "/days01/hello" }		//url패턴 여러개 주기
//,loadOnStartup = 2				// init 순서 설정
, initParams = {		// web.xml이용 하지 않고 어노테이션 이요해서 파라미터 사용
		@WebInitParam(name="user", value = "scott")
		,@WebInitParam(name="password", value = "tiger")
		,@WebInitParam(name="url", value = "jdbc:oracle:thin:@localhost:1521:xe")
		,@WebInitParam(name="jdbcdriver", value = "oracle.jdbc.driver.OracleDriver")
})

public class HelloServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("하이");
		
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("init Hello 호출");
		// JDBC드라이버 로딩, USER PWD 설정
	
	}

	
	
}

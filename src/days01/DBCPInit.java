package days01;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DBCPInit extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet 호출");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost 호출");
	}

	// 서블릿 객체가 생성될 떄 호출되는 메서드
	// 최초 요청이 있을때 서블릿 객체는 한번 생성되고 그때 호출되는 메서드 : init()
	// 서블릿 객체 초기화
	@Override
	public void init() throws ServletException {
		System.out.println("init DBCP 호출");
		// JDBC드라이버 로딩, USER PWD 설정
		loadJDBCDriver();
		initConnectionPool();
		
	}

	private void initConnectionPool() {
		/*
		String className = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		*/
	}

	// jdbc드라이버 읽어옴 (유지 보수 쉬움)
	private void loadJDBCDriver() {
		String className =this.getInitParameter("jdbcdriver");
		String url = this.getInitParameter("url");
		String user =this.getInitParameter("user");
		String password = this.getInitParameter("password");
		
		String pooName =  this.getInitParameter("poolName");	// 없으면 null반환
		if(pooName ==null) {	// 없을 경우 초기화 가능
			pooName = "xxx";
		}
		
	}

	/*
	@Override
	public void init(ServletConfig config) throws ServletException {
		
	}
	*/

	
	
	
}

package days12.mvc.hello;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days12.mvc.command.CommandHandler;

public class HelloHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("hello", "헬로우");
		request.setAttribute("now", "");
		// return "/WEB-INF/view/hello.jsp";
		return "hello";
	}
	
}
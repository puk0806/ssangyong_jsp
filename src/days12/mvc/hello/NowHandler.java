package days12.mvc.hello;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days12.mvc.command.CommandHandler;

public class NowHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("hello", "");
		request.setAttribute("now",new Date().toLocaleString());
		// return "/WEB-INF/view/hello.jsp";
		return "hello";
	}
	
}

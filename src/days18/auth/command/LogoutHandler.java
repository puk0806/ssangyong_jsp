package days18.auth.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import days18.mvc.command.CommandHandler;
 

public class LogoutHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		
		//res.sendRedirect(req.getContextPath() + "/index.jsp");
		response.sendRedirect(request.getContextPath() + "/index.do");
		return null;
	}

}
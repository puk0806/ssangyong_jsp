package days18.auth.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import days18.auth.service.LoginFailException;
import days18.auth.service.LoginService;
import days18.auth.service.User;
import days18.mvc.command.CommandHandler; 
 

public class LoginHandler implements CommandHandler {

	private static final String FORM_VIEW = "/days18/auth/loginForm";
	private LoginService loginService = new LoginService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest request
			, HttpServletResponse response) 
	throws Exception {
		String memberid = trim(request.getParameter("memberid"));
		String password = trim(request.getParameter("password"));

		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);

		if (memberid == null || memberid.isEmpty())
			errors.put("memberid", true );
		if (password == null || password.isEmpty())
			errors.put("password", true );

		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}

//String referer =  request.getHeader("Referer");
//System.out.println("> LoginHandler - referer : " + referer);
		try {
			User user = loginService.login(memberid, password);
			request.getSession().setAttribute("authUser", user);
			//res.sendRedirect(req.getContextPath() + "/index.jsp");
	HttpSession session = request.getSession(false);
	if ( session.getAttribute("referer") != null) {
		response.sendRedirect( (String)session.getAttribute("referer") );
	}else {
		response.sendRedirect(request.getContextPath() + "/index.do");
	}
			
			return null;
		} catch (LoginFailException e) {			
			errors.put("idOrPwNotMatch", true );
			return FORM_VIEW;
		}
	}

	private String trim(String str) {
		return str == null ? null : str.trim();
	}
}

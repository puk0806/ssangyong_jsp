package days18.auth.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.ha.backend.Sender;

import com.sun.org.apache.regexp.internal.REUtil;

import days18.auth.service.LoginService;
import days18.auth.service.User;
import days18.mvc.command.CommandHandler;

//p606
public class LoginHandler implements CommandHandler{
	
	private static final String FORM_VIEW ="days18/loginForm";
	private LoginService loginService = new LoginService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET요청");
			return processForm(request,response);
		}else if(request.getMethod().equalsIgnoreCase("POST")) {
			System.out.println("POST요청");
			return processSubmit(request,response);
		}else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
		
	}

	

	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		
		String memberid = trim(request.getParameter("memberid"));
		String password = trim(request.getParameter("password"));
		System.out.println("memberid : "+memberid);
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		request.setAttribute("errors", errors);
		
		if(memberid==null||memberid.isEmpty()) {
			errors.put("memberid", Boolean.TRUE);
		}
		if(password==null||password.isEmpty()) {
			errors.put("password",Boolean.TRUE);
		}
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		
		try {
			User user = loginService.login(memberid, password);
			request.getSession().setAttribute("authUser", user);
			response.sendRedirect(request.getContextPath()+"/index.do");
			return null;
		} catch (IOException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
		
	}



	private String trim(String str) {
		return str == null?null:str.trim();
	}

}

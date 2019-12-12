package days18.member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days18.auth.service.User;
import days18.member.service.ChangePasswordService;
import days18.member.service.InvalidPasswordException;
import days18.member.service.MemberNotFoundException;
import days18.mvc.command.CommandHandler;

//p622
public class ChangePasswordHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/days18/changePwdForm";
	private ChangePasswordService changePwdSvc = new ChangePasswordService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("체인지 핸들러 GET요청");
			return processForm(request,response);
		}else if(request.getMethod().equalsIgnoreCase("POST")) {
			System.out.println("체인지 핸들러 POST요청");
			return processSubmit(request,response);
		}
		
		return null;
	}


	// get 요청시
	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}
	
	// post 요청시
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		User user = (User)request.getSession().getAttribute("authUser");
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		
		String curPwd = request.getParameter("curPwd");
		String newPwd = request.getParameter("newPwd");
		
		if(curPwd==null||curPwd.isEmpty()) {
			errors.put("curPwd", Boolean.TRUE);
		}
		
		if(newPwd==null||newPwd.isEmpty()) {
			errors.put("newPwd", Boolean.TRUE);
		}
		
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			changePwdSvc.changePassword(user.getMemberid(), curPwd, newPwd);
			return "/days18/changePwdSuccess";
		}catch(InvalidPasswordException e) {
			errors.put("badCurPwd",Boolean.TRUE);
			return FORM_VIEW;
		}catch (MemberNotFoundException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return null;
		}	
	}
}

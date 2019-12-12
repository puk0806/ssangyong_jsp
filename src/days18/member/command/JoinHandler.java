package days18.member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days18.member.service.DuplicateIdException;
import days18.member.service.JoinRequest;
import days18.member.service.JoinService;
import days18.mvc.command.CommandHandler;

//p597
public class JoinHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/days18/joinForm";
	private JoinService joinService = new JoinService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET호출");
			return processForm(request,response);
		}else if(request.getMethod().equalsIgnoreCase("POST")) {
			System.out.println("POST호출 !!");
			return processSubmit(request,response);
		}else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}	

	// get요청시
	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}
	
	// post요청시
	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		JoinRequest joinReq = new JoinRequest();
		joinReq.setMemberid(request.getParameter("memberid"));
		joinReq.setName(request.getParameter("name"));
		joinReq.setPassword(request.getParameter("password"));
		joinReq.setConfirmPassword(request.getParameter("confirmPassword"));
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		request.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			joinService.join(joinReq);
			System.out.println("정상작동");
			return "/days18/joinSuccess";
		}catch(DuplicateIdException e) {
			System.out.println("에러발견");
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		}
	}
	
}

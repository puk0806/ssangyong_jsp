package days20.replyboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days20.repllyboard.command.CommandHandler;
import days20.replyboard.model.ReplyBoardDTO;
import days20.replyboard.service.WriteService;

public class WriteHandler implements CommandHandler {

	private static final String FORM_VIEW 	= "/days20/write";

	//private WriteService writeService = new WriteService();

	@Override
	public String process(HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			return processForm(request, response);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
        // 1. 새글
		// 2. 답글 ( 부모글 정보 ref, step, depth )
		
		ReplyBoardDTO dto = new ReplyBoardDTO();
		    // 새글, 답글 공통적으로 ....
			dto.setWriter(request.getParameter("writer"));  //  작성자
			dto.setEmail(request.getParameter("email"));
			dto.setSubject(request.getParameter("subject"));
			dto.setContent(request.getParameter("content"));
			dto.setPass(request.getParameter("pass"));
			dto.setIp(request.getRemoteAddr());               // ip address
		   //   ?num=4&ref=4&step=0&depth=0
			String num = request.getParameter("num");
			if( num == null) {
				dto.setStep(0);
				dto.setDepth(0);
			}else {  // 답글
				// 부모글의 ref/step/depth
				dto.setRef( Integer.parseInt(request.getParameter("ref")  ));	
				dto.setStep( Integer.parseInt(request.getParameter("step")  ));	
				dto.setDepth( Integer.parseInt(request.getParameter("depth")  ));	
			}
		
		
		//		int newArticleNo = writeService.write(dto);
		//req.setAttribute("newArticleNo", newArticleNo); 
		
		try {
			WriteService service = new WriteService();
			int result = service.write(dto);
			if( result == 1)	response.sendRedirect("list.do");
		} catch (Exception e) { 
				e.printStackTrace();
		}
		return null;
	}
 

}

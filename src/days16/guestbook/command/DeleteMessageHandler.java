package days16.guestbook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days16.guestbook.model.Message;
import days16.guestbook.service.DeleteMessageService;
import days16.guestbook.service.WriteMessageService;

public class DeleteMessageHandler implements CommandHandler{
   
	@Override
	public String process(HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		System.out.println("DeleteMessageHandler.process...");
		
		String message_id = request.getParameter("message_id");
		String password = request.getParameter("password");
		System.out.println("message_id" + message_id);
		System.out.println("password" + password);
		 
		
		DeleteMessageService deleteMessageService =
				DeleteMessageService.getInstance();	
		
		deleteMessageService.deleteMessage( Integer.parseInt(message_id), password);		
		
		response.sendRedirect("/jspPro/days16/guestbook/list.do");
		return null;
	}
}
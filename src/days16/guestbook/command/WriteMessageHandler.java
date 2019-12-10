package days16.guestbook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import board21.article.service.ArticlePage;
//import board21.article.service.WriteArticleService;
import days16.guestbook.model.Message;
import days16.guestbook.service.GetMessageListService;
import days16.guestbook.service.MessageListView;
import days16.guestbook.service.WriteMessageService;

public class WriteMessageHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		System.out.println("WriteMessageHandler.process...");
		
		String guest_name = request.getParameter("guest_name");
		String password = request.getParameter("password");
		String message =  request.getParameter("message");
		
		Message msg = new Message();
			msg.setGuest_name(guest_name);
			msg.setPassword(password);
			msg.setMessage(message);
		
		WriteMessageService writeMessageService =
				WriteMessageService.getInstance();	
		
		writeMessageService.write(msg);		
		
		response.sendRedirect("/jspPro/days16/guestbook/list.do");
		return null;
	}

}


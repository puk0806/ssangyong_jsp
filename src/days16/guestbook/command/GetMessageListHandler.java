package days16.guestbook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days16.guestbook.service.GetMessageListService;
import days16.guestbook.service.MessageListView;

public class GetMessageListHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		System.out.println("GetMessageListHandler.process...");
		String pageNumberVal = request.getParameter("page");
		int pageNumber = 1;
		if (pageNumberVal != null) {
			pageNumber = Integer.parseInt(pageNumberVal);
		}
		
		GetMessageListService messageListService = 
				GetMessageListService.getInstance();
		
		MessageListView viewData = 
				messageListService.getMessageList(pageNumber);
		  
		request.setAttribute("viewData", viewData);
		
		return "/days16/list";
	}

	
}

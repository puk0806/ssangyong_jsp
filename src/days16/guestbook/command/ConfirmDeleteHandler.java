package days16.guestbook.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConfirmDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		System.out.println("confirmDeleteHandler.process...");		
		String message_id = request.getParameter("message_id");
		System.out.println("message_id"+message_id);
		request.setAttribute("message_id", message_id);
		return "/days16/confirmDeletion";
	}

}

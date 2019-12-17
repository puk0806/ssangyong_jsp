package days20.replyboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days20.repllyboard.command.CommandHandler;
import days20.replyboard.model.ReplyBoardDTO;
import days20.replyboard.service.ContentService;

public class ContentHandler implements CommandHandler {

	private static final String FORM_VIEW = "/days20/content";

	private  ContentService contentService = new ContentService();

	@Override
	public String process(HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		ReplyBoardDTO dto = this.contentService.selectOne(num);
		request.setAttribute("dto", dto);
		return FORM_VIEW;
	}

}
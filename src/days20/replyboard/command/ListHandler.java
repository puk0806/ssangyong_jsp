package days20.replyboard.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days20.repllyboard.command.CommandHandler;
import days20.replyboard.model.ReplyBoardDTO;
import days20.replyboard.service.ListService;

public class ListHandler implements CommandHandler {
 
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		// 1 서비스 호출   답변형게시글   ArrayList request.sett 
		
		try {
			ListService service = new ListService();
			List<ReplyBoardDTO> list = service.select();
			request.setAttribute("list", list);
		} catch (Exception e) { 
				e.printStackTrace();
		}
		return "/days20/list";
	}

}

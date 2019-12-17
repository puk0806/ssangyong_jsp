package days20.repllyboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		// 에러 응답 404 오류 
		response.sendError(HttpServletResponse.SC_NOT_FOUND);
		
		return null;
	}

}

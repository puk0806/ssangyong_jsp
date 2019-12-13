package days18.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days18.mvc.command.CommandHandler;

public class IndexHandler implements CommandHandler{
	
	private static final String FORM_VIEW = "/days18/index";

	@Override
	public String process(HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		return FORM_VIEW;
	}

}
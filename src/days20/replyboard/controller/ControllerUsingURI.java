package days20.replyboard.controller;


import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import days20.repllyboard.command.CommandHandler;
import days20.repllyboard.command.NullHandler;


 

// 파일을 이용해서 요청 명령을 분기하는 컨트롤러
public class ControllerUsingURI extends HttpServlet{
	 
	private Map<String,CommandHandler> commandHandlerMap =
			new HashMap<>();
	
	@Override
	public void init() throws ServletException { 
		String configFile = getInitParameter("configFile");
        Properties prop = new Properties();
        String configFilePath = getServletContext().getRealPath(configFile);
        try (FileReader fis = new FileReader(configFilePath)) {
            prop.load(fis);
        } catch (IOException e) {
            throw new ServletException(e);
        }
        Iterator keyIter = prop.keySet().iterator();
        while (keyIter.hasNext()) {
            String command = (String) keyIter.next();
            String handlerClassName = prop.getProperty(command);
            try {
                Class<?> handlerClass = Class.forName(handlerClassName);
                CommandHandler handlerInstance = 
                        (CommandHandler) handlerClass.newInstance();
commandHandlerMap.put(command, handlerInstance);
            } catch (ClassNotFoundException | InstantiationException 
            		| IllegalAccessException e) {
                throw new ServletException(e);
            }
        }
//        System.out.println(this.commandHandlerMap.size()
//        		+"/"+ this.commandHandlerMap.get("/hello.do"));
	} // init() 닫기

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	private void process(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		 
		String command = request.getRequestURI();
		//   /hello.do
        if( command.indexOf(request.getContextPath())== 0 ) {
        	command = command.substring(request.getContextPath().length() );
        }
//System.out.println(command); //          /hello.do
        //
 
        CommandHandler handler = commandHandlerMap.get(command);
        if (handler == null) {
            handler = new NullHandler();
        }
        String viewPage = null;
        try {
            viewPage = handler.process(request, response);
        } catch (Throwable e) {
            throw new ServletException(e);
        }
        if (viewPage != null) {
        	String prefix = "/WEB-INF/view";
        	String suffix = ".jsp";
        	viewPage = prefix + viewPage+suffix;
        	System.out.println("viewPage"+viewPage);
	        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	        dispatcher.forward(request, response);
        }
	}

	

	
	
}


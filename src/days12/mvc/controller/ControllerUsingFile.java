package days12.mvc.controller;

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

import days12.mvc.command.CommandHandler;
import days12.mvc.command.NullHandler;

// 파일을 이용해서 요청 명령을 분기하는 [MV[C]]패



public class ControllerUsingFile extends HttpServlet {

    // <요청 명령어, 핸들러인스턴스> 매핑 정보 저장
	// CommandHandler 인터페이스 구현 ~Handler클래스 == 모델(Model)
    private Map<String, CommandHandler> commandHandlerMap = 
          new HashMap<>();

    public void init() throws ServletException {
        String configFile = getInitParameter("configFile");	// /WEB-INF/commandHandler.properties
        Properties prop = new Properties();
        // request.getRealPath() (X : request객체 없음)
        String configFilePath = getServletContext().getRealPath(configFile); // 파라미터값 가져오는 방법
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
            	// 핸들러 객체 생성
                Class<?> handlerClass = Class.forName(handlerClassName);
                CommandHandler handlerInstance = 
                        (CommandHandler) handlerClass.newInstance();
                // 맵 추가
                commandHandlerMap.put(command, handlerInstance);
            } catch (ClassNotFoundException | InstantiationException 
                  | IllegalAccessException e) {
                throw new ServletException(e);
            }
        }
    }
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("cmd");
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
        	// /WEB-INF/view/hello.jsp
        	viewPage = String.format("/WEB-INF/view/%s.jsp", viewPage);
           RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
           dispatcher.forward(request, response);
        }
    }
}
package days12.mvc.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleController extends HttpServlet{

   protected void doGet(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      processRequest(request, response);
   }
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      processRequest(request, response);
      }
   private void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       System.out.println(">SimpleController 서블릿 컨트롤러 호출됨");
      
      //1. 요청 분석   ?type=xxx
      String type = request.getParameter("type");
      
   
      Object resultObject = null;
      //2. 요청을 처리할 모델을 찾아서 결과물을 반환
      if(type == null || type.equals("greeting")) {
         resultObject = "안녕하세요";
      }else if(type.equals("date")) {
         resultObject = new java.util.Date();
      }else {
         resultObject = "Invalid Type";
      }
      
      //3. 결과물을  [request]나 session에 처리결과를 저장
      request.setAttribute("result", resultObject);
      
      //4.뷰(jsp페이지) 를 결정해서 포워딩, 리다이렉트 
      //RequestDispatcher 를 사용하여 알맞은 뷰로 포워딩
      RequestDispatcher dispatcher  = request.getRequestDispatcher("/days12/ex05_simpleView.jsp");
      dispatcher.forward(request, response);
      
   }
   
}
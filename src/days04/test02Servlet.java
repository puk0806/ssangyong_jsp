package days04;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class test02Servlet
 */
@WebServlet("/days04/test02")
public class test02Servlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test02Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //가장 먼저확인
      //System.out.println(">test02Servlet.doGet()..");	pet 파라미터명 존재?
	   if(request.getParameter("pet")==null) {	// 아무것도 안넘오면 null 리턴
		   String location = "test/test02.jsp?redirect";
		   response.sendRedirect(location);
	   }else {
		   // request.getParameterValues("pet");
		   String path = "test/test02_ok.jsp";
		   RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		   dispatcher.forward(request,response); 
	   }
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}
package days07.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

@WebServlet("/cstvsboard/list.htm")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public List() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 게시글 가져오기
		// jps/cstvsboard/list.htm					null
		// jps/cstvsboard/list.htm?currentPage		""
		// jps/cstvsboard/list.htm?currentPage=2		2
		String pCurrentPage = request.getParameter("currentPage");
		int currentPage = pCurrentPage == null ? 1: Integer.parseInt(pCurrentPage);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> list = null;
		
		request.setAttribute("list", list);
		
		String sql = " select *                                                     ";
	    sql+=     " from (                                                       ";
		sql+=   "     select rownum no, t.*                                    ";
		sql+=   "     from (                                                   ";
		sql+=   "         select  seq, writer, email, title, readed, writedate      ";
		sql+=   "         from cstvsboard                                    ";
		 
		//
		sql+=   "         order by seq desc                                    ";
		sql+=   "     ) t                                                      ";
		sql+=   " ) b                                                          ";
		sql+=   " where b.no between ? and ?                  ";
		// 한페이지에 출력할 게시글 수
		int numberPerPage = 10;
		// 물음표에 넣어줄 변수
		int start = (currentPage-1)*numberPerPage+1;	
		int end = currentPage*numberPerPage;			 
		
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<BoardDTO>();
				BoardDTO dto = null;
				do {
					dto = new BoardDTO();
					dto.setSeq(rs.getInt("seq"));
					dto.setWriter(rs.getString("writer"));
					dto.setEmail(rs.getString("email"));
					dto.setTitle(rs.getString("title"));
					dto.setWriteDate(rs.getDate("writedate"));
					dto.setReaded(rs.getInt("readed"));
				
					list.add(dto);
				}while(rs.next());
			}
			
			
		} catch (SQLException e) {
			System.out.println("List.java doGet() 예외 발생");
			e.printStackTrace();
		}finally {	
				try {
					if(rs!= null) rs.close();
					if(pstmt!=null)	pstmt.close();
					//DBConn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			
		}
		
		
		
		
		// 페이징 처리 (게시물수, 총페이지수 얻어오기)
		sql =  "select count(*) numberOfPostings ";
		sql += "        , ceil(count(*)/?) numberOfPages ";
		sql += "from cstvsboard ";
		
		PageBlock pageBlock = new PageBlock();
		pageBlock.setCurrentPage(currentPage);
		pageBlock.setNumberPerPage(numberPerPage);
		int numberOfPageBlocks = 10;
		pageBlock.setNumberOfPageBlocks(numberOfPageBlocks);
		
		int numberOfPages =0;	// 총페이지수 저장변수
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, numberPerPage);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				numberOfPages = rs.getInt("numberOfPages");
			}
		} catch (SQLException e) {
	
			e.printStackTrace();
		}finally {
			try {
				if(rs!= null) rs.close();
				if(pstmt!=null)	pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		DBConn.close();
		
		// 페이징 처리 
		int pageBlockStart= (currentPage-1)/numberOfPageBlocks*numberOfPageBlocks+1; // 블록 시작
		int pageBlockEnd = pageBlockStart + numberOfPageBlocks-1;					// 마지막 페이지 값
		pageBlockEnd = pageBlockEnd>numberOfPages ? numberOfPages : pageBlockEnd;	// 마지막 페이지보다 클경우 마지막페이지로설정
		
		pageBlock.setStart(pageBlockStart);
		pageBlock.setEnd(pageBlockEnd);
		
		// 이전 다음버튼 true/false
		pageBlock.setPrev(pageBlockStart==1 ? false :true);
		pageBlock.setNext(pageBlockEnd==numberOfPages?false:true); 
		
		// 포워딩
		request.setAttribute("list", list);  
		request.setAttribute("pageBlock", pageBlock);
		
		String path = "/days07/board/list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}

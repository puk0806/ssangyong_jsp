package days13.mvc.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days07.board.BoardDTO;
import days07.board.PageBlock;
import days13.mvc.command.CommandHandler;

public class ListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String pCurrentPage = request.getParameter("currentPage");
		int currentPage = pCurrentPage == null ? 1 : Integer.parseInt(pCurrentPage);

		// 1. 검색어(searchWord), 검색조건(searchCondition)
		int searchCondition = Integer.parseInt(
				request.getParameter("searchCondition") == null ? "1" : request.getParameter("searchCondition"));
		request.setAttribute("searchCondition", searchCondition);
		String searchWord = request.getParameter("searchWord");
		request.setAttribute("searchWord", searchWord);
		// 파라미터가 넘어오지 않거나 빈문자열이면 *
		if (searchWord == null || searchWord.equals(""))
			searchWord = "*";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> list = null;
		String sql = " select *                                                 ";
		sql += "      from (                                                   ";
		sql += "      select rownum no, t.*                                    ";
		sql += "      from (                                                   ";
		sql += "         select  seq, writer, email, title, readed, writedate  ";
		sql += "         from cstvsboard                                       ";

		// 2.검색 쿼리 추가
		switch (searchCondition) {
		case 1:
			sql += "    where regexp_like( title, ? , 'i') ";
			break;
		case 2:
			sql += "    where regexp_like( content, ? , 'i')  ";
			break;
		case 3:
			sql += "    where regexp_like( writer, ? , 'i')  ";
			break;
		case 4:
			sql += "    where regexp_like( title, ? , 'i')or regexp_like( content, ? , 'i')  ";
			break;
		}
		//

		sql += "         order by seq desc                                    ";
		sql += "     ) t                                                      ";
		sql += " ) b                                                          ";
		sql += " where b.no between ? and ?                  ";
		// 한페이지 출력할 게시글 수
		int numberPerPage = 10;
		int start = (currentPage - 1) * numberPerPage + 1; // 1 , 11
		int end = currentPage * numberPerPage; // 10 , 20

		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			// between ? and ?
			pstmt.setString(1, searchWord);
			if (searchCondition == 4) {
				pstmt.setString(2, searchWord);
				pstmt.setInt(3, start); // 3
				pstmt.setInt(4, end); // 4
			} else {
				pstmt.setInt(2, start); // 3
				pstmt.setInt(3, end); // 4
			}
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<BoardDTO>();
				BoardDTO dto = null;
				do {
					dto = new BoardDTO();
					dto.setSeq(rs.getInt("seq"));

					String writer = rs.getString("writer");
					if (!searchWord.equals("*") && searchCondition == 3) {
						writer = writer.replace(searchWord, "<span class='searchWord'>" + searchWord + "</span>");
					}
					dto.setWriter(writer);

					dto.setEmail(rs.getString("email"));

					String title = rs.getString("title");
					title = title.replace("<", "&lt;");
					title = title.replace(">", "&gt;");

					// 검색어 있다면
					if (!searchWord.equals("*") && searchCondition == 1) {
						title = title.replace(searchWord, "<span class='searchWord'>" + searchWord + "</span>");
					}
					dto.setTitle(title);

					dto.setWriteDate(rs.getDate("writedate"));
					dto.setReaded(rs.getInt("readed"));
					list.add(dto);
				} while (rs.next());
			}

		} catch (SQLException e) {
			// List.java > doGet() 예외발생
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
				// DBConn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 페이징 처리 : 총 게시글수, 총 페이지 수
		sql = " select count(*) numberOfPostings ";
		sql += "   ,  ceil(  count(*)/?  ) numberOfPages ";
		sql += " from cstvsboard ";

		// 3.검색 쿼리 추가
		switch (searchCondition) {
		case 1:
			sql += "    where regexp_like( title, ? , 'i') ";
			break;
		case 2:
			sql += "    where regexp_like( content, ? , 'i')  ";
			break;
		case 3:
			sql += "    where regexp_like( writer, ? , 'i')  ";
			break;
		case 4:
			sql += "    where regexp_like( title, ? , 'i')   or regexp_like( content, ? , 'i')  ";
			break;
		}

		PageBlock pageBlock = new PageBlock();
		pageBlock.setCurrentPage(currentPage);
		pageBlock.setNumberPerPage(numberPerPage);
		int numberOfPageBlocks = 10;
		pageBlock.setNumberOfPageBlocks(numberOfPageBlocks);

		int numberOfPages = 0; // 총페이지수 저장변수

		try {
			pstmt = conn.prepareStatement(sql);
			// 4. 검색 추가 코딩.
			pstmt.setInt(1, numberPerPage);
			pstmt.setString(2, searchWord);
			if (searchCondition == 4)
				pstmt.setString(3, searchWord);
			//
			rs = pstmt.executeQuery();
			if (rs.next()) {
				numberOfPages = rs.getInt("numberOfPages");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
				// DBConn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		DBConn.close();

		// 블럭 시작
		int pageBlockStart = (currentPage - 1) / numberOfPageBlocks * numberOfPageBlocks + 1;
		// 블럭 끝
		int pageBlockEnd = pageBlockStart + numberOfPageBlocks - 1;
		// 총페이지 수 : 7
		// << 1.2.3.4.5.6.7
		pageBlockEnd = pageBlockEnd > numberOfPages ? numberOfPages : pageBlockEnd;

		pageBlock.setStart(pageBlockStart);
		pageBlock.setEnd(pageBlockEnd);
		// 이전 버튼 true/false
		pageBlock.setPrev(pageBlockStart == 1 ? false : true);
		// 다음 버튼 true/false
		pageBlock.setNext(pageBlockEnd == numberOfPages ? false : true);

		// 포워딩
		request.setAttribute("list", list);
		request.setAttribute("pageBlock", pageBlock);

		return "list";

	}

}

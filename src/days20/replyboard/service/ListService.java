
package days20.replyboard.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import days20.replyboard.dao.ReplyBoardDAO;
import days20.replyboard.model.ReplyBoardDTO;

public class ListService {

	public List<ReplyBoardDTO> select() {
		ReplyBoardDAO dao = ReplyBoardDAO.getInstance();		
		try (Connection conn = ConnectionProvider.getConnection()) {			
			List<ReplyBoardDTO> list = dao.selectList(conn);
			// 로그 처리
			// 
			//
			return list;
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		}
	}

}

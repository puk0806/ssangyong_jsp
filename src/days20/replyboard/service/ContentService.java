package days20.replyboard.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days20.replyboard.dao.ReplyBoardDAO;
import days20.replyboard.model.ReplyBoardDTO;

public class ContentService {

	public ReplyBoardDTO selectOne(int num) {
		ReplyBoardDTO dto = null;
		ReplyBoardDAO dao = ReplyBoardDAO.getInstance();		
		Connection conn = null ; 
		try{	
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
				dao.updateReadcount(conn, num);
				dto = dao.selectOne(conn, num);
			conn.commit();
		} catch (SQLException | NamingException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} 
		return dto;
		
	}

}
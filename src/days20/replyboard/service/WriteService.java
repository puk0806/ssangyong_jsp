package days20.replyboard.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days20.replyboard.dao.ReplyBoardDAO;
import days20.replyboard.model.ReplyBoardDTO;

public class WriteService {
	
	
	public int write( ReplyBoardDTO dto ) {
		ReplyBoardDAO dao = ReplyBoardDAO.getInstance();		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();	
			int insertedCount = dao.insert(conn, dto); 
			if (insertedCount == 0) {
				//throw new RuntimeException("fail to insert article");
			}
			return insertedCount;
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} catch (RuntimeException e) {
			JdbcUtil.rollback(conn);
			throw e;
		} catch (NamingException e) {  
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

}
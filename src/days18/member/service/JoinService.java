package days18.member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days18.member.dao.MemberDao;
import days18.member.model.Member;

//p596
public class JoinService {
	
	private MemberDao memberDao = new MemberDao();
	
	public void join(JoinRequest joinReq) {
		Connection conn = null;
		
		try {
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member member = memberDao.selectById(conn, joinReq.getMemberid());
			if(member != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicateIdException();
			}
			
			memberDao.insert(conn,new Member(joinReq.getMemberid(), joinReq.getName(), joinReq.getPassword(), new Date()));
			conn.commit();
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}

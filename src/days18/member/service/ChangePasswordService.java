package days18.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days18.member.dao.MemberDao;
import days18.member.model.Member;
//p621
public class ChangePasswordService {
	
	private MemberDao memberDao = new MemberDao();
	
	public void changePassword(String userId,String curPwd,String newPwd) {
		
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member member = memberDao.selectById(conn, userId);
			if(member ==null) {
				throw new MemberNotFoundException();
			}
			if(!member.matchPassword(curPwd)) {
				throw new InvalidPasswordException();
			}
			member.changePassWord(newPwd);
			memberDao.update(conn, member);
			conn.commit();
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(conn);
		}
		
	}

}

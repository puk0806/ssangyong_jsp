package days18.auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import days18.member.dao.MemberDao;
import days18.member.model.Member;

//p605
public class LoginService {
	
	private MemberDao memberDao = new MemberDao();
	
	public User login(String memberid, String password ) {
		try(Connection conn = ConnectionProvider.getConnection()){
			Member member = memberDao.selectById(conn, memberid);
			if(member == null) {
				throw new LoginFailException();
			}
			if(!member.matchPassword(password)) {
				throw new LoginFailException();
			}
			return new User(member.getMemberid(), member.getName());
			
		} catch (SQLException | NamingException e) {
			
			throw new RuntimeException();
		}
		
	}

}

package days18.member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days18.member.dao.MemberDao;
import days18.member.model.Member;
 

// p 596
public class JoinService {

	private MemberDao memberDao = new MemberDao();

	public void join( JoinRequest joinReq ) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
conn.setAutoCommit(false);  // 1, 2  트랜잭션 처리
			// 1. 회원 존재 여부
					Member member = this.memberDao.selectById(conn, joinReq.getMemberid());
					if( member != null) {
						JdbcUtil.rollback(conn); 
						throw new DuplicateIdException();
					}
			// 2. 회원 가입 ( insert)		
					this.memberDao.insert(conn, new Member(
							joinReq.getMemberid()
							, joinReq.getName()
							, joinReq.getPassword()
							));
conn.commit(); // 커밋
		}catch(SQLException | NamingException e) {
JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}

	}

}

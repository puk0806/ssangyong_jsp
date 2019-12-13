package days18.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import com.util.JdbcUtil;

import days18.member.model.Member;

// p 592
public class MemberDao {
	public Member selectById(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from member "
					+ " where memberid=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			Member member = null;
			if( rs.next()) {
				member = new Member(
						rs.getString("memberid")
						, rs.getString("name")
						, rs.getString("password")
						, rs.getDate("regdate")
						);
			}
			return member;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Date toDate(Date date) {
		return date == null ? null : new Date( date.getTime());
	}
	
	public void insert( Connection conn, Member mem) throws SQLException {
		try( PreparedStatement pstmt = 
				conn.prepareStatement("insert into member values(?,?,?,sysdate)") ){
			pstmt.setString(1, mem.getMemberid());
			pstmt.setString(2, mem.getName());
			pstmt.setString(3, mem.getPassword());
			//pstmt.setDate(4, mem.getRegdate());
			pstmt.executeUpdate();
		}  
	}
	
	public void update(Connection conn, Member member) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update member set name = ?, password = ? where memberid = ?")) {
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getMemberid());
			pstmt.executeUpdate();
		}
	}

}
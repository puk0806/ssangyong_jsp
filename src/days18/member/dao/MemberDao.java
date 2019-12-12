package days18.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import days18.member.model.Member;

// p593
public class MemberDao {
	
	public Member selectById(Connection conn,String id) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from member where memberid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			Member member = null;
			if(rs.next()) {
				member = new Member(rs.getString("memberid"),rs.getString("name"),rs.getString("password"),rs.getDate("regdate"));
			}
			return member;
		}finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
		}
	}
	
	
	private Date toDate(Timestamp date) {
		return date == null ? null:new Date(date.getDate());
	}
	
	// 멤버 추가 메서드
	public void insert(Connection conn, Member mem)throws SQLException{
		String sql = "insert into member values(?,?,?,?)";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, mem.getMemberid());
			pstmt.setString(2, mem.getName());
			pstmt.setString(3, mem.getPassword());
			pstmt.setTimestamp(4, new Timestamp(mem.getRegdate().getTime()));
			pstmt.executeUpdate();
		}
	}
	
	
	// 멤버 수정 메서드
	public void update(Connection conn, Member member) throws SQLException{
		
		String sql = "update member set name = ?,password =? where memberid =?";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3,member.getMemberid());
			pstmt.executeUpdate();
		}
	}
	
}

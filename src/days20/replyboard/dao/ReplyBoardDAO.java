package days20.replyboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import days20.replyboard.model.ReplyBoardDTO;

public class ReplyBoardDAO {
	// 싱글톤
	private static ReplyBoardDAO dao = null;
	private ReplyBoardDAO() {}
	public static ReplyBoardDAO getInstance() {
		if( dao == null ) {
			dao = new ReplyBoardDAO();
		}
		return dao;
	}

	// 글쓰기
	public int insert(Connection conn, ReplyBoardDTO dto) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result  = 0;
		if(dto.getRef() == 0) {
			// 1. 새글 
			String sql = "insert into replyboard ( "
					+" num, writer, email, subject, pass"
					+ ", ref, step, depth, content, ip )"
					+ " values "
					+" ( seq_replyboard.nextval,  ?,?,?,? "
					+ " , seq_replyboard.currval, ?,?,?,?  )";
			try {
				pstmt =  conn.prepareStatement(sql);
				pstmt.setString(1, dto.getWriter());
				pstmt.setString(2, dto.getEmail());
				pstmt.setString(3, dto.getSubject());
				pstmt.setString(4, dto.getPass());
				pstmt.setInt(5, dto.getStep());
				pstmt.setInt(6, dto.getDepth());
				pstmt.setString(7, dto.getContent());
				pstmt.setString(8, dto.getIp()); 
				result = pstmt.executeUpdate();
			}catch (SQLException e) { 
				e.printStackTrace();
			} finally {
				try { pstmt.close();} catch (SQLException e) {	e.printStackTrace();	}
				try {conn.close();  } catch (SQLException e) {	e.printStackTrace();}
			}
		}else {
			// 2. 답글( 부모 정보 )
			// ㄱ. 부모 step 보다 큰 step+1
			String sql = "update replyboard "
					+ " set step = step + 1 "
					+ " where ref=? and step > ?";  // ? 그룹,  ? 부모step
			try {
				pstmt =  conn.prepareStatement(sql);
					pstmt.setInt(1, dto.getRef());   // 부모 ref
					pstmt.setInt(2, dto.getStep());  // 부모 step
				result = pstmt.executeUpdate();
				
				
				// 2. 
				sql = "insert into replyboard ( "
						+" num, writer, email, subject, pass"
						+ ", ref, step, depth, content, ip )"
						+ " values "
						+" ( seq_replyboard.nextval,  ?,?,?,? "
						+ " , ?, ?,?,?,?  )";
				pstmt =  conn.prepareStatement(sql);
					pstmt.setString(1, dto.getWriter());  // ?
					pstmt.setString(2, dto.getEmail());   // 
					pstmt.setString(3, dto.getSubject()); // 
					pstmt.setString(4, dto.getPass());     // ?
				pstmt.setInt(5, dto.getRef()); // 부모 그룹으로 설정
					pstmt.setInt(6, dto.getStep()+1);
					pstmt.setInt(7, dto.getDepth()+1);
					pstmt.setString(8, dto.getContent());
					pstmt.setString(9, dto.getIp()); 
				result = pstmt.executeUpdate();
			}catch (SQLException e) { 
		e.printStackTrace();
			} finally {
				try { pstmt.close();} catch (SQLException e) {	e.printStackTrace();	}
				try {conn.close();  } catch (SQLException e) {	e.printStackTrace();}
			}
		}
		
		
		return result;
	}

	// 전체 게시글 페이징 처리 없이 가져오는 메서드
	public List<ReplyBoardDTO> selectList(
			Connection conn){
		String sql =" select rownum rnum, num,writer,email,subject,pass, regdate,readcount,ref,step,depth,content,ip "
		        +  ", case       when ( sysdate - regdate ) < 0.041667  then  'true'      else 'false'      end  new "
				+ " from replyboard "
				+" order by ref desc, step asc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReplyBoardDTO> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ReplyBoardDTO dto = null;
			while(rs.next()) {
				dto =  new ReplyBoardDTO();
					dto.setNum( rs.getInt("num") );
					dto.setWriter( rs.getString("writer"));
					dto.setEmail( rs.getString("email"));
					dto.setSubject( rs.getString("subject"));	
					dto.setReadcount( rs.getInt("readcount"));
					dto.setRegdate(rs.getDate("regdate"));
					dto.setIp( rs.getString("ip"));
					dto.setStep( rs.getInt("step"));
					dto.setDepth(rs.getInt("depth"));
					//
					//dto.setNewImg(rs.getBoolean("new"));
					dto.setNewImg( new Boolean(rs.getString("new")) );
					
				list.add(dto);
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try { pstmt.close();} catch (SQLException e) {	e.printStackTrace();	}
			try {rs.close();    } catch (SQLException e) {	e.printStackTrace();}
			try {conn.close();  } catch (SQLException e) {	e.printStackTrace();}
		}
		return list;		
	}

	
	
	
	
	// 조회수 증가
	public int updateReadcount(Connection conn, int num) {
		String sql = "update replyboard "
				+" set readcount = readcount +1 "
				+" where num = ?";

		PreparedStatement pstmt = null;		
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try { pstmt.close();} catch (SQLException e) {	e.printStackTrace();	}
			//try {conn.close();  } catch (SQLException e) {	e.printStackTrace();}
		}
		return result;
	}

	// 게시글 얻어오기
	public ReplyBoardDTO selectOne(Connection conn, int num) {
		String sql = "select * from replyboard "
				+" where num = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		ReplyBoardDTO dto = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				dto =  new ReplyBoardDTO();

				dto.setNum( rs.getInt("num") );
				dto.setWriter( rs.getString("writer"));
				dto.setEmail( rs.getString("email"));
				dto.setSubject( rs.getString("subject"));	
				dto.setReadcount( rs.getInt("readcount"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setIp( rs.getString("ip"));
				dto.setStep( rs.getInt("step"));
				dto.setDepth(rs.getInt("depth"));

				dto.setRef(rs.getInt("ref"));
				dto.setPass(rs.getString("pass"));
				dto.setContent(rs.getString("content")); 

			}
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			try { pstmt.close();} catch (SQLException e) {	e.printStackTrace();	}
			try {rs.close();    } catch (SQLException e) {	e.printStackTrace();}
			//try {conn.close();  } catch (SQLException e) {	e.printStackTrace();}
		}
		return dto;
	}
}

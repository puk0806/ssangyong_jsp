package days19.article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import days19.article.model.Article;
import days19.article.model.Writer;

public class ArticleDao {
	
	public int insert(Connection conn, Article article) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into article "
					+ "(article_no, writer_id, writer_name, title,content, read_cnt) "
					+ "values (seq_article.nextval,?,?,?,?,0)");
				pstmt.setString(1, article.getWriter().getId());
				pstmt.setString(2, article.getWriter().getName());
				pstmt.setString(3, article.getTitle());
				pstmt.setString(4, article.getContent() ); 
			int insertedCount = pstmt.executeUpdate();			
			return insertedCount;
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from article");
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	public List<Article> select(Connection conn
			, int startRow
			, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = " select *                                                     ";
			sql+=     " from (                                                       ";
			sql+=   "     select rownum no, t.*                                    ";
			sql+=   "     from (                                                   ";
			sql+=   "         select  *      ";
			sql+=   "         from article                                     ";
			sql+=   "         order by article_no desc                                    ";
			sql+=   "     ) t                                                      ";
			sql+=   " ) b                                                          ";
			sql+=   " where b.no between ? and ?                  ";	
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, startRow + size-1);
			rs = pstmt.executeQuery();
			List<Article> result = new ArrayList<>();
			while (rs.next()) {
				result.add(convertArticle(rs));
			}
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article(
				rs.getInt("article_no"),
				new Writer(rs.getString("writer_id"),	rs.getString("writer_name")),
				rs.getString("title"),
				rs.getString("content"),
				rs.getDate("regdate"),
				rs.getDate("moddate"),
				rs.getInt("read_cnt"));
	}
	
}

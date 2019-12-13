package days19.article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import days19.article.dao.ArticleDao;
import days19.article.model.Article;

public class WriteArticleService {
	
	private ArticleDao articleDao = new ArticleDao(); 

	public int write(WriteRequest req) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();		
			// 
			Article article = toArticle(req);
			int insertedCount = articleDao.insert(conn, article);
			if (insertedCount == 0) {
				throw new RuntimeException("fail to insert article");
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

	private Article toArticle(WriteRequest req) {
		Date now = new Date();
		return new Article(0, req.getWriter() , req.getTitle()
				                     , req.getContent(), now, null, 0);
	}

}








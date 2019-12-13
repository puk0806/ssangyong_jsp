package days19.article.model;

import java.util.Date;

// 631     Article + ArticleContent 클래스 
public class Article {
	
	private int article_no;
	private Writer writer;  // writer_id, writer_name
	private String title;
	private String content;
	private Date regdate;
	private Date moddate; 
	private int read_cnt;
		
	public Article(int article_no, Writer writer, String title, String content
			, Date regdate, Date moddate,
			int read_cnt) {
		super();
		this.article_no = article_no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.moddate = moddate;
		this.read_cnt = read_cnt;
	}

	public int getArticle_no() {
		return article_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public Writer getWriter() {
		return writer;
	}

	public void setWriter(Writer writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getModdate() {
		return moddate;
	}

	public void setModdate(Date moddate) {
		this.moddate = moddate;
	}

	public int getRead_cnt() {
		return read_cnt;
	}

	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}
	
	

	
}

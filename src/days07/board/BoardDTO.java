package days07.board;

import java.sql.Connection;
import java.sql.Date;

public class BoardDTO {
	
	
	
	private int seq;
	private String writer;
	private String pwd;
	private String email;
	private String title;
	private Date writeDate;
	private int readed;
	private int tag;
	private String content;
	
	
	public BoardDTO() {

	}
	
	public BoardDTO(String writer, String pwd, String email, String title,int tag,String content) {
		super();
		this.writer = writer;
		this.pwd = pwd;
		this.email = email;
		this.title = title;
		this.tag = tag;
		this.content = content;
	}
	
	public BoardDTO(int seq, String writer, String pwd, String email, String title, 
			Date writeDate, int readed, int tag,String content) {
		this(writer,pwd,email,title,tag,content);
		this.seq = seq;
		this.writeDate = writeDate;
		this.readed = readed;
	}

	public BoardDTO(Connection conn) {
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getReaded() {
		return readed;
	}
	public void setReaded(int readed) {
		this.readed = readed;
	}
	public int getTag() {
		return tag;
	}
	public void setTag(int tag) {
		this.tag = tag;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}	

}

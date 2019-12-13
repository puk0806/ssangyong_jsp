package days19.article.model;

public class Writer {
	// 필드
	private String id;
	private String name;
	// 생성자
	public Writer(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
    // setter, getter
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	} 

}

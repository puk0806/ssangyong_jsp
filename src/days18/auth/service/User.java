package days18.auth.service;

// p604
public class User {
	
	private String memberid;
	private String name;
	
	public User(String memberid, String name) {
		super();
		this.memberid = memberid;
		this.name = name;
	}

	public String getMemberid() {
		return memberid;
	}

	public String getName() {
		return name;
	}
	
}

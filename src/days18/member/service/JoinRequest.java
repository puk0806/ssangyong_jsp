package days18.member.service;

import java.util.Map;

// p 594
public class JoinRequest {
	
	private String memberid;
	private String name;
	private String password;
	private String confirmPassword;
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	public boolean isPasswordEqualToConfirm() {
		return this.password != null && this.password.equals(this.confirmPassword);
	}
	
	public void validate( Map<String, Boolean> errors) {
		checkEmpty(errors, this.memberid, "memberid");
		checkEmpty(errors, this.name, "name");
		checkEmpty(errors, this.password, "password");
		checkEmpty(errors, this.confirmPassword, "confirmPassword");
		
		if( !errors.containsKey("confirmPassword")  && !isPasswordEqualToConfirm()) {
			errors.put("notMatch", true);
		}
	}

	private void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		if( value == null || value.isEmpty() ) {
			errors.put(fieldName, true);
		}
	}
}


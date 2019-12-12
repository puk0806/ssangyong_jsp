package days18.member.service;

import java.util.Map;

// p594
public class JoinRequest {
/*	
	create table member(
		    memberid VARCHAR2(50) primary key,
		    name varchar2(50) not null,
		    password VARCHAR2(10) not null,
		    regdate date not null
	);
*/
	// 필드명 테이블컬럼과 동일하게 하기!!!
	
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
		return password != null && password.equals(confirmPassword);
	}
	
	public void validate(Map<String,Boolean> errors) {
		checkEmpty(errors, memberid, "memberid");
		checkEmpty(errors, name, "name");
		checkEmpty(errors, password, "password");
		checkEmpty(errors, confirmPassword, "confirmPassword");
		if(!errors.containsKey("confirmPassword")) {
			if(!isPasswordEqualToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}
		}
	}
	
	private void checkEmpty(Map<String, Boolean> errors,String value,String fieldName) {
		if(value == null||value.isEmpty()) {
			errors.put(fieldName, Boolean.TRUE);
		}
	}
	
	
}

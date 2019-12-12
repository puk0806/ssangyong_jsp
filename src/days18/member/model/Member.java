package days18.member.model;

import java.util.Date;

//p591
public class Member {
	/*
	memberid VARCHAR2(50) primary key,
	name varchar2(50) not null,
	password VARCHAR2(10) not null,
	regdate date not null
	*/
	// 필드생성 칼럼명이랑 똑같이 주기 !!! spring에서 중요!

	private String memberid;
	private String name;
	private String password;
	private Date regdate;
	
	
	
	public Member(String memberid, String name, String password, Date regdate) {
		super();
		this.memberid = memberid;
		this.name = name;
		this.password = password;
		this.regdate = regdate;
	}
	
	public Member() {
		super();
	}
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	// 비밀번호 일치 확인 메서드
	public boolean matchPassword(String password) {
		return this.password.equals(password);
	}
	
	// 비밀번호 변경 메소드
	public void changePassWord(String newPwd) {
		this.password = newPwd;		
	}

}

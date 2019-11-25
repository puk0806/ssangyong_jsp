package days05;

import java.sql.Date;

public class EDSDTO {
	
	int deptno,pay,grade;
	String dname,ename,mgr_eString;
	Date hiredate;
	
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getMgr_eString() {
		return mgr_eString;
	}
	public void setMgr_eString(String mgr_eString) {
		this.mgr_eString = mgr_eString;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	@Override
	public String toString() {
		return "deptno=" + deptno + ", pay=" + pay + ", grade=" + grade + ", dname=" + dname + ", ename="
				+ ename + ", mgr_eString=" + mgr_eString + ", hiredate=" + hiredate;
	}
	
	
	
	

}

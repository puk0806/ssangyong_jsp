package days03;

public class DeptDTO {
	private int deptno;
	private String dname;
	private String loc;
	// 사원수 필드 추가
	private int empCnt;
	
	// getter, setter 자동 생성
	public int getEmpCnt() {
		return empCnt;
	}
	
	public void setEmpCnt(int empCnt) {
		this.empCnt = empCnt;
	}
	
	public int getDeptno() {
		return deptno;
	}
	
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	@Override
	public String toString() { 
		return String.format("%d(%s)-%d명"
				, deptno, dname, empCnt);
	}
	
	
}

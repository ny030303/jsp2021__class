package dto;

public class EmpDTO {
	private int empno;
	private String empname;
	private String joindate;
	private String rank;
	private String dept;
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	@Override
	public String toString() {
		return "EmpDTO [empno=" + empno + ", empname=" + empname + ", joindate=" + joindate + ", rank=" + rank
				+ ", dept=" + dept + "]";
	}
	
	
	
}

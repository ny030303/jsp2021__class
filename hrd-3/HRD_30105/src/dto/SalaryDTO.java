package dto;

public class SalaryDTO {
	public int empno;
	public String empname;
	public int  pay;
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
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	@Override
	public String toString() {
		return "SalaryDTO [empno=" + empno + ", empname=" + empname + ", pay=" + pay + "]";
	}
	
}

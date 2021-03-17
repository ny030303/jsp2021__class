package dto;

import java.sql.Date;

public class MemRentDTO {
	private int custno;
	private String custname;
	private int countNum;
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public int getCountNum() {
		return countNum;
	}
	public void setCountNum(int countNum) {
		this.countNum = countNum;
	}
	@Override
	public String toString() {
		return "MemRentDTO [custno=" + custno + ", custname=" + custname + ", countNum=" + countNum + "]";
	}

	
}

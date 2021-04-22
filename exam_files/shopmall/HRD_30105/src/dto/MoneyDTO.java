package dto;

import java.sql.Date;

public class MoneyDTO {
	private int custno;
	private String custname;
	private String grade;
	private int price;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "MoneyDTO [custno=" + custno + ", custname=" + custname + ", grade=" + grade + ", price=" + price + "]";
	}
	
}

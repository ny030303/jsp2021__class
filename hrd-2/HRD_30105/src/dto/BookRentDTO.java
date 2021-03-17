package dto;

import java.sql.Date;

public class BookRentDTO {
	private int bookno;
	private int countNum;
	public int getBookno() {
		return bookno;
	}
	public void setBookno(int bookno) {
		this.bookno = bookno;
	}
	public int getCountNum() {
		return countNum;
	}
	public void setCountNum(int countNum) {
		this.countNum = countNum;
	}
	@Override
	public String toString() {
		return "BookRentDTO [bookno=" + bookno + ", countNum=" + countNum + "]";
	}
	

	
}

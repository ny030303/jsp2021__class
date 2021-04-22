package dto;

import java.sql.Date;

public class OrderDTO {
	private int p_seno;
	private String i_code;
	private int p_no;
	private Date p_date;
	public int getP_seno() {
		return p_seno;
	}
	public void setP_seno(int p_seno) {
		this.p_seno = p_seno;
	}
	public String getI_code() {
		return i_code;
	}
	public void setI_code(String i_code) {
		this.i_code = i_code;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	@Override
	public String toString() {
		return "OrderDTO [p_seno=" + p_seno + ", i_code=" + i_code + ", p_no=" + p_no + ", p_date=" + p_date + "]";
	}
	
	
}

package dto;

import java.sql.Date;

public class GetOrderDTO {
	private int p_seno;
	private int p_no;
	private String p_name;
	private String i_code;
	private String i_name;
	private Date p_date;
	public int getP_seno() {
		return p_seno;
	}
	public void setP_seno(int p_seno) {
		this.p_seno = p_seno;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getI_code() {
		return i_code;
	}
	public void setI_code(String i_code) {
		this.i_code = i_code;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	@Override
	public String toString() {
		return "GetOrderDTO [p_seno=" + p_seno + ", p_no=" + p_no + ", p_name=" + p_name + ", i_code=" + i_code
				+ ", i_name=" + i_name + ", p_date=" + p_date + "]";
	}
	
	
	
}

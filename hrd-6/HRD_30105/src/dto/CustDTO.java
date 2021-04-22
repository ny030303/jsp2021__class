package dto;

public class CustDTO {
	private int p_no;
	private String p_name;
	private int p_birth;
	private int p_tel1;
	private int p_tel2;
	private int p_tel3;
	private int p_city;
	private String p_gender;
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
	public int getP_birth() {
		return p_birth;
	}
	public void setP_birth(int p_birth) {
		this.p_birth = p_birth;
	}
	public int getP_tel1() {
		return p_tel1;
	}
	public void setP_tel1(int p_tel1) {
		this.p_tel1 = p_tel1;
	}
	public int getP_tel2() {
		return p_tel2;
	}
	public void setP_tel2(int p_tel2) {
		this.p_tel2 = p_tel2;
	}
	public int getP_tel3() {
		return p_tel3;
	}
	public void setP_tel3(int p_tel3) {
		this.p_tel3 = p_tel3;
	}
	public int getP_city() {
		return p_city;
	}
	public void setP_city(int p_city) {
		this.p_city = p_city;
	}
	public String getP_gender() {
		return p_gender;
	}
	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	@Override
	public String toString() {
		return "CustDTO [p_no=" + p_no + ", p_name=" + p_name + ", p_birth=" + p_birth + ", p_tel1=" + p_tel1
				+ ", p_tel2=" + p_tel2 + ", p_tel3=" + p_tel3 + ", p_city=" + p_city + ", p_gender=" + p_gender + "]";
	}
	
}

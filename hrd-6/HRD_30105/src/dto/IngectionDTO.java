package dto;

public class IngectionDTO {
	private String i_code;
	private String i_name;
	private int num;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "IngectionDTO [i_code=" + i_code + ", i_name=" + i_name + ", num=" + num + "]";
	}	
}
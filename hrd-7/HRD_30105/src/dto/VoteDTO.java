package dto;

public class VoteDTO {
	private String V_JUMIN; // 99010110001
	private String V_NAME; // '김유권'
	private int M_NO; // 1
	private String V_TIME; // 0930
	private String V_AREA; // '제1투표장'
	private String V_CONFIRM; // 'N'
	public String getV_JUMIN() {
		return V_JUMIN;
	}
	public void setV_JUMIN(String v_JUMIN) {
		V_JUMIN = v_JUMIN;
	}
	public String getV_NAME() {
		return V_NAME;
	}
	public void setV_NAME(String v_NAME) {
		V_NAME = v_NAME;
	}
	public int getM_NO() {
		return M_NO;
	}
	public void setM_NO(int m_NO) {
		M_NO = m_NO;
	}
	public String getV_TIME() {
		return V_TIME;
	}
	public void setV_TIME(String v_TIME) {
		V_TIME = v_TIME;
	}
	public String getV_AREA() {
		return V_AREA;
	}
	public void setV_AREA(String v_AREA) {
		V_AREA = v_AREA;
	}
	public String getV_CONFIRM() {
		return V_CONFIRM;
	}
	public void setV_CONFIRM(String v_CONFIRM) {
		V_CONFIRM = v_CONFIRM;
	}
	@Override
	public String toString() {
		return "VoteDTO [V_JUMIN=" + V_JUMIN + ", V_NAME=" + V_NAME + ", M_NO=" + M_NO + ", V_TIME=" + V_TIME
				+ ", V_AREA=" + V_AREA + ", V_CONFIRM=" + V_CONFIRM + "]";
	}
	
	
}

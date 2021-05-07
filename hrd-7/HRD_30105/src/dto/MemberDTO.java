package dto;

public class MemberDTO {
	private int M_NO;
	private String M_NAME;
	private String P_NAME;
	private int P_SCHOOL;
	private String M_JUMIN;
	private String M_CITY;
	private String P_TEL1;
	private String P_TEL2;
	private String P_TEL3;
	
	public int getM_NO() {
		return M_NO;
	}
	public void setM_NO(int m_NO) {
		M_NO = m_NO;
	}
	public String getM_NAME() {
		return M_NAME;
	}
	public void setM_NAME(String m_NAME) {
		M_NAME = m_NAME;
	}
	public String getP_NAME() {
		return P_NAME;
	}
	public void setP_NAME(String p_NAME) {
		P_NAME = p_NAME;
	}
	public int getP_SCHOOL() {
		return P_SCHOOL;
	}
	public void setP_SCHOOL(int p_SCHOOL) {
		P_SCHOOL = p_SCHOOL;
	}
	public String getM_JUMIN() {
		return M_JUMIN;
	}
	public void setM_JUMIN(String m_JUMIN) {
		M_JUMIN = m_JUMIN;
	}
	public String getM_CITY() {
		return M_CITY;
	}
	public void setM_CITY(String m_CITY) {
		M_CITY = m_CITY;
	}
	public String getP_TEL1() {
		return P_TEL1;
	}
	public void setP_TEL1(String p_TEL1) {
		P_TEL1 = p_TEL1;
	}
	public String getP_TEL2() {
		return P_TEL2;
	}
	public void setP_TEL2(String p_TEL2) {
		P_TEL2 = p_TEL2;
	}
	public String getP_TEL3() {
		return P_TEL3;
	}
	public void setP_TEL3(String p_TEL3) {
		P_TEL3 = p_TEL3;
	}
	@Override
	public String toString() {
		return "MemberDTO [M_NO=" + M_NO + ", M_NAME=" + M_NAME + ", P_NAME=" + P_NAME + ", P_SCHOOL=" + P_SCHOOL
				+ ", M_JUMIN=" + M_JUMIN + ", M_CITY=" + M_CITY + ", P_TEL1=" + P_TEL1 + ", P_TEL2=" + P_TEL2
				+ ", P_TEL3=" + P_TEL3 + "]";
	}
	
	
}

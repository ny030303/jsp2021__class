package dto;

public class MemberVoteDTO {
	private int M_NO;
	private String M_NAME;
	private int M_NO_NUM;
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
	public int getM_NO_NUM() {
		return M_NO_NUM;
	}
	public void setM_NO_NUM(int m_NO_NUM) {
		M_NO_NUM = m_NO_NUM;
	}
	@Override
	public String toString() {
		return "MemberVoteDTO [M_NO=" + M_NO + ", M_NAME=" + M_NAME + ", M_NO_NUM=" + M_NO_NUM + "]";
	}
	
	
}

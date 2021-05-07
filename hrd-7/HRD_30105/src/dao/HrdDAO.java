package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MemberDTO;
import dto.MemberVoteDTO;
import dto.VoteDTO;

public class HrdDAO {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "1234");
		return con;
	}
	
	public ArrayList<MemberDTO> getAllMember() {
		String sql = "select a.M_NO, a.M_NAME, b.P_NAME, a.P_SCHOOL, a.M_JUMIN, a.M_CITY, b.P_TEL1, b.P_TEL2, b.P_TEL3 from TBL_MEMBER_202005 a, TBL_PARTY_202005 b where a.P_CODE = b.P_CODE order by a.M_NO";
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO m = new MemberDTO();
				m.setM_NO(rs.getInt("M_NO"));
				m.setM_NAME(rs.getString("M_NAME"));
				m.setP_NAME(rs.getString("P_NAME"));
				m.setP_SCHOOL(rs.getInt("P_SCHOOL"));
				m.setM_JUMIN(rs.getString("M_JUMIN"));
				m.setM_CITY(rs.getString("M_CITY"));
				m.setP_TEL1(rs.getString("P_TEL1"));
				m.setP_TEL2(rs.getString("P_TEL2"));
				m.setP_TEL3(rs.getString("P_TEL3"));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean insertVote(VoteDTO dto) {
		boolean result = false;
		String sql = "INSERT INTO TBL_VOTE_202005 values(?, ?, ?, ?, ?, ?)";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getV_JUMIN());
			pstmt.setString(2, dto.getV_NAME());
			pstmt.setInt(3, dto.getM_NO());
			pstmt.setString(4, dto.getV_TIME());
			pstmt.setString(5, dto.getV_AREA());
			pstmt.setString(6, dto.getV_CONFIRM());
			
			int rs = pstmt.executeUpdate();
			if(rs > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<VoteDTO> getAllVote() {
		String sql = "SELECT * FROM TBL_VOTE_202005 order by V_CONFIRM";
		ArrayList<VoteDTO> list = new ArrayList<VoteDTO>();
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				VoteDTO m = new VoteDTO();
				m.setV_JUMIN(rs.getString("V_JUMIN"));
				m.setV_NAME(rs.getString("V_NAME"));
				m.setM_NO(rs.getInt("M_NO"));
				m.setV_TIME(rs.getString("V_TIME"));
				m.setV_AREA(rs.getString("V_AREA"));
				m.setV_CONFIRM(rs.getString("V_CONFIRM"));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<MemberVoteDTO> getAllMemberVote() {
		String sql = "SELECT a.M_NO, a.M_NAME, count(b.M_NO) M_NO_NUM FROM TBL_MEMBER_202005 a, TBL_VOTE_202005 b where a.M_NO = b.M_NO AND b.V_CONFIRM = 'Y' group by (a.M_NO, a.M_NAME) order by count(b.M_NO) desc";
		ArrayList<MemberVoteDTO> list = new ArrayList<MemberVoteDTO>();
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVoteDTO m = new MemberVoteDTO();
				m.setM_NO(rs.getInt("M_NO"));
				m.setM_NAME(rs.getString("M_NAME"));
				m.setM_NO_NUM(rs.getInt("M_NO_NUM"));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}

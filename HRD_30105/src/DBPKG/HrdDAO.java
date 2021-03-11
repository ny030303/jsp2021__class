package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MemberDTO;
import dto.MoneyDTO;

public class HrdDAO {
	
//	private static HrdDAO instance = new HrdDAO();
//	
//	public HrdDAO() {};
//	
//	public static HrdDAO getInstance() {return instance;}
	
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		return con;
	}
	
	public int getLastCustno() {
		int lastCustno = -1;
		try {
			Connection con = getConnection();
			String sql = "SELECT max(custno) as custno from MEMBER_TBL_02";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				lastCustno = res.getInt("custno");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		
		return lastCustno;
	}
	
	public boolean insertMember(MemberDTO dto) {
		boolean result = false;
		try {
			Connection con = getConnection();
			String sql = "insert into MEMBER_TBL_02 values (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getCustno());
			pstmt.setString(2, dto.getCustname());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getAddress());
			pstmt.setDate(5, dto.getJoindate());
			pstmt.setString(6, dto.getGrade());
			pstmt.setString(7, dto.getCity());
			int res = pstmt.executeUpdate();
			if(res > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return result;
	}
	
	private MemberDTO makeMember(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		dto.setCustno(rs.getInt("custno"));
		dto.setCustname(rs.getString("custname"));
		dto.setPhone(rs.getString("phone"));
		dto.setAddress(rs.getString("address"));
		dto.setJoindate(rs.getDate("joindate"));
		dto.setGrade(rs.getString("grade"));
		dto.setCity(rs.getString("city"));
		return dto;
	}
	
	public ArrayList<MemberDTO> getAllMember() {
		ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
		try {
			Connection con = getConnection();
			String sql = "SELECT * from MEMBER_TBL_02";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO member = makeMember(rs);
				arr.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return arr;
	}
	
	public MemberDTO getAMember(int custno) {
		MemberDTO member = null;
		try {
			Connection con = getConnection();
			String sql = "SELECT * from MEMBER_TBL_02 WHERE custno = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, custno);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				member = makeMember(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return member;
	}
	
	public ArrayList<MoneyDTO> getAllMoney() {
		ArrayList<MoneyDTO> arr = new ArrayList<MoneyDTO>();
		try {
			Connection con = getConnection();
			String sql = "select a.custno, a.custname, a.grade, sum(b.price) as price " + 
					"from member_tbl_02 a, money_tbl_02 b " + 
					"where a.custno=b.custno " + 
					"group by a.custno, a.custname, a.grade " + 
					"order by price desc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MoneyDTO dto = new MoneyDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setGrade(rs.getString("grade"));
				dto.setPrice(rs.getInt("price"));
				arr.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return arr;
	}
	
	public boolean updateMember(MemberDTO dto) {
		boolean result = false;
		try {
			Connection con = getConnection();
			String sql = "UPDATE member_tbl_02 SET custname=?,phone=?,address=?,joindate=?,grade=?,city=? WHERE custno=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setDate(4, dto.getJoindate());
			pstmt.setString(5, dto.getGrade());
			pstmt.setString(6, dto.getCity());
			pstmt.setInt(7, dto.getCustno());
			int res = pstmt.executeUpdate();
			if(res > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return result;
	}
}

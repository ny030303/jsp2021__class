package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.MemberDTO;
import dto.MoneyDTO;

public class HrdDAO {
	
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		return con;
	}
	
	public int getMaxCustno() {
		int result = -1;
		String sql = "select max(custno) custno from member_tbl_02";
		
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("custno");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean insertMember(MemberDTO member) {
		boolean result = false;
		String sql = "insert into member_tbl_02 values(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, member.getCustno());
			pstmt.setString(2, member.getCustname());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getAddress());
			pstmt.setDate(5, member.getJoindate());
			pstmt.setString(6, member.getGrade());
			pstmt.setInt(7, member.getCity());
			int rs = pstmt.executeUpdate();
			if(rs > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<MemberDTO> getAllMember() {
		 ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "select * from member_tbl_02 order by custno";
		
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getDate("joindate"));
				dto.setGrade(rs.getString("grade"));
				dto.setCity(rs.getInt("city"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public MemberDTO getAMember(int custno) {
		MemberDTO dto = new MemberDTO();
		String sql = "select * from member_tbl_02 where custno = ?";
		
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, custno);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getDate("joindate"));
				dto.setGrade(rs.getString("grade"));
				dto.setCity(rs.getInt("city"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public boolean updateMember(MemberDTO member) {
		boolean result = false;
		String sql = "update MEMBER_TBL_02 set custname=?, phone=?, address=?, grade=?, city=? where custno=?";
		
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member.getCustname());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getAddress());
			pstmt.setString(4, member.getGrade());
			pstmt.setInt(5, member.getCity());
			pstmt.setInt(6, member.getCustno());
			int rs = pstmt.executeUpdate();
			if(rs > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<MoneyDTO> getAllMoney() {
		ArrayList<MoneyDTO> list = new ArrayList<MoneyDTO>();
		String sql = "select a.custno, b.custname, grade, sum(a.price) price from money_tbl_02 a, member_tbl_02 b where a.custno = b.custno group by a.custno, b.custname, grade order by a.custno";
		
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MoneyDTO dto = new MoneyDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setGrade(rs.getString("grade"));
				dto.setPrice(rs.getInt("price"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}

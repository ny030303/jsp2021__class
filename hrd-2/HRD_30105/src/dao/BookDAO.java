package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.BookRentDTO;
import dto.MemDTO;
import dto.MemRentDTO;

public class BookDAO {
	
	public static Connection getConn() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		return con;
	}
	
	public int getMaxCustno() {
		int custno = -1;
		String sql = "SELECT max(custno) custno from mem_tbl_book";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				custno = res.getInt("custno");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return custno;
	}
	
	public boolean insertMem(MemDTO mem) {
		boolean result = false;
		String sql = "INSERT INTO MEM_TBL_BOOK values(?, ?, ?, ?, ?)";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mem.getCustno());
			pstmt.setString(2, mem.getCustname());
			pstmt.setDate(3, mem.getJoindate());
			pstmt.setString(4, mem.getGrade());
			pstmt.setString(5, mem.getAddress());
			
			int res = pstmt.executeUpdate();
			
			if(res > 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<MemDTO> getAllMem() {
		ArrayList<MemDTO> arr = new ArrayList<MemDTO>();
		String sql = "select * from MEM_TBL_BOOK";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemDTO mem = new MemDTO();
				mem.setCustno(rs.getInt("custno"));
				mem.setCustname(rs.getString("custname"));
				mem.setJoindate(rs.getDate("joindate"));
				mem.setGrade(rs.getString("grade"));
				mem.setAddress(rs.getString("address"));
				arr.add(mem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
	}
	
	public MemDTO getAMem(int custno) {
		MemDTO mem = new MemDTO();
		String sql = "select * from MEM_TBL_BOOK where custno = ?";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, custno);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mem.setCustno(rs.getInt("custno"));
				mem.setCustname(rs.getString("custname"));
				mem.setJoindate(rs.getDate("joindate"));
				mem.setGrade(rs.getString("grade"));
				mem.setAddress(rs.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mem;
	}
	
	public boolean updateMem(MemDTO mem) {
		boolean result = false;
		String sql = "UPDATE MEM_TBL_BOOK set custname=?, joindate=?, grade=?, address=? where custno=?";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mem.getCustname());
			pstmt.setDate(2, mem.getJoindate());
			pstmt.setString(3, mem.getGrade());
			pstmt.setString(4, mem.getAddress());
			pstmt.setInt(5, mem.getCustno());
			int res = pstmt.executeUpdate();
			if(res > 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	public ArrayList<MemRentDTO> getAllMemberRent() {
		ArrayList<MemRentDTO> arr = new ArrayList<MemRentDTO>();
		String sql = "SELECT a.custno, a.custname, count(a.custno) countnum FROM mem_tbl_book a, rent_tbl_book b WHERE a.custno=b.custno group by a.custno, a.custname order by a.custno";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemRentDTO mr = new MemRentDTO();
				mr.setCustno(rs.getInt("custno"));
				mr.setCustname(rs.getString("custname"));
				mr.setCountNum(rs.getInt("countnum"));
				arr.add(mr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	public ArrayList<BookRentDTO> getAllBookRent() {
		ArrayList<BookRentDTO> arr = new ArrayList<BookRentDTO>();
		String sql = "select bookno, count(bookno) countNum from rent_tbl_book group by bookno";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookRentDTO br = new BookRentDTO();
				br.setBookno(rs.getInt("bookno"));
				br.setCountNum(rs.getInt("countNum"));
				arr.add(br);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
}

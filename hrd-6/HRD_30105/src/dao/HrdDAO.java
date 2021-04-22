package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.CustDTO;
import dto.GetOrderDTO;
import dto.IngectionDTO;
import dto.OrderDTO;

public class HrdDAO {
	
	private static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		return con;
	};
	
	public int getMaxPno() {
		int result = -1;
		String sql = "";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<CustDTO> getAllCust() {
		ArrayList<CustDTO> list = new ArrayList<CustDTO>();
		String sql = "select * from tbl_cust_201004 order by p_no";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				CustDTO c = new CustDTO();
				c.setP_no(rs.getInt("p_no"));
				c.setP_name(rs.getString("p_name"));
				c.setP_birth(rs.getInt("p_birth"));
				c.setP_tel1(rs.getInt("p_tel1"));
				c.setP_tel2(rs.getInt("p_tel2"));
				c.setP_tel3(rs.getInt("p_tel3"));
				c.setP_city(rs.getInt("p_city"));
				c.setP_gender(rs.getString("p_gender"));
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean insertOrder(OrderDTO dto) {
		boolean result = false;
		String sql = "insert into tbl_order_201004 values(?, ?, ?, ?)";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getP_seno());
			pstmt.setString(2, dto.getI_code());
			pstmt.setInt(3, dto.getP_no());
			pstmt.setDate(4, dto.getP_date());
			int rs = pstmt.executeUpdate();
			if(rs > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<GetOrderDTO> getAllOrder() {
		ArrayList<GetOrderDTO> list = new ArrayList<GetOrderDTO>();
		String sql = "select b.p_seno, a.p_no, a.p_name, b.i_code, c.i_name, b.p_date  from tbl_cust_201004 a, tbl_order_201004 b, tbl_ingection_201004 c where a.p_no = b.p_no AND b.i_code = c.i_code order by b.p_seno, a.p_no";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				GetOrderDTO dto = new GetOrderDTO();
				dto.setP_seno(rs.getInt("p_seno"));
				dto.setP_no(rs.getInt("p_no"));
				dto.setP_name(rs.getString("p_name"));
				dto.setI_code(rs.getString("i_code"));
				dto.setI_name(rs.getString("i_name"));
				dto.setP_date(rs.getDate("p_date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<IngectionDTO> getAllIngection() {
		ArrayList<IngectionDTO> list = new ArrayList<IngectionDTO>();
		String sql = "select a.i_code, b.i_name, count(a.i_code) num from tbl_order_201004 a, tbl_ingection_201004 b group by  a.i_code, b.i_name order by a.i_code";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				IngectionDTO dto = new IngectionDTO();
				dto.setI_code(rs.getString("i_code"));
				dto.setI_name(rs.getString("i_name"));
				dto.setNum(rs.getInt("num"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}

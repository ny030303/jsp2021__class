package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		}
		
		return lastCustno;
	}
}

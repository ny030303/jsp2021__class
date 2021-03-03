package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class testDAO {
	private static testDAO instance = new testDAO();
	private testDAO() {};

	public static testDAO getInstance() {
		return instance;
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "hr";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return conn;
	}
	
	public boolean insert() {
		try {
			conn = instance.getConnection();
			String sql = "INSERT into test values('aa', '11')";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			String sql2 = "INSERT into test values('bb', '22')";
			pstmt = conn.prepareStatement(sql2);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {conn.close();}
				if (pstmt != null) {pstmt.close();}
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean create() {
		try {
			conn = instance.getConnection();
			String sql = "create table test(id varchar2(5), pwd varchar2(5))";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {conn.close();}
				if (pstmt != null) {pstmt.close();}
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		return false;
	}
}

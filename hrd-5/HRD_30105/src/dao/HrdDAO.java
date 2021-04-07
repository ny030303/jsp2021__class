package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.PersonDTO;

public class HrdDAO {
	
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		return con;
	}
	
	public ArrayList<PersonDTO> getAllPerson() {
		ArrayList<PersonDTO> arr = new ArrayList<PersonDTO>();
		String sql = "select * from personnel";
		try {
			PreparedStatement pstmt = getConnection().prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PersonDTO person = new PersonDTO();
				person.setId(rs.getInt("id"));
				person.setName(rs.getString("name"));
				person.setDept(rs.getString("dept"));
				person.setPosition(rs.getInt("position"));
				person.setDuty(rs.getString("duty"));
				person.setPhone(rs.getString("phone"));
				
				arr.add(person);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	public ArrayList<PersonDTO> getIdPersons(int id) {
		ArrayList<PersonDTO> arr = new ArrayList<PersonDTO>();
		String sql = "select * from personnel where id = ?";
		try {
			PreparedStatement pstmt = getConnection().prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PersonDTO person = new PersonDTO();
				person.setId(rs.getInt("id"));
				person.setName(rs.getString("name"));
				person.setDept(rs.getString("dept"));
				person.setPosition(rs.getInt("position"));
				person.setDuty(rs.getString("duty"));
				person.setPhone(rs.getString("phone"));
				
				arr.add(person);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
}

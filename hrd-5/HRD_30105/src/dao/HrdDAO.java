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
	
	public ArrayList<PersonDTO> getDeptPersons(String dept) {
		ArrayList<PersonDTO> arr = new ArrayList<PersonDTO>();
		String sql = "select * from personnel where dept = ?";
		try {
			PreparedStatement pstmt = getConnection().prepareStatement(sql);
			pstmt.setString(1, dept);
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
	
	public boolean insertPerson(PersonDTO person) {
		boolean result = false;
		String sql = "insert into PERSONNEL values(?, ?, ?, ?,?,?)";
		try {
			PreparedStatement pstmt = getConnection().prepareStatement(sql);
			pstmt.setInt(1, person.getId());
			pstmt.setString(2, person.getName());
			pstmt.setString(3, person.getDept());
			pstmt.setInt(4, person.getPosition());
			pstmt.setString(5, person.getDuty());
			pstmt.setString(6, person.getPhone());
			int rs = pstmt.executeUpdate();
			if(rs > 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean updatePerson(PersonDTO person) {
		boolean result = false;
		String sql = "update PERSONNEL set name=?,dept=?,position=?, duty=?, phone=? where id=?";
		try {
			PreparedStatement pstmt = getConnection().prepareStatement(sql);
			pstmt.setString(1, person.getName());
			pstmt.setString(2, person.getDept());
			pstmt.setInt(3, person.getPosition());
			pstmt.setString(4, person.getDuty());
			pstmt.setString(5, person.getPhone());
			pstmt.setInt(6, person.getId());
			int rs = pstmt.executeUpdate();
			if(rs > 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean deletePerson(PersonDTO person) {
		boolean result = false;
		String sql = "delete  from  PERSONNEL where id =? and name=?";
		try {
			PreparedStatement pstmt = getConnection().prepareStatement(sql);
			pstmt.setInt(1, person.getId());
			pstmt.setString(2, person.getName());
			int rs = pstmt.executeUpdate();
			if(rs > 0) result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}

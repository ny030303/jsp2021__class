package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.CourseDTO;
import dto.LecturerDTO;

public class HrdDAO {
	
	
	private static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		return con;
	}
	
	public int getSizeNum() {
		int result = -1;
		String sql = "select count(id) num from course_tbl";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				result = res.getInt("num");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<CourseDTO> getAllCourse() {
		ArrayList<CourseDTO> arr = new ArrayList<CourseDTO>();
		String sql = "select a.id, a.name, a.credit, b.name lecturer, a.week, a.start_hour, a.end_end from course_tbl a, lecturer_tbl b where a.lecturer = b.idx order by a.id";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				CourseDTO course = new CourseDTO();
				course.setId(res.getString("id"));
				course.setName(res.getString("name"));
				course.setCredit(res.getInt("credit"));
				course.setLecturer(res.getString("lecturer"));
				course.setWeek(res.getInt("week"));
				course.setStart_hour(res.getInt("start_hour"));
				course.setEnd_end(res.getInt("end_end"));
				arr.add(course);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return arr;
	}
	
	public ArrayList<LecturerDTO> getLecturerNames() {
		ArrayList<LecturerDTO> arr = new ArrayList<LecturerDTO>();
		String sql = "select * from lecturer_tbl order by idx";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				LecturerDTO l = new LecturerDTO();
				l.setIdx(res.getInt("idx"));
				l.setName(res.getString("name"));
				l.setMajor(res.getString("major"));
				l.setField(res.getString("field"));
				arr.add(l);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return arr;
	}
	
	public boolean insertCourse(CourseDTO dto) {
		boolean result = false;
		String sql = "insert into course_tbl values (?, ?, ?, ?,?,?, ?)";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getCredit());
			pstmt.setString(4, dto.getLecturer());
			pstmt.setInt(5, dto.getWeek());
			pstmt.setInt(6, dto.getStart_hour());
			pstmt.setInt(7, dto.getEnd_end());
			int res = pstmt.executeUpdate();
			if(res > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public CourseDTO getCourse(String id) {
		CourseDTO course = new CourseDTO();
		String sql = "select * from course_tbl where id=?";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				course.setId(res.getString("id"));
				course.setName(res.getString("name"));
				course.setCredit(res.getInt("credit"));
				course.setLecturer(res.getString("lecturer"));
				course.setWeek(res.getInt("week"));
				course.setStart_hour(res.getInt("start_hour"));
				course.setEnd_end(res.getInt("end_end"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return course;
	}
	
	public boolean updateCourse(CourseDTO dto) {
		boolean result = false;
		String sql = "update course_tbl set name=?, credit=?, lecturer=?,week=?,start_hour=?,end_end=? where id=?";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getCredit());
			pstmt.setString(3, dto.getLecturer());
			pstmt.setInt(4, dto.getWeek());
			pstmt.setInt(5, dto.getStart_hour());
			pstmt.setInt(6, dto.getEnd_end());
			pstmt.setString(7, dto.getId());
			int res = pstmt.executeUpdate();
			if(res > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean deleteCourse(String id) {
		boolean result = false;
		String sql = "delete from course_tbl where id=?";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			int res = pstmt.executeUpdate();
			if(res > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public LecturerDTO getLecturer(int idx) {
		LecturerDTO lecturer = new LecturerDTO();
		String sql = "select * from course_tbl where idx=?";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				lecturer.setIdx(res.getInt("idx"));
				lecturer.setName(res.getString("name"));
				lecturer.setMajor(res.getString("major"));
				lecturer.setField(res.getString("field"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lecturer;
	}
	
	public boolean insertLecturer(LecturerDTO dto) {
		boolean result = false;
		String sql = "insert into lecturer_tbl values(?,?,?,?)";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getIdx());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getMajor());
			pstmt.setString(4, dto.getField());
			
			int res = pstmt.executeUpdate();
			if(res > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean deleteLecturer(int idx) {
		boolean result = false;
		String sql = "delete from lecturer_tbl where idx=?";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			int res = pstmt.executeUpdate();
			if(res > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}

package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.EmpDTO;
import dto.SalaryDTO;

public class HrdDAO {
	public static Connection getConn() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		return con;
	}
	
	public int getMaxEmpno() {
		int empno = -1;
		String sql = "select MAX(empno) empno from EMPLOYEE_TBL";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				empno = rs.getInt("empno");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return empno;
	}
	
	public boolean insertEmp(EmpDTO dto) {
		boolean result = false;
		String sql = "INSERT INTO EMPLOYEE_TBL values (?, ?, ?, ?, ?)";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getEmpno());
			pstmt.setString(2, dto.getEmpname());
			pstmt.setString(3, dto.getJoindate());
			pstmt.setString(4, dto.getRank());
			pstmt.setString(5, dto.getDept());
			int rs = pstmt.executeUpdate();
			if(rs > 0) {
				sql = "INSERT INTO salary_tbl values (?, sysdate, 0)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getEmpno());
				int rs2 = pstmt.executeUpdate();
				if(rs2 > 0) {
					result = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<EmpDTO> getAllEmp() {
		ArrayList<EmpDTO> arr = new ArrayList<EmpDTO>();
		String sql = "select empno, empname, to_char(joindate, 'YYYY-MM-DD') joindate, rank, dept from EMPLOYEE_TBL order by empno";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				EmpDTO emp = new EmpDTO();
				emp.setEmpno(rs.getInt("empno"));
				emp.setEmpname(rs.getString("empname"));
				emp.setJoindate(rs.getString("joindate"));
				emp.setRank(rs.getString("rank"));
				emp.setDept(rs.getString("dept"));
				arr.add(emp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
	}
	
	public EmpDTO getAEmp(int empno) {
		EmpDTO emp = new EmpDTO();
		String sql = "select empno, empname, to_char(joindate, 'YYYY-MM-DD') joindate, rank, dept from EMPLOYEE_TBL WHERE empno=?";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				emp.setEmpno(rs.getInt("empno"));
				emp.setEmpname(rs.getString("empname"));
				emp.setJoindate(rs.getString("joindate"));
				emp.setRank(rs.getString("rank"));
				emp.setDept(rs.getString("dept"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return emp;
	}
	
	
	public boolean updateEmp(EmpDTO dto) {
		boolean result = false;
		String sql = "update EMPLOYEE_TBL set empname=?, joindate=?, rank=?, dept=? where empno = ?";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getEmpname());
			pstmt.setString(2, dto.getJoindate());
			pstmt.setString(3, dto.getRank());
			pstmt.setString(4, dto.getDept());
			pstmt.setInt(5, dto.getEmpno());
			int rs = pstmt.executeUpdate();
			if(rs > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public ArrayList<SalaryDTO> getAllSalaryList() {
		ArrayList<SalaryDTO> arr = new ArrayList<SalaryDTO>();
		String sql = "select a.empno, a.empname, sum(pay) pay from EMPLOYEE_TBL a, salary_tbl b where a.empno = b.empno group by a.empno, a.empname order by pay DESC";
		try {
			Connection con = getConn();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				SalaryDTO salary = new SalaryDTO();
				salary.setEmpno(rs.getInt("empno"));
				salary.setEmpname(rs.getString("empname"));
				salary.setPay(rs.getInt("pay"));
				arr.add(salary);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
	}
}

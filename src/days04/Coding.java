package days04;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

import days03.DeptDTO;
import days03.EmpDTO;

public class Coding {
	
	public static void main(String[] args) {
		
		ArrayList<DeptDTO> dlist = null;
		ArrayList<EmpDTO> elist = null;
		
		Connection conn = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		
		conn = DBConn.getConnection();
		sql = "select * from dept";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dlist= new ArrayList<DeptDTO>();
				int deptno;
				String dname, loc;
				DeptDTO dto;
			
				
				do{
					dto = new DeptDTO();
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");
					dto.setDeptno(deptno);
					dto.setDname(dname);
					dto.setLoc(loc);
					
					 
				 }while(rs.next());
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConn.close();
		
	}

}

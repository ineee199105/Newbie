package dao;


import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

import vo.Member;

public class SignUpDAO {
	
	private static SignUpDAO signUpDAO;
	private Connection con;
	
	private SignUpDAO() {
		
	}
	
	public static SignUpDAO getInstance() {
		if(signUpDAO == null) {
			signUpDAO = new SignUpDAO();
		}
		return signUpDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertMember(Member member) {
		
		PreparedStatement pstmt = null;
		String sql = "";
		int insertCount = 0;
		
		try {
			sql = "INSERT INTO users (id, passwd, addr, age, email, gender, name, nation)";
			sql += "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
				
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getAddr());
			pstmt.setInt(4, member.getAge());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getName());
			pstmt.setString(8, member.getNation());
			
			insertCount = pstmt.executeUpdate();
		
		}catch (Exception ex) {
			System.out.println("insertMember 에러 + " + ex);
		}finally {
			close(con);
			close(pstmt);
		}
		
		return insertCount;
	}		

public int modifyMember(Member member) {
	
	PreparedStatement pstmt = null;
	String sql = "";
	int insertCount = 0;
	
	try {
		sql = "INSERT INTO users (id, passwd, addr, age, email, gender, name, nation)";
		sql += "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getPasswd());
		pstmt.setString(3, member.getAddr());
		pstmt.setInt(4, member.getAge());
		pstmt.setString(5, member.getEmail());
		pstmt.setString(6, member.getGender());
		pstmt.setString(7, member.getName());
		pstmt.setString(8, member.getNation());
		
		insertCount = pstmt.executeUpdate();
	
	}catch (Exception ex) {
		System.out.println("modifyMember 에러 + " + ex);
	}finally {
		close(con);
		close(pstmt);
	}
	
	return insertCount;
}		

public int deleteMember(Member member) {
	
	PreparedStatement pstmt = null;
	String sql = "";
	int insertCount = 0;
	
	try {
		sql = "DELETE FROM users WHERE id=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, member.getId());
		
		insertCount = pstmt.executeUpdate();
	
	}catch (Exception ex) {
		System.out.println("deleteMember 에러 + " + ex);
	}finally {
		close(con);
		close(pstmt);
	}
	
	return insertCount;
	}		
}


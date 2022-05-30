package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;
		
		try {
			sql = "INSERT INTO users (id, passwd, addr, age, email, gender, name, nation,";
			sql += "VALUES(?, ?, ?, ?, ?, ?, ?, ?";
				
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
		
		}catch (Exception ex) {
			System.out.println("insertMember ¿¡·¯ + " + ex);
		}
		}
		
	}



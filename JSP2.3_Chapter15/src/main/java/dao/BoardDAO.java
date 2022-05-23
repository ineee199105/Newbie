package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import vo.BoardBean;

public class BoardDAO {
	
	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;
	
	private static BoardDAO getInstance() {
		if(boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public int insertArticle(BoardBean article) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;
		
		try {
			pstmt = con.prepareStatement("SELECT MAX(BOARD_NUM) FROM board");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num = rs.getInt(1) + 1;
			else
				num =1;
			
			sql = "INSERT INTO board (BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT,";
		}
		
	}
}
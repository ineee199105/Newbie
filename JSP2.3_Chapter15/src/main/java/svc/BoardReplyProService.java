package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;


import dao.BoardDAO;
import vo.BoardBean;

public class BoardReplyProService {
	
	public boolean registReply(BoardBean boardBean) throws Exception {
		boolean isReplySuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = boardDAO.insertReplyAction(boardBean);
		
		if (insertCount > 0) {
			commit(con);
			isReplySuccess = true;
		}
		else {
			rollback(con);
		}
		
		close(con);
		return isReplySuccess;
	}

}

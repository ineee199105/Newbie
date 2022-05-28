package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.BoardDAO;

public class BoardDeleteProService {

	public boolean isArticleWriter (int board_num, String pass) throws Exception {
		
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		isArticleWriter = boardDAO.isArticleBoardWriter(board_num, pass);
		close(con);
		return isArticleWriter;
		
	}

	public boolean removeAction (int board_num) throws Exception {
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		int deleteCount = boardDAO.deleteArticle(board_num);
		
		if (deleteCount > 0) {
			commit(con);
			isRemoveSuccess = true;
		}
		else {
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}
}


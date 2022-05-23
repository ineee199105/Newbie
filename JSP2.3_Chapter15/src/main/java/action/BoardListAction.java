package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;
import vo.BoardBean;

public class BoardListAction implements Action {
	
	public ActionForward execute (HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
	
		BoardListService boardListService = new BoardListService();
		int listCount = boardListService.getListCount();
	}

}

package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		BoardDetailService boardDetailService = new BoardDetailService();
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		BoardBean article = boardDetailService.getArticle(board_num);
		request.setAttribute("article", article);
		forward.setPath("/board/qna_board_modify.jsp");
		return forward;
		
	}
}
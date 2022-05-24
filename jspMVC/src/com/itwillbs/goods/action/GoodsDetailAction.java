package com.itwillbs.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.admin.goods.db.GoodsDTO;
import com.itwillbs.goods.db.GoodsDAO;

public class GoodsDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : GoodsDetailAction_execute() 호출");
		
		// 전달된 정보 저장(num)
		int num = Integer.parseInt(request.getParameter("num"));
		
		// DAO 객체 
		GoodsDAO dao = new GoodsDAO();
		
		// getGoods(num)
		GoodsDTO dto = dao.getGoods(num);
		
		// request 영역에 저장
		request.setAttribute("dto", dto);
		
		// 페이지 이동
		// ./goods/goods_detail.jsp
		ActionForward forward = new ActionForward();
		forward.setPath("./goods/goods_detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}

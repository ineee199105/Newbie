package com.itwillbs.admin.goods.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.admin.goods.db.AdminGoodsDAO;

public class GoodsDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : GoodsDeleteAction_execute() 호출");
		
		// 전달정보 저장 (num)
		int num = Integer.parseInt(request.getParameter("num"));
		
		// DAO 객체
		AdminGoodsDAO dao = new AdminGoodsDAO();
		
		// deleteGoods(num)
		dao.deleteGoods(num);
		
		// 페이지 이동(./GoodsList.ag)
		ActionForward forward = new ActionForward();
		forward.setPath("./GoodsList.ag");
		forward.setRedirect(true);
		
		return forward;
	}

}

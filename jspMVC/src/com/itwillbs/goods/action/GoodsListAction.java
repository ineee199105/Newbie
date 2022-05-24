package com.itwillbs.goods.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.admin.goods.db.GoodsDTO;
import com.itwillbs.goods.db.GoodsDAO;

public class GoodsListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : GoodsListAction_execute 호출 ");
		
		// 전달되는 파라메터를 저장
		String item = request.getParameter("item");
		
		if(item == null){ // 선택한 카테고리가 없음(페이지 첫이동)=> 전체정보
			item = "all";
		}
		
		System.out.println(" M : item = "+ item);
		
		
		// DAO 객체 
		GoodsDAO dao = new GoodsDAO();
		
		// 상품 전체 정보 가져오는 메서드 구현
		//List<GoodsDTO> goodsList = dao.getGoodsList();
		List<GoodsDTO> goodsList = dao.getGoodsList(item);
		
		// request 영역에 저장
		request.setAttribute("goodsList", goodsList);
		
		// 페이지 이동 (./goods/goods_list.jsp)
		ActionForward forward = new ActionForward();
//		forward.setPath("./goods/goods_list.jsp");
		forward.setPath("./goods/goods_list2.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}

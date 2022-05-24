package com.itwillbs.order.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.basket.db.BasketDAO;
import com.itwillbs.order.db.OrderDAO;
import com.itwillbs.order.db.OrderDTO;

public class OrderAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : OrderAddAction_execute 호출");
		
		// 세션제어
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./GoodsList.go");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글처리(생략)
		// 전달된 정보 저장 (주문) - OrderDTO
		// 
		OrderDTO dto = new OrderDTO();
		
		dto.setO_r_name(request.getParameter("o_r_name"));
		dto.setO_r_phone(request.getParameter("o_r_phone"));
		dto.setO_r_addr1(request.getParameter("o_r_addr1"));
		dto.setO_r_addr2(request.getParameter("o_r_addr2"));
		dto.setO_r_msg(request.getParameter("o_r_msg"));
		
		dto.setO_trade_payer(request.getParameter("o_trade_payer"));
		dto.setO_trade_type(request.getParameter("o_trade_type"));
		
		dto.setO_m_id(id);
		
		//System.out.println(dto);
		
		// 장바구니 정보(장바구니+상품)
		BasketDAO bkDAO = new BasketDAO();
		
		Vector totalList = bkDAO.getBasketList(id);
		
		// 장바구니 정보
		List basketList = (List)totalList.get(0);
		// 상품 정보
		List goodsList = (List)totalList.get(1);
		
		// 결제모듈(API)
		System.out.println("------------------------------------------");
		System.out.println("           KAKAOPAY 실행 완료             ");
		System.out.println("------------------------------------------");
		
		// 주문정보 저장(OrderDAO)
		OrderDAO orDAO = new OrderDAO();
		orDAO.addOrder(dto,basketList,goodsList);
		
		// 메일,문자 알림 (Thread)
		
		// 상품 수량 수정
		
		// 장바구니 삭제(비우기)
		
		//  페이지 이동 (./OrderList.or)		
		
		return null;
	}

}

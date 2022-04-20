package com.itwillbs.jstl;

import java.io.IOException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.itwillbs.bean.MemberBean;

// http://localhost:8088/JSTL_EL5/jstl1
public class Servlet1 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet1-doGet() 호출");
		
		// "test"-"100"  => set2.jsp 페이지로 전달
		
		// request 영역에 정보를 저장
		request.setAttribute("test", "100");
		System.out.println(" request 영역에 정보 저장완료! ");
		
		
		// MemberBean 객체를 생성해서 정보 저장후 set2.jsp 전달해서 출력
		MemberBean mb = new MemberBean();
		mb.setId("admin");
		mb.setPw("1234");
		mb.setName("관리자");
		mb.setGender("남");
		mb.setAddr("부산");
		
		request.setAttribute("MemberBean", mb);
		
		
		// 배열 - ArrayList 사용
		
		MemberBean mb2 = new MemberBean();
		mb2.setId("itwill");
		mb2.setPw("1234");
		mb2.setName("사용자");
		mb2.setGender("여");
		mb2.setAddr("서울");
		
		ArrayList memberList = new ArrayList();
		memberList.add(mb);
		memberList.add(mb2);
		
		// request영역에 저장 -> set2.jsp 페이지전달
		request.setAttribute("memberList", memberList);
		
		// 서블릿에서 세션객체 사용하기
		HttpSession session = request.getSession();
		session.setAttribute("memberLists", memberList);
				
		
		// 페이지 이동 set2.jsp
		/*<jsp:forward page="set2.jsp"></jsp:forward>
		 * 액션태그는 jsp 페이지에서만 사용가능
		 * */
		
		RequestDispatcher dis
		     = request.getRequestDispatcher("./jstl_core/set2.jsp");
		
		dis.forward(request, response);
		
	
	}
	
}

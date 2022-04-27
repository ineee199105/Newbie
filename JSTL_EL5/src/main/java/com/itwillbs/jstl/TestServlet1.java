package com.itwillbs.jstl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// http://localhost:8088/JSTL_EL5/test1
public class TestServlet1 extends HttpServlet{

	// alt shift s + v
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(" doGet() 호출!!! ");
		
		// request 영역의 데이터를 생성
		request.setAttribute("cnt", 3000);
		
		// session 영역의 데이터를 생성
		HttpSession session = request.getSession();
		
		session.setAttribute("cnt", 4000);
		
		
		// attributeTest.jsp 페이지로 정보 전달 
		RequestDispatcher dis 
		     = request.getRequestDispatcher("./el/attributeTest.jsp");
		dis.forward(request, response);
		
		
	}
	

}

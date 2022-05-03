package com.itwillbs.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost:8088/servlet5/ex2
// http://localhost:8088/servlet5/ex3

@WebServlet("/ex3")
public class MyServlet2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// 서블릿 객체를 사용해서 본인이름을 화면에 출력
		System.out.println(" MyServlet2 - doGet() 호출");
		
	/*	response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(" 홍길동 ");
		out.close();*/
		
		// 페이지 이동
		// Redirect 방식
		// 주소변화 O  (ex2 -> ex2.jsp)
		// 화면변화 O  (흰 -> 주)
		//response.sendRedirect("./ex2.jsp");
		
		// Dispatcher 방식
		// 주소변화 X (ex2 -> ex2)
		// 화면변화 O (흰 -> 주)
		RequestDispatcher dis = request.getRequestDispatcher("./ex2.jsp");
		dis.forward(request, response);
	
	}
	

}

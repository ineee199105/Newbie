package com.itwillbs.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {
	
	private int visitCount = 0;

	
	// http://localhost:8088/servlet5/myservlet
	// alt shift s + v
	
	@Override
	public void init() throws ServletException {
		// 서블릿이 '최초' 생성시 호출되는 메서드
		System.out.println(" 서블릿 최초 생성! ");		
	}
	
	@Override
	protected void doGet(HttpServletRequest request,
			 HttpServletResponse response) throws ServletException, IOException {
		
		// GET방식으로 페이지 요청시 실행되는 메서드
		System.out.println("GET방식 페이지 호출!");	
		doPost(request, response);          
		
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// POST 방식으로 페이지 요청시 실행되는 메서드
		System.out.println("POST방식 페이지 호출!");
		
		visitCount++;
		
		// 화면 구현 동작
		response.setContentType("text/html; charset=utf-8");
		
		// 화면 출력객체
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<head>");
		out.print("</head>");
		out.print("<body>");
		out.print("   <h1> 이 페이지는 서블릿으로 구현!!! </h1>   ");
		out.print("   <img src='https://movie-phinf.pstatic.net/20220406_115/1649221973410H0er9_JPEG/movie_image.jpg?type=m203_290_2'>   ");
		out.print("   방문자수 : "+visitCount+"명 <br>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();		
		
	}


	@Override
	public void destroy() {
		// 해당 서블릿이 소멸될때 호출
		System.out.println("서블릿 소멸");		
	}
	
	
	

}

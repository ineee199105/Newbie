package com.itwillbs.jstl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet2 extends HttpServlet {

	// alt shfit s + v
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String[] foods = {"삼겹살","짜장면","햄버거","피자","아이스커피"};
		
		request.setAttribute("foods", foods);
		
		// ArrayList 영화
		ArrayList movies = new ArrayList();
		movies.add("신비한 동물들과 덤블도어의 비밀");
		movies.add("모비우스");
	    movies.add("이상한 나라의 수학자");
		movies.add("수퍼 소닉2");
		movies.add("앰뷸런스");
		
		request.setAttribute("movies", movies);
		
		// array.jsp 생성후 foods 데이터를 모두 화면에 출력
		RequestDispatcher dis =
				request.getRequestDispatcher("./el/array.jsp");
		dis.forward(request, response);
		
	}
	
	
	

}

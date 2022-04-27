package com.itwillbs.jstl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.bean.Person;
import com.itwillbs.bean.Phone;

@WebServlet(value="/test3")
public class TestServlet3 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		// Person객체(이름,나이,휴대폰)
		// Phone객체(모델명,색상)
		
		// 1) 1명의 사람정보를 생성하여 전달
		Phone p1 = new Phone();
		p1.setModel("아이폰13");
		p1.setColor("Black");
		
		Person kim = new Person();
		kim.setName("김학생");
		kim.setAge(20);
		kim.setPhone(p1);
		
		request.setAttribute("kim", kim);
		
		
		// 2) 3명의 사람정보를 생성하여 전달 (ArrayList)
		
		// person.jsp 페이지에 출력
		RequestDispatcher dis =
				request.getRequestDispatcher("./el/person.jsp");
		
		dis.forward(request, response);

	
	}
	
}

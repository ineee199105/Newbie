package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import svc.LoginService;
import vo.ActionForward;
import vo.Member;

@WebServlet("*.reg")
public class RegistController {

	public class BoardFrontController extends javax.servlet.http.HttpServlet 
	{
		private static final long serialVersionUID = 1L;

		protected void doProcess (HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			String RequestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = RequestURI.substring(contextPath.length());
			ActionForward forward = null;
			Action action = null;
			
			if (command.equals("/signUpPro.reg")) {
				forward = new ActionForward();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				}
			}
			else if (command.equals("/modifyPro.reg")) {
				forward = new ActionForward();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				}
			}
				
			if (forward != null) {
				
				if(forward.isRedirect()) {
					response.sendRedirect(forward.getPath()); //boardList.bo
				}else {
					RequestDispatcher dispatcher =
							request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
					}
				}
		}
			
			protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				doProcess(request,response);
			}

			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				doProcess(request, response);
			}

		}
}
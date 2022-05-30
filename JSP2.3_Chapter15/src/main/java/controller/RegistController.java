package controller;

import java.io.IOException;
import java.io.PrintWriter;

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
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			ActionForward forward = null;
			Action action = null;
			
			
			
			
			}
			
		}
}

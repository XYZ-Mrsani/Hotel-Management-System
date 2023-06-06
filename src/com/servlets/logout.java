package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logout
 */
@WebServlet("/logout")
public class logout extends HttpServlet {
	
	@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doGet(request, response);
	}
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.invalidate();
		response.setContentType("text/html");
		PrintWriter out =response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Logout Successfully');");
		out.println("window.location=\"home.jsp\";");
		out.println("</script>");
		//adjustment willbe change after logout
		//RequestDispatcher rd=request.getRequestDispatcher("login_signup.jsp");
		//rd.include(request, response);
		
		//response.sendRedirect("login.jsp");
	}

}

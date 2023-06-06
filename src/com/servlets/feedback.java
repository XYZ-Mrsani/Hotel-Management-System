package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProDao;
import com.mail.SendMail;

/**
 * Servlet implementation class feedback
 */
@WebServlet("/feedback")
public class feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Rate = request.getParameter("rating");
		String Name = request.getParameter("name");
		String Email = request.getParameter("email");
		String Comment = request.getParameter("comment");
		
		PrintWriter out = response.getWriter();
		
		ProDao dao = new ProDao();
		
		if(dao.insertFeedback(Rate, Name, Email, Comment))
		{
			
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Feedback sent Successfully');");
			out.println("window.location=\"loginhome.jsp\";");
			out.println("</script>");
		}else
		{
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Feedback sent Unsuccessfully');");
			out.println("window.location=\"feedback.jsp\";");
			out.println("</script>");
		}
	}

}

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

import com.dao.ProDao;

/**
 * Servlet implementation class delete
 */
@WebServlet("/delete")
public class delete extends HttpServlet {
	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String username = request.getParameter("username");
		String Dele = request.getParameter("delete");
		
		ProDao dao = new ProDao();
		
		//if(Dele!=null)
		//{
			if(dao.dele(username))
			{
				HttpSession session = request.getSession();
				session.removeAttribute("username");
				session.invalidate();
				response.setContentType("text/html");
				PrintWriter out =response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Account deleted success');");
				out.println("</script>");
				System.out.println("DELETED");
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				rd.include(request, response);
			}else
			{
				response.setContentType("text/html");
				PrintWriter out =response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Account deleted unsuccess');");
				out.println("</script>");
				System.out.println("NOT DELETED");
				RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
				rd.include(request, response);
				response.sendRedirect("profile.jsp");
			}
			
			
			/*String querry = "DELETE FROM login WHERE uname="+uname;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, username, password);
				Statement st = con.createStatement();
	            int rs = st.executeUpdate(querry);

				if (rs>0) {
					
					
					response.setContentType("text/html");
					PrintWriter out =response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Account deleted success');");
					out.println("</script>");
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.include(request, response);
					System.out.println("Deleted");
				
				}
				
				response.setContentType("text/html");
				PrintWriter out =response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Account deleted unsuccess');");
				out.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
				System.out.println("not deleted");

			} catch (Exception e) {

				e.printStackTrace();
			}*/
			
			/*if(dao.dele(uname))
			{
				response.setContentType("text/html");
				PrintWriter out =response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Account deleted success');");
				out.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}else
			{
				response.setContentType("text/html");
				PrintWriter out =response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Account deleted unsuccess');");
				out.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}*/
		//}
	}

}

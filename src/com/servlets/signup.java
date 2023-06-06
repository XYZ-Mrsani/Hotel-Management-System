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
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	
	@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String uname = request.getParameter("username");
		String email = request.getParameter("email");
		String phone = request.getParameter("mobile");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm_password");
		String message = "Your account successfully created";
		String subject = "SignUp for New User";
		String hotelmail = "hotelexample123@gmail.com";
		String pass = "HOTEL12345";
		
		PrintWriter out = response.getWriter();
		ProDao dao = new ProDao();
		
		//if(!check)
		//{
			/*response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Password not matching');");
			out.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
			rd.include(request, response);*/
		//}
		
		if(password!=null&&confirm!=null&&fname!=null&&lname!=null&&uname!=null&&email!=null&&phone!=null)
		{
			if(password.equals(confirm))
			{
				if(dao.insert(fname, lname, uname, email, phone, password,confirm))
				{
					//out.println("SignUp Successfully");
					response.setContentType("text/html");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('SignUp Successfully');");
					out.println("window.location=\"login_signup.jsp\";");
					out.println("</script>");
					//RequestDispatcher rd=request.getRequestDispatcher("login_signup.jsp");
					//rd.include(request, response);
					SendMail.send(email, subject, message, hotelmail, pass);
					//response.sendRedirect("login.jsp");
				}else
				{
					response.setContentType("text/html");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Dao Error');");
					out.println("</script>");
					RequestDispatcher rd=request.getRequestDispatcher("login_signup.jsp");
					rd.include(request, response);
				}
			}else
			{
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Password Not match');");
				out.println("window.location=\"login_signup.jsp\";");
				out.println("</script>");
				//RequestDispatcher rd=request.getRequestDispatcher("login_signup.jsp");
				//rd.include(request, response);
			}
		}
		else
		{
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('All the Column should be Fill!');");
			out.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher("login_signup.jsp");
			rd.include(request, response);
		}
		
	}

}

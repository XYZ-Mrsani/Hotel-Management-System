package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDao;
import com.dao.ProDao;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	
	@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");
		
	//--------------------------------------------------------------------------------------------
		
		String url = "jdbc:mysql://localhost:3306/project";
		String username = "root";
		String password = "";
		
			String query = "select id,email from login where uname='" + uname + "'";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, username, password);
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(query);

				if (rs.next()) {
					request.getSession().setAttribute("uid", rs.getString(1));
					request.getSession().setAttribute("email", rs.getString(2));
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

	//---------------------------------------------------------------------------------------------
		
		ProDao dao = new ProDao();
		
		if(dao.check(uname, pass))
		{
			HttpSession session = request.getSession();
			session.setAttribute("username",uname);
			response.sendRedirect("loginhome.jsp");
		}
		else
		{
			response.setContentType("text/html");
			PrintWriter out =response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Invalid Username or Password');");
			out.println("window.location=\"login_signup.jsp\";");
			out.println("</script>");
			//RequestDispatcher rd=request.getRequestDispatcher("login_signup.jsp");
			//rd.include(request, response);
			//response.sendRedirect("login.jsp");
		}
		
		AdminDao adao = new AdminDao();
		if(adao.adcheck(uname, pass)) {
			HttpSession session = request.getSession();
			session.setAttribute("adusername",uname);
			response.sendRedirect("adminhome.jsp");
		}else
		{
			response.setContentType("text/html");
			PrintWriter out =response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Invalid Username or Password');");
			out.println("window.location=\"login_signup.jsp\";");
			out.println("</script>");
			//RequestDispatcher rd=request.getRequestDispatcher("login_signup.jsp");
			//rd.include(request, response);
			//response.sendRedirect("login.jsp");
		}
	}

}

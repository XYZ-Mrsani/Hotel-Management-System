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

import com.mysql.cj.Session;
import com.dao.ProDao;
import com.model.User;


/**
 * Servlet implementation class view
 */
@WebServlet("/view")
public class view extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doGet(request, response);
	}

protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//String View = request.getParameter("view");
		String uname = request.getParameter("uname");
		//String id = request.getParameter("id");
		
		ProDao dao = new ProDao();
		
		User user = dao.selectUser(uname);
		request.setAttribute("user", user);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
		dispatcher.forward(request, response);

		//HttpSession session = request.getSession();
		//session.setAttribute("username", uname);

		/*--String url = "jdbc:mysql://localhost:3306/project";
		--String username = "root";
		--String password = "";
		
		//if (View != null) {


			--String Fname = request.getParameter("fname");
			--String Lname = request.getParameter("lname");
			--String Email = request.getParameter("email");
			--String Phno = request.getParameter("mobile");

			--String query = "select * from login where uname='" + uname + "'";
			--try {
				--Class.forName("com.mysql.jdbc.Driver");
				--Connection con = DriverManager.getConnection(url, username, password);
				--Statement st = con.createStatement();
				--ResultSet rs = st.executeQuery(query);

				if (rs.next()) {
					request.setAttribute("fname", rs.getString(2));
					request.setAttribute("lname", rs.getString(3));
					request.setAttribute("email", rs.getString(5));
					request.setAttribute("mobile", rs.getString(6));
				}--

				/*
				 * System.out.println(request.getAttribute("fname"));
				 * System.out.println(request.getAttribute("fname"));
				 * System.out.println(request.getAttribute("email"));
				 * System.out.println(request.getAttribute("mobile"));
				 * //response.sendRedirect("profile.jsp");
				 *

				--RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
				--rd.include(request, response);

			} catch (Exception e) {---
				e.printStackTrace();
			}--*/

			// if(dao.up(uname))
			// {

			// response.sendRedirect("profile.jsp");
			// }

		//}
			
	}

}

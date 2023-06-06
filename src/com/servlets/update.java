package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProDao;
import com.model.User;


/**
 * Servlet implementation class update
 */
@WebServlet("/update")
public class update extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "jdbc:mysql://localhost:3306/project";
		String username = "root";
		String password = "";
		
		String Update = request.getParameter("update");
		String usename = request.getParameter("username");
		String UpdatePro = request.getParameter("updateprofile");
		
		if(Update!=null)
		{
			
			/*String query = "select * from login where uname='" + usename + "'";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, username, password);
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(query);

				if (rs.next()) {
					request.setAttribute("fname", rs.getString(2));
					request.setAttribute("lname", rs.getString(3));
					request.setAttribute("email", rs.getString(5));
					request.setAttribute("mobile", rs.getString(6));
				}


				RequestDispatcher rd = request.getRequestDispatcher("editprofile.jsp");
				rd.include(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}*/
			
			ProDao dao = new ProDao();
			
			User user = dao.selectUser(usename);
			request.setAttribute("user", user);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("editprofile.jsp");
			dispatcher.forward(request, response);

	}
		
		if(UpdatePro!=null)
		{
			String Fname = request.getParameter("fname");
			String Lname = request.getParameter("lname");
			String Email = request.getParameter("email");
			String Phno = request.getParameter("mobile");
			
			/*String query = "update login set fname=?,lname=?,email=?,phone=? where uname='"+usename+"'";
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, username, password);
				PreparedStatement ps = con.prepareStatement(query);						
				ps.setString(1, Fname);
				ps.setString(2, Lname);
				ps.setString(3, Email);
				ps.setString(4, Phno);
				
				int rs = ps.executeUpdate();
				
				if(rs>0)
				{
					
					response.setContentType("text/html");
					PrintWriter out =response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Account Updated');");
					//out.println("window.location=http://localhost:8080/SE2/view?uname='"+usename+"';");
					out.println("</script>");
					RequestDispatcher rd = request.getRequestDispatcher("/loginhome.jsp");
					rd.include(request, response);
				}else
				{
					response.setContentType("text/html");
					PrintWriter out =response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Account Updated');");
					out.println("</script>");
					RequestDispatcher rd = request.getRequestDispatcher("/editprofile.jsp");
					rd.include(request, response);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}*/
			
			ProDao dao = new ProDao();
			if(dao.update(usename, Fname, Lname, Email, Phno)){
				response.setContentType("text/html");
				PrintWriter out =response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Account Updated');");
				//out.println("window.location=http://localhost:8080/SE2/view?uname='"+usename+"';");
				out.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/loginhome.jsp");
				rd.include(request, response);
			}else {
				response.setContentType("text/html");
				PrintWriter out =response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Account not Updated');");
				out.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("/editprofile.jsp");
				rd.include(request, response);
			}
		}
	}

}

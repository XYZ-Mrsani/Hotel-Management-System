package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDao;
import com.dao.ProDao;
import com.mail.SendMail;
import com.model.Cart;
import com.model.User;



/**
 * Servlet implementation class CartServlets
 */
@WebServlet("/")
public class AdminServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doGet(request, response);
	}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String action = request.getServletPath();
		
		switch (action)
{
		case "/deleteo":
			deleteOrder(request, response);
			break;
			
		case "/deleter":
			deleteRoom(request, response);
			break;
			
		case "/deleteu":
			deleteUser(request, response);
			break;
			
		case "/insertuser":
			insertUser(request, response);
			break;
			
		case "/viewuser":
			viewuser(request, response);
			break;
			
		case "/updateu":
			updateUser(request, response);
			break;
			
		case "/viewroom":
			viewroom(request, response);
			
			break;
			
		case "/updater":
			updateRoom(request, response);
			break;
			
		case "/deletecono":
			confirmOrder(request, response);
			break;
		case "/logoutad":
			logout(request, response);
			break;
		}
}

private void deleteOrder(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	PrintWriter out = response.getWriter();
	try {
	int id = Integer.parseInt(request.getParameter("id"));
	
	if(id>0) {
		AdminDao adao = new AdminDao();
		adao.DeleOrder(id);
	}out.println("error");
	response.sendRedirect("adminhome.jsp");
}catch (Exception e) {
	e.printStackTrace();
}
  }

private void confirmOrder(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	PrintWriter out = response.getWriter();
	try {
	int id = Integer.parseInt(request.getParameter("id"));
	
	if(id>0) {
		AdminDao adao = new AdminDao();
		adao.ConDeleOrder(id);
	}out.println("error");
	response.sendRedirect("adminhome.jsp");
}catch (Exception e) {
	e.printStackTrace();
}
  }

private void logout(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	
	try {
		HttpSession session = request.getSession();
		session.removeAttribute("adusername");
		session.invalidate();
		response.setContentType("text/html");
		PrintWriter out =response.getWriter();
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Logout Successfully');");
		out.println("window.location=\"home.jsp\";");
		out.println("</script>");
}catch (Exception e) {
	e.printStackTrace();
}
  }


private void deleteRoom(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	PrintWriter out = response.getWriter();
	try {
	int id = Integer.parseInt(request.getParameter("id"));
	
	if(id>0) {
		AdminDao adao = new AdminDao();
		adao.DeleRoom(id);
		
	}out.println("error");
	response.sendRedirect("adminhome.jsp");
}catch (Exception e) {
	e.printStackTrace();
}
  }

private void deleteUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	PrintWriter out = response.getWriter();
	try {
	int id = Integer.parseInt(request.getParameter("id"));
	
	if(id>0) {
		AdminDao adao = new AdminDao();
		adao.DeleUser(id);
		
	}out.println("error");
	response.sendRedirect("adminhome.jsp");
}catch (Exception e) {
	e.printStackTrace();
}
  }


private void viewuser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	PrintWriter out = response.getWriter();
	try {
	int id = Integer.parseInt(request.getParameter("id"));
	request.getSession().setAttribute("uid",id);
	
	if(id>0) {
		AdminDao adao = new AdminDao();
		User user = adao.selectUser(id);
		request.setAttribute("user", user);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("edituser.jsp");
		dispatcher.forward(request, response);
	}
	out.println("error");
	//response.sendRedirect("adminhome.jsp");
}catch (Exception e) {
	e.printStackTrace();
}
  }

private void updateUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	PrintWriter out = response.getWriter();
	try {
	int id = Integer.parseInt(request.getParameter("id"));
	String Fname = request.getParameter("fname");
	String Lname = request.getParameter("lname");
	String Uname = request.getParameter("uname");
	String Email = request.getParameter("email");
	String Phno = request.getParameter("mobile");
	
	if(id>0) {
		AdminDao adao = new AdminDao();
		//User user = adao.selectUser(id);
		//request.setAttribute("user", user);
		if(adao.updateUser(id, Fname, Lname, Uname, Email, Phno)){
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Account Updated');");
			//out.println("window.location=http://localhost:8080/SE2/view?uname='"+usename+"';");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("adminhome.jsp");
			rd.include(request, response);
			
		}else {
			
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Account not Updated');");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("edituser.jsp");
			rd.include(request, response);
		}
	}
	out.println("error");
	//response.sendRedirect("adminhome.jsp");*/
}catch (Exception e) {
	e.printStackTrace();
}
  }

private void viewroom(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	PrintWriter out = response.getWriter();
	try {
	int id = Integer.parseInt(request.getParameter("id"));
	request.getSession().setAttribute("rid",id);
	
	if(id>0) {
		AdminDao adao = new AdminDao();
		Cart cart = adao.selectRoom(id);
		request.setAttribute("cart", cart);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("editrooms.jsp");
		dispatcher.forward(request, response);
	}
	out.println("error");
	//response.sendRedirect("adminhome.jsp");
}catch (Exception e) {
	e.printStackTrace();
}
  }

private synchronized void updateRoom(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	PrintWriter out = response.getWriter();
	try {
	int id = Integer.parseInt(request.getParameter("id"));
	String Room = request.getParameter("room");
	String Availability = request.getParameter("availability");
	String Price = request.getParameter("price");
	
	if(id>0) {
		AdminDao adao = new AdminDao();
		//User user = adao.selectUser(id);
		//request.setAttribute("user", user);
		if(adao.updateRoom(id, Room, Availability, Price)){
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Room Updated');");
			//out.println("window.location=http://localhost:8080/SE2/view?uname='"+usename+"';");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("adminhome.jsp");
			rd.include(request, response);
			
		}else {
			
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Room not Updated');");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("edituser.jsp");
			rd.include(request, response);
		}
	}
	out.println("error");
	//response.sendRedirect("adminhome.jsp");*/
}catch (Exception e) {
	e.printStackTrace();
}
  }



private void insertUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	PrintWriter out = response.getWriter();
	//int id = Integer.parseInt(request.getParameter("id"));
	String Fname = request.getParameter("fname");
	String Lname = request.getParameter("lname");
	String Username = request.getParameter("uname");
	String Email = request.getParameter("email");
	String Phone = request.getParameter("mobile");
	String Password = request.getParameter("pass");
	String Confirm = request.getParameter("conpass");
	try {
	
	/*out.println(Fname);
	out.println(Lname);
	out.println(Username);
	out.println(Email);
	out.println(Phone);
	out.println(Password);
	out.println(Confirm);*/
	
	ProDao dao = new ProDao();
	if(Password.equals(Confirm))
	{
		if(dao.insert(Fname, Lname, Username, Email, Phone, Password,Confirm))
		{
			//out.println("SignUp Successfully");
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('new user added');");
			out.println("window.location=\"adminhome.jsp\";");
			out.println("</script>");
		}else
		{
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Dao Error');");
			out.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher("adminhome.jsp");
			rd.include(request, response);
		}
	}else
	{
		response.setContentType("text/html");
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Password Not match');");
		out.println("window.location=\"newuser.jsp\";");
		out.println("</script>");
	}
	
}catch (Exception e) {
	e.printStackTrace();
}
  }

}


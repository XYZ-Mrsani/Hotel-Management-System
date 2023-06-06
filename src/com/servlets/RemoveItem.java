package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.*;
import com.mail.SendMail;
import com.model.Cart;

/**
 * Servlet implementation class RemoveItem
 */
@WebServlet("/removeitem")
public class RemoveItem extends HttpServlet {
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		
		out.println("product id: "+id);
		if(id !=null)
		{
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart");
			if(cart_list !=null) {
				for(Cart c:cart_list) {
					if(c.getId() ==Integer.parseInt(id)) {
						cart_list.remove(cart_list.indexOf(c));
						break;
					}
				}
				response.sendRedirect("cart.jsp");
			}
			
		}else {
			response.sendRedirect("cart.jsp");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String email = (String) request.getSession().getAttribute("email");
		String message = "You have successfully canceled the Booking";
		String subject = "Cancel Book";
		String hotelmail = "hotelexample123@gmail.com";
		String pass = "HOTEL12345";
		try {
		int id = Integer.parseInt(request.getParameter("id"));
		String qua = request.getParameter("quantity");
		String rid = request.getParameter("rid");
		
		if(id>0) {
			
//------------------------------------------------------------------
			/*String url = "jdbc:mysql://localhost:3306/project";
			String username = "root";
			String password = "";

			String query = "update products set availability=(select availability from products where id='"+rid+"')+ '"+qua+"' where id='"+rid+"'";
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, username, password);
				PreparedStatement st = con.prepareStatement(query);
				st.execute();
				
				out.println("error");*/
//------------------------------------------------------------------			
			ProDao dao = new ProDao();
			dao.cancelOrder(id,rid,qua);
			SendMail.send(email, subject, message, hotelmail, pass);
		}out.println("error");
		response.sendRedirect("orders.jsp");
	}catch (Exception e) {
		e.printStackTrace();
	}
  }
	
}

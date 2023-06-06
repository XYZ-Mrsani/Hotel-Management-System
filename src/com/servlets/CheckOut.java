package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Cart;

/**
 * Servlet implementation class CheckOut
 */
@WebServlet("/checkout")
public class CheckOut extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doGet(request, response);
	}
	/// no need,(same here in the insertorder)
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			PrintWriter out= response.getWriter();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			 ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart");
			 if(cart_list != null && request.getSession().getAttribute("username") !=null) {
				 for(Cart c:cart_list) {
					 int pid = c.getId();
					 String uid = (String) request.getSession().getAttribute("uid");
					 int pq = c.getQuantity();
					 String td = df.format(date);
					 
					 String url = "jdbc:mysql://localhost:3306/project";
						String username = "root";
						String password = "";
						
						String query = "insert into orders(p_id, u_id, o_quantity, o_date) values('"+pid+"','"+uid+"','"+pq+"','"+td+"')";
						
						
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(url, username, password);
							Statement st = con.createStatement();
						    int result = st.executeUpdate(query);
						    if(result<0)break;
				 }
				 cart_list.clear();
				 response.sendRedirect("orders.jsp");
				 
			 }else {
				 if(request.getSession().getAttribute("username") == null) {
					 response.sendRedirect("login_signup.jsp");
				 }else {
					 response.sendRedirect("cart.jsp");
				 }
			 }

			
			//out.println(td);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

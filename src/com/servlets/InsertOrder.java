package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProDao;
import com.mail.SendMail;
import com.model.Cart;


/**
 * Servlet implementation class InsertOrder
 */
@WebServlet("/insertorder")
public class InsertOrder extends HttpServlet {
	
	//checkout servlet no more need
protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doGet(request, response);
	}
	
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*PrintWriter out = response.getWriter();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String td = df.format(date);
		
		try {
			
			if(request.getSession().getAttribute("auth") !=null) {
				int pid = Integer.parseInt(request.getParameter("id"));
				int userid = Integer.parseInt(request.getParameter("uid"));
				int pq = Integer.parseInt(request.getParameter("quantity"));
				
				if(pq <=0)
				{
					pq=1;
				}
				
				/*out.println(pid);
				out.println(userid);
				out.println(pq);
				out.println(td);
				
//--------------------------------------------------------------------------------------
				String url = "jdbc:mysql://localhost:3306/cart";
				String username = "root";
				String password = "";
				
				String query = "insert into orders(p_id, u_id, o_quantity, o_date) values('"+pid+"','"+userid+"','"+pq+"','"+td+"')";
				
				
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(url, username, password);
					Statement st = con.createStatement();
				    st.executeUpdate(query);
				    
				    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart");
					if(cart_list !=null) {
						for(Cart c:cart_list) {
							if(c.getId() == pid) {
								cart_list.remove(cart_list.indexOf(c));
								break;
							}
						}
						
					}
				    response.sendRedirect("orders.jsp");
				
			}else {
				response.sendRedirect("login.jsp");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}*/
		
		try {
			PrintWriter out= response.getWriter();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			
			 String uid = (String) request.getSession().getAttribute("uid");
			 String email = (String) request.getSession().getAttribute("email");
			 String checkin = (String)request.getSession().getAttribute("checkin");
			 String checkout = (String)request.getSession().getAttribute("checkout");
			 String message = "Your ID:'"+uid+"',You have successfully resarved";
			 String subject = "Resaved Rooms";
			 String hotelmail = "hotelexample123@gmail.com";
			 String pass = "HOTEL12345";
		
			 ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart");
			 if(cart_list != null && request.getSession().getAttribute("username") !=null) {
				 for(Cart c:cart_list) {
					 int pid = c.getId();
					 
					 int pq = c.getQuantity();
					 String td = df.format(date);
					 
					/* String url = "jdbc:mysql://localhost:3306/project";
						String username = "root";
						String password = "";
						
						String query = "insert into orders(p_id, u_id, o_quantity, o_date) values('"+pid+"','"+uid+"','"+pq+"','"+td+"')";
						String query2 = "update products set availability=(select availability from products where id='"+pid+"')-'"+pq+"' where id='"+pid+"'";
						
						
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(url, username, password);
							Statement st = con.createStatement();
							st.addBatch(query);
							st.addBatch(query2);
							int[] result = st.executeBatch();
						    //int result = st.executeUpdate(query);*/
					ProDao dao = new ProDao();
					boolean result = dao.insertOrder(pid, uid, pq, td,checkin,checkout);
					if(result)break;
				 }
				 SendMail.send(email, subject, message, hotelmail, pass);
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

	
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String td = df.format(date);
		
		try {
			
			if(request.getSession().getAttribute("username") !=null) {
				int pid = Integer.parseInt(request.getParameter("id"));
				int userid = Integer.parseInt(request.getParameter("uid"));
				int pq = Integer.parseInt(request.getParameter("quantity"));
				
				if(pq <=0)
				{
					pq=1;
				}
				
				/*out.println(pid);
				out.println(userid);
				out.println(pq);
				out.println(td);*/
				/*
//--------------------------------------------------------------------------------------
				String url = "jdbc:mysql://localhost:3306/project";
				String username = "root";
				String password = "";
				
				String query = "insert into orders(p_id, u_id, o_quantity, o_date) values('"+pid+"','"+userid+"','"+pq+"','"+td+"')";
				
				
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(url, username, password);
					Statement st = con.createStatement();
				    st.executeUpdate(query);
				    
				    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart");
					if(cart_list !=null) {
						for(Cart c:cart_list) {
							if(c.getId() == pid) {
								cart_list.remove(cart_list.indexOf(c));
								break;
							}
						}
						
					}
				    response.sendRedirect("orders.jsp");
				
			}else {
				response.sendRedirect("login_signup.jsp");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		//doGet(request, response);
	}*/

}

/*package com.saniya.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saniya.model.Order;

/**
 * Servlet implementation class BuyNow
 */
/*@WebServlet("/buynow")
public class BuyNow extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		try {
			String auth = (String) request.getSession().getAttribute("auth");
			if(auth !=null) {
				int pid = Integer.parseInt(request.getParameter("id"));
				String userid = request.getParameter("uid");
				int pq = Integer.parseInt(request.getParameter("quantity"));
				
				if(pq <=0)
				{
					pq=1;
				}
				
				out.print("hello");
				
				/*Order order = new Order();
			    order.setId(pid);
				order.setUid(userid);
				order.setQunatity(pq);
				order.setDate(d.format(date));*/
				
    //--------------------------------------------------------------------------------------
				/*String url = "jdbc:mysql://localhost:3306/cart";
				String username = "root";
				String password = "";
				
				String query = "insert into orders(p_id, u_id, o_quantity, o_date) values('"+pid+"','"+userid+"','"+pq+"','"+d.format(date)+"')";
				
				
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(url, username, password);
					Statement st = con.createStatement();
				    st.executeUpdate(query);*/
					
//--------------------------------------------------------------------------------------
				//Dao dao = new Dao();
				//boolean rst = dao.insertOrder(order);
				//if(result)
				//{
					//response.sendRedirect("order.jsp");
				//}else {
					//out.println("Order failed");
				//}
				
		/*	}else {
				response.sendRedirect("login.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}*/


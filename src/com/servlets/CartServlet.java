package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Cart;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cartservlet")
public class CartServlet extends HttpServlet {
	
protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doGet(request, response);
	}
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean exist =false;
		
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		
		ArrayList<Cart> cartlist = new ArrayList<>();
		
		Cart cart = new Cart();
		cart.setId(id);
		cart.setQuantity(1);
		
		HttpSession session = request.getSession();
		ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart");
		
		if(cart_list==null)
		{
			cartlist.add(cart);
			session.setAttribute("cart", cartlist);
			response.sendRedirect("room.jsp");
//			out.println("session created added list");
		}else
		{
			cartlist = cart_list;
			
			for(Cart c:cart_list) {
				if(c.getId()==id)
				{
					exist =true;
					response.setContentType("text/html");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Already Exist in Cart');");
					out.println("window.location.href='room.jsp'");
					out.println("</script>");
				}
			}
			if(!exist)
			{
				cartlist.add(cart);
				response.sendRedirect("room.jsp");
			}
			
		}
		
		
	}

}

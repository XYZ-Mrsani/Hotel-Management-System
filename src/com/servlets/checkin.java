package com.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class checkin
 */
@WebServlet("/checkin")
public class checkin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getSession().getAttribute("username")!=null)
			{
		String Checkin = request.getParameter("checkin");
		String Checkout = request.getParameter("checkout");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		Date d1 = sdf.parse(Checkin);
		Date d2 = sdf.parse(Checkout);

		long diff = Math.abs(d2.getTime() - d1.getTime());
		long day = TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
		
		request.getSession().setAttribute("day", day);
		request.getSession().setAttribute("checkin", Checkin);
		request.getSession().setAttribute("checkout", Checkout);
		
		response.sendRedirect("room.jsp");}
		else {
			response.sendRedirect("login_signup.jsp");
		}}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}

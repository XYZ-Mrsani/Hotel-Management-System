package com.dao;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jstl.BooleanLiteral;

import com.model.Cart;
import com.model.Order;
import com.model.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ProDao{

	static String url = "jdbc:mysql://localhost:3306/project";
	static String username = "root";
	static String password = "";

	public boolean insert(String fname, String lname, String uname, String email, String phone, String pass, String copass) {
		String query = "insert into login (fname,lname,uname,email,phone,pass) values('" + fname + "','" + lname + "','" + uname + "','" + email + "',"+ phone + ",'" + pass + "')";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement();
			
			int rs = st.executeUpdate(query);
			if(rs>0)
			{
				return true;
			}
				System.out.println("SignUp Failed");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean check(String uname, String pass) {
		String query = "select * from login where uname=? and pass=?";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, uname);
			st.setString(2, pass);

			ResultSet rs = st.executeQuery();

			if (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setFname(rs.getString("fname"));
				user.setLname(rs.getString("lname"));
				user.setUname(rs.getString("uname"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;
	}
	
	public boolean dele(String name)
	{
		String query = "DELETE FROM login WHERE uname='"+name+"'";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement();
            int rs = st.executeUpdate(query);

			if (rs>0) {
				
				System.out.println("Deleted");
				return true;
			}
			System.out.println("not deleted");

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;
	}
	
public List<Cart> getCartProd(ArrayList<Cart> cartList){
		
		String query = "select * from products where id=?";
		List<Cart> cartp = new ArrayList<Cart>();
		try {
			if(cartList.size()>0)
			{
				for(Cart item:cartList) {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(url, username, password);
					PreparedStatement st = con.prepareStatement(query);
					st.setInt(1, item.getId());
					
					ResultSet rs = st.executeQuery();
					
					while(rs.next())
					{
						Cart cartr = new Cart();
						cartr.setId(rs.getInt("id"));
						cartr.setName(rs.getString("name"));
						cartr.setAvailability(rs.getInt("availability"));
						cartr.setPrice(rs.getDouble("price")*item.getQuantity());
						cartr.setQuantity(item.getQuantity());
						
						cartp.add(cartr);
					}
				}
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return cartp;
	}
	
	public double getTotalPrice(ArrayList<Cart> cartlist)
	{
		String query = "select price from products where id=?";
		double sum = 0;
		try {
			if(cartlist.size()>0) {
				for(Cart item:cartlist)
				{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(url, username, password);
					PreparedStatement st = con.prepareStatement(query);
					st.setInt(1, item.getId());
					
					ResultSet rs = st.executeQuery();
					
					while(rs.next())
					{
						sum = sum + rs.getDouble("price")*item.getQuantity();
					}
				}
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return sum;
	}
	
public void cancelOrder(int id, String rid, String q)
	{
		try {
			Cart cart = new Cart();
			
			String query = "delete from orders where o_id='"+id+"'";
			String query2 = "update products set availability=(select availability from products where id='"+rid+"')+'"+q+"' where id='"+rid+"'";
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, username, password);
				Statement st = con.createStatement();
				st.addBatch(query);
				st.addBatch(query2);
				st.executeBatch();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

public List<User> getAllusers(){
	List<User> list = new ArrayList<User>();
	
	try {
	String query = "select * from login";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
	PreparedStatement st = con.prepareStatement(query);
	ResultSet rs = st.executeQuery();
	while(rs.next())
	{
		User user = new User();
		user.setId(rs.getInt(1));
		user.setFname(rs.getString(2));
		user.setLname(rs.getString(3));
		user.setUname(rs.getString(4));
		user.setEmail(rs.getString(5));
		user.setPhone(rs.getString(6));
		list.add(user);
	}
	
	
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return list;
}


public User selectUser(String uname) {
	User user = new User();
	try{
		String query = "select * from login where uname=?";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, uname);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			user.setFname(rs.getString("fname"));
			user.setLname(rs.getString("lname"));
			user.setUname(rs.getString("uname"));
			user.setEmail(rs.getString("email"));
			user.setPhone(rs.getString("phone"));
		}
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return user;
}

public boolean update(String usename,String fname, String lname, String email, String phone)
{
	String query = "update login set fname=?,lname=?,email=?,phone=? where uname='"+usename+"'";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		PreparedStatement ps = con.prepareStatement(query);						
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, email);
		ps.setString(4, phone);
		
		int rs = ps.executeUpdate();
		if(rs>0) {
			System.out.println("updated");
			return true;
		}
	
     }catch(Exception e) {
    	 e.printStackTrace();
     }
	return false;
  }

public boolean insertOrder(int pid,String uid,int pq,String td, String checkin, String checkout) {
	boolean result = false;
	try {
		String query = "insert into orders(p_id, u_id, o_quantity, o_date, check_in, check_out) values('"+pid+"','"+uid+"','"+pq+"','"+td+"','"+checkin+"','"+checkout+"')";
		String query2 = "update products set availability=(select availability from products where id='"+pid+"')-'"+pq+"' where id='"+pid+"'";
		
		
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement();
			st.addBatch(query);
			st.addBatch(query2);
			st.executeBatch();
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return result;
   }

public boolean insertFeedback(String rate, String name, String email, String comment) {
	
	String query = "insert into feedback values('"+rate+"','"+name+"','"+email+"','"+comment+"')";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		Statement st = con.createStatement();
        int rs = st.executeUpdate(query);

		if (rs>0) {
			System.out.println("insert success");
			return true;
		}
		System.out.println("not success");

	} catch (Exception e) {

		e.printStackTrace();
	}

	return false;
}

}

	

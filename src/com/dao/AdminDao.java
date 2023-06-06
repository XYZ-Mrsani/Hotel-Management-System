package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Cart;
import com.model.Order;
import com.model.User;

public class AdminDao {
	
	static String url = "jdbc:mysql://localhost:3306/project";
	static String username = "root";
	static String password = "";
	
	public List<User> getUsers(){
		String query = "Select * from login";
		List<User> list = new ArrayList<User>();
		User user = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setFname(rs.getString("fname"));
				user.setLname(rs.getString("lname"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				list.add(user);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Cart> getRooms(){
		String query = "Select * from products";
		List<Cart> list = new ArrayList<Cart>();
		Cart cart = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				cart = new Cart();
				cart.setId(rs.getInt("id"));
				cart.setName(rs.getString("name"));
				cart.setAvailability(rs.getInt("availability"));
				cart.setPrice(rs.getDouble("price"));
				list.add(cart);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Order> getOrders(){
		String query = "Select * from orders";
		List<Order> list = new ArrayList<Order>();
		Order order = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				order = new Order();
				order.setOrderId(rs.getInt("o_id"));
				order.setId(rs.getInt("p_id"));
				order.setUid(rs.getInt("u_id"));
				order.setAvailability(rs.getInt("o_quantity"));
				order.setDate(rs.getString("o_date"));
				order.setCheckin(rs.getString("check_in"));
				order.setCheckout(rs.getString("check_out"));
				list.add(order);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Order> getOrdered(){
		String query = "Select * from ordered";
		List<Order> list = new ArrayList<Order>();
		Order order = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				order = new Order();
				order.setOrderId(rs.getInt("o_id"));
				order.setId(rs.getInt("p_id"));
				order.setUid(rs.getInt("u_id"));
				order.setAvailability(rs.getInt("o_quantity"));
				order.setDate(rs.getString("o_date"));
				order.setCheckin(rs.getString("check_in"));
				order.setCheckout(rs.getString("check_out"));
				list.add(order);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean DeleOrder(int id) {
		
		try {
			String query = "delete from orders where o_id=?";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1,id);
			st.execute();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
public boolean ConDeleOrder(int id) {
		
		try {
			String query = "delete from ordered where o_id=?";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1,id);
			st.execute();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
public boolean DeleRoom(int id) {
		
		try {
			String query = "delete from products where id=?";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1,id);
			st.execute();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

public boolean DeleUser(int id) {
	
	try {
		String query = "delete from login where id=?";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1,id);
		st.executeUpdate();
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	return false;
   }

public User selectUser(int id) {
	User user = new User();
	try{
		String query = "select * from login where id=?";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
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


public boolean updateUser(int id,String fname, String lname, String uname, String email,String phone)
{
	String query = "update login set fname=?,lname=?,uname=?,email=?,phone=? where id='"+id+"'";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		PreparedStatement ps = con.prepareStatement(query);						
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, uname);
		ps.setString(4, email);
		ps.setString(5, phone);
		
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

public Cart selectRoom(int id) {
	Cart cart = new Cart();
	try{
		String query = "select * from products where id=?";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			cart.setName(rs.getString("name"));
			cart.setAvailability(rs.getInt("availability"));
			cart.setPrice(rs.getDouble("price"));
		}
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	return cart;
}


public boolean updateRoom(int id,String room, String availability, String price)
{
	String query = "update products set name=?,availability=?,price=? where id='"+id+"'";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		PreparedStatement ps = con.prepareStatement(query);						
		ps.setString(1, room);
		ps.setString(2, availability);
		ps.setString(3, price);
		
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


public boolean adcheck(String uname, String pass) {
	String query = "select * from admin where uname=? and pass=?";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, uname);
		st.setString(2, pass);

		ResultSet rs = st.executeQuery();

		if (rs.next()) {
			return true;
		}

	} catch (Exception e) {

		e.printStackTrace();
	}

	return false;
}


}


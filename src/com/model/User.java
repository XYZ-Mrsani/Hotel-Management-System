package com.model;

public class User {
	private int id;
	private String fname;
	private String lname;
	private String uname;
	private String email;
	private String phone;
	private String pass;
	
	public User() {
	}

	public User(int id, String fname, String lname, String uname, String email, String phone, String pass) {
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.uname = uname;
		this.email = email;
		this.phone = phone;
		this.pass = pass;
	}
	
	

	public User(String fname, String lname, String email, String phone) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.phone = phone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", fname=" + fname + ", lname=" + lname + ", uname=" + uname + ", email=" + email+ ", phone=" + phone + ", pass=" + pass + "]";
	}
	

}

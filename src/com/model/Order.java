package com.model;

public class Order extends Cart{
	private int orderId;
	private int uid;
	private int qunatity;
	private String date;
	private String checkin;
	private String checkout;
	
	public Order() {
	}
	
	public Order(int orderId, int uid, int qunatity, String date, String checkin, String checkout) {
		super();
		this.orderId = orderId;
		this.uid = uid;
		this.qunatity = qunatity;
		this.date = date;
		this.checkin = checkin;
		this.checkout = checkout;
	}

	public Order(int uid, int qunatity, String date, String checkin, String checkout) {
		super();
		this.uid = uid;
		this.qunatity = qunatity;
		this.date = date;
		this.checkin = checkin;
		this.checkout = checkout;
	}

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getQunatity() {
		return qunatity;
	}
	public void setQunatity(int qunatity) {
		this.qunatity = qunatity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCheckin() {
		return checkin;
	}
	
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	
	public String getCheckout() {
		return checkout;
	}
	
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
}

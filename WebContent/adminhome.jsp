<%@page import="com.model.Order"%>
<%@page import="com.model.Cart"%>
<%@page import="com.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<%@include file="includes/head.jsp"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1

response.setHeader("Pragma", "no-cache"); //HTTP 1.0

response.setHeader("Expires", "0"); //Proxies	

if (session.getAttribute("adusername") == null) {
	response.sendRedirect("login_signup.jsp");
}
session.setMaxInactiveInterval(10*60);//after 10 min session destroy

AdminDao adao = new AdminDao();
List<User> users;
users = adao.getUsers();

List<Cart> rooms;
rooms = adao.getRooms();

List<Order> orders;
orders = adao.getOrders();

List<Order> ordered;
ordered = adao.getOrdered();
%>
</head>
<body style="background-color: #f2f2f2;">

<div class="container">
<div class="card-header my-3" style="font-weight: bold;font-size: 24px">All Customers &emsp;<button type="submit" class="btn btn-primary" onclick="window.location='newuser.jsp'">New Customer</button><a href="<%=request.getContextPath()%>/logoutad" class="btn btn-dark float-right">LogOut</a></div>
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Email</th>
					<th scope="col">Phone</th>
					<th scope="col">Edit</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			<tbody>
			<%for(User user:users) {%>
					<tr>
						<td><%=user.getId() %></td>
						<td><%=user.getFname()%></td>
						<td><%=user.getLname() %></td>
						<td><%=user.getEmail() %></td>
						<td><%=user.getPhone() %></td>
						<td>
						<a class="btn btn-success" href="<%=request.getContextPath()%>/viewuser?id=<%=user.getId() %>">Edit</a>
						</td>
						<td>
						<a href="<%=request.getContextPath()%>/deleteu?id=<%=user.getId() %>" class="btn btn-danger">Delete</a>
						</td>
					</tr>
					<%request.getSession().setAttribute("userid", user.getId()); %>
					<%} %>
			</tbody>
		</table>
		<br>
		
		<div class="card-header my-3" style="font-weight: bold; font-size: 24px">Room Details</div>
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Availability</th>
					<th scope="col">Price</th>
					<th scope="col">Edit</th>
<!-- 					<th scope="col">Delete</th> -->
				</tr>
			</thead>
			<tbody>
			<%for(Cart room:rooms) {%>
					<tr>
						<td><%=room.getId() %></td>
						<td><%=room.getName() %></td>
						<td><%=room.getAvailability() %></td>
						<td><%=room.getPrice() %></td>
						<td>
						<a class="btn btn-success" href="<%=request.getContextPath()%>/viewroom?id=<%=room.getId() %>">Edit</a>
						</td>
<!-- 						<td> -->
<%-- 						<a href="<%=request.getContextPath()%>/deleter?id=<%=room.getId() %>" class="btn btn-danger">Delete</a> --%>
<!-- 						</td> -->
					</tr>
					<%} %>
			</tbody>
		</table>
		<br>

		<div class="card-header my-3" style="font-weight: bold;font-size: 24px">Customer Orders</div>
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th scope="col">OrderID</th>
					<th scope="col">RoomID</th>
					<th scope="col">UserId</th>
					<th scope="col">OrderQuantity</th>
					<th scope="col">OrderDate</th>
					<th scope="col">CheckIn Date</th>
					<th scope="col">CheckOut Date</th>
					<th scope="col">Confirm</th>
				</tr>
			</thead>
			<tbody>
			<%for(Order order:orders) {%>
					<tr>
						<td><%=order.getOrderId() %></td>
						<td><%=order.getId() %></td>
						<td><%=order.getUid() %></td>
						<td><%=order.getAvailability() %></td>
						<td><%=order.getDate() %></td>
						<td><%=order.getCheckin() %></td>
						<td><%=order.getCheckout() %></td>
						<td>
						<a href="<%=request.getContextPath()%>/deleteo?id=<%=order.getOrderId() %>" class="btn btn-success">Confirm</a>
						</td>
					</tr>
					<%} %>
			</tbody>
		</table>
		<br>
		
		<div class="card-header my-3" style="font-weight: bold;font-size: 24px">Confirmed Order Details</div>
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th scope="col">OrderID</th>
					<th scope="col">RoomID</th>
					<th scope="col">UserId</th>
					<th scope="col">OrderQuantity</th>
					<th scope="col">OrderDate</th>
					<th scope="col">CheckIn Date</th>
					<th scope="col">CheckOut Date</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			<tbody>
			<%for(Order conorder:ordered) {%>
					<tr>
						<td><%=conorder.getOrderId() %></td>
						<td><%=conorder.getId() %></td>
						<td><%=conorder.getUid() %></td>
						<td><%=conorder.getAvailability() %></td>
						<td><%=conorder.getDate() %></td>
						<td><%=conorder.getCheckin() %></td>
						<td><%=conorder.getCheckout() %></td>
						<td>
						<a href="<%=request.getContextPath()%>/deletecono?id=<%=conorder.getOrderId() %>" class="btn btn-danger">Delete</a>
						</td>
					</tr>
			<%} %>
			</tbody>
		</table>
</div>
</body>
</html>
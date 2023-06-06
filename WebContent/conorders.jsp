<%@page import="com.model.User"%>
<%@page import="com.model.Order"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    DecimalFormat df = new DecimalFormat("#.##");
	request.setAttribute("df", df);
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1

	response.setHeader("Pragma", "no-cache"); //HTTP 1.0

	response.setHeader("Expires", "0"); //Proxies	

	
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login_signup.jsp");
	}
	session.setMaxInactiveInterval(10*60);//after 10 min session destroy
	
    ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart");
	List<Cart> cartp =null;
	if(cart_list !=null)
	{
		ProDao dao = new ProDao();
		cartp = dao.getCartProd(cart_list);
		double total = dao.getTotalPrice(cart_list);
		request.setAttribute("cart_list", cart_list);
		request.setAttribute("total", total);
	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Booking History</title>
<%@include file="includes/head.jsp"%>
</head>
<style>
.navbar input[type="text"]
{
            border: none;
			background: transparent;
			outline: none;
			color:white;
			text-align: left;
			vertical-align: 9px;
			width: 100px;
}


body{
font-family: circular;
font-size: 20px;
margin:0%;
}


nav{
width: 100%;
background-color: rgba(0, 0, 0, 0.4);
color:white;
}

#availablilty{
border-radius: 50px;
background-color: rgb(255,255,255);
padding:5px;
padding-top: 10px;
height: 60px;
}

span[type="button"]{
background-color: #7952b3;
color: white;
}



span[type="button"]:hover{
background-color: #67449b;
color: white;
}



#availablilty span{
border-radius: 50px;
height: 40px;
}

img{
vertical-align: 0px;
}
</style>
<body>
<%@include file="includes/roomnav.jsp"%>

<sql:setDataSource var="ordered" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project" user="root" password="" />
<sql:query var="listorders" dataSource="${ordered}"> SELECT * from ordered where u_id=<%=(String) request.getSession().getAttribute("uid")%> order by ordered.o_id desc;</sql:query>

<br>
<br>
<br>
<div class="container">
		<div class="card-header my-3">Booking History</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">CheckIn Date</th>
					<th scope="col">CheckOut Date</th>
					<th scope="col">Status</th>
				</tr>
			</thead>
			<tbody>
			
			
			<c:forEach var="od" items="${listorders.rows}">
			<sql:query var="listorders" dataSource="${ordered}"> SELECT * from products where id=${od.p_id}</sql:query>
			<c:forEach var="prod" items="${listorders.rows}">
					<tr>
						<td><c:out value="${od.o_date}" /></td>
						<td><c:out value="${prod.name}" /></td>
						<td><input type="text" name="quantity" value="<c:out value="${od.o_quantity}" /> " readonly style="border: none; background: transparent;"></td>
						<td><fmt:formatNumber value="${(prod.price * od.o_quantity)}" type = "currency"/></td>
						<td><c:out value="${od.check_in}" /></td>
						<td><c:out value="${od.check_out}" /></td>
						<td>Confirm</td>
					</tr>
					</c:forEach>
			</c:forEach>
				
			</tbody>
		</table>
	</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>
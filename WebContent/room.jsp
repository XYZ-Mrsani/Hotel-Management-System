<%@page import="com.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%
	ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart");
	if(cart_list !=null)
	{
		request.setAttribute("cart_list", cart_list);
	}
	
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1

	response.setHeader("Pragma", "no-cache"); //HTTP 1.0

	response.setHeader("Expires", "0"); //Proxies	

	if (session.getAttribute("username") == null) {
		response.sendRedirect("login_signup.jsp");
	}
	session.setMaxInactiveInterval(10*60);//after 10 min session destroy
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Rooms</title>
<link rel="stylesheet" href="index2.css">
<%@include file="includes/head.jsp"%>
<style type="text/css">
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

input[type="text"]
{
            border: none;
			background: transparent;
			outline: none;
			color: black;
			text-align: left;
			width: 100px;
}

img{
vertical-align: 0px;
}

body{
font-family: circular;
font-size: 20px;
background-color: rgb(235, 235, 235);
}



#cartitems button:hover{
background-color: #7952b3;
border: 1px solid #7952b3;
color: white;
}



.btn-purchase{
border-radius:50px;
background-color: #7952b3;
color: white;
}



.btn-purchase:hover{
background-color: #67449b;
color: white;
}

.cartitems{
border-radius:50px;
border: 1px solid #7952b3;
color: #7952b3;
}



.cartitems:hover{
background-color: #7952b3;
border: 1px solid #7952b3;
color: white;
}

</style>
</head>
<body>
<%@include file="includes/roomnav.jsp"%>
<br>
<br>
<br>
<sql:setDataSource var="product" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project" user="root" password="" />
<sql:query var="listproduct" dataSource="${product}">SELECT * FROM products;</sql:query>

<center>
<div class="container">
		<div class="card-header my-3" style="font-weight: bold; font-size: 24px;">Room Types Availability</div>
		<div class="row">

			<c:forEach var="prod" items="${listproduct.rows}">
				<div class="col-md-4 my-3">
					<div class="card w-100" style="width: 20rem;">
					<center><h5 class="card-header my-3"><c:out value="${prod.name}" /></h5></center>
						<img class="card-img-top" src="<c:out value="${prod.image}" />"alt="......" style="width: 350px; height: 350px">
						<div class="card-body">
							<h4 class="price">
								Price:<fmt:formatNumber value="${prod.price}"  type = "currency"/>
							</h4>
							<h4 class="availabillty">
								Availability :<c:out value="${prod.availability }" />
							</h4>
							<div class="mt-3 d-flex justify-content-center">
								<a href="cartservlet?id=<c:out value="${prod.id}" />" class="btn cartitems" id="add">Add to Cart</a>
	<form action="insertorder?quantity=1&id=${prod.id }" method="post" class="form-inline">
	<input type="text" name="uid" readonly="readonly" value="<%=(request.getSession().getAttribute("uid") == null) ? "" : (String) request.getSession().getAttribute("uid")%>" hidden> 
								<!--<button type="submit" class="btn btn-primary">Buy Now</button>-->
	</form>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</center>

<%@include file="includes/footer.jsp"%>
</body>
</html>
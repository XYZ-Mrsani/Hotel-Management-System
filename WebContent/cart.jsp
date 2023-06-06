<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Cart"%>
<%@page import="com.dao.ProDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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

	long day = (long) session.getAttribute("day");
	ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart");
	List<Cart> cartp =null;
	if(cart_list !=null)
	{ 
		ProDao dao = new ProDao();
		cartp = dao.getCartProd(cart_list);
		double total = dao.getTotalPrice(cart_list)*(day);
		request.setAttribute("cart_list", cart_list);
		request.setAttribute("total", total);
	}

	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cart Page</title>
<%@include file="includes/head.jsp"%>
<style>
.table tbody td{
vartical-align:middle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 20px;z	
}
.paypal{
width: 200px;
}

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

</style>
 <script src="https://www.paypal.com/sdk/js?client-id=AZlJ7S7eWaTf_e97hqaWVRXu1HqtAyTokf1LBfBsf6nOXzzR3m2d3E1cVU6_ucRcpKOB2l8M5pSmD5JL&enable-funding=venmo&currency=USD"></script>
    <script>
        function initPayPalButton() {
            paypal
                .Buttons(
                    {
                        style: {
                            layout:  'horizontal',
                            color:   'blue',
                            shape:   'rect',
                            label:   'buynow'},

                        createOrder: function (data, actions) {
                            return actions.order.create({
                                purchase_units: [{
                                    "amount": {
                                        "currency_code": "USD",
                                        "value": document.getElementById('total').value
                                    }
                                }]
                            });
                        },

                        onApprove: function (data, actions) {
                            return actions.order
                                .capture()
                                .then(function (orderData) {
                                        console.log('Capture result',orderData,JSON.stringify(orderData,null, 2));

                                        const element = document
                                            .getElementById('paypal-button-container');
                                        window.location.href="http://localhost:8080/SE2Project/insertorder";
                                    });
                        },

                        onError: function (err) {
                            console.log(err);
                        }
                    }).render('#paypal-button-container');
        }
        initPayPalButton();
    </script>
</head>
<body>
<%@include file="includes/roomnav.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">
		
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Availability</th>
					<th scope="col">Price</th>
					<th scope="col">&emsp;&emsp;&emsp;&#160; Qunatity</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			<% if(cart_list !=null){
				for(Cart c:cartp){%>
				<tr>
					<td><%= c.getName() %></td>
					<td><%= c.getAvailability()%></td>
					<td>$<input type="text" id="price" value="<%= df.format(c.getPrice()) %>" readonly style="background: transparent; border: none; width:100px;"></td>
					<td>
						<form action="insertorder" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%= c.getId() %>" class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
					 <a class="btn btn-sm btn-decre" href="addquantity?action=decre&id=<%=c.getId() %>" id="decre"><i class="fas fa-minus-square"></i></a>
									<input type="text" name="quantity" class="form-control w-50" value="<%=c.getQuantity() %>" readonly>
					<a class="btn btn-sm btn-incre" href="addquantity?action=incre&id=<%=c.getId() %>" id="incre"><i class="fas fa-plus-square"></i></a>
							</div>
							<input type="text" name="uid" readonly="readonly"
								value="<%=(request.getSession().getAttribute("uid") == null) ? "" : (String) request.getSession().getAttribute("uid")%>" hidden>
							<!--&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-primary btn-sm">Buy</button>-->
						</form>
					</td>
					<td>
					<a href="removeitem?id=<%= c.getId() %>" class="btn btn-sm btn-danger" style="border-radius: 20px;">Remove</a>
					</td>
				</tr>
				<%}
			}
				%>
			</tbody>
		</table>
		<div class="d-flex py-3">
			<h3>Total Price: $ <input type="text" id="total" value="${(total>0)?df.format(total):0 }" readonly style="background: transparent; border: none; width:100px"></h3>
			<!--<a class="mx-3 btn btn-primary" href="insertorder">Check Out</a>-->
			<div id="paypal-button-container" class="paypal"></div>
		</div>
	</div>
</body>
</html>
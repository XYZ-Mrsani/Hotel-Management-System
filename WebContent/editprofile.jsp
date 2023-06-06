<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Edit Profile</title>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
       body {
	margin: 0;
	padding:50px;
	font-family: sans-serif;
    background-image: url(https://drive.google.com/uc?id=11-tmO4kyePGzuSN6EwHOtSuxPT4QSNxR);
    background-position: center center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
    background-color: #464646;
}

.profilebox {
	width: 600px;
	height: 300px;
	background:white;
	color: #fff;
	top: 55%;
	left: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	box-sizing: border-box;
	padding: 40px 30px;
	box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
	border-radius:15px;
}

.avatar {
	margin: 20px;
	width: 100px;
	height: 100px;
}

.profilebox p {
	margin: 0;
	padding: 0;
	font-weight: bold;
	color: black;
	font-size: 16px;
}

.profilebox input[type="text"], input[type="password"] {
	border: none;
	border-bottom: 1px solid black;
	background: transparent;
	outline: none;
	height: 35px;
	color: black;
	width: 250px;
	font-size: 18px;
}

.p1 {
	font-size: 24px;
	text-align: center;
}

.user input[type="text"] {
	border: none;
	background: transparent;
	font-size: 22px;
	outline: none;
	height: 35px;
	color:#7952b3;
	font-weight:bold;
	width: 350px;
}
.box{
	margin-left:335px;
	width:600px;
	height:150px;
	background-color:white;
	border-radius: 15px;
}

#upbtn{
	margin-right:20px;
	border: none;
	outline: none;
	height: 40px;
	background: #7952b3;
	color: white;
	font-size: 18px;
	border-radius: 20px;
	width: 150px;
}

#upbtn:hover {
	cursor: pointer;
	border: 1px solid #7952b3;
	background:white;
	color: #7952b3;
}

#backbtn{
	border: none;
	outline: none;
	height: 40px;
	border: 1px solid #7952b3;
	background:white;
	color: #7952b3;
	font-size: 18px;
	border-radius: 20px;
	width: 150px;
}

#backbtn:hover {
	cursor: pointer;
	background: #7952b3;
	color: white;
}

.task {
	margin-top:20px;
	margin-left: 110px;
}

#updatebtn{
	border: none;
	outline: none;
	height: 40px;
	background: #7952b3;
	color: white;
	font-size: 18px;
	border-radius: 20px;
	width: 150px;
	width: 70px;
}

#updatebtn:hover {
	cursor: pointer;
	border: 1px solid #7952b3;
	background:white;
	color: #7952b3;
}

#closebtn{
	border: none;
	outline: none;
	height: 40px;
	border: 1px solid #7952b3;
	background:white;
	color: #7952b3;
	font-size: 18px;
	border-radius: 20px;
	width: 70px;
}

#closebtn:hover {
	cursor: pointer;
	background: #7952b3;
	color: white;
}
    </style>
</head>
<body>

<%
		String username = (String) session.getAttribute("username");

		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1

		response.setHeader("Pragma", "no-cache"); //HTTP 1.0

		response.setHeader("Expires", "0"); //Proxies	

		if (session.getAttribute("username") == null) {
			response.sendRedirect("login_signup.jsp");
		}
		session.setMaxInactiveInterval(10*60);//after 10 min session destroy
	%>
	
	<div class="box">
	<div class="user" style="float: right;">
		<table class="t1">
			<tr>
				<td><img src="https://drive.google.com/uc?id=11Nm9t9JNcHlxoe03QUiZ_JxTeCl3zALv" class="avatar"></td>
				<td><input type="text" name="uname" value="${user.uname}" readonly="readonly"></td>
			</tr>
		</table>
	</div>
	</div>
	<form action="loginhome.jsp" method="post">
        <div class="profilebox">
			<p class="p1">Edit Profile Details</p>
				<table>
					<tr>
						<td>
							<p>First Name - </p>
						</td>
						<td>
							&ensp;<input type="text" name="fname" value="${user.fname }">
						</td>
					</tr>
				
					<tr>
						<td>
							<p>Last Name - </p>
						</td>
						<td>
							&ensp;<input type="text" name="lname" value="${user.lname }">
						</td>
					</tr>
				
					<tr>
						<td>
							<p>Email Address - </p>
						</td>
						<td>
							&ensp;<input type="text" name="email" value="${user.email }">
						</td>
					</tr>
				
					<!--<tr>
						<td>
							<p>Address - </p>
						</td>
						<td>
							<p>&nbsp;<input type="text" name="address"></p>
						</td>
					</tr>-->
				
					<tr>
						<td>
							<p>Phone - </p>
						</td>
						<td>
							&ensp;<input type="text" name="mobile" value="${user.phone }">
						</td>
					</tr>
				</table>
				<div class="task">
			<input type="text" name="uname" value="${username }" hidden>
<!-- 			<input type="submit" id="upbtn" name="updateprofile" value="Update"> -->
			<input class="btn btn-success" id="upbtn" name="updateprofile"  data-toggle="modal" data-target="#myModal1" value="Update" readonly="readonly">
			<input type="submit" id="backbtn" value="Back" formaction="view?uname=${username}" formmethod="post">
		</div>
		</div>
		
		<div class="modal fade" id="myModal1" role="dialog">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title text-center">Message</h3>
            </div>
            <div class="modal-body">
              <h4><p>Are You Sure Want Update Your Account!</p></h4>
            </div>
            <div class="modal-footer">
            	<input type="submit" id="updatebtn" class="btn btn-success" name="delete" value="Yes" formaction="update?username=${username}" formmethod="post">
              <button type="button" id="closebtn" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
          </div>
        </div>
        </div>
		
		</form>
</body>
<!--
<form action="#" method="post">
	<input type="submit" name="booking" value="Booking Info">
</form>

<form action="#" method="post">
	<input type="submit" name="booking" value="Booking Info">
</form>

<form action="#" method="post">
	<input type="submit" name="booking" value="Booking Info">
</form>-->
</body>
</html>
<%@page import="com.dao.ProDao"%>
<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>View Profile</title>
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
	background: transparent;
	outline: none;
	height: 35px;
	color: black;
	width: 350px;
	font-size: 18px;
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

#delbtn{
	border: none;
	outline: none;
	height: 40px;
	background: red;
	color: white;
	font-size: 18px;
	border-radius: 20px;
	width: 150px;
}

#delbtn:hover {
	cursor: pointer;
	border: 1px solid #b30000;
	background:white;
	color: #b30000;
}

#homebtn{
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

#homebtn:hover {
	cursor: pointer;
	background: #7952b3;
	color: white;
}

.task {
	margin-top:20px;
	margin-left: 30px;
}

#deletebtn{
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

#deletebtn:hover {
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
				<td><input type="text" name="uname" value="${user.uname }"
					readonly="readonly"></td>
			</tr>
		</table>
	</div>
	</div>
	<form method="post">
		<div class="profilebox">
			<p style="font-size: 24px; text-align: center;">Profile Details</p>
			<table>
				<tr>
					<td>
						<p>First Name -</p>
					</td>
					<td>
							&ensp;<input type="text" name="fname" readonly="readonly"
								value="${user.fname}">
					</td>
				</tr>

				<tr>
					<td>
						<p>Last Name -</p>
					</td>
					<td>
							&ensp;<input type="text" name="lname" readonly="readonly"
								value="${user.lname}">
					</td>
				</tr>

				<tr>
					<td>
						<p>Email Address -</p>
					</td>
					<td>
							&ensp;<input type="text" name="email" readonly="readonly"
								value="${user.email}">
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
						<p>Phone -</p>
					</td>
					<td>
							&ensp;<input type="text" name="mobile" readonly="readonly"
								value="${user.phone}">
					</td>
				</tr>
			</table>
		
		<div class="task">
			
			<input type="text" name="username" value="${username}" readonly="readonly" hidden>
		
			<input type="submit" id="upbtn" name="update" value="Update Details" formaction="update?username=${username}" formmethod="post">&nbsp;&nbsp;
		
<%-- 			<input type="submit" id="delbtn" name="delete" value="Delete Account" formaction="delete?username=${username}" formmethod="post">&nbsp;&nbsp; --%>
			<input class="btn btn-danger" id="delbtn"  data-toggle="modal" data-target="#myModal1" name="delete" value="Delete Account" readonly="readonly">&nbsp;&nbsp;
			
		    <input type="submit" id="homebtn" name="home" value="Home" formaction="loginhome.jsp" formmethod="post"> &nbsp;&nbsp;
		
		</div>
		</div>
		
		<div class="modal fade" id="myModal1" role="dialog">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title text-center">Message</h3>
            </div>
            <div class="modal-body">
              <h4><p>Are You Sure Want Delete Your Account!</p></h4>
            </div>
            <div class="modal-footer">
            	<input type="submit" id="deletebtn" class="btn btn-success" name="delete" value="Yes" formaction="delete?username=${username}" formmethod="post">
              <button type="button" id="closebtn" class="btn btn-default" data-dismiss="modal">No</button>
            </div>
          </div>
        </div>
        </div>
		
	</form>
	
	
</body>
</html>
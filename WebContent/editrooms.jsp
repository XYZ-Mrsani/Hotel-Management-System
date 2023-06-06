<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Room Details</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<script type="text/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body {
    color: #000;
    overflow-x: hidden;
    height: 100%;
    background-size: 120% 120%;
    background-color: #ebecee;
}

.card {
    padding: 30px 40px;
    margin-top: 20px;
    margin-bottom: 60px;
    border: none !important;
    box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.2)
}

.form-control-label {
    margin-bottom: 0
}

input,
textarea,
button {
    padding: 8px 15px;
    border-radius: 5px !important;
    margin: 5px 0px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    font-size: 18px !important;
    font-weight: 300
}

</style>
</head>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1

response.setHeader("Pragma", "no-cache"); //HTTP 1.0

response.setHeader("Expires", "0"); //Proxies	

if (session.getAttribute("adusername") == null) {
	response.sendRedirect("login_signup.jsp");
}
session.setMaxInactiveInterval(10*60);//after 10 min session destroy
%>
<body>
<div class="container-fluid px-1 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
            <div class="card">
                <h3 class="text-center mb-4">Update Room Details</h3>
                <form class="form-card" action="<%=request.getContextPath()%>/updater?id=<%=(request.getSession().getAttribute("rid") == null) ? "" : (int) request.getSession().getAttribute("rid")%>" method="post">
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Room Type<span class="text-danger"> *</span></label> <input type="text" name="room" value="${cart.name }"> </div>
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Availability<span class="text-danger"> *</span></label> <input type="text" name="availability" value="${cart.availability }"> </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Price<span class="text-danger"> *</span></label> <input type="text" name="price" value="${cart.price }"> </div>
                    </div>
              
                    <div class="row justify-content-end">
                    	<div class="form-group col-sm-6"> <button type="button" class="btn-block btn-primary" onclick="window.location='adminhome.jsp'">Home</button> </div>
                        <div class="form-group col-sm-6"> <button type="submit" class="btn-block btn-success">Update</button> </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
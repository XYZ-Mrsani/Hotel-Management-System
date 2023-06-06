<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

<style>

.outer {
	width: 100%;
	height: 400px;
	border: 1px solid #202020;
	display: flex;
	background-color: #202020;
	opacity: 0.9;
}

.middle {
	width: 300px;
	height: 350px;
	border: 1px solid #202020;
	margin: 23px 15px;
	background-color: #202020;
	color: white;
}

#div1 {
	background-image: url(https://drive.google.com/uc?id=1z5Pa77wD1xWHWmvSeeZtCbvP7xMPHIcZ);
	background-size: cover;
}

a {
	color: white;
	text-decoration: none;
}

.fa {
	padding: 10px;
	font-size: 20px;
	width: 45px;
	text-align: center;
	text-decoration: none;
	margin: 5px 2px;
}

.fa:hover {
	opacity: 0.7;
}

.fa-facebook {
	background: white;
	color: black;
}

.fa-twitter {
	background: white;
	color: black;
}

.fa-youtube {
	background: white;
	color: black;
}

.fa-instagram {
	background: white;
	color: black;
}


body{
background-color:#ebecee;
font-family: circular;
font-size: 20px;
margin:0%;
}



nav{
width: 100%;
background-color: rgba(0, 0, 0, 0.4);
color:white;
}



img{
width: 100%;
height:auto;
background-repeat: no-repeat;
background-size: cover;
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



input[type="date"]{
border-radius: 45px;
border: 1px solid #b9b9b9;
background-color: white;
}
#log{
float: right;
}

#bookbtn{
border:1px solid #7952b3;
background-color:#7952b3;
height:40px;
border-radius: 20px;
}

#bookbtn:hover{
background-color:#4B0082;
}

#Main
{
	padding-left:28%;
	padding-right: 25%;
	margin-top: 2%;
}
#Dining
{
   display:flex;
   font-family:circular;	
}
#Restuarent
{
	display:flex;
  font-family:circular;
}	
#Spa
{
	display:flex;
  font-family:circular;
}
#Services
{
	margin-top: 4.5%;
	margin-bottom: 3%;
  font-family:circular;
}
.Hi
{
	width:5%;
}

#Outer
	{
       display: flex;
       margin-left: 21%;
       margin-right: 19%;
       margin-top: 3%;
	}
	#card1
	{
	margin-right: 3%;
    display: inline-flex;
	}
	
#icon{
color: purple;
font-size: 100px;
}

#formbtn{
border:1px solid #7952b3;
background-color:#7952b3;
height:40px;
border-radius: 20px;
}

#formbtn:hover{
background-color:#4B0082;
}

     .out {
            width: 100%;
            height: 500px;
            display: flex;
        }

        .mid {
            width: 400px;
            height: 450px;
            margin: 23px 30px;
        }

        * {
      padding: 0;
      margin: 0;
      box-sizing: border-box;
    }


    #containe {
    
      transform: translate(0%, 0%);
      box-shadow: 0 10px 20px rgb(40, 40, 40);

    }

   

    .overlay {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      opacity: 0;
      transition: opacity 0.4s ease-in-out;
      background: black;
      cursor: pointer;
    }

    .content {
      position: absolute;
      top: 50%;
      left: 50%;
      right: -30%;
      transform: translate(-50%, -50%);
      color: white;
      font-family: cursive;
      text-align: center;
    }

    #containe:hover .overlay {
      opacity: 0.8;
    }
    
#image{
   height: 500px;
   object-fit: cover;
    }

</style>
</head>

<body>
<script type="text/javascript">
function locate() {
	window.location="http://localhost:8080/SE2/room.jsp";
}
</script>
<%@include file="includes/navbar.jsp"%>
<section id="home">
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
<div class="carousel-indicators">
<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
</div>
<div class="carousel-inner">
<div class="carousel-item active">
<img src="https://drive.google.com/uc?id=195zXDF89CeCobNlf_MyT967zsWRarw-i" class="d-block w-100" alt="...">
</div>
<div class="carousel-item">
<img src="https://drive.google.com/uc?id=1bgblYXIu32d7iYlyFxW8WaYmtkN_BqtC" class="d-block w-100" alt="...">
</div>
<div class="carousel-item">
<img src="https://drive.google.com/uc?id=1t6FUsKxTHDnocXCOPy1UV42V9aTTDoLa" class="d-block w-100" alt="...">
</div>
</div>
<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
<span class="carousel-control-prev-icon" aria-hidden="true"></span>
<span class="visually-hidden">Previous</span>
</button>
<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
<span class="carousel-control-next-icon" aria-hidden="true"></span>
<span class="visually-hidden">Next</span>
</button>
</div>

<div class="container position-absolute bottom-0 start-50 translate-middle">
<form action="checkin" method="post">
<div class="row" id="availablilty">
<span class="col-lg-2 text-end">Check In</span>
<input type="date" name="checkin" class="col-lg-2 mb-2" onfocus= "(this.type='date')">
<span class="col-lg-2 text-end">Check Out</span>
<input type="date" name="checkout" class="col-lg-2 mb-2" onfocus= "(this.type='date')">
<span class="col-lg-1"></span>
<button class="btn btn-primary col-lg-2" type="submit" id="bookbtn">Book Now</button>
<span class="col-lg-1"></span>
</div>
</form>
</div>
</section>

<section id="about">
<div class="d-flex bd-highlight"id="font" style="margin-top: 80px;">
  <div class="p-2 flex-fill bd-highlight" ><img src="https://drive.google.com/uc?id=1paNDlbRNLzHndiBb2Q2voK6Vye9-uwuk" width="95%" height="70%" style="padding-left:20%; padding-bottom:20%; margin-top:3.5%; "></div>
  <div class="p-2 flex-fill bd-highlight" ><b><p style="font-size:2.5vw; font-family:circular;">About us</p></b>
 <p style="padding-right:20%; font-size:1.75vw; ">Our vision is to rank among the best hotels in the country that greatly reduce environment pollution and wildlife destruction with maintaining the operation of the hotel . Our mission is to provide the most exciting and memorable accommodation to our customers. Our hotel location offers our customers the most stunning views and scenery around the hotel area. </p>
 </div>
 </div>
 </section>
 
 <section id="rooms">
<div style="margin-top: -80px;">
<center><b><p style="font-size:2.5vw; font-family:circular;">Our Rooms</p></b></center>
    <div class="out">
        <div class="mid">
            <div id="containe">
                <img id="image" src="https://drive.google.com/uc?id=1qJITB0IYe4lDF9SIoAoxyAGI5t4FrP_l">
                <div class="overlay">
                  <div class="content">
                    <h2>Single Rooms</h2><br><br>
                    <p> </p>
          
                    <p>
                      The approximately 17 sq m single rooms have modern furnishings. The high-quality king-size bed ensures a
                      refreshing sleep. We are happy to provide a cot for a charge of $6.00 per night.</p>
          
                    <p>Price: 50$</p>
          
                  </div>
          
                </div>
          
              </div>

        </div>
        <div class="mid">
        
            <div id="containe">

                <img id="image" src="https://drive.google.com/uc?id=1Xqcner4qDgWYKVcobJIfwtOmqTx2RfRA" >
                <div class="overlay">
                  <div class="content">
                    <h2>double rooms</h2><br><br>
                    <p> </p>
                    <p>The double rooms of approximately 22-30 sq m all have modern furnishings. The beds can be booked either as
                      doubles or twins. We are happy to provide a cot for a charge of $6.00 per night. </p>
          
                    <p>Price: 100$</p>
          
                  </div>
                </div>
              </div>

        </div>
        <div class="mid">
            
            <div id="containe">
                <img id="image" src="https://drive.google.com/uc?id=1ZJPpIUpJNW0FBI6BVJYnLp_yVqKbvPEp">
                <div class="overlay">
                  <div class="content">
                    <h2>Family rooms</h2><br>
                    <p> </p>
                    <p>The family rooms of approximately 40-60 sq m all have modern furnishings. The rooms have three or four beds
                      and are suitable for both families and adults. Some of the family rooms have bunk beds of 200 cm length; the
                      remaining rooms are fitted with separate double beds (also available as twins). </p>
                    <p>Price: 150$</p>
                  </div>
                </div>
              </div>

        </div>
    </div>
    </div>
 </section>
 
 <section id="facilities">
 <div style="margin-top:80px; margin-bottom: 80px;">
<center><b><p style="font-size:2.5vw; font-family:circular";> Facilities</p></b></center>
<div id = "Main" >
<center>
<div id = "Dining"> 
  <div class="card" style="width: 20rem; height:15rem">
  <div class="card-body">
    <b><p class="card-title" style="font-size:1.5vw;">Dining</p></b>
    <p class="card-text" style="font-size: 1.2vw">Whether with family, on a romantic get away, or stopping by on bussiness, Our Dine will tantalise your tastebuds by bringing the world to your table. </p>
  </div>
</div>
<div class="card" style="width: 20rem; height:15rem">
  <img src="https://drive.google.com/uc?id=1JKo7VnsJzGTsuTITZUhIhYjaxluAPROp" class="card-img-top" alt="" style="height:15rem">
</div>
</div>

<div id = "Restuarent">
 <div class="card" style="width: 20rem; height:15rem">
  <img src="https://drive.google.com/uc?id=1Qq7yGU1p1c9PrbIYJsVFJjaW2JGAaMNv" class="card-img-top" alt="" style=" height:20rem">
</div>
<div class="card" style="width: 20rem;">
  <div class="card-body">
    <b><p class="card-title" style="font-size:1.5vw;">Restaurant</p></b>
    <p class="card-text" style="font-size: 1.2vw">Breakfast, Lunch or Dinner, our Restaurant brings to you the seamless integration of flavors and cuisines from around the World.</p>
  </div>
</div>
</div>

<div id = "Spa">
 <div class="card" style="width: 20rem; height:15rem">
  <div class="card-body">
    <b><p class="card-title" style="font-size:1.5vw;">Spa</p></b>
    <p class="card-text" style="font-size: 1.2vw">At our Spa nature reveals guests secrets of healing and harmony, which embrace a deep understanding of mind, body and soul: their individual needs and its inter dependency.</p>
  </div>
</div>
<div class="card" style="width: 20rem; height:15rem">
  <img src="https://media.istockphoto.com/photos/still-life-closeup-of-a-tranquil-spa-arrangement-picture-id1325095289?b=1&k=20&m=1325095289&s=170667a&w=0&h=WN2MnFRkjm-Sb3Pqu6jeQj8wR2sNu3qCGi6TFptwOPA=" class="card-img-top" alt="" style="height:15rem">
</div>
</div>
</center>
</div>
</div>

<center>
<div class="container">

		<b><p style="font-size:2.5vw; font-family:circular"> Our Services </p></b>
	
		<div class="card-group">
		<div class="card col-lg-2" style="margin-right: 2%;">
  			<div class="card-body" id="icon">
    			<i class="fa fa-wifi" style="font-size: 70px; margin-right: 40px;"></i>
    			<h5 class="text-center">Free WiFi</h5>
  			</div>
		</div>
		<div class="card col-lg-2" style="margin-right: 2%;">
  			<div class="card-body" id="icon">
    			<i class="fa fa-car" style="font-size: 70px; margin-right: 40px;"></i>
    			<h5 class="text-center">Parking</h5>
  			</div>
		</div>
		<div class="card col-lg-2" style="margin-right: 2%;">
  			<div class="card-body" id="icon">
    			<i class="fa fa-cutlery" style="font-size: 70px; margin-right: 40px;"></i>
    			<h5 class="text-center">Restaurent</h5>
  			</div>
		</div>
		<div class="card col-lg-2" style="margin-right: 2%;">
  			<div class="card-body" id="icon">
    			<i class="fa fa-clock-o" style="font-size: 70px; margin-right: 40px;"></i>
    			<h5 class="text-center">24 Hour Reception</h5>
  			</div>
		</div>
		<div class="card col-lg-2" style="margin-right: 2%;">
  			<div class="card-body" id="icon">
    			<i class="fa fa-circle-o" style="font-size: 70px; margin-right: 40px;"></i>
    			<h5 class="text-center">Swimming Pool</h5>
  			</div>
		</div>
		</div>
	</div>
</section>

<section id="gallery">
<div style="text-align: center;">
<b><p style="font-size:2.5vw; font-family:circular; margin-top: 80px; margin-bottom: 30px;"> Gallery</p></b>
<div class="row" style="margin-bottom: 80px;">
  <div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
    <img
      src="https://images.unsplash.com/photo-1629947487905-9f45cb002b41?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"
      class="w-100 shadow-1-strong rounded mb-4"
      alt=""
    />

    <img
      src="https://images.unsplash.com/photo-1565503261152-b42ab6c1a925?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
      class="w-100 shadow-1-strong rounded mb-4"
      alt=""
    />
  </div>

  <div class="col-lg-4 mb-4 mb-lg-0">
    <img
      src="https://images.unsplash.com/photo-1636484807469-e33af13716b7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
      class="w-100 shadow-1-strong rounded mb-4"
      alt=""
    />

    <img
      src="https://images.unsplash.com/photo-1540304453527-62f979142a17?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTF8NjgwMjI4MXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
      class="w-100 shadow-1-strong rounded mb-4"
      alt=""
    />
  </div>

  <div class="col-lg-4 mb-4 mb-lg-0">
    <img
      src="https://images.unsplash.com/photo-1519690889869-e705e59f72e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
      class="w-100 shadow-1-strong rounded mb-4"
      alt=""
    />

    <img
      src="https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
      class="w-100 shadow-1-strong rounded mb-4"
      alt=""
    />
  </div>
</div>
</div>
</section>

<div class="card text-center container" style="margin-top: 80px; margin-bottom: 80px;"><p class="card-header" style="font-weight: bold;font-size: 22px;">Feel free to drop us your feedback!</p>
<div class="card-body"><a href="feedback.jsp" class="btn btn-success" id="formbtn">Go to Feedback Form</a></div>
</div>

<section id="contactus">
	<footer>
	<diV class="outer">
		<div class="middle" id="div1"></div>
		<div class="middle" id="div2">
			<p>
				<b><u>EXPLORE</u></b>
			</p>
			<p>
				<a href="#home">Home</a>
			</p>
			<p>
				<a href="#aboutus">About Us</a>
			</p>
			<p>
				<a href="#rooms">Rooms</a>
			</p>
			<p>
				<a href="#facilities">Facilities and Services</a>
			</p>
			<p>
				<a href="#gallery">Gallery</a>
			</p>
			<p>
				<a href="#contactus">Contact Us</a>
			</p>
		</div>
		<div class="middle" id="div3">
			<p>
				<u><b>FOLLOW US ON</b></u>
			</p>
			<p>Social Media Channels</p>
			<p>
				<a href="#" class="fa fa-facebook"></a> <a href="#"
					class="fa fa-youtube"></a> <a href="#" class="fa fa-instagram"></a>
				<a href="#" class="fa fa-twitter"></a>
			</p>
		</diV>
		<div class="middle" id="div4">
			<p>
				<u><b>Contact Us</b></u>
			</p>
			<p>Phone No: +94123456789</p>
			<p>Email: hotelexample123@gmail.com</p>
		</div>

	</div>
	</footer>
</section>
	<img alt=".." src="https://drive.google.com/uc?id=1u3AWW9sUJeX-fO3SRiMFyIx-HX0LTEhZ">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
	
</body>

</html>
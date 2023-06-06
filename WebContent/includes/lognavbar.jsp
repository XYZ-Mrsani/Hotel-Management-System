<header>
<div class="container-fluid">
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse justify-content-left" id="navbarNavAltMarkup">
<ul class="navbar-nav">
<li class="nav-item">
<a class="nav-link"><img alt="..." src="https://drive.google.com/uc?id=15OPxkfnkdq5y_q9H0wbIWCzHu1u9E0oQ" style="width: 70px; height: 40px;"></a>
</li>
<li class="nav-item">
<a class="nav-link active" aria-current="page" href="#home">Home</a>
</li>
<li class="nav-item">
<a class="nav-link" href="#about">About Us</a>
<li class="nav-item">
<a class="nav-link" href="#rooms">Our Rooms</a>
</li>
<li class="nav-item">
<a class="nav-link" href="#facilities">Facilities & Services</a>
</li>
<li class="nav-item">
<a class="nav-link" href="#gallery">Gallery</a>
</li>
<li class="nav-item">
<a class="nav-link" href="#contactus">Contact Us</a>
</li>
</ul>
</div>

<div style="float: right;">
<div class="collapse navbar-collapse" id="navbarNavAltMarkup" style="float: right;">
<ul class="navbar-nav">
<li class="nav-item">
<%if(session.getAttribute("day")!=null){ %>
<a class="nav-link" href="cart.jsp">Cart &nbsp;<span class="badge badge-danger px-1">${ cart_list.size()} </span></a></li>
<%} %>
<li class="nav-item dropdown">
 <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"><img src="https://drive.google.com/uc?id=11Nm9t9JNcHlxoe03QUiZ_JxTeCl3zALv" style="width: 25px; height: 25px">&emsp;<input type="text" name="uname" readonly="readonly" value="${username}"/></a>
          
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="view?uname=${username}">View Profile</a></li>
            <li><a class="dropdown-item" href="orders.jsp">Booking Info</a></li>
            <li><a class="dropdown-item" href="conorders.jsp">Booking History</a></li>
            <li><a class="dropdown-item" href="logout">LogOut</a></li>
          </ul></li>
</ul>
</div>
</div>
</nav>
</div>
</header>
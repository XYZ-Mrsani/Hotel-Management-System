<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback Form</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css"
    integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
  <style>
  body{
  background-color:#ebecee;
  }
    #buttoncolor {
      border: 2px solid #7952b3;
      background-color: #7952b3;
      border-radius: 20px;
      width: 150px;
    }
    
    #buttoncolor:hover {
      border: 2px solid #7952b3;
      background-color: white;
      border-radius: 20px;
      color: #7952b3;
    }

    #font {
      font-family: circular;
    }
  </style>
</head>
<body>

<div class="shadow-lg p-3 mb-5 bg-body rounded">
    <div class="container">
      <form action="feedback" method="post">
        <div>
          <div>
            <h3 id="font">Feel free to drop us your feedback!</h3><br>
          </div>
          <div class="rateyo" id="rating" data-rateyo-rating="4" data-rateyo-num-stars="5" data-rateyo-score="3">
          </div><br>
          <span class='result'>0</span>
          <input type="hidden" name="rating" required>
          <br><br>
        </div>

        <div class="mb-5" id="font">
          <label for="exampleFormControlInput1" class="form-label">Name</label>
          <input class="form-control" type="text" placeholder="Enter Name" aria-label="default input example" name="name" required>

        </div>
        <div class="mb-5" id="font">
          <label for="exampleFormControlInput1" class="form-label">Email address</label>
          <input type="email" class="form-control" id="exampleFormControlInput1" name="email" placeholder="Enter Email" required>
        </div>
        <div class="mb-5" id="font">
          <label for="exampleFormControlTextarea1" class="form-label">Comment</label>
          <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="comment" required></textarea>
        </div>
        <div class="col-auto">
          <button type="submit" class="btn btn-primary" id="buttoncolor" name="add" style="margin-right: 20px;">Submit</button>
          <%if (session.getAttribute("username") != null) {%>
        	  <a href="loginhome.jsp" class="btn btn-primary" id="buttoncolor" >Back to Home</a>
  		<% }else{ %>
          <a href="home.jsp" class="btn btn-primary" id="buttoncolor" >Back to Home</a><%} %>
        </div>
        </form>

    </div>
  </div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

  <script>


    $(function () {
      $(".rateyo").rateYo().on("rateyo.change", function (e, data) {
        var rating = data.rating;
        $(this).parent().find('.score').text('score :' + $(this).attr('data-rateyo-score'));
        $(this).parent().find('.result').text('rating :' + rating);
        $(this).parent().find('input[name=rating]').val(rating); //add rating value to input field
      });
    });

  </script>
</body>
</html>
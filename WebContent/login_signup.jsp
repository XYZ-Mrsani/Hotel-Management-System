<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login or Signup</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>
@import url('https://fonts.googleapis.com/icon?family=Material+Icons');
  *, *:before, *:after {
  box-sizing: border-box;
}

html {
  overflow-y: scroll;
}

body {
  font-family: circular;
  background-image: url(https://drive.google.com/uc?id=13NQIsDVvdu9bsSbAgcbEL6RGX_iJyvoh);
  background-position: center center;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
  background-color: #464646;
}

a {
  text-decoration: none;
  color: #1ab188;
  transition: .5s ease;
}
a:hover {
  color: #179b77;
}

.form {
  background: white;
  padding: 40px;
  max-width: 500px;
  margin: 40px auto;
  border-radius: 4px;
  box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);
}

.tab-group {
  list-style: none;
  padding: 0;
  margin: 0 0 40px 0;
}
.tab-group:after {
  content: "";
  display: table;
  clear: both;
}
.tab-group li a {
  display: block;
  text-decoration: none;
  padding: 15px;
  background: rgba(160, 179, 176, 0.25);
  color: #a0b3b0;
  font-size: 20px;
  float: left;
  width: 50%;
  text-align: center;
  cursor: pointer;
  transition: .5s ease;
}
.tab-group li a:hover {
  background: #9400D3;
  color: #ffffff;
}
.tab-group .active a {
  background: #4B0082;
  color: #ffffff;
}

.tab-content > div:last-child {
  display: none;
}

h1 {
  text-align: center;
  color: black;
  font-weight: 300;
  margin: 0 0 40px;
}

label {
  position: absolute;
  transform: translateY(6px);
  left: 13px;
  color: black;
  transition: all 0.25s ease;
  -webkit-backface-visibility: hidden;
  pointer-events: none;
  font-size: 22px;
}
label .req {
  margin: 2px;
  color: #af13f1;
}

label.active {
  transform: translateY(50px);
  left: 2px;
  font-size: 14px;
}
label.active .req {
  opacity: 0;
}

label.highlight {
  color: black;
}

input, textarea {
  font-family:circular;
  font-size: 22px;
  display: block;
  width: 100%;
  height: 100%;
  padding: 5px 10px;
  background: none;
  background-image: none;
  border: 1px solid #a0b3b0;
  color: black;
  border-radius: 0;
  transition: border-color .25s ease, box-shadow .25s ease;
}
input:focus, textarea:focus {
  outline: 0;
  border-color: #9400D3;
  box-shadow: 0 1px 1px 1px #9400D3;
}

textarea {
  border: 2px solid #4B0082;
  resize: vertical;
}

.field-wrap {
  position: relative;
  margin-bottom: 40px;
}

.top-row:after {
  content: "";
  display: table;
  clear: both;
}
.top-row > div {
  float: left;
  width: 48%;
  margin-right: 4%;
}
.top-row > div:last-child {
  margin: 0;
}

.button {
  font-family:cicular;
  border: 0;
  outline: none;
  border-radius: 0;
  padding: 15px 0;
  font-size: 1.5rem;
  font-weight: 600;
  letter-spacing: .1em;
  background: #4B0082;
  color: #ffffff;
  transition: all 0.5s ease;
  -webkit-appearance: none;
  border-radius: 50px;
}
.button:hover, .button:focus {
  background: #9400D3;
}

.button-block {
  display: block;
  width: 100%;
}

.forgot {
  margin-top: -20px;
  text-align: right;
}

</style>
</head>
<body>
<div class="form">
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up</h1>
          
          <form action="signup" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" name="fname" required autocomplete="off">
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text" name="lname" required autocomplete="off">
            </div>
          </div>
          
          <div class="field-wrap">
            <label>
              User Name<span class="req">*</span>
            </label>
            <input type="text" name="username" required autocomplete="off">
          </div>
          
          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
           <input type="email" name="email" required autocomplete="off">
          </div>
          
          <div class="field-wrap">
            <label>
              Phone <span class="req">*</span>
            </label>
           <input type="text" name="mobile" required autocomplete="off">
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
           <input type="password" name="password" required autocomplete="off">
          </div>
          
          <div class="field-wrap">
            <label>
              Confirm Password<span class="req">*</span>
            </label>
             <input type="password" name="confirm_password" required autocomplete="off">
          </div>
          
          <button type="submit" class="button button-block"/>SignUp</button>
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form action="login" method="post">
          
            <div class="field-wrap">
            <label>
              Username<span class="req">*</span>
            </label>
             <input type="text" name="username" required autocomplete="off">
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off">
          </div>
          
          
          
          <button class="button button-block">Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script>
    $('.form').find('input, textarea').on('keyup blur focus', function (e) {
    
    var $this = $(this),
        label = $this.prev('label');
  
      if (e.type === 'keyup') {
        if ($this.val() === '') {
            label.removeClass('active highlight');
          } else {
            label.addClass('active highlight');
          }
      } else if (e.type === 'blur') {
        if( $this.val() === '' ) {
          label.removeClass('active highlight'); 
        } else {
          label.removeClass('highlight');   
        }   
      } else if (e.type === 'focus') {
        
        if( $this.val() === '' ) {
          label.removeClass('highlight'); 
        } 
        else if( $this.val() !== '' ) {
          label.addClass('highlight');
        }
      }
  
  });
  
  $('.tab a').on('click', function (e) {
    
    e.preventDefault();
    
    $(this).parent().addClass('active');
    $(this).parent().siblings().removeClass('active');
    
    target = $(this).attr('href');
  
    $('.tab-content > div').not(target).hide();
    
    $(target).fadeIn(600);
    
  });
  </script>
</body>
</html>
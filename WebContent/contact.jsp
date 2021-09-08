<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*,com.Database.Shop.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>WELCOME TO SHOPPING PARADISE</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

</head>
<body>
<body>
<%
String user="",text="<li class='nav-item'><a class='nav-link' href='login.jsp?test=1'>Login</a></li><form class='form-inline my-2 my-lg-0' action='search' method='post'>"+
"<input class='form-control mr-sm-2' type='search' placeholder='Search' name='product_name' aria-label='Search'>"+
"<button class='btn btn-outline-success my-2 my-sm-0' type='submit'>Search</button></form>";
		  Cookie ck[]=request.getCookies();
		  for(Cookie c:ck)
		  {
			  if(c.getName().equals("user"))
			  {
				  user=c.getValue();
				  if(user.equalsIgnoreCase("HAIDER"))
					  text="<li class='nav-item'><a class='nav-link' href='admin.jsp'>Welcome, "+user+"</a></li><li class='nav-item'><a class='nav-link' href='logout.jsp'>Logout</a></li>";
					  else
						  text="<li class='nav-item'><a class='nav-link' href='index.jsp'>Welcome, "+user+"</a></li><li class='nav-item'><a class='nav-link' href='logout.jsp'>Logout</a></li>";
			  }
		  }
		  %>
<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
    <a class="navbar-brand" href="#">
    <img src="images/images.png" alt="Logo" style="width:125px;border-radius:20px"></a>
      <a class="navbar-brand" href="#" style="font-family:Comic Sans MS">SHOPPING PARADISE</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.jsp">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.jsp">Contact Us</a>
          </li>
          <%=text %>
          </ul>
      </div>
    </div>
  </nav>
  <div class="container" style="margin-top:100px">
  <div class="container">
  <img  style="border-radius:20px;margin-top:5px;margin-bottom:5px" src="images/contact-banner.jpg" width="100%" height="400px">
  </div>
  <h4><strong>OFFICE</strong></h4>
  
  <div class="row">
  <div class="col-md-6">
  <strong>OFFICE ADDRESS:</strong>&nbsp;9/52,SHAH NAJAF ROAD,HAZRAT GANJ,LUCKNOW-226003<br>
  <strong>OFFICE TIMINGS:</strong>&nbsp;&nbsp;MON to FRI:9am to 6pm<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ONLY FOR SAT:9am to 3pm<br> 
  </div>
  <div class="col-md-6">
                    <form class="form" action="addQuery" method="post">
                                <div class="form-group">
                            <label for="user_name">YOUR NAME</label>
                            <input class="form-control" type="text" name="user_name"/>
                        </div>
					    <div class="form-group">
                            <label for="email_address">EMAIL-ADDRESS</label>
                            <input class="form-control" type="text" name="email_address"/>
                        </div>
                        <div class="form-group">
					  <label for="query">ENTER YOUR QUERY</label>
					  <textarea class="form-control" rows="3" name="query"></textarea>
					</div>
                       <div class="form-group">                    
                            <input class="form-control btn-primary btn-lg" type="submit" value="SUBMIT YOU QUERY"/>
                        </div>
                        <div class="form-group">                    
                            &nbsp;
                        </div>
                        </form>
                        </div>
  
  </div>
<div class="row">
<div class="col-md-6">
<h4><strong>CONTACT US</strong></h4>
<strong>CUSTOMER SUPPORT NUMBER:</strong>&nbsp;&nbsp;1800-001-2227<br>
<strong>EMAIL-ADDRESS:</strong>&nbsp;&nbsp;support_shopping_paradise@gmail.com
</div>
</div>
</div>
<br>
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="text-center bg-dark text-white">Copyright&copy;2019 SHOPPING PARADISE Inc. All Right Reserved To HAIDER</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>
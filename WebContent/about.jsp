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
				  text="<li class='nav-item'><a class='nav-link' href='#'>Welcome, "+user+"</a></li>"+
				  "<li class='nav-item'><div class='dropdown'><button type='button' class='btn btn-dark dropdown-toggle'"+
				  "data-toggle='dropdown'>My Account</button><div class='dropdown-menu'>"+
				  "<a class='dropdown-item' href='myOrders.jsp'>My Orders</a>"+
				  "<a class='dropdown-item' href='cart.jsp'>My Cart</a>"+
				  "<a class='dropdown-item' href='editProfile.jsp'>Edit Profile</a></div></div></li>"+
				  "<li class='nav-item'><a class='nav-link' href='logout.jsp'>Logout</a></li>";
			  }
		  }
		  Connection con1;
		  DBConfig dbcon1=new DBConfig();
		  con1=dbcon1.getConnection();
		  Statement s1=con1.createStatement();
		  ResultSet rs2=s1.executeQuery("select * from Category");
		  %>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
    <a class="navbar-brand" href="#">
    <img src="images/images.png" alt="Logo" style="width:125px;border-radius:20px"></a>
      <a class="navbar-brand" href="#"  style="font-family:Comic Sans MS">SHOPPING PARADISE</a>
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
            <a class="nav-link" href="contact.jsp">Contact</a>
          </li>
          <%=text %>
          </ul>
      </div>
    </div>
  </nav>
  <!-- Page Content -->
  <div class="container" style="margin-top:100px">
  <div class="row">
  <div class="col-md-6">
  <img src="images/images.png" height="450px" width="450px">
  </div>
  <div class="col-md-6" style="font-size:20px; font-family:Comic Sans MS">
  Welcome to <strong>SHOPPING PARADISE</strong>!
  <br>We aim to offer our customers a variety of the latest products. We have come a long way, so we know exactly which direction to take when supplying you with high quality yet budget-friendly products. We offer all of this while providing excellent customer service and friendly support.

We always keep an eye on the latest trends and put our customers wishes first. That is why we have satisfied customers all over the world, and are thrilled to be a part of this industry.

The interests of our customers are always top priority for us, so we hope you will enjoy our products as much as we enjoy making them available to you.<br>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Regards,HAIDER<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(CEO & FOUNDER)
  </div>
  </div>
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>



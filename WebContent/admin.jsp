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
String user="",text="<li class='nav-item'><a class='nav-link' href='login.jsp'>Login</a></li>";
Cookie ck[]=request.getCookies();
for(Cookie c:ck)
{
	  if(c.getName().equals("user"))
	  {
		  user=c.getValue();
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
            <a class="nav-link" href="category.jsp?cat=0">Manage Categories</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="product.jsp?pro=0">Manage Products</a>
          </li>          
          <%=text %>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container" style="margin-top:100px;">

    <div class="row">
        <div class="col-md-12">&nbsp;</div>

    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
                  Welcome, <%=user %>    
        </div>
        <div class="col-md-3"></div>

    </div>
    <div class="row">
        <div class="col-md-12">&nbsp;</div>

    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->

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

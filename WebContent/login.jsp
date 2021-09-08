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
<%int test=Integer.parseInt(request.getParameter("test")); %>
<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
     <a class="navbar-brand" href="#">
    <img src="images/images.png" alt="Logo" style="width:125px;border-radius:20px"></a>
      <a class="navbar-brand" href="#" style="font-family:Comic Sans MS">SHOPPING PARADISE</a> <a class="navbar-brand" href="#"></a>
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
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">Login</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container" style="margin-top:100px">

    <div class="row">
        <div class="col-md-12">&nbsp;</div>

    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <form class="form" action="login" method="post">
                <div class="form-group">
                    <label for="email">Email ID</label>
                    <input class="form-control" type="text" name="email"/>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input class="form-control" type="password" name="password"/>
                </div>
                <div class="form-group">                    
                    <input class="form-control btn-primary btn-lg" type="submit" value="Login"/>
                </div>
                <%if(test==0)
                {
                %>
                <div class="alert alert-danger">
  				<strong>INVALID CREDENTIALS</strong>
				</div>
                <%
                }
                %>
                <div class="form-group">                    
                    <a href="#">Forgot Password?</a> | <a href="registration.jsp?flag=0">New User</a>
                </div>
            </form>
            </div>
            
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

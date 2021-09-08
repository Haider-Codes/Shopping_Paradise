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
int f=0;
Cookie ck[]=request.getCookies();
for(Cookie c:ck)
{
	  if(c.getName().equals("user"))
	  {
		  user=c.getValue();
			  text="<li class='nav-item'><a class='nav-link' href='admin.jsp'>Welcome, "+user+"</a></li><li class='nav-item'><a class='nav-link' href='logout.jsp'>Logout</a></li>";
			  }
}
Connection con;
String product_name=request.getParameter("product_name");
DBConfig dbcon=new DBConfig();
con=dbcon.getConnection();
Statement s=con.createStatement();
ResultSet rs1=s.executeQuery("select * from product where product_name="+product_name);
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
        <div class="col-md-12">&nbsp;</div>

    </div>
    <div class="row">
    <%
    while(rs1.next())
    {
    	f++;
    %>
         <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100" style="border-radius:20px">
              <a href="categories.jsp?cid=<%=rs1.getInt(6) %>"><img class="card-img-top" src="images/<%=rs1.getString(7) %>" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="categories.jsp?cid=<%=rs1.getInt(6) %>"><%=rs1.getString(2) %></a>
                </h4>
                <h5><%=rs1.getString(4) %></h5>
                <p class="card-text"><%=rs1.getString(3) %></p>
              </div>
              <% if(user.equals(""))
              {
               %>
              <a href="login.jsp?test=1" class="btn btn-primary" role="button">ADD TO CART</a>
              <% 
              } 
              %>
             <%
             if(user!=(""))
             {
             %>
              <a href="cartItemController.jsp?product_id=<%=rs1.getInt(1) %>&&user_name=<%=user %>" class="btn btn-primary" role="button">ADD TO CART</a>
              <%
              }
              %>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
<%
}
    if(f==0)
    {
%>
	<div class="col-md-3"></div>
				<div class="alert alert-primary">
  				<strong>Product Not Found!</strong>
				</div>
      </div>
      <%
    }
      %>
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
 
        


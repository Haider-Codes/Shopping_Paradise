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
int user_id;
double amount=0.0,sum=0.0;
String user="",text="<li class='nav-item'><a class='nav-link' href='login.jsp'>Login</a></li>";
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
		  Connection con1;
		  DBConfig dbcon1=new DBConfig();
		  con1=dbcon1.getConnection();
		  try{
		  Statement s1=con1.createStatement();
		  ResultSet rs1=s1.executeQuery("select * from users where user_name='"+user+"';");
		  while(rs1.next())
		  {
			  user_id=rs1.getInt(1);
		  ResultSet rs=s1.executeQuery("select * from cart where user_id="+user_id);
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
  <div class="container" style="margin-top:100px">

    <div class="row">
        <div class="col-md-12">&nbsp;</div>
        </div>
        
      <div class="row">
        <div class="col md-6">
        <table class="table table-striped">
        <tr>
        <th>PRODUCT </th>
        <th>PRODUCT NAME</th>
        <th>QUANTITY</th>
        <th>AMOUNT</th>
        <th></th>
        </tr>
<tr height="200px">
<%
        while(rs.next())
        {
        %>
<td><img width="200px" height="200px" src="images/<%=rs.getString(5)%>"></td>
  
  <td><%=rs.getString(2) %></td>
 <td>
 <div class="dropdown"><button type="button" class="btn btn-light dropdown-toggle"data-toggle="dropdown"><%=rs.getInt(3)%></button>
                  <div class="dropdown-menu">
				  <a class="dropdown-item" href="cartItemQuantityController.jsp?product_id=<%=rs.getInt(1)%>&&quantity=<%=1%>&&user_id=<%=rs.getInt(6)%>">1</a>
				  <a class="dropdown-item" href="cartItemQuantityController.jsp?product_id=<%=rs.getInt(1)%>&&quantity=<%=2%>&&user_id=<%=rs.getInt(6)%>">2</a>
				  <a class="dropdown-item" href="cartItemQuantityController.jsp?product_id=<%=rs.getInt(1)%>&&quantity=<%=3%>&&user_id=<%=rs.getInt(6)%>">3</a>
				  </div>
				  </div>
				 
</td> 
 <%amount=(rs.getInt(3))*(rs.getFloat(4));
 sum=sum+amount;
 %>
 <td><%=amount %></td>
 <td><a href="cartItemDelete.jsp?user_id=<%=rs.getInt(6)%>&&product_id=<%=rs.getInt(1)%>" class="btn btn-danger" role="button">REMOVE</a></td>
 </tr>
 <%
 }
		  }
		  }
		  catch(Exception e)
		  {
			  e.getMessage();
		  }
 %>
 <tr>
 <td></td>
 <td></td>
 <td></td>
 <td></td>
 <td>TOTAL=RS.<%=sum %></td>
 </tr>
 <tr>
  </table>
</div>
</div>
<%
Statement s2=con1.createStatement();
ResultSet rs1=s2.executeQuery("select * from users where user_name='"+user+"';");
while(rs1.next() && sum>0.0)
{
%>
<div class="row">
        <div class="col-md-9">&nbsp;</div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="billAddress.jsp?user_id=<%=rs1.getInt(1) %>" class="btn btn-primary" role="button">PROCEED TO CHECKOUT</a>
        </div>
        <%
}
        %>
</div>
        

<div class="col-md-3">&nbsp;</div>
    <!-- /.row -->
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
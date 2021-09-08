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
double sum=0.0;
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
		  int user_id=Integer.parseInt(request.getParameter("user_id"));
		  int pay=Integer.parseInt(request.getParameter("pay"));
		  int bill_id=Integer.parseInt(request.getParameter("bill_id"));
		  Connection con;
		  DBConfig dbcon=new DBConfig();
		  con=dbcon.getConnection();
		  Statement s=con.createStatement();
		  s.executeUpdate("delete from cart where user_id="+user_id);
		  ResultSet rs=s.executeQuery("select * from current_order where current_user_id="+user_id);
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
<h1 class="text-center pt-5 text-warning">THANK YOU FOR SHOPPING WITH US!!</h1>
<hr class="w-250 mx-auto">
<h2 class="text-center pt-5 text-dark">ORDER SUMMARY</h2>
<hr class="w-25 mx-auto">
<div class="container-fluid" style="border:1px solid black;width:75%;height:75%; padding-left:25px;padding-bottom:5px;padding-top:5px;margin-bottom:10px;border-radius:15px">
<h4>ORDERS</h4>                
<%
while(rs.next())
{
%>
<div class="row">
<div class="col-md-6">
&nbsp;&nbsp;&nbsp;<strong>ORDER ID:</strong>#<%=rs.getInt(1) %><br>
&nbsp;&nbsp;&nbsp;<strong>ORDER NAME:</strong><%=rs.getString(4) %><br>
&nbsp;&nbsp;&nbsp;<strong>ORDER AMOUNT:</strong><%=rs.getFloat(3) %><br>
<%
sum+=rs.getFloat(3);
%>
&nbsp;&nbsp;&nbsp;<strong>ORDER DATE:</strong><%=rs.getString(2) %><br>
<br><br>
</div>
</div>
<%
}
%>
<strong>TOTAL AMOUNT=</strong>RS.<%=sum %>
<div class="row">
<div class="col-md-6">
<h4>PAYMENT INFORMATION</h4>
<%
if(pay==1)
{
%>
<strong>PAYMENT METHOD:</strong>DEBIT/CREDIT CARD
<%
}
if(pay==2)
{
%>
<strong>PAYMENT METHOD:</strong>CASH ON DELIVERY(COD)
<%
}
%>
</div>
<div class="col-md-6">
<h4>BILLING INFORMATION</h4>
<%
ResultSet rs1=s.executeQuery("select * from bill where bill_id="+bill_id);
while(rs1.next())
{
%>
<%=rs1.getString(2) %>
<%
}
%>
</div>
</div>
</div>
</div>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
</div>
<div class="col-md-3"><a href="index.jsp" class="btn btn-primary" role="button" style="width:250px">CONTINUE SHOPPING</a></div>
</div>
<div class="row">
                <div class="col-md-12">&nbsp;</div>
            </div>
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


<%
s.executeUpdate("delete from current_order where current_user_id="+user_id);
%>
</body>
</html>
</body>
</html>
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
int i=1;
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
		  Connection con;
		  DBConfig dbcon=new DBConfig();
		  con=dbcon.getConnection();
		  Statement s=con.createStatement();
		  ResultSet rs=s.executeQuery("select * from bill where user_id="+user_id);
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
                <div class="col-md-3 font-weight-bold">PREFERED ADDRESSES<br>
                <%
	                while(rs.next())
	                {
	                %>
	                <%=i%>).&nbsp;<a href="paymentModeSelect.jsp?bill_id=<%=rs.getInt(1)%>"><%=rs.getString(2)%></a>
	                <br><br><br>
	                <% 
	                i++;
	                }
	                %>
	                </div>
                <div class="col-md-6">
                    <form class="form" action="bill" method="post">
                     
                            
                            <input style="display:none;" class="form-control" type="text" name="user_id" value="<%=user_id %>"/>
                      
                                <div class="form-group">
                            <label for="address_line_1">ADDRESS LINE 1</label>
                            <input class="form-control" type="text" name="address_line_1"/>
                        </div>
					  <div class="form-group">
					  <label for="address_line_2">ADDRESS LINE 2</label>
					  <input class="form-control" type="text" name="address_line_2"/>
					</div>
                        <div class="form-group">
                            <label for="district">DISTRICT</label>
                            <input class="form-control" type="text" name="district"/>
                        </div>
                        <div class="form-group">
                            <label for="state">STATE</label>
                            <input class="form-control" type="text" name="state"/>
                        </div>
                        <div class="form-group">
                            <label for="pincode">PINCODE</label>
                            <input class="form-control" type="number" name="pincode"/>
                        </div>
                        <div class="form-group">                    
                            <input class="form-control btn-primary btn-lg" type="submit" value="ADD ADDRESS"/>
                        </div>
                        <div class="form-group">                    
                            &nbsp;
                        </div>
                        </form>
                        </div>
                        <div class="col-md-3"></div>
                        <div class="row">
                <div class="col-md-12">&nbsp;</div>

            </div>
                        
                        </div>
                        </div>
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
                        
                        
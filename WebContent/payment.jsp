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
		  int bill_id=Integer.parseInt(request.getParameter("bill_id"));
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
<h1 class="text-center pt-5 text-dark">DEBIT/CREDIT CARD</h1>
<hr class="w-25 mx-auto">
                <div class="row">
                <div class="col-md-12">&nbsp;</div>
                </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form class="form" action="pay" method="post">
                                <div class="form-group">
                            <label for="name_on_card">NAME ON CARD</label>
                            <input class="form-control" type="text" name="name_on_card" id="name"/>
                            <span class="text-danger font-weight-bold" id="holder"></span>
                        </div>
					  <div class="form-group">
					  <label for="card_number">CARD NUMBER</label>
					  <input class="form-control" type="password" name="card_number" id="cnum"/>
					        <span class="text-danger font-weight-bold" id="cno"></span>
                      </div>
                        <div class="form-group">
                            <label for="card_expiry">CARD EXPIRY</label>
                            <input class="form-control" type="date" name="card_expiry" id="expiry"/>
                            <span class="text-danger font-weight-bold" id="exp"></span>
                        </div>
                        <div class="form-group">
                            <label for="cvv">CVV</label>
                            <input class="form-control" type="password" name="cvv" id="pass"/>
                            <span class="text-danger font-weight-bold" id="cvvpass"></span>
                        </div>
                                             
                            &nbsp;<a href="index.jsp" class="btn btn-danger" role="button" style="width:265px">CANCEL</a>&nbsp;<a href="currentOrderController.jsp?bill_id=<%=bill_id %>&&pay=<%=1%>" class="btn btn-primary" onclick="return validation();" role="button" style="width:265px">PLACE YOUR ORDER</a>
                        </form>       
                </div>               
                <script>
                function validation(){
                	var name=document.getElementById('name').value;
                	var correct_name=/^[A-Za-z]+$/;
                	var cnum=document.getElementById('cnum').value;
                	var correct_number=/^[0-9]+$/;
                	var expiry=document.getElementById('expiry').value;
                	var pass=document.getElementById('pass').value;
                	if(name=="")
                		{
                		document.getElementById('holder').innerHTML="PLEASE FILL THE NAME";
                		return false;
                		}
                	if(!name.match(correct_name))
                	    {
                		document.getElementById('holder').innerHTML="ONLY ALPHABETS ARE ALLOWED";
                		return false;
                        }
                	if(name.length<4 && name.length>10)
                		{
                		document.getElementById('holder').innerHTML="NAME SHOULD BE BETWEEN 4 TO 10 ALPHABETS";
                		return false;
                        }
                	
                	if(cnum=="")
                		{
                		document.getElementById('cno').innerHTML="PLEASE FILL THE CARD NUMBER";
                		return false;
                		}
                	if(!cnum.match(correct_number))
                		{
                		document.getElementById('cno').innerHTML="ONLY DIGITS ARE ALLOWED";
                		return false;
                		}
                	if(cnum.length!=16)
                		{
                		document.getElementById('cno').innerHTML="CARD NUMBER SHOULD BE OF 16 DIGITS";
                		return false;
                		}
                	if(expiry=="")
                		{
                		document.getElementById('exp').innerHTML="PLEASE FILL THE CARD EXPIRY DATE";
                		return false;
                  		}
                	if(pass=="")
                		{
                		document.getElementById('cvvpass').innerHTML="PLEASE FILL THE CVV NUMBER OF THE CARD";
                		return false;
                		}
                	if(!pass.match(correct_number))
            		{
            		document.getElementById('cvvpass').innerHTML="ONLY DIGITS ARE ALLOWED";
            		return false;
            		}
                	if(pass.length!=3)
                		{
                		document.getElementById('cvvpass').innerHTML="CVV NUMBER SHOULD BE OF 3 DIGITS";
                		return false;
                		}
                }
                
                
                </script>
                
                
                
                
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
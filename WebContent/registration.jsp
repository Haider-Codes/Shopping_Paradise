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
		  int flag=Integer.parseInt(request.getParameter("flag"));
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
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form name="forms" class="form" action="register" method="post" onsubmit="return validation();">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input class="form-control" type="text" name="username" id="user"/>
                            <span id="username" class="text-danger font-weight-bold"></span>
                        </div>
                        <div class="form-group">
                            <label for="email">Email ID</label>
                            <input class="form-control" type="text" name="email" id="email"/>
                            <span id="emails" class="text-danger font-weight-bold"></span>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input class="form-control" type="password" name="password" id="pass"/>
                            <span id="password" class="text-danger font-weight-bold"></span>
                        </div>
                        <div class="form-group">
                            <label for="phno">Phone Number</label>
                            <input class="form-control" type="text" name="phno" id="phoneno"/>
                            <span id="phone" class="text-danger font-weight-bold"></span>
                        </div>
                        <div class="form-group">
                            <label for="gender">Gender</label>
                            <input class="radio-inline" type="radio" name="gender" value="Male"/> Male
                            <input class="radio-inline" type="radio" name="gender" value="Female"/>Female
                            <span id="genders" class="text-danger font-weight-bold"></span>
                        </div>
                        <div class="form-group">                    
                            <input  id="1" class="form-control btn-primary btn-lg" type="submit" value="Register"/>
                        </div>
                        
                        <% if(flag==1)
                        	  {
                        	  %>   
                            <div class="alert alert-success">
  							<strong>Registration Successfull!</strong>
							</div>
                           <%
                        	  }
                           %> 
                         <div class="form-group">                    
                            Already Registered? <a href="login.jsp">Login Here</a>
                        </div>
                    </form>
                    <script type="text/javascript">
                    function validation(){
                    	var correct=/^[A-Za-z]+$/;
                    	var correct_way=/^[0-9]+$/;
                    	var user=document.getElementById('user').value;
                    	var email=document.getElementById('email').value;
                    	var pass=document.getElementById('pass').value;
                    	var phoneno=document.getElementById('phoneno').value;
                    	var a=document.forms.gender;
                    	if(user=="")
                		{
                		document.getElementById('username').innerHTML="PLEASE FILL THE USERNAME";
                		return false;
                		}
                	if(!user.match(correct))
                	{
                		document.getElementById('username').innerHTML="USERNAME SHOULD ONLY HAVE ALPAHABETS";	
                		return false;
                	}
                	if(user.length<3 || user.length>20)
                		{
                		document.getElementById('username').innerHTML="USERNAME SHOULD BE BETWEEN 3 AND 20";
                		return false;
                		}
                	
                	if(email=="")
            		{
            		document.getElementById('emails').innerHTML="PLEASE FILL THE EMAIL";
            		return false;
            		}
            		if(email.indexOf('@')==0)
            			{
                		document.getElementById('emails').innerHTML="@ CANNOT COME AT THAT POSITION IN EMAIL";
                		return false;
            			}
                	if(email.charAt((email.length-4))!='.' && email.charAt((email.length-3))!='.')
                		{
                		document.getElementById('emails').innerHTML="INVALID EMAIL";
                		return false;	
                		}
                	if(pass=="")
            		{
            		document.getElementById('password').innerHTML="PLEASE FILL THE PASSWORD";
            		return false;
            		}
            		if(pass.length<3 && pass.length>8)
            			{
            			document.getElementById('password').innerHTML="PASSWORD LENGTH SHOULD BE BETWEEN 3 AN 8";
                		return false;
            			}
            		if(phoneno=="")
            		{
            		document.getElementById('phone').innerHTML="PLEASE FILL THE PHONE NUMBER";
            		return false;
            		}
            		if(!phoneno.match(correct_way))
        			{
        			document.getElementById('phone').innerHTML="THIS FIELD SHOULD CONTAIN ONLY DIGITS";
            		return false;
            		}
        		
            		if(phoneno.length!=10)
            			{
            			document.getElementById('phone').innerHTML="PHONE NUMBER SHOULD BE OF 10 DIGITS";
                		return false;
                		}
            		if(phoneno.charAt(0)!='9' && phoneno.charAt(0)!='8' && phoneno.charAt(0)!='7')
            			{
            			document.getElementById('phone').innerHTML="PHONE NUMBER SHOULD STARTS WITH 9,8 OR 7";
                		return false;
                		}
                    	for(var i=0;i<a.length;i++)
                    		{
                    		if(a[i].checked)
                    			return true;
                    		}
                    document.getElementById('genders').innerHTML="PLEASE SELECT ANY ONE";
                    return false;
                    }
                    
                    
                    
                    
                    
 
                    </script>
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

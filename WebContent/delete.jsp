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
		  text="<li class='nav-item'><a class='nav-link' href='#'>Welcome, "+user+"</a></li><li class='nav-item'><a class='nav-link' href='logout.jsp'>Logout</a></li>";
	  }
}
Connection con;
DBConfig dbcon=new DBConfig();
con=dbcon.getConnection();
Statement s=con.createStatement();
int c=Integer.parseInt(request.getParameter("id"));
s.executeUpdate("delete from category where category_id="+c);
response.sendRedirect("category.jsp?cat=0");
%>
  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="java.sql.*,com.Database.Shop.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WELCOME TO SHOPPING PARADISE</title>
</head>
<body>
<%
int quantity,user_id,product_id,c=0;
user_id=Integer.parseInt(request.getParameter("user_id"));
product_id=Integer.parseInt(request.getParameter("product_id"));
quantity=Integer.parseInt(request.getParameter("quantity"));
DBConfig dbcon=new DBConfig();
Connection con=dbcon.getConnection();
try 
{
	Statement s=con.createStatement();
		c=s.executeUpdate("update cart set quantity="+quantity+"where user_id="+user_id+"and product_id="+product_id);
		if(c>0)
			response.sendRedirect("cart.jsp");
	}
catch(Exception e)
{
	e.printStackTrace();
}



%>
</body>
</html>
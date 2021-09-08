<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 import="java.sql.*,java.util.Date,com.Database.Shop.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WELCOME TO SHOPPING PARADISE</title>
</head>
<body>
<%
int user_id,pay;
String product_name="",product_image="";
float amount=0.0f;
int bill_id=Integer.parseInt(request.getParameter("bill_id"));
Date date=new Date();
String dat=date.toString();
pay=Integer.parseInt(request.getParameter("pay"));
Connection con;
DBConfig dbcon=new DBConfig();
con=dbcon.getConnection();
try
{
Statement s=con.createStatement();
ResultSet rs=s.executeQuery("select * from bill where bill_id="+bill_id);
while(rs.next())
{
	user_id=rs.getInt(3);
	ResultSet rs1=s.executeQuery("select * from cart where user_id="+user_id);
	while(rs1.next())
	{
		amount=rs1.getFloat(4);
		product_name=rs1.getString(2);
		product_image=rs1.getString(5);
		Statement s1=con.createStatement();
		s1.executeUpdate("insert into orders(order_dt,order_amount,product_name,user_id) values ('"+dat+"',"+amount+",'"+product_name+"',"+user_id+");"); 
		}
	response.sendRedirect("orderInvoice.jsp?user_id="+user_id+"&&pay="+pay+"&&bill_id="+bill_id);
}

	}
catch(Exception e)
{
	e.getMessage();
}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  import="java.sql.*,com.Database.Shop.*"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WELCOME TO SHOPPING PARADISE</title>
</head>
<body>
<%
String product_name,image,user;
Float amount;
int quantity,user_id,c=0;
user=request.getParameter("user_name");
int product_id=Integer.parseInt(request.getParameter("product_id"));
Connection con1;
DBConfig dbcon1=new DBConfig();
con1=dbcon1.getConnection();
try{
Statement s1=con1.createStatement();
ResultSet rs1=s1.executeQuery("select * from Users where user_name='"+user+"';");
while(rs1.next())
{
	user_id=rs1.getInt(1);
ResultSet rs2=s1.executeQuery("select * from Product where product_id="+product_id);
while(rs2.next())
{
image=rs2.getString(7);
product_name=rs2.getString(2);
amount=rs2.getFloat(4);
quantity=1;
c=s1.executeUpdate("insert into cart values("+product_id+",'"+product_name+"',"+quantity+","+amount+",'"+image+"',"+user_id+");");
if(c>0)
	response.sendRedirect("index1.jsp?flag=1");
}
}
}
catch(Exception e)
{
	e.getMessage();
}
%>
</body>
</html>
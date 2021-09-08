<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*,com.Database.Shop.*"
    pageEncoding="ISO-8859-1"%>
<%  Connection con;
		  DBConfig dbcon=new DBConfig();
		  con=dbcon.getConnection();
		  Statement s=con.createStatement();
		  ResultSet rs=s.executeQuery("select * from category");
 while(rs.next())
        	{
        	%>
          <a href="categories.jsp?cid=<%=rs.getInt(1) %>" class="list-group-item"><%=rs.getString(2) %></a>
          <%
        	}
          %>
        
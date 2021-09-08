<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Cookie ck[]=request.getCookies();
		  for(Cookie c:ck)
		  {
			if(c.getName().equals("user"))
			{
			c.setMaxAge(0);
			response.addCookie(c);
			response.sendRedirect("index.jsp");
			}
		  }
%>
			
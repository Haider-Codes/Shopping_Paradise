package com.Main.Shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Database.Shop.DBConfig;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	String email,password,role;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		email=request.getParameter("email");
		password=request.getParameter("password");
		DBConfig mydbcon=new DBConfig();
		con=mydbcon.getConnection();
		try
		{
			ps=con.prepareStatement("select * from users where email=? and passwd=?");
			ps.setString(1, email);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Cookie cookie=new Cookie("user",rs.getString("user_name"));
				cookie.setMaxAge(24*1*60*60);
				response.addCookie(cookie);
				
				role=rs.getString("role");
				if(role.equalsIgnoreCase("admin"))
				{
					response.sendRedirect("admin.jsp");
				}
				else
				{
					response.sendRedirect("index.jsp");
				}
			}
			else
			{
				response.sendRedirect("login.jsp?test=0");
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			
		}
		}

}

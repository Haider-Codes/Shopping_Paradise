package com.User.Shop;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Database.Shop.DBConfig;

public class UserRegistration extends HttpServlet {
	String username;
	String email;
	String phno;
	String password;
	String gender;
	Connection con;
	PreparedStatement ps;
    private static final long serialVersionUID = 1L;
       
    public UserRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		username=request.getParameter("username");
		email=request.getParameter("email");
		phno=request.getParameter("phno");
		password=request.getParameter("password");
	    gender=request.getParameter("gender");
		DBConfig db=new DBConfig();
		con=db.getConnection();
		try {
			ps=con.prepareStatement("insert into users(user_name,email,phone,passwd,gender,role) values(?,?,?,?,?,?)");
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setString(3, phno);
			ps.setString(4, password);
			ps.setString(5, gender);
			ps.setString(6, "CUSTOMER");
			ps.executeUpdate();			
			//RequestDispatcher rd=getServletContext().getRequestDispatcher("/register.jsp");
			//String remsg="Registration SuccessFull!!";
			//request.setAttribute("remsg",remsg);
			//rd.forward(request, response);
			response.sendRedirect("registration.jsp?flag=1");
		}
		catch(Exception e)
		{
			//RequestDispatcher rd=getServletContext().getRequestDispatcher("/register.jsp");
			//String remsg="Registration SuccessFull!!";
			//request.setAttribute("remsg",remsg);
			//rd.forward(request, response);
	
		e.printStackTrace();	
		}
	}

}

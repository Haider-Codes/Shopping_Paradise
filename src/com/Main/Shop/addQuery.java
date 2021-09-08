package com.Main.Shop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Database.Shop.DBConfig;

/**
 * Servlet implementation class addQuery
 */
@WebServlet("/addQuery")
public class addQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int c=0;
		String user_name=request.getParameter("user_name");
		String email=request.getParameter("email_address");
		String query=request.getParameter("query");
		Connection con;
		DBConfig dbcon=new DBConfig();;
		con=dbcon.getConnection();
		try
		{
		Statement s=con.createStatement();
		c=s.executeUpdate("insert into query values('"+user_name+"','"+email+"','"+query+"');");
		if(c>0)
		response.sendRedirect("contact.jsp");
	    }
catch(Exception e)
		{
	      e.getMessage();
		}
}
}
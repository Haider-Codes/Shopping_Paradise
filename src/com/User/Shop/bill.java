package com.User.Shop;

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
 * Servlet implementation class bill
 */
@WebServlet("/bill")
public class bill extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bill() {
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
		int c=0,user_id;
		String address="";
		user_id=Integer.parseInt(request.getParameter("user_id"));
		address+=request.getParameter("address_line_1")+","+request.getParameter("address_line_2")+","+request.getParameter("district")+","+request.getParameter("state")+"-"+request.getParameter("pincode");
		Connection con;
		DBConfig dbcon=new DBConfig();
		con=dbcon.getConnection();
		try
		{
		Statement s=con.createStatement();
		c=s.executeUpdate("insert into bill(address,user_id) values('"+address+"',"+user_id+");");
		
		if(c>0)
			response.sendRedirect("billAddress.jsp?user_id="+user_id);
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}

}
}
package com.Admin.Shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Database.Shop.DBConfig;
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String category_name;
	Connection con;
    Statement s;
    int c=0;
    public AddCategory() {
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
	category_name=request.getParameter("category_name");
    DBConfig dbcon=new DBConfig();
    con=dbcon.getConnection();
    try
    {
    s=con.createStatement();
    String query="insert into category(category_name) values('"+category_name+"')";
    c=s.executeUpdate(query);
    if(c>0)
    	out.println("<div class=\'alert alert-success\'>\r\n" + 
    			"    <strong>Success!</strong> This alert box could indicate a successful or positive action.\r\n" + 
    			"  </div>");
    con.close();
    response.sendRedirect("category.jsp?cat=1");
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
	}

}

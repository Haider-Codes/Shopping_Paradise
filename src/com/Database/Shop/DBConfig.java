package com.Database.Shop;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
Connection con;
public Connection getConnection()
{
	try
	{
		Class.forName("org.h2.Driver");
		con=DriverManager.getConnection("jdbc:h2:tcp://localhost/~/ecommerce","sa","123");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return con;
}
}

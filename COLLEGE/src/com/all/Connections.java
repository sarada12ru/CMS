package com.all;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Connections 
{
	public Connection cn ;
	public void conn() throws SQLException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3333/college","root","prasad");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
	}
}
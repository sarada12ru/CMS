package com.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import oracle.jdbc.OracleDriver;

public class Connections 
{
	public Connection cn ;
	OracleDriver dr;
	public void conn() throws SQLException
	{
		dr = new OracleDriver();
		cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","college","prasad");
	}
}
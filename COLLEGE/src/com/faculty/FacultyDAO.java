package com.faculty;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.admin.Connections;

public class FacultyDAO 
{
	int ret;
	Connections conn;
	PreparedStatement pst;
	ResultSet rs;
	public ResultSet login(String username, String password) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from FACULTY where username = ? and password = ?");
		pst.setString(1,username);
		pst.setString(2,password);
		rs = pst.executeQuery();
		return rs;	
	}
	public ResultSet getDetails(String empid) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst =  conn.cn.prepareStatement("select * from faculty where empid = ?");
		pst.setString(1, empid);
		rs = pst.executeQuery();
		return rs;
	}
	public ResultSet getNotice() throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from notice");
		rs = pst.executeQuery();
		return rs;
	}
	public ResultSet getNotice(String empid) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from faculty where empid = ?");
		pst.setString(1, empid);
		rs = pst.executeQuery();
		return rs;
	}
	public ResultSet getAttendance(String empid) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from faculty_attendance where id = ?");
		pst.setString(1, empid);
		rs = pst.executeQuery();
		return rs;
	}
}

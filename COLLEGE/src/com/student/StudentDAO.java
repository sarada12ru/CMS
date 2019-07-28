package com.student;

import java.sql.PreparedStatement;
import com.all.*;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO 
{
	int ret;
	Connections conn;
	PreparedStatement pst;
	ResultSet rs;
	public ResultSet login(String username, String password) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from STUDENT where SERIAL = ? and password = ?");
		pst.setString(1,username);
		pst.setString(2,password);
		rs = pst.executeQuery();
		return rs;	
	}
	public ResultSet getStudent(String serial) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from STUDENT where SERIAL = ?");
		pst.setString(1, serial);
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
	public ResultSet getAttendanceStudent(String serial,String semester) throws SQLException
	{
		conn =  new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from student_attendance where serial = ? and semester=?");
		pst.setString(1, serial);
		pst.setString(2,semester);
		rs = pst.executeQuery();
		return rs; 
	}
}

package com.attendance;

import java.sql.*;
import com.all.*;


public class AttendanceDAO 
{
	ResultSet rs;
	Connections conn;
	int ret;
	PreparedStatement pst;
	public ResultSet login(String username, String password) throws SQLException 
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from ADMIN where username = ? and password = ?");
		pst.setString(1,username);
		pst.setString(2,password);
		rs = pst.executeQuery();
		return rs;	
	}
	public ResultSet getStudent(String course,String semester) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from STUDENT where course =?  and semester = ?");
		pst.setString(1, course);
		pst.setString(2,semester);
		rs = pst.executeQuery();
		return rs;
	}
	public int SendAttendanceStudent(String serial, String date1, String semester ,String status) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("insert into student_attendance (serial ,date1, status,semester) values(?,?,?,?)");
		pst.setString(1,serial);
		pst.setString(2, date1);
		pst.setString(3, status);
		pst.setString(4, semester);
		ret = pst.executeUpdate();
		return ret;
	}
	public int SendAttendanceFaculty(String empid, String date1, String status) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("insert into faculty_attendance (id ,date1, status) values(?,?,?)");
		pst.setString(1, empid);
		pst.setString(2, date1);
		pst.setString(3, status);
		ret = pst.executeUpdate();
		return ret;
	}
	public ResultSet getFaculty() throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from faculty where status = ?");
		pst.setString(1, "APPOINTED");
		rs = pst.executeQuery();
		return rs;
	}
	public ResultSet getFacultyAttendance() throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from faculty_attendance");
		rs = pst.executeQuery();
		return rs;
	}
	public ResultSet getFacultyAttendance(String empid) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from faculty_attendance where id = ?");
		pst.setString(1, empid);
		rs = pst.executeQuery();
		return rs;
	}
	
}

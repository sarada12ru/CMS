package com.admin;

import com.all.*;
import java.sql.*;

public class AdminDAO 
{
	static int ret;
	int total;
	Connections conn;
	PreparedStatement pst;
	ResultSet rs;
	String semester;
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
	public int registerStudent(String serial,String name,String fname,String gender,String dob,String course,String session1,String email,String mobile,String address,int percentage_10th,int percentage_12th,String password) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("INSERT INTO STUDENT (SERIAL,NAME,FNAME,GENDER,DOB,COURSE,SESSION1,EMAIL,MOBILE,ADDRESS,PERCENTAGE_10TH,PERCENTAGE_12TH,PASSWORD,SEMESTER) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pst.setString(1, serial);
		pst.setString(2, name);
		pst.setString(3, fname);
		pst.setString(4, gender);
		pst.setString(5, dob);
		pst.setString(6, course);
		pst.setString(7, session1);
		pst.setString(8, email);
		pst.setString(9, mobile);
		pst.setString(10, address);
		pst.setInt(11, percentage_10th);
		pst.setInt(12, percentage_12th);
		pst.setString(13, password);
		pst.setString(14, "FIRST");
		ret = pst.executeUpdate();
		return ret;
	}
	public ResultSet getStudent() throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from STUDENT");
		rs = pst.executeQuery();
		return rs;
	}
	public ResultSet getStudent(String course,String session1) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from STUDENT where course = ? and session1 = ?");
		pst.setString(1, course);
		pst.setString(2,session1);
		rs = pst.executeQuery();
		return rs;
	}
	public ResultSet getStudent(String serial) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from STUDENT where serial = ?");
		pst.setString(1, serial);
		rs = pst.executeQuery();
		return rs;
	}
	public int updateSemester(String course, String session1) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		rs = getStudent(course,session1);
		pst = conn.cn.prepareStatement("update STUDENT set SEMESTER = ? where course=? and session1 = ?");
		pst.setString(2, course);
		pst.setString(3, session1);
		if(rs.next())
		{
			semester = rs.getString("semester");
			if(semester.equals("FIRST"))
			{
				pst.setString(1, "SECOND");
				ret = pst.executeUpdate();
			}
			else if(semester.equals("SECOND"))
			{
				pst.setString(1, "THIRD");
				ret = pst.executeUpdate();
			}
			else if(semester.equals("THIRD"))
			{
				pst.setString(1, "FOURTH");
				ret = pst.executeUpdate();
			}
			else if(semester.equals("FOURTH"))
			{
				pst.setString(1, "FIFTH");
				ret = pst.executeUpdate();
			}
			else if(semester.equals("FIFTH"))
			{
				pst.setString(1, "SIXTH");
				ret = pst.executeUpdate();
			}
			else if(semester.equals("SIXTH"))
			{
				pst.setString(1, "PASSED OUT");
				ret = pst.executeUpdate();
			}
		}
		return ret;
	}
	public ResultSet getFaculty() throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from faculty");
		rs = pst.executeQuery();
		return rs;
	}
	public ResultSet getFacultyStatus() throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from faculty where status = ?");
		pst.setString(1, "APPOINTED");
		rs = pst.executeQuery();
		return rs;
	}
	public ResultSet getFaculty(String empid) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("select * from faculty where EMPID=?");
		pst.setString(1,empid);
		rs = pst.executeQuery();
		return rs;
	}
	public int registerFaculty(String name, String fname,String dob,String dept,String joiningdate,String experience,String username,String empid,String password) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("insert into FACULTY(USERNAME,PASSWORD,NAME,FNAME,DEPT,DOB,EMPID,JOININGDATE,EXPERIENCE,STATUS) VALUES (?,?,?,?,?,?,?,?,?,?)");
		pst.setString(1, username);
		pst.setString(2, password);
		pst.setString(3, name);
		pst.setString(4, fname);
		pst.setString(5, dept);
		pst.setString(6, dob);
		pst.setString(7, empid);
		pst.setString(8, joiningdate);
		pst.setString(9, experience);
		pst.setString(10, "APPOINTED");
		ret = pst.executeUpdate();
		return ret;
	}
	public int updateFaculty(String empid,String status) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("update FACULTY set STATUS = ? where EMPID = ?");
		pst.setString(1, status);
		pst.setString(2, empid);
		ret = pst.executeUpdate();
		return ret;
	}
	public int SendNotice(String notice) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("insert into notice (notice)  values(?)");
		pst.setString(1,notice);
		ret = pst.executeUpdate();
		return ret;
	}
	public int SendNotice(String notice,String empid) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("update faculty set notice = ? where empid=?");
		pst.setString(1,notice);
		pst.setString(2,empid);
		ret = pst.executeUpdate();
		return ret;
	}
	public int SendNotice(String notice,String serial, String course) throws SQLException
	{
		conn = new Connections();
		conn.conn();
		pst = conn.cn.prepareStatement("update student set notice = ? where serial = ? and course = ?");
		pst.setString(1,notice);
		pst.setString(2, serial);
		pst.setString(3,course);
		ret = pst.executeUpdate();
		return ret;
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



package com.admin;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterStudent extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public RegisterStudent() 
    {
        super();
    }
    ResultSet rs;
    int row,ret,percentage_10th,percentage_12th;
    String serial,name,fname,gender,dob,course,session1,email,mobile,address,password;
    AdminDAO dao;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		name = request.getParameter("name");
		fname = request.getParameter("fname");
		gender = request.getParameter("gender");
		dob = request.getParameter("dob");
		course = request.getParameter("course");
		session1 = request.getParameter("session");
		email = request.getParameter("email");
		mobile = request.getParameter("mobile");
		address = request.getParameter("address");
		percentage_10th = Integer.parseInt(request.getParameter("percentage_10th"));
		percentage_12th = Integer.parseInt(request.getParameter("percentage_12th"));
		dao = new AdminDAO();
		password = course+name.substring(0, 4)+percentage_10th;
 		try 
		{
			serial = name.substring(0,5)+percentage_12th+course ;
			ret = dao.registerStudent(serial, name, fname, gender, dob, course, session1, email, mobile, address, percentage_10th, percentage_12th, password);
			if(ret >0)
			{
				response.sendRedirect("admin/RegisterStudent.jsp?serial="+serial+"&password="+password);
			}
			else
			{
				response.sendRedirect("admin/RegisterStudent.jsp?msg=error");
			}
		}
		catch (SQLException e)
		{	
			e.printStackTrace();
		}
		
	}

}

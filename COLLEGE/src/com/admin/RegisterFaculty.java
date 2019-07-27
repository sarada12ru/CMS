package com.admin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterFaculty extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
      
    public RegisterFaculty() 
    {
        super();
    }
    String name,fname,dept,dob,joining_date,experience,username,empid,password;
    int ret,row,year;
    AdminDAO dao ;
    ResultSet rs;
    Date date;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		name = request.getParameter("name");
		fname = request.getParameter("fname");
		dept = request.getParameter("dept");
		dob = request.getParameter("dob");
		joining_date =  request.getParameter("joining_date");
		experience = request.getParameter("experience");
		dao = new AdminDAO();
		date = new Date();
		year = date.getYear();
		try 
		{
			rs = dao.getFaculty();
			row = rs.getRow();
			row = row+1;
			empid = dept+"/"+year+"/0"+row;
			username = empid;
			password = name.substring(0,5)+year+row;
			ret = dao.registerFaculty(name, fname, dob, dept, joining_date, experience, username, empid, password);
			if(ret >0)
			{
				response.sendRedirect("admin/RegisterFaculty.jsp?empid="+empid+"&password="+password);
			}
			else
			{
				response.sendRedirect("admin/RegisterFaculty.jsp?msg=Registration Failed");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
	}

}

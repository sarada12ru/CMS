package com.attendance;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SendAttendanceFaculty extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public SendAttendanceFaculty() 
    {
        super();
    }
    String empid,status,date1;
    AttendanceDAO dao;
    int ret;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
    	dao = new AttendanceDAO();
		empid = request.getParameter("empid");
		status = request.getParameter("status");
		date1 = request.getParameter("date");
		try 
		{
			ret = dao.SendAttendanceFaculty(empid, date1, status);
			if(ret > 0)
			{
				response.sendRedirect("attendance/FacultyAttendance.jsp");
			}
			else
			{
				response.sendRedirect("attendance/FacultyAttendance.jsp");
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

}

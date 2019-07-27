package com.attendance;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AttendanceLogin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public AttendanceLogin() 
    {
        super();
    }
    String username,password;
    ResultSet rs;
    AttendanceDAO dao = new AttendanceDAO();
    HttpSession session;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		session = request.getSession();
		username = request.getParameter("username");
		password = request.getParameter("password");
		try 
		{
			rs = dao.login(username, password);
			if(rs.next())
			{
				session.setAttribute("username", "username");
				response.sendRedirect("attendance/StudentAttendance.jsp");
			}
			else
			{
				response.sendRedirect("attendance/index.jsp?msg=error");
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}

}

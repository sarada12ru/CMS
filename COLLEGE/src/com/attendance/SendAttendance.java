package com.attendance;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public SendAttendance() 
    {
        super();   
    }
    
    String serial, status,course,semester;
    String date1;
    AttendanceDAO dao ;
    int ret ;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		date1 = request.getParameter("date1");
		serial = request.getParameter("serial");
		status = request.getParameter("status");
		course = request.getParameter("course");
		semester = request.getParameter("semester");
		dao = new AttendanceDAO();
		try 
		{
			ret = dao.SendAttendanceStudent(serial, date1, semester ,status);
			if(ret > 0)
			{
				response.sendRedirect("attendance/GetStudents.jsp?course="+course+"&semester="+semester);
			}
			else
			{
				response.sendRedirect("attendance/GetStudents.jsp?course="+course+"&semester="+semester+"&msg=error");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
	}

}

package com.admin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateSemester extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public UpdateSemester() 
    {
        super();
    }
    AdminDAO dao;
    int ret;
    String course,session1,semester;
    ResultSet rs;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		course = request.getParameter("course");
		session1 = request.getParameter("session");
		dao = new AdminDAO();
		try 
		{
			rs = dao.getStudent(course,session1);
			rs.next();
			semester = rs.getString("semester");
			if(semester.equals("PASSED OUT"))
			{
				response.sendRedirect("admin/UpdateSemester.jsp?msg=Passed Out Students Semester Cant be Updated");
			}
			else
			{
				ret = dao.updateSemester(course, session1);
				if(ret > 0)
				{
					response.sendRedirect("admin/UpdateSemester.jsp?msg=Successfully Updated");
				}
				else
				{
					response.sendRedirect("admin/UpdateSemester.jsp?msg=Updating failed");
				}
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

}

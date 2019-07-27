package com.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateFaculty extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
      
    public UpdateFaculty() 
    {
        super();
    }
    String empid,status;
    int ret;
    AdminDAO dao;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		empid = request.getParameter("empid");
		status = "RETIRED";
		dao = new AdminDAO();
		try
		{
			ret = dao.updateFaculty(empid, status);
			if(ret > 0)
			{
				response.sendRedirect("admin/UpdateFaculty.jsp?msg=Successfully Updated");
			}
			else
			{
				response.sendRedirect("admin/UpdateFaculty.jsp?msg=Updating Failed");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
	}

}

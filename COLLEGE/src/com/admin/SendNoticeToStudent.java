package com.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SendNoticeToStudent extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

    public SendNoticeToStudent() 
    {
        super();
    }

    String notice,serial,course;
    AdminDAO dao;
    int ret;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		serial = request.getParameter("serial");
		notice = request.getParameter("notice");
		course = request.getParameter("course");
		dao = new AdminDAO();
		try 
		{
			ret = dao.SendNotice(notice, serial, course);
			if(ret > 0)
			{
				response.sendRedirect("admin/NoticeToStudent.jsp?msg=Successfully Sent");
			}
			else
			{
				response.sendRedirect("admin/NoticeToStudent.jsp?msg=Failed");
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}

}

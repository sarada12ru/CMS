package com.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SendNoticeToFaculty extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public SendNoticeToFaculty() 
    {
        super();
    }
    String empid,notice;
    AdminDAO dao;
    int ret;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		empid = request.getParameter("empid");
		notice = request.getParameter("notice");
		dao = new AdminDAO();
		try 
		{
			ret = dao.SendNotice(notice, empid);
			if(ret > 0)
			{
				response.sendRedirect("admin/NoticeToFaculty.jsp?msg=Successfully Sent");
			}
			else
			{
				response.sendRedirect("admin/NoticeToFaculty.jsp?msg=Failed");
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
	}

}

package com.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SendNoticeToAll extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public SendNoticeToAll() 
    {
        super();
    }
    String notice;
    AdminDAO dao;
    int ret ;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		notice = request.getParameter("notice");
		dao = new AdminDAO();
		try 
		{
			ret = dao.SendNotice(notice);
			if(ret >  0)
			{
				response.sendRedirect("admin/NoticeToAll.jsp?msg=Sent Successfully");
			}
			else
			{
			response.sendRedirect("admin/NoticeToAll.jsp?msg=Sending Failed! Try Again Later !");
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

}

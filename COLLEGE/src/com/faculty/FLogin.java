package com.faculty;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FLogin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    public FLogin() 
    {
        super();    
    }
    FacultyDAO dao;
    String username,password;
    ResultSet rs;
    HttpSession session;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		session = request.getSession();
		dao = new FacultyDAO();
		username = request.getParameter("username");
		password = request.getParameter("password");
		try 
		{
			rs = dao.login(username, password);
			if(rs.next())
			{
				session.setAttribute("empid", username);
				response.sendRedirect("faculty/Profile.jsp");
			}
			else
			{
				response.sendRedirect("faculty/index.jsp?msg=error");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
	}

}

package com.admin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() 
    {
        super();
    }

    ResultSet rs;
    AdminDAO dao;
	String username, password;
	HttpSession session;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		username = request.getParameter("username");
		password = request.getParameter("password");
		dao = new AdminDAO();
		session = request.getSession();
		try 
		{
			rs = dao.login(username, password);
			if(rs.next())
			{
				session.setAttribute("username", rs.getString("username"));
				session.setAttribute("name", rs.getString("name"));
				response.sendRedirect("admin/RegisterStudent.jsp");
			}
			else
			{
				response.sendRedirect("admin/index.jsp?msg=invalid");
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}

}

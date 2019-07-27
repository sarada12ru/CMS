<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.admin.*" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<body>
	<%
	String course = request.getParameter("course");
	String session1 = request.getParameter("session");
	AdminDAO dao = new AdminDAO();
	ResultSet rs = dao.getStudent(course, session1);
	%>
	<label>Choose Student</label>
	<select name="serial" class="form-control" id="serial">
		<option>SELECT</option>
	<%
	while(rs.next())
	{%>
		<option value='<%=rs.getString("serial")%>'><%=rs.getString("serial")%> - <%=rs.getString("name")%></option>
	<%}
	%>
	</select>
	
</body>
</html>
<%@page import="java.sql.*" %>
<%@page import="com.student.*" %>
<!doctype html>
<html class="no-js" lang="">
<%
if(session.getAttribute("username") == null)
{
	response.sendRedirect("index.jsp");
}
else
{
	%>
	<head>
	    <jsp:include page="includes/header.jsp" />
	</head>
	<%
	String serial = session.getAttribute("username").toString();
	StudentDAO dao = new StudentDAO();
	ResultSet rs =  dao.getStudent(serial);
	rs.next();
	%>
	<body>
	    <jsp:include page="includes/nav.jsp" />
	    
	    <div class="realtime-statistic-area">
	        <div class="container">
	            <div class="row">
	            	<table>
	            	<tr>
	            		<th>SERIAL NO.</th>
	            		<td><%=rs.getString("serial") %></td>
	            		<th>NAME</th>
	            		<td><%=rs.getString("name") %></td>
	  				</tr>
	  				<tr>
	            		<th>GENDER</th>
	            		<td><%=rs.getString("gender") %></td>
	            		<th>D.O.B</th>
	            		<td><%=rs.getString("dob") %></td>
	  				</tr>
	  				<tr>
	            		<th>COURSE</th>
	            		<td><%=rs.getString("course") %></td>
	            		<th>SESSION</th>
	            		<td><%=rs.getString("session1") %></td>
	  				</tr>
	  				<tr>
	            		<th>EMAIL</th>
	            		<td><%=rs.getString("email") %></td>
	            		<th> MOBILE</th>
	            		<td><%=rs.getString("mobile") %></td>
	  				</tr>
	  				<tr>
	            		<th>FATHERS'S NAME</th>
	            		<td><%=rs.getString("fname") %></td>
	            		<th> ADDRESS</th>
	            		<td><%=rs.getString("address") %></td>
	  				</tr>
	            	</table>
	            	<%
	            	int row = 0;
	            	ResultSet rs1 = dao.getAttendanceStudent(serial, rs.getString("semester"));   
	            	while(rs1.next())
	            	{
	            		row = row + 1;
	            	}
	            	
	            	%>
	            	<br><br>
	            	<h3>Attendance Report For <%=rs.getString("semester") %> Semester</h3>
	            	<table>
	            	<tr>
	            		<th style="width:50%;text-align:center">Attendance</th>
	            		<td style="text-align:center"><%=row %></td>
	            	</tr>
	            	</table>
	            </div>
	        </div>
	    </div>
	   
	    <jsp:include page="includes/footer.jsp" />
	    
	</body>
	<%
}
%>
</html>
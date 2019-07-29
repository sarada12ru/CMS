<%@page import="java.sql.*" %>
<%@page import="com.faculty.*" %>
<!doctype html>
<html class="no-js" lang="">
<%
if(session.getAttribute("empid") == null)
{
	response.sendRedirect("index.jsp");
}
else
{%>
	<head>
    <jsp:include page="includes/header.jsp" />
</head>

<body>
    <jsp:include page="includes/nav.jsp" />
    
	    <!-- Start Realtime sts area-->
	    <div class="realtime-statistic-area">
	        <div class="container" style="padding-left:20%;padding-right:20%">
	            <div class="row">
	            <%
	            String empid=session.getAttribute("empid").toString();
	            FacultyDAO dao = new FacultyDAO();
	            ResultSet rs = dao.getDetails(empid);
	            rs.next();
	            %>
	            <table>
	            <caption><%=rs.getString("empid") %></caption>
	            	<tr>
	            		<th>NAME</th>
	            		<td><%=rs.getString("name") %></td>
	            	</tr>
	            	<tr>
	            		<th>FATHER'S NAME</th>
	            		<td><%=rs.getString("fname") %></td>
	            	</tr>
	            	<tr>
	            		<th>DEPARTMENT</th>
	            		<td><%=rs.getString("dept") %></td>
	            	</tr>
	            	<tr>
	            		<th>DOB</th>
	            		<td><%=rs.getString("dob") %></td>
	            	</tr>
	            	<tr>
	            		<th>JOINING DATE</th>
	            		<td><%=rs.getString("joiningdate") %></td>
	            	</tr>
	            	<tr>
	            		<th>STATUS</th>
	            		<td><%=rs.getString("status") %></td>
	            	</tr>
	            </table>
	            <%
	            	int row = 0;
	            	ResultSet rs1 = dao.getAttendance(empid);   
	            	while(rs1.next())
	            	{
	            		row = row + 1;
	            	}
	            	%>
	            	<br><br>
	            	<h3>Attendance Report</h3>
	            	<table>
	            	<tr>
	            		<th style="width:50%;text-align:center">Attendance</th>
	            		<td style="text-align:center"><%=row %></td>
	            	</tr>
	            	</table>
	            </div>
	        </div>
	    </div>
	    <!-- End Realtime sts area-->
	    
	    <jsp:include page="includes/footer.jsp" />
	</body>
<%}
%>
</html>
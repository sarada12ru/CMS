<%@page import="com.attendance.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.all.*" %>
<html>
<head>
    <jsp:include page="includes/header.jsp" />
    			<%
            	if(session.getAttribute("name")==null && session.getAttribute("serial") == null)
            	{
            		response.sendRedirect("index.jsp");
            	}
            	%>
</head>

<body>
    <jsp:include page="includes/nav.jsp" />
    
    <!-- Start Realtime sts area-->
    <div class="realtime-statistic-area">
        <div class="container">
            <div class="row">
            <%
            AttendanceDAO dao = new AttendanceDAO();
            ResultSet rs = dao.getFaculty();
            %>
            <table>
            	<tr>
            		<th>EMPLOYEE ID</th>
            		<th>NAME</th>
            		<th>ATTENDANCE</th>
            	</tr>
            <%
            while(rs.next())
            {
            	String empid = rs.getString("empid");
            	String name =  rs.getString("name");
            	ResultSet rs1 = dao.getFacultyAttendance(empid);
            	int row = 0;
            	while(rs1.next())
            	{
            		row = row + 1;
            	}
            	%>
            	<tr>
            		<td><%=empid %></td>
            		<td><%=name %></td>
            		<td><%=row %></td>
            	</tr>           	
            	<%
            }
            %>
            </table>
            </div>
        </div>
    </div>
    <!-- End Realtime sts area-->
    
    <jsp:include page="includes/footer.jsp" />
    
</body>

</html>
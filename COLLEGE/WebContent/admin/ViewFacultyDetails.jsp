<%@page import="com.admin.*" %>
<%@page import="java.sql.*" %>
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
<%
String empid = request.getParameter("empid");
AdminDAO dao = new AdminDAO();
ResultSet rs = dao.getFaculty(empid);
rs.next();
%>
<body>
    <jsp:include page="includes/nav.jsp" />
    
    <!-- Start Realtime sts area-->
    <div class="realtime-statistic-area">
        <div class="container" style="padding-left:20%;padding-right:20%">
            <div class="row">
            	<h1 style="font-family:Baskerville BOLD BT"><%=rs.getString("NAME") %> - <%=rs.getString("EMPID") %></h1>
            	<table>
            		<tr><th>DEPARTMENT</th><td><%=rs.getString("DEPT") %></td></tr>
            		<tr><th>JOINING DATE</th><td><%=rs.getString("joiningdate") %></td></tr>
            		<tr><th>FATHERS NAME</th><td><%=rs.getString("FNAME") %></td></tr>
            		<tr><th>DOB</th><td><%=rs.getString("DOB") %></td></tr>
            		<tr><th>PASSWORD</th><td><%=rs.getString("PASSWORD") %></td></tr>
            	</table>
            	<br><br>
            	<form action="ViewParticularFaculty.jsp" method="post">
	            	<div class="form-group">
	            		<input type="submit" value="Back To Previous">
	            	</div>
            	</form>
            </div>
        </div>
    </div>
    <!-- End Realtime sts area-->
    
    <jsp:include page="includes/footer.jsp" />
    
</body>

</html>
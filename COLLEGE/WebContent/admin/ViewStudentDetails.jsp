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
String serial = request.getParameter("serial");
AdminDAO dao = new AdminDAO();
ResultSet rs = dao.getStudent(serial);
rs.next();
%>
<body>
    <jsp:include page="includes/nav.jsp" />
    
    <!-- Start Realtime sts area-->
    <div class="realtime-statistic-area">
        <div class="container" style="padding-left:20%;padding-right:20%">
            <div class="row">
            	<h1 style="font-family:Baskerville BOLD BT"><%=rs.getString("NAME") %> - <%=rs.getString("SERIAL") %></h1>
            	<table>
            		<tr><th>COURSE</th><td><%=rs.getString("COURSE") %></td></tr>
            		<tr><th>SESSION</th><td><%=rs.getString("SESSION1") %></td></tr>
            		<tr><th>FATHERS NAME</th><td><%=rs.getString("FNAME") %></td></tr>
            		<tr><th>DOB</th><td><%=rs.getString("DOB") %></td></tr>
            		<tr><th>GENDER</th><td><%=rs.getString("GENDER") %></td></tr>
            		<tr><th>EMAIL</th><td><%=rs.getString("EMAIL") %></td></tr>
            		<tr><th>MOBILE</th><td><%=rs.getString("MOBILE") %></td></tr>
            		<tr><th>ADDRESS</th><td><%=rs.getString("ADDRESS") %></td></tr>
            		<tr><th>SEMESTER</th><td><%=rs.getString("SEMESTER") %></td></tr>
            		<tr><th>PASSWORD</th><td><%=rs.getString("PASSWORD") %></td></tr>
            	</table>
            	<br><br>
            	<form action="ViewParticularStudent.jsp" method="post">
	            	<div class="form-group">
	            		<input type="submit" value="Back To Previous" class="btn" >
	            	</div>
            	</form>
            </div>
        </div>
    </div>
    <!-- End Realtime sts area-->
    
    <jsp:include page="includes/footer.jsp" />
    
</body>

</html>
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

<body>
    <jsp:include page="includes/nav.jsp" />
    
    <!-- Start Realtime sts area-->
    <div class="realtime-statistic-area">
        <div class="container">
            <div class="row">
            	<h1 style='font-family:Baskerville BOLD BT'>Faculty Records</h1><br>
            	<%
            	AdminDAO dao = new AdminDAO();
            	ResultSet rs = dao.getFaculty();
            	%>
            	<table>
            		<tr>
            			<th>EMPID</th>
            			<th>NAME</th>
            			<th>DEPARTMENT</th>
            			<th>D.O.B</th>
            			<th>JOINING DATE</th>
            			<th>EXPERIENCE</th>
            			<th>STATUS</th>
            		</tr>
            	<%
            	while(rs.next())
            	{%>
            		<tr>
            			<td><%=rs.getString("empid") %></td>
            			<td><%=rs.getString("name") %></td>
            			<td><%=rs.getString("dept") %></td>
            			<td><%=rs.getString("dob") %></td>
            			<td><%=rs.getString("joiningdate") %></td>
            			<td><%=rs.getString("experience") %></td>
            			<td><%=rs.getString("status") %></td>
            		</tr>	
            	<%}
            	%>
            	</table>
            </div>
        </div>
    </div>
    <!-- End Realtime sts area-->
    
    <jsp:include page="includes/footer.jsp" />
    
</body>

</html>
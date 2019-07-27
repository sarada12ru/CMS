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
            <h1 style='font-family:Baskerville BOLD BT'>Student Records</h1><br>
            	<%
            	AdminDAO dao = new AdminDAO();
            	ResultSet rs = dao.getStudent();
            	%>
            	<table>
            		<tr>
            			<th>SERIAL</th>
            			<th>NAME</th>
            			<th>FNAME</th>
            			<th>GENDER</th>
            			<th>D.O.B</th>
            			<th>COURSE</th>
            			<th>SESSION</th>
            			<th>MOBILE</th>
            			<th>EMAIL</th>
            			<th>NOTICE</th>
            		</tr>
            	<%
            	while(rs.next())
            	{%>
            		<tr>
            			<td><%=rs.getString("serial") %></td>
            			<td><%=rs.getString("name") %></td>
            			<td><%=rs.getString("fname") %></td>
            			<td><%=rs.getString("gender") %></td>
            			<td><%=rs.getString("dob") %></td>
            			<td><%=rs.getString("course") %></td>
            			<td><%=rs.getString("session1") %></td>
            			<td><%=rs.getString("mobile") %></td>
            			<td><%=rs.getString("email") %></td>
            			<td><%=rs.getString("notice") %></td>
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
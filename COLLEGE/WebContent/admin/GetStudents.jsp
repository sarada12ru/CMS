<%@page import="java.sql.*" %>
<%@page import="com.admin.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>
<html>
<head>
				<%
            	if(session.getAttribute("name")==null && session.getAttribute("serial") == null)
            	{
            		response.sendRedirect("index.jsp");
            	}
            	%>
    <jsp:include page="includes/header.jsp" />
</head>
<%
AdminDAO dao = new AdminDAO();
String course = request.getParameter("course");
String semester = request.getParameter("semester");
Connections conn = new Connections();
conn.conn();
PreparedStatement pst = conn.cn.prepareStatement("select * from student where course = ? and semester = ?");
pst.setString(1, course);
pst.setString(2,semester);
ResultSet rs = pst.executeQuery();
int row =0;
%>
<body>
    <jsp:include page="includes/nav.jsp" />
    
    <!-- Start Realtime sts area-->
    <div class="realtime-statistic-area">
        <div class="container">
            <div class="row">
            	
            		<table>
            			<caption>COURSE : <%=course %> || SEMESTER : <%=semester %>  </caption>
            			<tr>
            				<th>SERIAL</th>
            				<th>NAME</th>
            				<th>ATTENDANCE</th>
            			</tr>
            			<%
            			while(rs.next())
            			{
            				ResultSet rs1 = dao.getAttendanceStudent(rs.getString("serial"), rs.getString("semester"));   
                        	while(rs1.next())
                        	{
                        		row = row + 1;
                        	} 
            			%>
            			<tr>
            			<form action="../SendAttendance" method="post">
							<td><%=rs.getString("serial") %></td>   
							<td><%=rs.getString("name") %></td>
							<td><%=row %></td>
            			</form>     			
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
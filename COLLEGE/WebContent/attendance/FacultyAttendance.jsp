<%@page import="com.attendance.*" %>
<%@page import="com.all.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>
<%
if(session.getAttribute("username") == null)
{
	response.sendRedirect("index.jsp");
}
Connections conn = new Connections();
conn.conn();
String pattern = "yyyy-MM-dd";
SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
String date = simpleDateFormat.format(new Date());
%>
<html>
<head>
    <jsp:include page="includes/header.jsp" />
    <script>
     function f1()
     {
    	 var status = document.getElementById('status').value;
    	 if(status == "SELECT")
    		 {
    		 alert("Choose Attendance Status !");
    		 return false;
    		 }
     }
    </script>
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
            		<caption>DATE : <%=date %></caption>
           			<tr>
           				<th>ID</th>
           				<th>NAME</th>
           				<th>STATUS</th>
           				<th>ACTION</th>
           			</tr>
           			<%
           			while(rs.next())
           			{
           			%>
           			<tr>
           			<form method="post" action="../SendAttendanceFaculty">
           				<input type="hidden" name="empid" value='<%=rs.getString("empid") %>'>
           				<input type="hidden" name="date" value='<%=date%>'>
           				<td><%=rs.getString("empid")%></td>
           				<td><%=rs.getString("name")%></td>
           				<%
           					PreparedStatement pst1 = conn.cn.prepareStatement("select * from  faculty_attendance where id=? and date1=?");
           					pst1.setString(1,rs.getString("empid") );
           					pst1.setString(2, date);
           					ResultSet rs1 = pst1.executeQuery();
           					if(rs1.next())
           					{%>
           						<td>Already Submitted</td>	
           						<td><input type='submit' value="Send Attendance" class='btn btn-primary' style='width:100%' disabled	></td>
           					<%}
           					else
           					{%>
           						<td><select name="status" id='status' class="form-control"><option>SELECT</option><option value="PRESENT">Present</option><option value="ABSENT">Absent</option></select></td> 
								<td><input type="submit" class="btn btn-primary" value="Send Attendance" style="width:100%"></td>
           					<%}
           				%>
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
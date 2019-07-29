<%@page import="java.sql.*" %>
<%@page import="com.attendance.*" %>
<%@page import="com.all.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>
<html>
<head>
<%
if(session.getAttribute("username") == null)
{
	response.sendRedirect("index.jsp");
}
%>
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
<%
AttendanceDAO dao = new AttendanceDAO();
String course = request.getParameter("course");
String semester = request.getParameter("semester");
Connections conn = new Connections();
conn.conn();
ResultSet rs = dao.getStudent(course, semester);
String pattern = "yyyy-MM-dd";
SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
String date = simpleDateFormat.format(new Date());
%>
<body>
    <jsp:include page="includes/nav.jsp" />
    
    <!-- Start Realtime sts area-->
    <div class="realtime-statistic-area">
        <div class="container">
            <div class="row">
            	
            		<table>
            			<caption>COURSE : <%=course %> || SEMESTER : <%=semester %> ||DATE : <%=date %> </caption>
            			<tr>
            				<th>SERIAL</th>
            				<th>NAME</th>
            				<th>STATUS</th>
            				<th>ACTION</th>
            			</tr>
            			<%
            			while(rs.next())
            			{
            			%>
            			
            			<tr>
            			<form action="../SendAttendance" method="post" onsubmit="return f1()">
							<td><%=rs.getString("serial") %></td>   
							<td><%=rs.getString("name") %></td>
							<input type="hidden" name="course" value="<%=course%>" >
							<input type="hidden" name="semester" value="<%=semester%>" >
							<input type="hidden" name="serial" value="<%=rs.getString("serial")%>" >    
							<input type="hidden" name="date1" value="<%=date%>">   
							<%
							PreparedStatement pst1 = conn.cn.prepareStatement("select * from student_attendance where serial = ? and date1 = ?");
							pst1.setString(1, rs.getString("serial"));
							pst1.setString(2, date);
							ResultSet rs1 = pst1.executeQuery();
							if(rs1.next())
							{
								%>
									<td>Already Submitted</td>
									<td><input type="submit" class="btn btn-primary" value="Send Attendance" style="width:100%" disabled></td>
								<%
							}
							else
							{
								%>
								<td><select name="status" id='status' class="form-control"><option>SELECT</option><option value="PRESENT">Present</option><option value="ABSENT">Absent</option></select></td> 
								<td><input type="submit" class="btn btn-primary" value="Send Attendance" style="width:100%"></td>
								<%
							}
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
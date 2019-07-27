<%@page import="com.faculty.*" %>
<%@page import="java.sql.*" %>
<html class="no-js" lang="">
<%
if(session.getAttribute("empid") == null)
{
	response.sendRedirect("index.jsp");
}
%>
<head>
    <jsp:include page="includes/header.jsp" />
</head>
<%
String empid=session.getAttribute("empid").toString();
FacultyDAO dao = new FacultyDAO();
ResultSet rs = dao.getNotice();
rs.next();
ResultSet rs1 = dao.getNotice(empid);
rs1.next();
%>
<body>
    <jsp:include page="includes/nav.jsp" />
    
    <div class="realtime-statistic-area">
        <div class="container" style="padding-left:20%;padding-right:20%">
            <div class="row">
            	<div class="col-sm-6">
	            	<h1 style="font-family:Baskerville Italic;color:green;text-decoration:underline">Notice For All</h1>
	            	<%=rs.getString("notice") %>
            	</div>
            	<div class="col-sm-6">
	            	<h1 style="font-family:Baskerville Italic;color:green;text-decoration:underline">Notice For You</h1>
	            	<%=rs1.getString("notice") %>
            	</div>
            </div>
        </div>
    </div>
    
    <jsp:include page="includes/footer.jsp" />
</body>

</html>
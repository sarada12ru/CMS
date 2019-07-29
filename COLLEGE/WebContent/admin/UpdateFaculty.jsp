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
        <div class="container" style="padding-left:20%;padding-right:20%">
            <div class="row">
            <%
            String msg = request.getParameter("msg");
            if(msg != null)
            {
            	out.print("<h3 style='color:lime'>"+msg+"</h3>");
            }
            %>
                <%
            	AdminDAO dao = new AdminDAO();
            	ResultSet rs = dao.getFacultyStatus();
                %>
                <h1 Style="font-family:Baskerville BOLD BT">Update Faculty</h1>
                <form action="../UpdateFaculty" method="post">
                    <div class="form-group">
                        <label for="">Choose Faculty</label>
                        <select name="empid" class="form-control" id="faculty">
                        <option selected disabled>SELECT</option>
                        	<%
                        	while(rs.next())
                        	{
                        		String empid = rs.getString("empid");
                        	%>
                        		<option value='<%=empid%>'><%=empid %> - <%=rs.getString("name") %></option>	
                        	<%}
                        	%>
                        </select>
                        <div class="form-group">
                            <label for="">Status</label>
                            <input type="text" name="status" value="RETIRED" class="form-control" readonly>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Update Status" class="btn btn-primary" style="width:49%">
                            <input type="reset" value="Cancel" class="btn btn-danger" style="width:49%">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End Realtime sts area-->
    
    <jsp:include page="includes/footer.jsp" />
    
</body>

</html>
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
    <script>
    function f1()
    {
    	var empid  =  document.getElementById("empid").value;
        if(empid == "SELECT")
        	{
        	alert("Choose Faculty");
        	return false;
        	}	
    }
    </script>
</head>
<%
AdminDAO dao = new AdminDAO();
ResultSet rs = dao.getFaculty();
%>
<body>
    <jsp:include page="includes/nav.jsp" />
    <!-- Start Realtime sts area-->
    <div class="realtime-statistic-area">
        <div class="container" style="padding-left: 20%;padding-right: 20%">
            <div class="row">
            	<h1 style='font-family:Baskerville BOLD BT'>Notice to Faculty</h1><br>
            	<%
            	String msg= request.getParameter("msg");
            	if(msg != null)
            	{%>
            		<h3 style="color:lime"><%=msg %></h3>
            	<%}
            	%>
            	
            		<form action="../SendNoticeToFaculty" method="post" onsubmit="return f1()">
	            	    <div class="form-group">
	            	    	<label>Choose Faculty</label>
		            	    <select name="empid" id="empid" class="form-control">
		            	        <option selected disabled>SELECT</option>
		            	        <%
		            	        while(rs.next())
		            	        {%>
		            	        	<option value='<%=rs.getString("empid")%>'><%=rs.getString("empid")%> - <%=rs.getString("name")%> - <%=rs.getString("dept")%></option>	
		            	        <%}
		            	        %>
		            	    </select>
	            	    </div>
	            	    <div class="form-group">
	            	    	<label>Notice</label>
	            	    	<textarea rows="10" class="form-control" name="notice" placeholder="Enter notice here !"></textarea>
	            	    </div>
	            	    <div class="form-group">
	            	    	<input type="submit" value="Send Notice" class="btn btn-primary" style="width:49%">
	            	    	<input type="reset" value="Cancel" class="btn btn-danger" style="width:49%">
	            	    </div>
	            	</form>
            </div>
        </div>
    </div>
    <!-- End Realtime sts area-->
    
    <jsp:include page="includes/footer.jsp" />
    
</body>

</html>
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
            	out.print("<h3 style='color:green'>"+msg+"</h3>");
            }
            %>
            
            <h1 style='font-family:Baskerville BOLD BT'>Update Semester</h1><br>
            	<form action="../UpdateSemester" method="post">
            	    <div class="form-group">
            	        <label for="">COURSE</label>
            	        <select name="course" class="form-control">
            	            <option selected  disabled>SELECT</option>
            	            <option value="BCA">BCA</option>
            	            <option value="BBA">BBA</option>
            	        </select>
            	    </div>
            	    <div class="form-group">
            	        <label for="name">SESSION</label>
            	        <select name="session" class="form-control">
            	            <option selected disabled>SELECT</option>
            	            <option value="2019-2022">2019-2022</option>
            	            <option value="2020-2023">2020-2023</option>
                            <option value="2021-2024">2021-2024</option>
                            <option value="2022-2025">2022-2025</option>
            	        </select>
            	    </div>
            	    <div>
            	        <input type="submit" value="Update Semester" class="btn btn-primary" style="width:49.5%">            	        
            	        <input type="reset" value="Cancel" class="btn btn-danger" style="width:49.5%">
            	    </div>
            	</form>
            </div>
        </div>
    </div>
    <!-- End Realtime sts area-->
    
    <jsp:include page="includes/footer.jsp" />
    
</body>

</html>
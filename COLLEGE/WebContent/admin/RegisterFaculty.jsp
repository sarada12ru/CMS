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
        <%
        String empid , password,msg;
        empid = request.getParameter("empid");
        password = request.getParameter("password");
        msg = request.getParameter("msg");
        if(empid !=null && password != null)
        {
        	out.print("<h3 style='color:green'>Employee ID = "+empid+" & Password = "+password+"</h3>");
        }
        else if(msg != null)
        {
        	out.print("<h3 style='color:red'>Registration Failed</h3>");
        }
        %>
        <h1 style='font-family:Baskerville BOLD BT'>Register Faculty</h1><br>
            <div class="row">
                <form action="../RegisterFaculty" method="post">
                    <div class="form-group">
                        <label for="">NAME</label>
                        <input type="text" name="name" id="name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="">FATHER'S NAME</label>
                        <input type="text" name="fname" id="fname" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="">D.O.B</label>
                        <input type="date" name="dob" id="name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="">DEPARTMENT</label>
                        <select name="dept" id="dept" class="form-control" >
                            <option selected disabled>SELECT</option>
                            <option value="IT">Information Technology</option>
                            <option value="MGMT">Management</option>
                        </select>
                    </div>
                    <div class="form-group">
                    	<label>Joining Date</label>
                    	<input type="date" name="joining_date" id="joining_date" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="">EXPERIENCE(In Yrs)</label>
                        <input type="number" name="experience" id="experience" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Register" class="btn btn-primary" style="width:49%">
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
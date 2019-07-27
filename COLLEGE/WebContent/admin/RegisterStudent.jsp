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
            var gender = document.getElementById("gender").value;
            var course = document.getElementById("course").value;
            var session = document.getElementById("session").value;
            if(gender == "SELECT")
                {
                    alert("Please Select Gender");
                    return false;
                }
            else if(course == "SELECT")
                {
                    alert("Please Select Course");
                    return false;
                }
            else if(session == "SELECT")
                {
            		alert(session);
                    alert("Please Select Session");
                    return false;
                }
        }
    </script>
</head>

<body>
    <jsp:include page="includes/nav.jsp" />
    
    <!-- Start Realtime sts area-->
    <div class="realtime-statistic-area">
        <div class="container" style="padding-left:20%;padding-right:20%">
        <br>
        <%
        String serial , password,msg;
        serial = request.getParameter("serial");
        password = request.getParameter("password");
        msg = request.getParameter("msg");
        if(serial !=null && password != null)
        {
        	out.print("<h3 style='color:green'>Serial = "+serial+" & Password = "+password+"</h3>");
        }
        else if(msg != null)
        {
        	out.print("<h3 style='color:red'>Registration Failed</h3>");
        }
        %>
        <h1 style='font-family:Baskerville BOLD BT'>Register Student</h1><br>
            <div class="row">
            	<form action="../RegisterStudent" method="post" onsubmit="return f1()">
            	    <div class="form-group">
            	        <label for="name">NAME</label>
            	        <input type="text" name="name" id="" class="form-control" required>
            	    </div>
                    <div class="form-group">
            	        <label for="fname">FATHER'S NAME</label>
            	        <input type="text" name="fname" id="" class="form-control" required>
            	    </div>
                    <div class="form-group">
            	        <label for="gender">GENDER</label>
            	        <select name="gender" id="gender" class="form-control">
                            <option selected  disabled >SELECT</option>
            	            <option value="male">MALE</option>
            	            <option value="male">MALE</option>
            	        </select>
            	    </div>
                    <div class="form-group">
            	        <label for="name">DOB</label>
            	        <input type="date" name="dob" id="" class="form-control" required>
            	    </div>
                    <div class="form-group">
            	        <label for="name">COURSE</label>
            	        <select name="course" id="course" class="form-control">
            	            <option selected  disabled>SELECT</option>
            	            <option value="BCA">BCA</option>
            	            <option value="BBA">BBA</option>
            	        </select>
            	    </div>
                    <div class="form-group">
            	        <label for="name">SESSION</label>
            	        <select name="session" id="session" class="form-control">
            	            <option selected disabled>SELECT</option>
            	            <option value="2019-2022">2019-2022</option>
            	            <option value="2020-2023">2020-2023</option>
                            <option value="2021-2024">2021-2024</option>
                            <option value="2022-2025">2022-2025</option>
            	        </select>
            	    </div>   
                    <div class="form-group">
            	        <label for="name">EMAIL</label>
            	        <input type="email" name="email" id="" class="form-control" required>
            	    </div>  
            	    <div class="form-group">
            	        <label for="name">MOBILE</label>
            	        <input type="text" name="mobile" pattern="[0-9]{10}" title="Mobile no must be of 10 digit" class="form-control" required>
            	    </div>              
                    <div class="form-group">
            	        <label for="name">ADDRESS</label>
            	        <textarea name="address" class="form-control"></textarea>
            	    </div> 
            	    <div class="form-group">
            	        <label for="name">10th PERCENTAGE</label>
            	        <input type="text" name="percentage_10th" pattern="[0-9]{2}" title="Percentage must be of 2 digit" id="" class="form-control" required>
            	    </div> 
            	    <div class="form-group">
            	        <label for="name">12th PERCENTAGE</label>
            	        <input type="text" name="percentage_12th" pattern="[0-9]{2}"  title="Percentage must be of 2 digit" id="" class="form-control" required>
            	    </div> 
            	    <div>
            	        <input type="submit" value="Register" class="btn btn-primary" style="width:49.5%">            	        
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
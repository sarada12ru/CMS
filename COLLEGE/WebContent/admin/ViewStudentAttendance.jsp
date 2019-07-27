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
    function f2()	
    {
    	var course = document.getElementById("course").value;
    	var semester = document.getElementById("semester").value;
    	if(course == "SELECT")
    		{
    		alert("Choose Course !");
    		return false;
    		}
    	else if(semester == "SELECT")
    		{
    		alert("Choose Semester !");
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
            <div class="row">
            	<h1 style='font-family:Baskerville BOLD BT'>Student Attendance</h1>
            	<form action="GetStudents.jsp" method="post" onsubmit="return f1()">
            		<div class="form-group">
            	        <label for="name">COURSE</label>
            	        <select name="course" id="course" class="form-control">
            	            <option selected  disabled>SELECT</option>
            	            <option value="BCA">BCA</option>
            	            <option value="BBA">BBA</option>
            	        </select>
            	    </div>
            	    <div class="form-group">
            	        <label for="name">SEMESTER</label>
            	        <select name="semester" id="semester" class="form-control">
            	            <option selected disabled>SELECT</option>
            	            <option value="FIRST">FIRST</option>
            	            <option value="SECOND">SECOND</option>
                            <option value="THIRD">THIRD</option>
                            <option value="FOURTH">FOURTH</option>
                            <option value="FIFTH">FIFTH</option>
                            <option value="SIXTH">SIXTH</option>
            	        </select>
            	    </div> 
            	    <div>
            	    	<input type="submit" class="btn btn-primary" value="Get Attendance">
            	    	<input type="reset" class="btn btn-danger" value="Cancel">
            	    </div>           	    
            	</form>
            </div>
        </div>
    </div>
    <!-- End Realtime sts area-->
    
    <jsp:include page="includes/footer.jsp" />
    
</body>

</html>
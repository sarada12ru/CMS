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
    function f2()
    {
    	var course = document.getElementById("course").value;
    	var session = document.getElementById("session").value;
    	var serial = document.getElementById("serial").value;
    	if(course == "SELECT")
    		{
    		alert("Choose Course !");
    		return false;
    		}
    	else if(course == "SELECT")
    		{
    		alert("Choose Session !");
    		return false;
    		}
    	else if(serial == "SELECT")
			{
			alert("Choose Student !");
			return false;
			}
    }
    var request;  
	function sendInfo()  
	{  
		var course=document.getElementById("course").value;  
		var session = document.getElementById("session").value;
		var url="ajax_scripts/GetStudent.jsp?course="+course+"&session="+session; 
		if(window.XMLHttpRequest)
		{  
			request=new XMLHttpRequest();  
		}  
		else if(window.ActiveXObject)
		{  
			request=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
		try
		{  
			request.onreadystatechange=getInfo;  
			request.open("GET",url,true);  
			request.send();  
		}
		catch(e)
		{
			alert("Unable to connect to server");
		}  
	}  
		  
	function getInfo()
	{  
		if(request.readyState==4)
		{  
		var val=request.responseText; 
		document.getElementById('res').innerHTML=val;  
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
            	<h1 style='font-family:Baskerville BOLD BT'>View Particular Student</h1><br>
            	<form method="post" action="ViewStudentDetails.jsp">
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
            	        <select name="session" id="session" class="form-control"  onchange="sendInfo()">
            	            <option selected disabled>SELECT</option>
            	            <option value="2019-2022">2019-2022</option>
            	            <option value="2020-2023">2020-2023</option>
                            <option value="2021-2024">2021-2024</option>
                            <option value="2022-2025">2022-2025</option>
            	        </select>
            	    </div> 
            	    <div class="form-group" id="res">
            	    
            	    </div>
            	    <div class="form-group">
            	    	<input type="submit" value="View Student" class="btn btn-primary" style="width:49%">
            	    	<input type="reset" value="cancel" class="btn btn-danger" style="width:49%">
            	    </div>
            	</form>
            </div>
        </div>
    </div>
    <!-- End Realtime sts area-->
    
    <jsp:include page="includes/footer.jsp" />
    
</body>

</html>
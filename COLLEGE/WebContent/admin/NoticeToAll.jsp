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
            <h1 style='font-family:Baskerville BOLD BT'>Notice For All</h1>
            <%
            String msg = request.getParameter("msg");
            if(msg != null)
            {%>
            	<h3 style="font-family:Baskerville Italic;color:lime"><%=msg %></h3>	
            <%}
            %>
            	<form action="../SendNoticeToAll" method="post">
            		<div class="form-group">
            			<label>Notice</label>
            			<textarea name="notice" class="form-control" placeholder="Enter your message here !" rows="10"></textarea>
            		</div>
            		<div class="form-group">
            			<input type="submit" class="btn btn-primary" value="Send Notice" style="width:49%">
            			<input type="reset" class="btn btn-danger" value="Cancel" style="width:49%">
            		</div>
            	</form>
            </div>
        </div>
    </div>
    <!-- End Realtime sts area-->
    
    <jsp:include page="includes/footer.jsp" />
    
</body>

</html>
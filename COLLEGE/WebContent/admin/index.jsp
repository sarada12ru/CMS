
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login || Admin</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<style>
		body
		{
			background: linear-gradient(to bottom right, #33ccff 20%, #ff99cc 100%) center center no-repeat fixed;
		}
		#heading
		{
			text-align:center;
			padding-top:10%;
		}
		.form
		{
			padding-left:30%;
			padding-right:30%;
		}
		h1
		{
			font-family:Baskerville Bold;
			font-weight:bold;
			
		}
	</style>
	
</head>
<body>
		<div id="heading">
			<h1>ADMIN LOGIN</h1>
		</div>
		<div class="form">
			<form action="../Admin_Login" method="post">
				<div class="form-group">
					<label>Username</label>
					<input type="text" name="username" placeholder="Username" class="form-control">
				</div>
				<div class="form-group">
					<label>Password</label>
					<input type="password" name="password" placeholder="***********" class="form-control">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="Login" style="width:48%">
					<input type="reset" class="btn btn-danger" value="Cancel" style="width:49%">
				</div>
			</form>
		</div>
</body>
</html>
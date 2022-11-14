<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://fonts.cdnfonts.com/css/steak-2" rel="stylesheet">
<link href="http://fonts.cdnfonts.com/css/segoe-script" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

<link rel="stylesheet" href="css/style3.css">
<title>Sign up HG Store</title>
</head>
<body>
	<div class="container-fluid" style="padding: 0">
		<%@ include file="header.jsp"%>
	</div>

	<div class="container-fluid fo">
		<div class="background_signup">
			<img src="media/backgroundlogin.jpg" style="width: 100%; height:100%"
				class="img-responsive">
			<div class="container_signup">
				<form action="registerSubmit" method="post">
					<h1 class="text_signup">Sign up</h1>
					<label for="fullname"><b class="text_signup_form">Full name</b></label>
					<input type="text" placeholder="Enter full name" name="fullName"
						required> 
					<label for="email"><b class="text_signup_form">Email</b></label> <input type="text"
						placeholder="Enter email" name="email" required> 
						
					<label for="address"><b class="text_signup_form">Address</b></label> <input type="text"
						placeholder="Enter address" name="address" required> 
						
					<label for="phone"><b class="text_signup_form">Phone</b></label> <input type="text"
						placeholder="Enter phone number" name="phone" required> 	
												
					<label for="password"><b class="text_signup_form">Password</b></label> <input
						type="password" placeholder="Enter Password" name="password"
						required>		
												
					<label for="confirm_pwd"><b class="text_signup_form">Confirm Password</b></label> <input
						type="password" placeholder="Enter Password" name="confirm_pwd"  required>						
					<button type="submit" class="btn_signup">Sign up</button>
					<p class="alert" style="display:${display}"> ${alertMessage}</p>
					</form>
			</div>
		</div>
	</div>
	<div class="container-fluid fo">
		<%@ include file="footer.jsp"%>
	</div>
	</body>
</html>
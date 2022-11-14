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
<title>Login HG Store</title>


</head>
<body>
	<div class="container-fluid" style="padding: 0">
		<%@ include file="header.jsp"%>
	</div>

	<div class="container-fluid fo">
		<div class="bg">
			<img src="media/backgroundlogin.jpg"
				style="width: 100%; height: 100%">
			<div class="container_login">
				<form name="myFormSignUp" action="submitLogin" method="post"
					onsubmit="validateFormSigUp()">
					<h1 class="text_login">Login</h1>
					<label for="user"><b class="text_login_form">User</b></label> 
					<input type="text" placeholder="Mail" name="name" value="${user}"> 
					<label for="psw"><b class="text_login_form">Password</b></label> 
					<input type="password" placeholder="Enter Password" name="password" value="${pass}">
					<button type="submit" class="btn_login">Login</button>
					<p class="alert" style="display:${display}">User or pass is wrong</p>
					<input type="checkbox" value="none" name="check" /> 
					<label for="squaredcheck"><b class="text_login_form">Remember me</b></label>
				</form>
				<div class="row">
					<div class="col-xs-6">
						<button type="submit" class="btn_cancel">Cancel</button>
					</div>
					<div class="col-xs-6">
						<a href="#" class="forgot_pw" style="color:white">Forgot password ?</a>
					</div>
				</div> 
			</div>
		</div>
	</div>
	<div class="container-fluid fo">
		<%@ include file="footer.jsp"%>
	</div>




</body>
</html>
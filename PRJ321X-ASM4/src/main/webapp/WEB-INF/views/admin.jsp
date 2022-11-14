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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link rel="stylesheet" href="css/style3.css">

<title>HG Store</title>
</head>
<body>
	<jsp:include page="modalwelcome.jsp" />
	<div class="container-fluid he">
		<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="navbar-header">
					<a class="navbar-brand logo" style="font-size: 30px" href="#">HG STORE</a>
				</div>
		</nav>
	</div>	
	
	<div class="container-fluid " style="margin-top: 50px; padding: 0px">
		<div class="row" style="height:550px">
			<div class="col-sm-2 left-menu">
				<div class="btn-group-vertical btn-menu">
					<button type="button" class="btn btn-primary btn-menu size-btn">Dashboard</button>
					<button type="button" class="btn btn-primary btn-menu size-btn" onclick="location.href='productAdmin';">Product</button>
					<button type="button" class="btn btn-primary btn-menu size-btn">Manager Staff</button>
					<button type="button" class="btn btn-primary btn-menu size-btn" >Report</button>
					<button type="button" class="btn btn-primary btn-menu size-btn" onclick="location.href='login';">Logout</button>
					
				</div>
			</div>
			<div class="col-sm-10">
			
			</div>
		</div>
	</div>

	<div class="container-fluid fo">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
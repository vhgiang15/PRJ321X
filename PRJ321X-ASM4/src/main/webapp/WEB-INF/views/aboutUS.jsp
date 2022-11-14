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
<title>About HG Store</title>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp" />
	</div>
	<div class="container-fluid fo">
		<div class="col-sm-6">
			<iframe 
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3934.027044397426!2d105.9750632142796!3d9.592937082543763!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a04df36d202525%3A0x3bc7d252601f7d39!2zODQgxJDGsOG7nW5nIEzDqiBEdeG6qW4sIFBoxrDhu51uZyAzLCBTw7NjIFRyxINuZywgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1661272419526!5m2!1svi!2s"
				name="map" class="img_map"></iframe>
		</div>
		<div class="col-sm-6">
			<div class="background_aboutUS">
				<img src="media/backgroundlogin.jpg" class="img_map">
				<div class="container_aboutUS">
					<h1>HG Store</h1>
					<p>No. 84, Le Duan street, Soc Trang District</p>
					<p>+84983,983.983</p>
					<p>Mail: hgstore84@gmail.com</p>
					<a href="home.jsp"> Home</a> <br> <a href="#">Product</a>
					<p>Customers service: 19006868</p>
				</div>
			</div>

		</div>
	</div>

	<div class="container-fluid fo">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
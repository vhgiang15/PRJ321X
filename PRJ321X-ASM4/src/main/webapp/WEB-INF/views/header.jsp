<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<header>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand logo" style="font-size: 30px" href="#">HG STORE</a>
					<a href="aboutUS" class="btn btn-info btn-sm" style="margin-top: 10px">
					
						<span class="glyphicon glyphicon-map-marker"></span> Map
					</a>
				</div>

				<div class="collapse navbar-collapse" id="myNavbar">
					<form class="navbar-form navbar-left" action="search">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search" name="textSearch">
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
					<ul class="nav navbar-nav">
						<li><a href="home">Home</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Product<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="productType?textSearch=cellphone">Cellphone</a></li>
								<li><a href="productType?textSearch=laptop">Laptop</a></li>
							</ul></li>
						<li><a href="aboutUS">About US</a></li>
					</ul>



					<ul class="nav navbar-nav navbar-right">
						<li><a href="register"><span class="glyphicon glyphicon-user"></span>
								Register</a></li>
						<li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span>
								Login</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>
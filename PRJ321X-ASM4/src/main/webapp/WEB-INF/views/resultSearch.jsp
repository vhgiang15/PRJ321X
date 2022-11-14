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
	<div class="container-fluid">
		<jsp:include page="header.jsp"/>	
	</div>
	
	<div class="container-fluid" style="margin-top: 100px">
		<jsp:include page="bodySearch.jsp"/>
	</div>
	
	
	<div class="container-fluid fo">
		<jsp:include page="footer.jsp" />
	</div>

</body>
</html>
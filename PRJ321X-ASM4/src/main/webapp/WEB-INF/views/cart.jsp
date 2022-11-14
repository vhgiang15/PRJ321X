<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<jsp:include page="header.jsp" />
	</div>
	<div class="container-fluid productOrder">
		<table id="cart" class="tableOrder table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%" class="text-center">Product</th>
					<th style="width: 10%" class="text-center">Price</th>
					<th style="width: 18%" class="text-center">Quantity</th>
					<th style="width: 22%" class="text-center">Amount</th>
					<th style="width: 00%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sessionScope.order.lProduct}" var="o">
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-2 hidden-xs">
									<img src="${o.srcProduct}" alt="Sản phẩm 1"
										class="img-responsive" width="100">
								</div>
								<div class="col-sm-10">
									<h4 class="nomargin">${o.nameProduct}</h4>
								</div>
							</div>
						</td>
						<td data-th="Price" class="text-center">$${o.priceProduct}</td>
						<td data-th="Quantity" class="text-center">
						    <button type="button" class="btn btn-sm" onclick="location.href='decrease?id=${o.productId}';"> <span class="glyphicon glyphicon-minus"></span></button> 
						${o.quantity} 
						<button type="button" class="btn btn-sm" onclick="location.href='increase?id=${o.productId}';"> <span class="glyphicon glyphicon-plus"></span> </button> 						
						</td>
						<td data-th="Subtotal" class="text-center">$${o.amountProduct}</td>
						<td class="actions" data-th=""><a 
							href="remove?id=${o.productId}"><button type="button"
									class="btn btn-danger">Remove</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td><a href="home" class="btn btn-warning"><i
							class="fa fa-angle-left"></i> Continue to buy</a></td>
					<td colspan="2" class="hidden-xs"></td>
					<td class="hidden-xs text-center"><strong>Total:
							$${order.price} </strong></td>

				</tr>
			</tfoot>
		</table>

		<form class="form-horizontal" action="submitOrder">
			<div class="form-group">
				<label class="control-label col-sm-1" for="fullname">Customer
					name</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="Full name"
						name="fullname">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1" for="email">Mail</label>
				<div class="col-sm-5">
					<input type="email" class="form-control" id="email"
						placeholder="Enter email" name="mail">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1" for="address">Address</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="Address"
						name="address">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1" for="address">Phone
					number</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" placeholder="Phone number"
						name="phone">
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-1">
					<button type="submit" class="btn btn-success"
						style="display:${enableSubmit}">Submit</button>
				</div>
			</div>
			
			<div class="form-group">
			<div class="col-sm-12">
				<label class="control-label col-sm-3" for="alert"><a href="home" style="display:${displayAlert}">Success! Go to homepage </a></label> 
				</div>
			<div class="col-sm-12">	
				<label class="control-label col-sm-3" for="error" style="display:${error}; color:red">Please input above information</label>
				</div>
			</div>

		</form>

	</div>

	<div class="container-fluid fo">
		<jsp:include page="footer.jsp" />
	</div>

</body>
</html>
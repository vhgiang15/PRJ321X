<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h4 style="display:${alert}; color:red">Not found any Product</h4>
	<div class="row">
		<div class="col-sm-9 product">

			<c:forEach items="${listP}" var="o">
						<div class="col-sm-6">
							<div class="media">
								<div class="media-left media-middle">
									<img src="${o.src}"
										class="media-object">
								</div>
								<div class="media-body">
									<p style="text-transform: uppercase;">${o.type}</p>
									<h4 class="media-heading">
										<a href="product?id=${o.id}">${o.name}</a>
									</h4>
									<p>$${o.price}</p>
									<form action="cart" method="post">
									<input type=submit value="Add to Cart" class="btn btn-success">
									<input type=text name="id" value="${o.id}" style="display:none">
									<input type=text name="name" value="${o.name}" style="display:none">
									<input type=text name="src" value="${o.src}" style="display:none">
									<input type=text name="price" value="${o.price}" style="display:none">
									</form>
									
								</div>
							</div>

						</div>

			</c:forEach>

		</div>
		<div class="col-sm-3">
			<div class="col-sm-12 cart">
				<h3>Shopping cart</h3>
				<p>Summary information of your cart can be displayed here</p>
				<div class="row summary_info"></div>
			</div>
			<div class="col-sm-12 popular_product">
				<div class="text_popular">Popular Product</div>
				<div class="row">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">

							<div class="item active">
								<img src="media/samsung-galaxy-z-flip4-5g.jpg" class="img_silde">
								<div class="carousel-caption">
									<h4>Samsung-z-Flip4</h4>
								</div>
							</div>

							<div class="item">
								<img src="media/samsung-galaxy-s20.jpg" class="img_silde">
								<div class="carousel-caption">
									<h4>Samsung-galaxy-S20</h4>
								</div>
							</div>

							<div class="item">
								<img src="media/IP13 mini.jpeg" class="img_silde">
								<div class="carousel-caption">
									<h4>IPhone 13 mini</h4>
								</div>
							</div>

						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<ul class="pagination">
			<c:if test="${indexPage>1}">
				<li class="page-item"><a class="page-link"
					href="search?indexPage=${indexPage-1}&beginPage=${(indexPage-1)%3==0?beginPage-3:beginPage}&textSearch=${textSearch}">Previous</a></li>
			</c:if>
			<c:forEach begin="${beginPage}"
				end="${(beginPage+2)<endPage?(beginPage+2):endPage}" var="i">
				<li class=" ${indexPage==i?"active":""}"><a
					href="search?indexPage=${i}&beginPage=${beginPage}&textSearch=${textSearch}">${i}</a></li>
			</c:forEach>
			<c:if test="${indexPage<endPage}">
				<li class="page-item"><a class="page-link"
					href="search?indexPage=${indexPage+1}&beginPage=${(indexPage+1)%3==1?beginPage+3:beginPage}&textSearch=${textSearch}">Next</a></li>
			</c:if>
		</ul>
	</div>

</body>
</html>
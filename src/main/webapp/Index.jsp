<%@page import="impl.ProductDAOImpl"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>

<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	font: 400 15px/1.8 Lato, sans-serif;
	color: #777;
}

h3, h4 {
	margin: 10px 0 30px 0;
	letter-spacing: 10px;
	font-size: 20px;
	color: #111;
}

.container {
	padding: 80px 120px;
}

.person {
	border: 10px solid transparent;
	margin-bottom: 25px;
	width: 80%;
	height: 80%;
	opacity: 0.7;
}

.person:hover {
	border-color: #f1f1f1;
}

.carousel-inner img {
	-webkit-filter: grayscale(90%);
	filter: grayscale(90%); /* make all photos black and white */
	width: 100%; /* Set width to 100% */
	margin: auto;
}

.carousel-caption h3 {
	color: #fff !important;
}

@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
}

.bg-1 {
	background: #2d2d30;
	color: #bdbdbd;
}

.bg-1 h3 {
	color: #fff;
}

.bg-1 p {
	font-style: italic;
}

.list-group-item:first-child {
	border-top-right-radius: 0;
	border-top-left-radius: 0;
}

.list-group-item:last-child {
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail p {
	margin-top: 15px;
	color: #555;
}

.btn {
	padding: 10px 20px;
	background-color: #333;
	color: #f1f1f1;
	border-radius: 0;
	transition: .2s;
}

.btn:hover, .btn:focus {
	border: 1px solid #333;
	background-color: #fff;
	color: #000;
}

.modal-header, h4, .close {
	background-color: #333;
	color: #fff !important;
	text-align: center;
	font-size: 30px;
}

.modal-header, .modal-body {
	padding: 40px 50px;
}

.nav-tabs li a {
	color: #777;
}

#googleMap {
	width: 100%;
	height: 400px;
	-webkit-filter: grayscale(100%);
	filter: grayscale(100%);
}

.navbar {
	font-family: Montserrat, sans-serif;
	margin-bottom: 0;
	background-color: #2d2d30;
	border: 0;
	font-size: 11px !important;
	letter-spacing: 4px;
	opacity: 0.9;
}

.navbar li a, .navbar .navbar-brand {
	color: #d5d5d5 !important;
}

.navbar-nav li a:hover {
	color: #fff !important;
}

.navbar-nav li.active a {
	color: #fff !important;
	background-color: #29292c !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
}

.open .dropdown-toggle {
	color: #fff;
	background-color: #555 !important;
}

.dropdown-menu li a {
	color: #000 !important;
}

.dropdown-menu li a:hover {
	background-color: red !important;
}

footer {
	background-color: #2d2d30;
	color: #f5f5f5;
	padding: 32px;
}

footer a {
	color: #f5f5f5;
}

footer a:hover {
	color: #777;
	text-decoration: none;
}

.form-control {
	border-radius: 0;
}

textarea {
	resize: none;
}
</style>
</head>
<c:import url="header.jsp"></c:import>

<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50">



	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="images/blog_1.jpg" alt="New fashion" width="1200"
					height="500">
				<div class="carousel-caption">
					<h3>New Style</h3>

				</div>
			</div>

			<div class="item">
				<img src="images/blog_2.jpg" alt="mens"
					width="1200" height="700">
				<div class="carousel-caption">

					<h3>New Brands</h3>
				</div>
			</div>

			<div class="item">
				<img src="images/blog_3.jpg" alt="wallpaper"
					width="1200" height="700">
				<div class="carousel-caption">
					<h3>Store</h3>


				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<!-- Container (The Band Section) -->
	<div id="band" class="container text-center">
		<h3>NEW LIFESTYLE</h3>
		<p>
			<em>We love fashion!</em>
		</p>
		<p><h1 style="color:#4169E1">In crude terms fashion is a style of living. There are
			aristocratic fashions, film-style fashions, peasant class fashions
			and a kind of fashion known as maverick fashion. Naturally it is
			related to dress and manners. But manners imply something deeper than
			fashions. Because fashion is comparatively superficial, and changes
			with the winds of change in certain races and people.
		</h1>
		</p>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<p class="text-center">
					<B>WOMEN</B>
				</p>
				<br> <a href="#demo" data-toggle="collapse"> <img
					src="images/Plus-Size-outfit-Neutral-Winter.jpg"
					class="img-circle person" alt="Brands Name" width="255"
					height="200">
				</a>
				<div id="demo" class="collapse">
					<p>Allen Solly</p>
					<p>Levi's</p>
					<p>Lee</p>
				</div>
			</div>
			<div class="col-sm-4">
				<p class="text-center">
					<B>MEN</B>
				</p>
				<br> <a href="#demo2" data-toggle="collapse"> <img
					src="images/images.jpg" class="img-circle person" alt="Brands Name"
					width="255" height="400">
				</a>
				<div id="demo2" class="collapse">
					<p>Ralph Lauren</p>
					<p>Hugo Boss</p>
					<p>Lacoste</p>
				</div>
			</div>
			<div class="col-sm-4">
				<p class="text-center">
					<B>KIDS</B>
				</p>
				<br> <a href="#demo3" data-toggle="collapse"> <img
					src="images/25-styles-newborn-baby-boy-girls-clothes.jpg"
					class="img-circle person" alt="Brands Name" width="255"
					height="255">
				</a>
				<div id="demo3" class="collapse">
					<p>CHICCO</p>
					<p>KAPKIDS</p>
					<p>SKIP HOP</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Container (New Arrivals Section) -->
	<div id="New Arrivals" class="bg-1">
		<div class="container">
			<h3 class="text-center">NEW ARRIVALS</h3>
			<p class="text-center">
				A collection which will go to one's personality.<br> <br>
			</p>
			<ul class="list-group">

			</ul>

			<div class="row text-center">
				<div class="col-sm-4">
					<div class="thumbnail">
						<img src="images/813hRJwKGHL._UY445_.jpg" alt="girls" width="250"
							height="250">

					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<img
							src="images/Mens-Denim-Shirts-Pocket-Blue-Color-Brand-Clothing-Man-s-Long-Sleeve-Slim-Fit-Men-Polka.jpg_640x640.jpg"
							alt="men" width="400" height="300">

					</div>
				</div>
				<div class="col-sm-4">
					<div class="thumbnail">
						<img
							src="images/Summer-Kids-Clothes-Sets-Short-Sleeve-Boy-Tshirt-Pants-Suit-Clothing-Set-Newborn-Sport-Suits-Children-Baby-Boy-Clothes-SY125-ykx0.jpg"
							alt="Children" width="400" height="300">

					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->







	</div>
	<div class="modal-footer"></div>
	<div id="productCategoryDisplay" class="container">

		<%
			ProductDAO pdao = new ProductDAOImpl();

			request.setAttribute("pmap", pdao.getProductsByCategory());
		%>

		<c:forEach items="${pmap}" var="entry">

			<div class="row">
				<div class="col-lg-12">

					<h1>${entry.key}</h1>

					<div class="container" >

						<c:forEach items="${entry.value}" var="prod">

							<div class="row jumbotron" style="padding:0;">

								<div class="col-lg-6" style="margin:0; padding:0;">
									<img style="width: 500px; height: 500px; object-fit: cover;" src="${prod.getImageUrl()}">
								</div>
								
								<div class="col-lg-6" style="margin:0; padding:0;">
									<a href="ViewSingleProduct.jsp?id=${prod.getId()}"><h1>${prod.getName()}</h1></a>
								
									<hr>
									
									<p>${prod.getDescription()}</p>
								
								</div>

							</div>

						</c:forEach>



					</div>

				</div>
			</div>

		</c:forEach>



	</div>




	<!-- Container (Contact Section) -->
	<div id="contact" class="container">
		<h3 class="text-center">Contact</h3>
		<p class="text-center">
			<em>We love our fans!</em>
		</p>

		<div class="row">
			<div class="col-md-4">

				<p>
					<span class="glyphicon glyphicon-map-marker"></span>India
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span>Phone: +91
					9998889999
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>Email:
					mail@mail.com
				</p>
			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control" id="name" name="name"
							placeholder="Name" type="text" required>
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" id="email" name="email"
							placeholder="Email" type="email" required>
					</div>
				</div>
				<textarea class="form-control" id="comments" name="comments"
					placeholder="Comment" rows="5"></textarea>
				<br>
				<div class="row">
					<div class="col-md-12 form-group">
						<button class="btn pull-right" type="submit">Send</button>
					</div>
				</div>
			</div>
		</div>
		<br>






		<!-- Footer -->
		<footer class="text-center">
			<a class="up-arrow" href="#myPage" data-toggle="tooltip"
				title="TO TOP"> <span class="glyphicon glyphicon-chevron-up"></span>
			</a><br>
			<br>
		</footer>

		<script>
			$(document).ready(function() {
				// Initialize Tooltip
				$('[data-toggle="tooltip"]').tooltip();

				// Add smooth scrolling to all links in navbar + footer link
				$("footer a[href='#myPage']").on('click', function(event) {

					// Prevent default anchor click behavior
					event.preventDefault();

					// Store hash
					var hash = this.hash;

					// Using jQuery's animate() method to add smooth page scroll
					// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
					$('html, body').animate({
						scrollTop : $(hash).offset().top
					}, 900, function() {

						// Add hash (#) to URL when done scrolling (default click behavior)
						window.location.hash = hash;
					});
				});
			})
		</script>
</body>
</html>

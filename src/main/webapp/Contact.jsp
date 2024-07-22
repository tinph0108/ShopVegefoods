<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<style >
.navbar-nav {
	flex-direction: row;
}

.navbar-nav .nav-item {
	margin-left: 10px;
}

.navbar-nav.mr-auto {
	margin-right: auto;
}

.form-inline {
	display: flex;
	justify-content: center;
	align-items: center;
}

.search-form {
	display: flex;
	border: 2px solid #28a745; /* Viền ngoài của toàn bộ thanh tìm kiếm */
	border-radius: 25px; /* Bo tròn các góc của toàn bộ thanh tìm kiếm */
	overflow: hidden;
}

.search-input {
	width: 250px; /* Chiều ngang */
	height: 30px; /* Chiều cao */
	padding: 5px 10px; /* Điều chỉnh padding */
	font-size: 14px; /* Điều chỉnh kích thước chữ */
	border: none; /* Loại bỏ viền mặc định */
	border-radius: 25px 0 0 25px; /* Bo tròn góc trái */
	outline: none; /* Loại bỏ viền khi focus */
}

.search-button {
	height: 30px; /* Chiều cao */
	padding: 0 15px; /* Điều chỉnh padding */
	font-size: 16px; /* Điều chỉnh kích thước chữ */
	border: none; /* Loại bỏ viền mặc định */
	border-radius: 0 25px 25px 0; /* Bo tròn góc phải */
	background: none; /* Loại bỏ màu nền */
	color: #28a745; /* Màu chữ xanh */
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer; /* Con trỏ chuột thay đổi khi hover */
}

.search-button i {
	font-size: 16px; /* Kích thước biểu tượng */
}

.navbar-nav.ml-auto {
	margin-left: auto;
</style>
</head>
<body class="goto-here">

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">Vegefoods</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a href="index.jsp"
						class="nav-link">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="product">Shop</a> <a
								class="dropdown-item" href="wishlist.html">Wishlist</a> <a
								class="dropdown-item" href="ProductSingle.jsp">Single
								Product</a> <a class="dropdown-item" href="cart">Cart</a> <a
								class="dropdown-item" href="checkout.html">Checkout</a>
						</div></li>
					<li class="nav-item"><a href="About.jsp" class="nav-link">About</a></li>
					<li class="nav-item"><a href="Blog.jsp" class="nav-link">Blog</a></li>
					<li class="nav-item"><a href="Contact.jsp" class="nav-link">Contact</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0 mx-auto search-form">
					<input class="form-control search-input" type="search"
						placeholder="Bạn muốn chọn ăn gì?" aria-label="Search">
					<button class="btn search-button" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item cta cta-colored"><a href="cart"
						class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>
					<li class="nav-item"><a href="Login.jsp" class="nav-link"><i
							class="fas fa-sign-in-alt"></i> Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- END nav -->

	<div class="hero-wrap hero-bread"
		style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Contact
							us</span>
					</p>
					<h1 class="mb-0 bread">Contact us</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section contact-section bg-light">
		<div class="container">
			<div class="row d-flex mb-5 contact-info">
				<div class="w-100"></div>
				<div class="col-md-3 d-flex">
					<div class="info bg-white p-4">
						<p>
							<span>Địa chỉ:</span> 12 Nguyễn Văn Bảo, Phường 4, Gò Vấp, Hồ Chí
							Minh
						</p>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="info bg-white p-4">
						<p>
							<span>Phone:</span> <a href="tel://0327858843">+84 327 858
								843</a>
						</p>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="info bg-white p-4">
						<p>
							<span>Email:</span> <a href="mailto:	tinphan924@gmail.com">tinphan924@gmail.com</a>
						</p>
					</div>
				</div>
				<div class="col-md-3 d-flex">
					<div class="info bg-white p-4">
						<p>
							<span>Website</span> <a href="#">Vegefoods.com</a>
						</p>
					</div>
				</div>
			</div>
			<div class="row block-9">
				<div class="col-md-6 order-md-last d-flex">
					<form action="#" class="bg-white p-5 contact-form">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Your Name">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Your Email">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Subject">
						</div>
						<div class="form-group">
							<textarea name="" id="" cols="30" rows="7" class="form-control"
								placeholder="Message"></textarea>
						</div>
						<div class="form-group">
							<input type="submit" value="Send Message"
								class="btn btn-primary py-3 px-5">
						</div>
					</form>

				</div>

				<div class="col-md-6 d-flex">
					<div id="map" class="bg-white"></div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="mouse">
					<a href="#" class="mouse-icon">
						<div class="mouse-wheel">
							<span class="ion-ios-arrow-up"></span>
						</div>
					</a>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Vegefoods</h2>
						<p>Rau sạch, tươi ngon từ trang trại đến bàn ăn của bạn!</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a
								href="https://www.facebook.com/sniT.18"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a
								href="https://www.instagram.com/s1mpel8"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Menu</h2>
						<ul class="list-unstyled">
							<li><a href="Shop.jsp" class="py-2 d-block">Shop</a></li>
							<li><a href="About.jsp" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Journal</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Help</h2>
						<div class="d-flex">
							<ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
								<li><a href="#" class="py-2 d-block">Shipping
										Information</a></li>
								<li><a href="#" class="py-2 d-block">Returns &amp;
										Exchange</a></li>
								<li><a href="#" class="py-2 d-block">Terms &amp;
										Conditions</a></li>
								<li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
							</ul>
							<ul class="list-unstyled">
								<li><a href="#" class="py-2 d-block">FAQs</a></li>
								<li><a href="#" class="py-2 d-block">Contact</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">12 Nguyễn Văn Bảo, Phường 4, Gò Vấp, Hồ Chí
										Minh</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+84 327 858 843</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">tinphan924@gmail.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
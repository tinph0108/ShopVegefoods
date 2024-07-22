<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.*"%>
<%@ page import="dao.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
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
<style>
.carousel-control-prev, .carousel-control-next {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(0, 0, 0, 0.5);
	border: none;
	border-radius: 50%;
	color: #fff;
	width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
}

.carousel-control-prev {
	left: -20px;
}

.carousel-control-next {
	right: -20px;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	font-size: 20px;
}

.owl-carousel .item {
	position: relative;
}

.owl-carousel .item .product {
	margin: 10px;
}

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
}
</style>
</head>
<body class="goto-here">

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index">Vegefoods</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a href="index"
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
						<span class="mr-2"><a href="index">Home</a></span> <span
							class="mr-2"><a href="index.html">Product</a></span> <span>Product
							Single</span>
					</p>
					<h1 class="mb-0 bread">Product Single</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a href="images/${product.hinh1}" class="image-popup"><img
						src="images/${product.hinh1}" class="img-fluid"
						alt="${product.tenSP}"></a>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>${product.tenSP}</h3>
					<div class="rating d-flex">
						<p class="text-left mr-4">
							<a href="#" class="mr-2">5.0</a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a>
						</p>
						<p class="text-left mr-4">
							<a href="#" class="mr-2" style="color: #000;">100 <span
								style="color: #bbb;">Rating</span></a>
						</p>
						<p class="text-left">
							<a href="#" class="mr-2" style="color: #000;">500 <span
								style="color: #bbb;">Sold</span></a>
						</p>
					</div>
					<p class="price">
						<span>${product.giaBan} VNĐ</span>
					</p>

					<p>${product.moTa}</p>
					<div class="row mt-4">

						<div class="w-100"></div>
						<div class="input-group col-md-6 d-flex mb-3">
							<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="ion-ios-remove"></i>
								</button>
							</span> <input type="text" id="quantity" name="quantity"
								class="form-control input-number" value="1" min="1" max="100">
							<span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="">
									<i class="ion-ios-add"></i>
								</button>
							</span>
						</div>
						<div class="w-100"></div>
						<div class="col-md-12">
							<p style="color: #000;">Số lượng còn lại: ${product.soLuong}</p>
						</div>
					</div>
					<p>
						<a href="cart.html" class="btn btn-black py-3 px-5">Add to
							Cart</a>
					</p>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Products</span>
					<h2 class="mb-4">Related Products</h2>
				</div>
			</div>
			<div class="container position-relative">
				<div class="owl-carousel owl-theme">
					<c:forEach var="relatedProduct" items="${relatedProducts}">
						<div class="item">
							<div class="product">
								<a href="productDetail?productId=${relatedProduct.maSP}"
									class="img-prod"> <img class="img-fluid"
									src="images/${relatedProduct.hinh1}"
									alt="${relatedProduct.tenSP}">
									<div class="overlay"></div>
								</a>
								<div class="text py-3 pb-4 px-3 text-center">
									<h3>
										<a href="productDetail?productId=${relatedProduct.maSP}">${relatedProduct.tenSP}</a>
									</h3>
									<div class="d-flex">
										<div class="pricing">
											<p class="price">
												<span>${relatedProduct.giaBan} VNĐ</span>
											</p>
										</div>
									</div>
									<div class="bottom-area d-flex px-3">
										<div class="m-auto d-flex">
											<a href="#"
												class="add-to-cart d-flex justify-content-center align-items-center text-center">
												<span><i class="ion-ios-menu"></i></span>
											</a> <a href="#"
												class="buy-now d-flex justify-content-center align-items-center mx-1">
												<span><i class="ion-ios-cart"></i></span>
											</a> <a href="#"
												class="heart d-flex justify-content-center align-items-center">
												<span><i class="ion-ios-heart"></i></span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				</button>
				<button class="carousel-control-next" type="button">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
				</button>
			</div>
		</div>
	</section>



	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
		<div class="container py-4">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-6">
					<h2 style="font-size: 22px;" class="mb-0">Subcribe to our
						Newsletter</h2>
					<span>Get e-mail updates about our latest shops and special
						offers</span>
				</div>
				<div class="col-md-6 d-flex align-items-center">
					<form action="#" class="subscribe-form">
						<div class="form-group d-flex">
							<input type="text" class="form-control"
								placeholder="Enter email address"> <input type="submit"
								value="Subscribe" class="submit px-3">
						</div>
					</form>
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


	<script>
		$(document).ready(function() {
			var quantitiy = 0;
			$('.quantity-right-plus').click(function(e) {
				e.preventDefault();
				var quantity = parseInt($('#quantity').val());
				$('#quantity').val(quantity + 1);
			});

			$('.quantity-left-minus').click(function(e) {
				e.preventDefault();
				var quantity = parseInt($('#quantity').val());
				if (quantity > 1) {
					$('#quantity').val(quantity - 1);
				}
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			var owl = $(".owl-carousel");
			owl.owlCarousel({
				loop : true,
				margin : 10,
				nav : false,
				responsive : {
					0 : {
						items : 1
					},
					600 : {
						items : 2
					},
					1000 : {
						items : 4
					}
				}
			});

			$(".carousel-control-next").click(function() {
				owl.trigger('next.owl.carousel');
			});

			$(".carousel-control-prev").click(function() {
				owl.trigger('prev.owl.carousel');
			});
		});
	</script>




</body>
</html>
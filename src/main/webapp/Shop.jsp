<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.Product"%>
<%@ page import="entity.DanhMuc"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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
.product-category a {
	display: inline-block;
	padding: 10px 20px;
	color: #333;
	text-decoration: none;
}

.product-category a.active {
	background-color: #333;
	color: #fff;
	text-decoration: none;
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
#search-results {
    position: absolute;
    background: #fff;
    width: 250px;
    max-height: 300px;
    overflow-y: auto;
    display: none;
    z-index: 1000;
    margin-top: 260px;
    border-radius: 20px;
   
}
#search-results ul {
    list-style: none;
    padding: 0;
    margin: 0;
    border: 2px solid ;
  
}
#search-results ul li {
    padding: 10px;
    border-bottom: 2px solid #ccc;
    display: flex;
    align-items: center;  
}
#search-results ul li:last-child {
    border-bottom: none;
}
#search-results ul li img {
    width: 30px;  /* Chỉnh lại kích thước ảnh */
    height: 30px; /* Chỉnh lại kích thước ảnh */
    margin-right: 10px;
}
#search-results ul li a {
    text-decoration: none;
    color: #000;
    display: flex;
    flex-direction: column;
    
}
#search-results ul li a span {
    font-size: 14px;
}
.ftco-navbar-light .navbar-nav>.nav-item>.nav-link {
	padding-left: 0 !important; /* Loại bỏ padding-left */
}

.nav-profile img {
	width: 30px;
	height: 30px;
}

.nav-profile .dropdown-menu {
	width: 200px;
	padding: 10px;
	border-radius: 10px;
	background: #f8f9fa;
	border: none;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.nav-profile .dropdown-item {
	display: flex;
	align-items: center;
	padding: 10px 15px;
	color: #333;
	text-decoration: none;
	transition: background 0.3s;
}

.nav-profile .dropdown-item:hover {
	background: #e9ecef;
}

.nav-profile .dropdown-item i {
	margin-right: 10px;
	font-size: 18px;
}

.nav-profile .dropdown-header {
	text-align: center;
	padding: 10px 15px;
}

.nav-profile .dropdown-divider {
	margin: 5px 0;
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
					<li class="nav-item active"><a href="index" class="nav-link">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="product">Shop</a> <a
								class="dropdown-item" href="wishlist.html">Wishlist</a> <a
								class="dropdown-item" href="ProductSingle.jsp">Single
								Product</a> <a class="dropdown-item" href="Cart.jsp">Cart</a> <a
								class="dropdown-item" href="checkout.html">Checkout</a>
						</div></li>
					<li class="nav-item"><a href="About.jsp" class="nav-link">About</a></li>
					<li class="nav-item"><a href="Blog.jsp" class="nav-link">Blog</a></li>
					<li class="nav-item"><a href="Contact.jsp" class="nav-link">Contact</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0 mx-auto search-form"
					onsubmit="return false;">
					<input class="form-control search-input" type="search"
						id="search-query" placeholder="Bạn muốn chọn ăn gì?"
						aria-label="Search" onkeyup="searchProducts()">
					<button class="btn search-button" type="submit">
						<i class="fas fa-search"></i>
					</button>
					<div id="search-results">
						<ul style="border-radius: 20px;"></ul>
					</div>
				</form>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item cta cta-colored">
    <a href="cart" class="nav-link">
        <span class="icon-shopping_cart"></span>
        [<c:out value="${totalItems}" />]
    </a>
</li>

					<c:if test="${sessionScope.acc != null}">
						<li class="nav-item dropdown pe-3 nav-profile"><a
							class="nav-link nav-profile d-flex align-items-center pe-0"
							href="#" data-bs-toggle="dropdown"> <img
								src="images/profile-img.jpg" alt="Profile"
								class="rounded-circle"> <span style="margin-left: 10px"
								class="d-none d-md-block dropdown-toggle ps-2"> <c:set
										var="email" value="${sessionScope.acc.email}" /> <c:out
										value="${fn:substringBefore(email, '@')}" />
							</span>
						</a>
							<ul
								class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
								<li class="dropdown-header">
									<h6>
										<c:out value="${fn:substringBefore(email, '@')}" />
									</h6> <span> <c:choose>
											<c:when test="${sessionScope.acc.admin}">
                                                Admin
                                            </c:when>
											<c:when test="${sessionScope.acc.sell}">
                                                Bán hàng
                                            </c:when>
											<c:otherwise>
                                                Khách hàng
                                            </c:otherwise>
										</c:choose>
								</span>
								</li>

								<c:if test="${sessionScope.acc.admin == true}">
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item d-flex align-items-center"
										href="Admin.jsp"> <svg xmlns="http://www.w3.org/2000/svg"
												width="16" height="16" fill="currentColor"
												class="bi bi-people" viewBox="0 0 16 16">
  <path
													d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1zm-7.978-1L7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002-.014.002zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0M6.936 9.28a6 6 0 0 0-1.23-.247A7 7 0 0 0 5 9c-4 0-5 3-5 4q0 1 1 1h4.216A2.24 2.24 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816M4.92 10A5.5 5.5 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0m3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4" />
</svg> <span style="margin-left: 8px">Trang quản lý</span>
									</a></li>
								</c:if>


								<c:if test="${sessionScope.acc.sell == true}">
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item d-flex align-items-center"
										href="Admin.jsp"> <svg xmlns="http://www.w3.org/2000/svg"
												width="16" height="16" fill="currentColor"
												class="bi bi-basket3" viewBox="0 0 16 16">
  <path
													d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6z" />
</svg> <span style="margin-left: 8px">Trang quản lý</span>
									</a></li>

								</c:if>


								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item d-flex align-items-center"
									href="users-profile.html"> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
  <path
												d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492M5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0" />
  <path
												d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115z" />
</svg> <span style="margin-left: 8px">Account Settings</span>
								</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item d-flex align-items-center"
									href="pages-faq.html"> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-question-circle"
											viewBox="0 0 16 16">
  <path
												d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
  <path
												d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286m1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94" />
</svg> <span style="margin-left: 8px">Need Help?</span>
								</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item d-flex align-items-center"
									href="logout"> <svg xmlns="http://www.w3.org/2000/svg"
											width="16" height="16" fill="currentColor"
											class="bi bi-box-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
												d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z" />
  <path fill-rule="evenodd"
												d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z" />
</svg> <span style="margin-left: 8px"> Sign Out</span>
								</a></li>
							</ul></li>
					</c:if>
					<c:if test="${sessionScope.acc == null}">
						<li class="nav-item"><a href="Login.jsp" class="nav-link">
								<i class="fas fa-sign-in-alt"></i> Login
						</a></li>
					</c:if>
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
						<span class="mr-2"><a href="index">Home</a></span> <span>Products</span>
					</p>
					<h1 class="mb-0 bread">Products</h1>
				</div>
			</div>
		</div>
	</div>
	
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<ul class="product-category">
						<li><a href="category?maDanhMuc=all"
							class="${param.maDanhMuc == 'all' || param.maDanhMuc == null ? 'active' : ''}">All</a></li>
						<c:forEach items="${categories}" var="o">
							<li><a href="category?maDanhMuc=${o.maDanhMuc}"
								class="${param.maDanhMuc == o.maDanhMuc ? 'active' : ''}">${o.tenDanhMuc}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<div id="product-list" class="row">
				<c:forEach var="product" items="${products}">
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="product">
							<a href="productDetail?productId=${product.maSP}"
								class="img-prod"><img class="img-fluid"
								src="images/${product.hinh1}" alt="${product.tenSP}">
								<div class="overlay"></div> </a>
							<div class="text py-3 pb-4 px-3 text-center">
								<h3>
									<a href="productDetail?productId=${product.maSP}">${product.tenSP}</a>
								</h3>
								<div class="d-flex">
									<div class="pricing">
										<p class="price">
											<span class="price-sale">${product.giaBan} VNĐ</span>
										</p>
									</div>
								</div>
								<div class="bottom-area d-flex px-3">
									<div class="m-auto d-flex">
										<a href="productDetail?productId=${product.maSP}"
											class="add-to-cart d-flex justify-content-center align-items-center text-center">
											<span><i class="ion-ios-menu"></i></span>
										</a> 
										<a href="#"
													class="buy-now d-flex justify-content-center align-items-center mx-1"
													onclick="addToCart(event, '${product.maSP}')"> <span><i
														class="ion-ios-cart"></i></span>
												</a>
										 <a href="#"
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

			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<li><a href="#">&lt;</a></li>
							<li class="active"><span>1</span></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&gt;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
		<div class="container py-4">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-6">
					<h2 style="font-size: 22px;" class="mb-0">Subscribe to our
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
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Menu</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">Shop</a></li>
							<li><a href="#" class="py-2 d-block">About</a></li>
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
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
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
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
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
	<script src="js/main.js"></script>

<script>
function searchProducts() {
    var query = document.getElementById("search-query").value;
    if (query.length > 2) {
        $.ajax({
            url: 'ProductIndexServlet',
            type: 'get',
            data: { query: query },
            dataType: 'json',
            success: function(data) {
                var searchResults = $('#search-results ul');
                searchResults.empty();
                if (data.length > 0) {
                    data.forEach(function(product) {
                        searchResults.append(
                            '<li>' +
                                '<img src="images/' + product.hinh1 + '" alt="' + product.tenSP + '">' +
                                '<a href="productDetail?productId=' + product.maSP + '">' +
                                    '<span>' + product.tenSP + '</span>' +
                                    '<span>' + product.giaBan + ' VNĐ</span>' +
                                '</a>' +
                            '</li>'
                        );
                    });
                    $('#search-results').show();
                }
            }
        });
    } else {
        $('#search-results').hide();
    }
}
</script>
	<script>
		function addToCart(event, maSP) {
			event.preventDefault(); // Ngăn không cho trang tải lại
			$.ajax({
				url : 'addToCart',
				type : 'GET',
				data : {
					maSP : maSP,
					amount : 1
				},
				success : function(response) {
					// Xử lý kết quả thành công
					alert('Product added to cart successfully!');
					// Cập nhật số lượng sản phẩm trong giỏ hàng (nếu cần thiết)
					$('#cart-count').text(response.totalItems); // Giả sử bạn có một phần tử với id "cart-count" để hiển thị số lượng sản phẩm trong giỏ hàng
				},
				error : function(xhr, status, error) {
					// Xử lý kết quả lỗi
					alert('Error adding product to cart!');
				}
			});
		}
	</script>
</body>
</html>

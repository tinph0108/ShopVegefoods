<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.Product"%>
<%@ page import="entity.DanhMuc"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vegefoods</title>
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
                <form class="form-inline my-2 my-lg-0 mx-auto search-form" onsubmit="return false;">
                    <input class="form-control search-input" type="search" id="search-query"
                        placeholder="Bạn muốn chọn ăn gì?" aria-label="Search" onkeyup="searchProducts()">
                    <button class="btn search-button" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                    <div id="search-results">
                        <ul style="border-radius: 20px;"></ul>
                    </div>
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

    <section id="home-section" class="hero">
        <div class="home-slider owl-carousel">
            <div class="slider-item"
                style="background-image: url(images/bg_1.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div
                        class="row slider-text justify-content-center align-items-center"
                        data-scrollax-parent="true">

                        <div class="col-md-12 ftco-animate text-center">
                            <h1 class="mb-2">We serve Fresh Vegestables </h1>
                            <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
                            <p>
                                <a href="Shop.jsp" class="btn btn-primary">View Details</a>
                            </p>
                        </div>

                    </div>
                </div>
            </div>

            <div class="slider-item"
                style="background-image: url(images/bg_2.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div
                        class="row slider-text justify-content-center align-items-center"
                        data-scrollax-parent="true">

                        <div class="col-sm-12 ftco-animate text-center">
                            <h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
                            <h2 class="subheading mb-4">We deliver organic vegetables
                                &amp; fruits</h2>
                            <p>
                                <a href="#" class="btn btn-primary">View Details</a>
                            </p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section">
        <div class="container">
            <div class="row no-gutters ftco-services">
                <div
                    class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div
                            class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-shipped"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Free Shipping</h3>
                            <span>On order over $100</span>
                        </div>
                    </div>
                </div>
                <div
                    class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div
                            class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-diet"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Always Fresh</h3>
                            <span>Product well package</span>
                        </div>
                    </div>
                </div>
                <div
                    class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div
                            class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-award"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Superior Quality</h3>
                            <span>Quality Products</span>
                        </div>
                    </div>
                </div>
                <div
                    class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
                    <div class="media block-6 services mb-md-0 mb-4">
                        <div
                            class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
                            <span class="flaticon-customer-service"></span>
                        </div>
                        <div class="media-body">
                            <h3 class="heading">Support</h3>
                            <span>24/7 Support</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section ftco-category ftco-no-pt">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-6 order-md-last align-items-stretch d-flex">
                            <div
                                class="category-wrap-2 ftco-animate img align-self-stretch d-flex"
                                style="background-image: url(images/category.jpg);">
                                <div class="text text-center">
                                    <h2>Vegetables</h2>
                                    <p>Protect the health of every home</p>
                                    <p>
                                        <a href="Shop.jsp" class="btn btn-primary">Shop now</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div
                                class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
                                style="background-image: url(images/category-1.jpg);">
                                <div class="text px-3 py-1">
                                    <h2 class="mb-0">
                                        <a href="#">Fruits</a>
                                    </h2>
                                </div>
                            </div>
                            <div
                                class="category-wrap ftco-animate img d-flex align-items-end"
                                style="background-image: url(images/category-2.jpg);">
                                <div class="text px-3 py-1">
                                    <h2 class="mb-0">
                                        <a href="#">Vegetables</a>
                                    </h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div
                        class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
                        style="background-image: url(images/category-3.jpg);">
                        <div class="text px-3 py-1">
                            <h2 class="mb-0">
                                <a href="#">Juices</a>
                            </h2>
                        </div>
                    </div>
                    <div class="category-wrap ftco-animate img d-flex align-items-end"
                        style="background-image: url(images/category-4.jpg);">
                        <div class="text px-3 py-1">
                            <h2 class="mb-0">
                                <a href="#">Dried</a>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center mb-3 pb-3">
                <div class="col-md-12 heading-section text-center ftco-animate">
                    <span class="subheading">Featured Products</span>
                    <h2 class="mb-4">Our Products</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
                </div>
            </div>
        </div>
        <div class="container">
            <div id="product-list" class="row">
                <c:choose>
                    <c:when test="${not empty products}">
                        <c:forEach var="product" items="${products}">
                            <div class="col-md-6 col-lg-3 ftco-animate">
                                <div class="product">
                                    <a href="productDetail?productId=${product.maSP}" class="img-prod">
                                        <img class="img-fluid" src="images/${product.hinh1}" alt="${product.tenSP}">
                                        <div class="overlay"></div>
                                    </a>
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
                                                <a href="productDetail?productId=${product.maSP}" class="add-to-cart d-flex justify-content-center align-items-center text-center">
                                                    <span><i class="ion-ios-menu"></i></span>
                                                </a>
                                                <a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                                    <span><i class="ion-ios-cart"></i></span>
                                                </a>
                                                <a href="#" class="heart d-flex justify-content-center align-items-center">
                                                    <span><i class="ion-ios-heart"></i></span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col-md-12">
                            <p class="text-center">Không có sản phẩm này</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>

    <section class="ftco-section testimony-section">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section ftco-animate text-center">
                    <span class="subheading">Testimony</span>
                    <h2 class="mb-4">Our satisfied customer says</h2>
                    <p>Far far away, behind the word mountains, far from the
                        countries Vokalia and Consonantia, there live the blind texts.
                        Separated they live in</p>
                </div>
            </div>
            <div class="row ftco-animate">
                <div class="col-md-12">
                    <div class="carousel-testimony owl-carousel">
                        <div class="item">
                            <div class="testimony-wrap p-4 pb-5">
                                <div class="user-img mb-5"
                                    style="background-image: url(images/person_1.jpg)">
                                    <span
                                        class="quote d-flex align-items-center justify-content-center">
                                        <i class="icon-quote-left"></i>
                                    </span>
                                </div>
                                <div class="text text-center">
                                    <p class="mb-5 pl-4 line">Far far away, behind the word
                                        mountains, far from the countries Vokalia and Consonantia,
                                        there live the blind texts.</p>
                                    <p class="name">Garreth Smith</p>
                                    <span class="position">Marketing Manager</span>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimony-wrap p-4 pb-5">
                                <div class="user-img mb-5"
                                    style="background-image: url(images/person_2.jpg)">
                                    <span
                                        class="quote d-flex align-items-center justify-content-center">
                                        <i class="icon-quote-left"></i>
                                    </span>
                                </div>
                                <div class="text text-center">
                                    <p class="mb-5 pl-4 line">Far far away, behind the word
                                        mountains, far from the countries Vokalia and Consonantia,
                                        there live the blind texts.</p>
                                    <p class="name">Garreth Smith</p>
                                    <span class="position">Interface Designer</span>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimony-wrap p-4 pb-5">
                                <div class="user-img mb-5"
                                    style="background-image: url(images/person_3.jpg)">
                                    <span
                                        class="quote d-flex align-items-center justify-content-center">
                                        <i class="icon-quote-left"></i>
                                    </span>
                                </div>
                                <div class="text text-center">
                                    <p class="mb-5 pl-4 line">Far far away, behind the word
                                        mountains, far from the countries Vokalia and Consonantia,
                                        there live the blind texts.</p>
                                    <p class="name">Garreth Smith</p>
                                    <span class="position">UI Designer</span>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimony-wrap p-4 pb-5">
                                <div class="user-img mb-5"
                                    style="background-image: url(images/person_1.jpg)">
                                    <span
                                        class="quote d-flex align-items-center justify-content-center">
                                        <i class="icon-quote-left"></i>
                                    </span>
                                </div>
                                <div class="text text-center">
                                    <p class="mb-5 pl-4 line">Far far away, behind the word
                                        mountains, far from the countries Vokalia and Consonantia,
                                        there live the blind texts.</p>
                                    <p class="name">Garreth Smith</p>
                                    <span class="position">Web Developer</span>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="testimony-wrap p-4 pb-5">
                                <div class="user-img mb-5"
                                    style="background-image: url(images/person_1.jpg)">
                                    <span
                                        class="quote d-flex align-items-center justify-content-center">
                                        <i class="icon-quote-left"></i>
                                    </span>
                                </div>
                                <div class="text text-center">
                                    <p class="mb-5 pl-4 line">Far far away, behind the word
                                        mountains, far from the countries Vokalia and Consonantia,
                                        there live the blind texts.</p>
                                    <p class="name">Garreth Smith</p>
                                    <span class="position">System Analyst</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <hr>

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



</body>
</html>

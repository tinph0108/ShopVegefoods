<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Order Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
}

.container {
	margin-top: 30px;
}

.sherah-adashboard {
	background: #ffffff;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.sherah-breadcrumb__title {
	font-size: 24px;
	font-weight: bold;
	color: #333;
}

.sherah-breadcrumb__list {
	list-style: none;
	padding: 0;
}

.sherah-breadcrumb__list li {
	display: inline;
	font-size: 14px;
}

.sherah-breadcrumb__list li+li:before {
	content: '>';
	padding: 0 10px;
}

.sherah-table {
	margin-top: 25px;
}

.sherah-table__main {
	width: 100%;
	border-collapse: collapse;
}

.sherah-table__head th {
	background-color: #f1f1f1;
	padding: 10px;
	border-bottom: 2px solid #ddd;
}

.sherah-table__body td {
	padding: 10px;
	border-bottom: 1px solid #eee;
}

.form-control-quantity {
	width: 60px;
	display: inline;
}

.form-update-btn {
	background: none;
	border: none;
	color: #007bff;
}

.form-update-btn:hover {
	color: #0056b3;
}
</style>
</head>
<body>
	<section class="sherah-adashboard sherah-show">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="sherah-body">
						<!-- Dashboard Inner -->
						<div class="sherah-dsinner">
							<div class="row mg-top-30">
								<div class="col-12 sherah-flex-between">
									<!-- Sherah Breadcrumb -->
									<div class="sherah-breadcrumb">
										<h2 class="sherah-breadcrumb__title">Order Details</h2>
										<ul class="sherah-breadcrumb__list">
											<li><a href="orderlist">Order List</a></li>
											<li class="active"><a href="#">Order Details</a></li>
										</ul>
									</div>
									<!-- End Sherah Breadcrumb -->
								</div>
							</div>
							<div
								class="sherah-table sherah-page-inner sherah-border sherah-default-bg mg-top-25">
								<h4>Order #${orderProductDetails.order.orderID}</h4>
								<p>Customer: ${orderProductDetails.order.firstName}
									${orderProductDetails.order.lastName}</p>
								<p>Address: ${orderProductDetails.order.address}</p>
								<p>Phone: ${orderProductDetails.order.phone}</p>
								<p>Email: ${orderProductDetails.order.email}</p>
								<p>Order Date: ${orderProductDetails.order.orderDate}</p>
								<p>Total Amount: ${orderProductDetails.order.totalAmount}</p>

								<h4>Items</h4>
								<table class="sherah-table__main">
									<thead class="sherah-table__head">
										<tr>
											<th>Product</th>
											<th>Product Name</th>
											<th>Price</th>
											<th>Quantity</th>
											<th>Total Amount</th>

										</tr>
									</thead>
									<tbody class="sherah-table__body">
										<c:forEach var="product"
											items="${orderProductDetails.products}">
											<tr>
												<td><img src="images/${product.hinh1}"
													alt="Product Image" style="width: 50px;"></td>
												<td>${product.tenSP}</td>
												<td>${product.giaBan}</td>
												<td>
													<form action="orderdetails" method="post"
														style="display: inline;">
														<input type="hidden" name="orderID"
															value="${orderProductDetails.order.orderID}"> <input
															type="hidden" name="maSP" value="${product.maSP}">
														<input type="number" name="quantity"
															class="form-control form-control-quantity"
															value="${product.soLuong}">
														<button type="submit" class="form-update-btn">
															<i class="fas fa-sync-alt"></i>
														</button>
													</form>
												</td>
												<td>${product.giaBan * product.soLuong}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

								<button type="button" class="btn btn-back"
									onclick="window.history.back();">
									<i class="fas fa-arrow-left"></i> Back
								</button>

							</div>
						</div>
						<!-- End Dashboard Inner -->
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>

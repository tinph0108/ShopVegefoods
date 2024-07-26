<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Order Management</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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

.sherah-btn {
	background-color: #09ad95;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	text-decoration: none;
	transition: background-color 0.3s;
}

.sherah-btn:hover {
	background-color: #079f87;
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

.sherah-table__status {
	display: inline-block;
	padding: 5px 10px;
	border-radius: 15px;
	font-size: 12px;
}

.sherah-color2 {
	color: #09ad95;
}

.sherah-color2__bg--opactity {
	background-color: rgba(9, 173, 149, 0.1);
}

.sherah-color3__bg--opactity {
	background-color: rgba(255, 193, 7, 0.1);
}

.sherah-color4__bg--opactity {
	background-color: rgba(220, 53, 69, 0.1);
}

.action-btn {
	padding: 5px 10px;
	font-size: 14px;
	border: none;
	border-radius: 5px;
	color: white;
	text-decoration: none;
	display: inline-block;
	margin-right: 5px;
}

.edit-btn {
	background-color: #007bff;
}

.edit-btn:hover {
	background-color: #0056b3;
}

.view-btn {
	background-color: #28a745;
}

.view-btn:hover {
	background-color: #218838;
}

.action-icons {
	display: flex;
	justify-content: space-around;
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
										<h2 class="sherah-breadcrumb__title">Order list</h2>
										<ul class="sherah-breadcrumb__list">
											<li><a href="#">Home</a></li>
											<li class="active"><a href="orderlist">Order List</a></li>
										</ul>
									</div>
									<!-- End Sherah Breadcrumb -->
								
								</div>
							</div>
							<div
								class="sherah-table sherah-page-inner sherah-border sherah-default-bg mg-top-25">
								<table class="sherah-table__main">
									<thead class="sherah-table__head">
										<tr>
											<th>Order ID</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Address</th>
											<th>Phone</th>
											<th>Email</th>
											<th>Order Date</th>
											<th>Total Amount</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody class="sherah-table__body">
										<c:forEach var="order" items="${listOrder}">
											<tr>
												<td>${order.orderID}</td>
												<td>${order.firstName}</td>
												<td>${order.lastName}</td>
												<td>${order.address}</td>
												<td>${order.phone}</td>
												<td>${order.email}</td>
												<td>${order.orderDate}</td>
												<td>${order.totalAmount}</td>
												<td>
													<div class="action-icons">
														<a href="editOrder?id=${order.orderID}"
															class="action-btn edit-btn"> <i class="fas fa-edit"></i>
														</a>
														<a href="orderdetails?orderID=${order.orderID}"
															class="sherah-table__action sherah-color2 sherah-color3__bg--opactity">
																<i class="fas fa-eye"></i>
														</a>
													</div>
												</td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
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

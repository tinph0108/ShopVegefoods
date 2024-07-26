<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Order</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
    .form-group {
        margin-bottom: 15px;
    }
    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }
    .btn-secondary {
        background-color: #6c757d;
        border-color: #6c757d;
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
                                        <h2 class="sherah-breadcrumb__title">Edit Order</h2>
                                        <ul class="sherah-breadcrumb__list">
                                            <li><a href="orderlist">Order List</a></li>
                                            <li class="active"><a href="#">Edit Order</a></li>
                                        </ul>
                                    </div>
                                    <!-- End Sherah Breadcrumb -->
                                </div>
                            </div>
                            <div class="sherah-table sherah-page-inner sherah-border sherah-default-bg mg-top-25">
                                <form action="updateOrder" method="post">
                                    <input type="hidden" name="orderID" value="${order.orderID}">
                                    <div class="form-group">
                                        <label for="firstName">First Name</label>
                                        <input type="text" class="form-control" id="firstName" name="firstName" value="${order.firstName}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="lastName">Last Name</label>
                                        <input type="text" class="form-control" id="lastName" name="lastName" value="${order.lastName}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <input type="text" class="form-control" id="address" name="address" value="${order.address}" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input type="text" class="form-control" id="phone" name="phone" value="${order.phone}" required>
                                    </div>
                                   
                                    <button type="button" class="btn btn-secondary" onclick="window.history.back();">Cancel</button>
                                     <button type="submit" class="btn btn-primary">Save</button>
                                </form>
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

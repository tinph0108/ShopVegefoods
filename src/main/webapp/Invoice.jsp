<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Invoice</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    .sherah-adashboard {
        padding: 30px;
        background: #f7f7f7;
    }
    .sherah-body {
        background: #fff;
        border-radius: 5px;
        padding: 20px;
    }
    .sherah-dsinner {
        margin-top: 20px;
    }
    .sherah-breadcrumb {
        margin-bottom: 20px;
    }
    .sherah-breadcrumb h2 {
        margin: 0;
        font-size: 24px;
    }
    .sherah-breadcrumb__list {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .sherah-breadcrumb__list li {
        display: inline;
        margin-right: 5px;
    }
    .sherah-breadcrumb__list li a {
        color: #333;
        text-decoration: none;
    }
    .sherah-breadcrumb__list li.active a {
        color: #007bff;
    }
    .sherah-btn {
        background: #007bff;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        margin-top: 10px;
    }
    .sherah-btn:hover {
        background: #0056b3;
    }
    .sherah-invoice-header {
        text-align: center;
        margin-bottom: 30px;
    }
    .sherah-invoice-header img {
        width: 100px;
    }
    .sherah-invoice-form__title {
        font-weight: bold;
        margin-bottom: 10px;
    }
    .sherah-invoice-form__text {
        margin: 0;
    }
    .sherah-table__main {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
    }
    .sherah-table__head {
        background: #007bff;
        color: #fff;
    }
    .sherah-table__head th {
        padding: 10px;
        text-align: left;
    }
    .sherah-table__body tr {
        border-bottom: 1px solid #ddd;
    }
    .sherah-table__body td {
        padding: 10px;
    }
    .order-totals {
        margin-top: 20px;
    }
    .order-totals__list {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .order-totals__list li {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
    }
    .order-totals__amount {
        font-weight: bold;
    }
    .sherah-dflex {
        display: flex;
    }
    .sherah-dflex-gap-30 {
        gap: 30px;
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
                                        <h2 class="sherah-breadcrumb__title">Invoice</h2>
                                        <ul class="sherah-breadcrumb__list"> 
                                            <li><a href="#">Home</a></li>
                                            <li class="active"><a href="invoice.jsp">Invoice</a></li>
                                        </ul>
                                    </div>
                                    <!-- End Sherah Breadcrumb -->
                                    <a href="order-details" class="sherah-btn sherah-gbcolor">Add New Vendor</a>
                                </div>
                            </div>
                            <div class="sherah-page-inner sherah-border sherah-default-bg mg-top-25">
                                <div class="sherah-invoice-header">
                                    <a href="index.html"> <img class="sherah-logo__main" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgsVJ-cqIVZS30wVa5yEXB8X6dhqiyRyq7M-dm3frI6RENZm70In9PBPwYHPqhv1J_h9M&usqp=CAU" alt="#"></a>
                                    <p class="sherah-invoice-header__id sherah-color1">Order #BD80288</p>
                                </div>
                                <!-- Sherah Invoice -->
                                <div class="sherah-invoice-form mg-btm-70">
                                    <div class="sherah-invoice-form__first">
                                        <div class="sherah-invoice-form__single">
                                            <h4 class="sherah-invoice-form__title">Billed To: </h4>
                                            <p class="sherah-invoice-form__text">John Smith</p>
                                            <p class="sherah-invoice-form__text">Apt. 4B</p>
                                            <p class="sherah-invoice-form__text">Springfield, ST 54321</p>
                                        </div>
                                        <div class="sherah-invoice-form__single sherah-invoice-form__single--right">
                                            <h4 class="sherah-invoice-form__title">Shipped To:</h4>
                                            <p class="sherah-invoice-form__text">Kenny Rigdon</p>
                                            <p class="sherah-invoice-form__text">1234 Main</p>
                                            <p class="sherah-invoice-form__text">Apt. 4B</p>
                                            <p class="sherah-invoice-form__text">Springfield, ST 54321</p>
                                        </div>
                                    </div>
                                    <div class="sherah-invoice-form__first">
                                        <div class="sherah-invoice-form__single">
                                            <h4 class="sherah-invoice-form__title">Payment Method:</h4>
                                            <p class="sherah-invoice-form__text">Visa ending **** 4242</p>
                                            <p class="sherah-invoice-form__text">sherahinfo@email.com</p>
                                        </div>
                                        <div class="sherah-invoice-form__single sherah-invoice-form__single--right">
                                            <h4 class="sherah-invoice-form__title">Order Date:</h4>
                                            <p class="sherah-invoice-form__text">November 02, 2022</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Sherah Invoice -->
                                <div class="row">
                                    <div class="col-12">
                                        <div class="sherah-table-order">
                                            <table id="sherah-table__orderv1" class="sherah-table__main sherah-table__main--orderv1">
                                                <thead class="sherah-table__head">
                                                    <tr>
                                                        <th class="sherah-table__column-1 sherah-table__h1">No</th>
                                                        <th class="sherah-table__column-2 sherah-table__h2">Products name</th>
                                                        <th class="sherah-table__column-3 sherah-table__h3">Price</th>
                                                        <th class="sherah-table__column-4 sherah-table__h4">Quantity</th>
                                                        <th class="sherah-table__column-4 sherah-table__h4">Total Amount</th>
                                                    </tr>
                                                </thead> 
                                                <tbody class="sherah-table__body">
                                                    <tr>
                                                        <td class="sherah-table__column-4 sherah-table__data-1">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc">01</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-2 sherah-table__data-2">
                                                            <div class="sherah-table__product-name">
                                                                <h4 class="sherah-table__product-name--title">Polka Dots Woman Dress</h4>
                                                                <p class="sherah-table__product-name--text">Color : Black</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-3 sherah-table__data-3">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc">$612</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-4 sherah-table__data-4">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc">2</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-4 sherah-table__data-4">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc"> $1,224</p>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="sherah-table__column-4 sherah-table__data-1">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc">02</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-2 sherah-table__data-2">
                                                            <div class="sherah-table__product-name">
                                                                <h4 class="sherah-table__product-name--title">Sweater For Women</h4>
                                                                <p class="sherah-table__product-name--text">Color : Light White</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-3 sherah-table__data-3">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc">$120</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-4 sherah-table__data-4">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc">1</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-4 sherah-table__data-4">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc">$120</p>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="sherah-table__column-4 sherah-table__data-1">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc">03</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-2 sherah-table__data-2">
                                                            <div class="sherah-table__product-name">
                                                                <h4 class="sherah-table__product-name--title">Convert for man shoe</h4>
                                                                <p class="sherah-table__product-name--text">Color : Black & Orange</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-3 sherah-table__data-3">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc">$450</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-4 sherah-table__data-4">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc">3</p>
                                                            </div>
                                                        </td>
                                                        <td class="sherah-table__column-4 sherah-table__data-4">
                                                            <div class="sherah-table__product-content">
                                                                <p class="sherah-table__product-desc">$1,350</p>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div class="order-totals">
                                                <ul class="order-totals__list">
                                                    <li class="order-totals__list--sub"><span>Subtotal</span> <span class="order-totals__amount">$790</span></li>
                                                    <li><span>Store Credit</span> <span class="order-totals__amount">$-20</span></li>
                                                    <li><span>Delivery Charges</span> <span class="order-totals__amount">$30</span></li>
                                                    <li><span>Shipping</span> <span class="order-totals__amount">$25</span></li>
                                                    <li><span>Vat Tax</span> <span class="order-totals__amount">$35</span></li>
                                                    <li class="order-totals__bottom"><span>Total</span> <span class="order-totals__amount">$35</span></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 mg-top-30">
                                        <h4 class="mg-btm-10">Notes: </h4> 
                                        <p>All accounts are to be paid within 7 days from receipt of invoice. To be paid by cheque or credit card or direct payment online. If account is not paid within 7 days</p>
                                        <p>the credits details supplied as confirmation of work undertaken will be charged the agreed quoted fee noted above.</p> 
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group mg-top-30 sherah-dflex sherah-dflex-gap-30 justify-content-end">
                                            <a href="invoice-print.html" class="sherah-btn sherah-btn__secondary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24.123" height="24.122" viewBox="0 0 24.123 24.122">
                                                <g id="Icon" transform="translate(-24.948 -124.926)">
                                                  <path id="Path_1022" data-name="Path 1022" d="M29.142,143.747c-.357-.016-.638-.02-.918-.043a3.509,3.509,0,0,1-3.27-3.544q-.013-2.778,0-5.556a3.515,3.515,0,0,1,3.424-3.59c.232-.012.465,0,.765,0,0-.739-.015-1.425.005-2.109a6.3,6.3,0,0,1,.132-1.351,3.455,3.455,0,0,1,3.339-2.616q4.379-.02,8.758,0a3.476,3.476,0,0,1,3.469,3.24c.055.75.023,1.506.029,2.259,0,.169,0,.338,0,.541.36.02.67.028.977.055a3.5,3.5,0,0,1,3.209,3.457c.017,1.883.01,3.767,0,5.65a3.513,3.513,0,0,1-3.39,3.575c-.245.015-.492,0-.8,0,0,.361,0,.654,0,.948-.005.816.026,1.634-.028,2.447a2.041,2.041,0,0,1-2.059,1.928q-5.768.019-11.536,0a2.076,2.076,0,0,1-2.1-2.1c-.032-.878-.009-1.758-.01-2.636C29.142,144.138,29.142,143.968,29.142,143.747Zm15.764-1.48A2.192,2.192,0,0,0,47.65,139.9q0-2.566,0-5.132a3.165,3.165,0,0,0-.049-.654,2.133,2.133,0,0,0-2.328-1.69q-8.17,0-16.339,0c-.173,0-.346,0-.518.008a2.093,2.093,0,0,0-2.044,2.151q-.015,2.778,0,5.556a2.139,2.139,0,0,0,2.74,2.094v-2.244c-.17-.016-.31-.023-.448-.044a.669.669,0,0,1-.636-.692.679.679,0,0,1,.674-.7,3.479,3.479,0,0,1,.376-.009H44.944a2.941,2.941,0,0,1,.423.015.7.7,0,0,1,.032,1.38c-.152.027-.308.036-.492.056ZM43.458,140H30.564c0,2.335-.007,4.625.006,6.915a.675.675,0,0,0,.765.709q5.672.008,11.344,0c.524,0,.771-.276.775-.849.009-1.3,0-2.6,0-3.907C43.458,141.93,43.458,140.99,43.458,140Zm-12.839-9.04H43.431c0-.949.047-1.86-.012-2.763a2,2,0,0,0-1.983-1.844q-4.421-.031-8.843,0a1.953,1.953,0,0,0-1.949,1.6A28.445,28.445,0,0,0,30.619,130.963Z" fill="#fff"/>
                                                  <path id="Path_1023" data-name="Path 1023" d="M59.406,222.84c-.36,0-.721.014-1.08,0a.693.693,0,0,1-.732-.694.679.679,0,0,1,.717-.706c.735-.02,1.471-.019,2.206,0a.685.685,0,0,1,.732.692.7.7,0,0,1-.717.712c-.031,0-.063,0-.094,0H59.406Z" transform="translate(-29.571 -87.407)" fill="#fff"/>
                                                  <path id="Path_1024" data-name="Path 1024" d="M128.164,302.866c-.58,0-1.159.008-1.738,0-.525-.009-.825-.267-.833-.691-.009-.443.3-.716.852-.719q1.738-.012,3.477,0c.525,0,.825.266.833.691.009.443-.3.712-.852.72C129.323,302.873,128.743,302.866,128.164,302.866Z" transform="translate(-91.165 -159.896)" fill="#fff"/>
                                                  <path id="Path_1025" data-name="Path 1025" d="M128.164,334.867c-.579,0-1.159.008-1.738,0-.525-.009-.825-.267-.834-.691-.009-.443.3-.716.852-.72q1.738-.012,3.477,0c.525,0,.825.266.834.69.009.443-.3.712-.852.72C129.323,334.874,128.744,334.867,128.164,334.867Z" transform="translate(-91.165 -188.883)" fill="#fff"/>
                                                </g>
                                              </svg>
                                              Print</a>
                                            <button type="submit" class="sherah-btn sherah-btn__primary">Submit Now</button>
                                        </div>
                                    </div>
                                </div>     
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

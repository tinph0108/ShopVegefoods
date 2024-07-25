<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editProduct" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="window.history.back()">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Mã sản phẩm</label>
                                            <input value="${detail.maSP}" name="maSP" type="text" class="form-control" readonly required>
                                        </div>
                                        <div class="form-group">
                                            <label>Tên sản phẩm</label>
                                            <input value="${detail.tenSP}" name="name" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Hình (URL)</label>
                                            <input value="${detail.hinh1}" name="hinh1" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Hình 2 (URL)</label>
                                            <input value="${detail.hinh2}" name="hinh2" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Hình 3 (URL)</label>
                                            <input value="${detail.hinh3}" name="hinh3" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Hình 4 (URL)</label>
                                            <input value="${detail.hinh4}" name="hinh4" type="text" class="form-control" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Giá bán</label>
                                            <input value="${detail.giaBan}" name="price" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Đơn Vị Tính</label>
                                            <input value="${detail.donViTinh}" name="donViTinh" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Khối lượng</label>
                                            <div class="input-group quantity-input">
                                                <input value="${detail.khoiLuong}" name="khoiLuong" type="number" class="form-control form-control-sm" min="1" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Số lượng</label>
                                            <div class="input-group quantity-input">
                                                <input value="${detail.soLuong}" name="soLuong" type="number" class="form-control form-control-sm" min="1" max="100" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Mô tả</label>
                                            <textarea name="moTa" class="form-control" required>${detail.moTa}</textarea>
                                        </div>
                                       	<div class="form-group">
									<label>Danh mục</label> <select name="category"
										class="form-select" aria-label="Default select example">
										<c:forEach items="${categories}" var="o">
                                                    <option value="${o.maDanhMuc}" ${o.maDanhMuc == detail.danhMuc.maDanhMuc ? 'selected' : ''}>${o.tenDanhMuc}</option>
										</c:forEach>
									</select>
								</div>
                                        <div class="form-group">
                                            <label>Tình trạng</label>
                                            <input value="${detail.tinhTrang}" name="tinhTrang" type="text" class="form-control" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                            <input type="button" class="btn btn-default" value="Cancel" onclick="window.history.back()">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>

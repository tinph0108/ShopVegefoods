<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manager Product</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/manager.css" rel="stylesheet" type="text/css" />
<style>
img {
	width: 200px;
	height: 120px;
}

.quantity-input {
	display: flex;
	align-items: center;
}

.quantity-input .btn-sm {
	height: 30px;
	width: 30px;
	padding: 0;
	font-size: 14px;
}

.quantity-input .form-control-sm {
	height: 30px;
	width: 90px;
	text-align: center;
	padding: 0;
	font-size: 14px;
}
</style>
<body>
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Manage <b>Product</b>
						</h2>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success"
							data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add
								New Product</span></a> <a href="#deleteEmployeeModal"
							class="btn btn-danger" data-toggle="modal"><i
							class="material-icons">&#xE15C;</i> <span>Delete</span></a>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th><span class="custom-checkbox"> <input
								type="checkbox" id="selectAll"> <label for="selectAll"></label>
						</span></th>
						<th>ID</th>
						<th>Name</th>
						<th>Image</th>
						<th>Price</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listP}" var="o">
						<tr>
							<td><span class="custom-checkbox"> <input
									type="checkbox" id="checkbox1" name="options[]" value="1">
									<label for="checkbox1"></label>
							</span></td>
							<td>${o.maSP}</td>
							<td>${o.tenSP}</td>
							<td><c:choose>
									<c:when test="${o.hinh1.startsWith('http')}">
										<img src="${o.hinh1}">
									</c:when>
									<c:otherwise>
										<img src="images/${o.hinh1}">
									</c:otherwise>
								</c:choose></td>
							<td>${o.giaBan}VND</td>
							<td><a href="loadProduct?pid=${o.maSP}" class="edit"
								data-toggle="modal"><i class="material-icons"
									data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a href="#"
								onclick="confirmDelete('deleteProduct?pid=${o.maSP}')"
								class="delete"><i class="material-icons"
									data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="clearfix">
				<div class="hint-text">
					Showing <b>5</b> out of <b>25</b> entries
				</div>
				<ul class="pagination">
					<li class="page-item disabled"><a href="#">Previous</a></li>
					<li class="page-item active"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item"><a href="#" class="page-link">3</a></li>
					<li class="page-item"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">5</a></li>
					<li class="page-item"><a href="#" class="page-link">Next</a></li>
				</ul>
			</div>
		</div>
		<a href="#"><button type="button" class="btn btn-primary" onclick="window.history.back()">Back
				to page Admin</button>
	</div>
	<!-- Edit Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="addProduct	" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Add Product</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>Mã sản phẩm</label> <input name="maSP" type="text"
										class="form-control" required>
								</div>
								<div class="form-group">
									<label>Tên sản phẩm</label> <input name="name" type="text"
										class="form-control" required>
								</div>
								<div class="form-group">
									<label>Hình (URL)</label> <input name="hinh1" type="text"
										class="form-control" required>
								</div>
								<div class="form-group">
									<label>Hình 2 (URL)</label> <input name="hinh2" type="text"
										class="form-control" required>
								</div>
								<div class="form-group">
									<label>Hình 3 (URL)</label> <input name="hinh3" type="text"
										class="form-control" required>
								</div>
								<div class="form-group">
									<label>Hình 4 (URL)</label> <input name="hinh4" type="url"
										class="form-control" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>Giá bán</label> <input name="price" type="text"
										class="form-control" required>
								</div>
								<div class="form-group">
									<label>Đơn Vị Tính</label> <input name="donViTinh" type="text"
										class="form-control" required>
								</div>
								<div class="form-group">
									<label>Khối lượng</label>
									<div class="input-group quantity-input">
										<input name="khoiLuong" type="number"
											class="form-control form-control-sm" value="1000" min="1"
											required>
									</div>
								</div>
								<div class="form-group">
									<label>Số lượng</label>
									<div class="input-group quantity-input">
										<input name="soLuong" type="number"
											class="form-control form-control-sm" value="1" min="1"
											max="100" required>
									</div>
								</div>
								<div class="form-group">
									<label>Mô tả</label>
									<textarea name="moTa" class="form-control" required></textarea>
								</div>
								<div class="form-group">
									<label>Danh mục</label> <select name="category"
										class="form-select" aria-label="Default select example">
										<c:forEach items="${categories}" var="o">
											<option value="${o.maDanhMuc}">${o.tenDanhMuc}</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label>Tình trạng</label> <input name="tinhTrang" type="text"
										class="form-control" required>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>



	<!-- Edit Modal HTML -->
<div id="editEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="editProduct" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Mã sản phẩm</label>
                                <input name="maSP" type="text" class="form-control"  required>
                            </div>
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input name="name" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Hình (URL)</label>
                                <input name="hinh1" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Hình 2 (URL)</label>
                                <input name="hinh2" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Hình 3 (URL)</label>
                                <input name="hinh3" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Hình 4 (URL)</label>
                                <input name="hinh4" type="url" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Giá bán</label>
                                <input name="price" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Đơn Vị Tính</label>
                                <input name="donViTinh" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Khối lượng</label>
                                <div class="input-group quantity-input">
                                    <input name="khoiLuong" type="number" class="form-control form-control-sm" value="1000" min="1" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Số lượng</label>
                                <div class="input-group quantity-input">
                                    <input name="soLuong" type="number" class="form-control form-control-sm" value="1" min="1" max="100" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea name="moTa" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Danh mục</label>
                                <select name="category" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${categories}" var="o">
                                        <option value="${o.maDanhMuc}">${o.tenDanhMuc}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Tình trạng</label>
                                <input name="tinhTrang" type="text" class="form-control" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-info" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>

	<!-- Delete Modal HTML -->
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h4 class="modal-title">Delete Product</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Are you sure you want to delete this Product?</p>
						<p class="text-warning">
							<small>This action cannot be undone.</small>
						</p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-danger" value="Delete">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="js/manager.js" type="text/javascript"></script>
	<script>
		function confirmDelete(url) {
			if (confirm("Are you sure you want to delete this product?")) {
				window.location.href = url;
			}
		}
	</script>
</body>
</html>
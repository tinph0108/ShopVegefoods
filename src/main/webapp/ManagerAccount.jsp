<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Accounts</title>
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
<style>
body {
	font-family: 'Roboto', sans-serif;
	background: #f5f5f5;
}

.table-wrapper {
	margin: 30px auto;
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
	max-width: 1000px;
}

.table-title {
	padding-bottom: 15px;
	background: #4CAF50;
	color: #fff;
	padding: 16px 30px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn {
	float: right;
	color: #fff;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

.table-responsive {
	margin: 30px 0;
}

.table-responsive table {
	width: 100%;
	margin-bottom: 20px;
	border-collapse: separate;
	border-spacing: 0;
}

.table-responsive table th, .table-responsive table td {
	text-align: center;
	vertical-align: middle;
	padding: 12px;
}

.table-responsive table th {
	background: #f5f5f5;
	font-weight: bold;
}

.table-responsive table td {
	background: #fff;
	border-bottom: 1px solid #e9e9e9;
}

.table-responsive table tr:hover {
	background: #f5f5f5;
}

.table-responsive .btn {
	margin: 0 5px;
}

.table-responsive .btn i {
	font-size: 18px;
}

.table-responsive .btn.edit {
	color: #FFC107;
}

.table-responsive .btn.delete {
	color: #E34724;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	color: #999;
	padding: 10px 20px;
	border-radius: 30px !important;
	background: #f5f5f5;
	margin: 0 2px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a {
	background: #4CAF50;
	color: #fff;
}
</style>
</head>
<body>
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							Manage <b>Accounts</b>
						</h2>
					</div>
					<div class="col-sm-6 text-right">
						<a href="#addAccountModal" class="btn btn-success"
							data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add
								New Account</span></a>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Email</th>
							<th>Sell</th>
							<th>Admin</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody id="account-list">
						<c:forEach items="${listA}" var="o">
							<tr id="account-${o.uID}">
								<td>${o.uID}</td>
								<td>${o.email}</td>
								<td><c:choose>
										<c:when test="${o.sell}">Bán hàng</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${o.admin}">Admin</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose></td>
								<td><a href="#" class="edit" data-uid="${o.uID}"
									data-email="${o.email}" data-sell="${o.sell}"
									data-admin="${o.admin}" data-toggle="modal"><i
										class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
									<a href="#" onclick="confirmDelete('${o.uID}')" class="delete"><i
										class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
								</td>


							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<a href="#"><button type="button" class="btn btn-primary"
				onclick="window.history.back()">Back to Admin Page</button></a>
	</div>
	<div id="editAccountModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="editAccountForm">
					<div class="modal-header">
						<h4 class="modal-title">Edit Account</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Email</label> <input type="email" id="editEmail"
								name="email" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Sell</label> <select id="editSell" name="sell"
								class="form-control">
								<option value="true">Bán hàng</option>
								<option value="false">-</option>
							</select>
						</div>
						<div class="form-group">
							<label>Admin</label> <select id="editAdmin" name="admin"
								class="form-control">
								<option value="true">Admin</option>
								<option value="false">-</option>
							</select>
						</div>
						<input type="hidden" id="editUID" name="uID">
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit" class="btn btn-info"
							value="Save">
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="addAccountModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="addAccountForm" action="addAccount" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Add New Account</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Sell</label>
                        <select name="sell" class="form-control">
                            <option value="false" selected>-</option>
                            <option value="true">Bán hàng</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Admin</label>
                        <select name="admin" class="form-control">
                            <option value="false" selected>-</option>
                            <option value="true">Admin</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>

	<script>
		function confirmDelete(uID) {
			if (confirm("Are you sure you want to delete this account?")) {
				$.ajax({
					url : 'deleteAccount',
					type : 'GET',
					data : {
						aid : uID
					},
					success : function(response) {
						$('#account-' + uID).remove();
					},
					error : function(xhr, status, error) {
						alert('Error deleting account!');
					}
				});
			}
		}
	</script>
	<script>
		$(document).ready(function() {

			$('#addAccountForm').on('submit', function(e) {
				e.preventDefault();
				$.ajax({
					url : 'addAccount',
					type : 'POST',
					data : $(this).serialize(),
					success : function(response) {
						$('#addAccountModal').modal('hide');
						location.reload();
					},
					error : function(xhr, status, error) {
						alert('Error adding account!');
					}
				});
			});

			$('.edit').on('click', function() {
				var uID = $(this).data('uid');
				var email = $(this).data('email');
				var sell = $(this).data('sell');
				var admin = $(this).data('admin');

				$('#editUID').val(uID);
				$('#editEmail').val(email);
				$('#editSell').val(sell);
				$('#editAdmin').val(admin);

				$('#editAccountModal').modal('show');
			});

			$('#editAccountForm').on('submit', function(e) {
				e.preventDefault();
				$.ajax({
					url : 'editAccount',
					type : 'POST',
					data : $(this).serialize(),
					success : function(response) {
						$('#editAccountModal').modal('hide');
						location.reload();
					},
					error : function(xhr, status, error) {
						alert('Error updating account!');
					}
				});
			});
		});
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request Password Reset</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="css/styleLogin.css">
<style>
body {
	font-family: 'Arial', sans-serif;
	background: #f0f2f5;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container2 {
	background: #fff;
	padding: 40px 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	width: 100%;
}

.form-container {
	text-align: center;
}

form h1 {
	margin-bottom: 20px;
	color: #333;
}

.social-container {
	margin-bottom: 20px;
}

.social-container a {
	text-decoration: none;
	color: #fff;
	margin: 0 10px;
	display: inline-block;
	width: 40px;
	height: 40px;
	line-height: 40px;
	border-radius: 50%;
	background: #3b5998;
	font-size: 20px;
}

.social-container a:hover {
	background: #2d4373;
}

.social-container a.social-google {
	background: #dd4b39;
}

.social-container a.social-google:hover {
	background: #c23321;
}

.social-container a.social-linkedin {
	background: #0077b5;
}

.social-container a.social-linkedin:hover {
	background: #005983;
}

form span {
	display: block;
	margin-bottom: 20px;
	color: #666;
}

form input {
	width: calc(100% - 20px);
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

form button {
	background: #5cb85c;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

form button:hover {
	background: #4cae4c;
}

form p.text-danger {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container2">
		<div class="form-container">
			<button style="margin-top: 20px"
				onclick="window.location.href='indexLogin.jsp'">Back To
				Home</button>

			<form action="resetPassword" method="post">
				<h1>Reset Password</h1>
				<p class=" text-danger">${mess}</p>
				<input name="email" value="${email}" type="email"
					placeholder="Email" /> <input name="newpassword" type="password"
					placeholder="New Password" /> <input name="confirmPassword"
					type="password" placeholder="Confirm Password" />
				<button type="submit">Reset</button>
			</form>
		</div>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="css/styleLogin.css">
</head>
<body>
	<div class="container2" id="container2">
		<div class="form-container sign-up-container">
			<button style="margin-top: 20px"
				onclick="window.location.href='indexLogin.jsp'">Back To Home</button>

			<form action="signup" method="post">
				<h1>Create Account</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your email for registration</span> 
				<input name="email" type="email" placeholder="Email" /> 
				<input name="password" type="password" placeholder="Password" /> 
				<input name="repassword" type="password" placeholder="Repeat Password" />
				<button type="submit">Sign Up</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<button style="margin-top: 20px"
				onclick="window.location.href='indexLogin.jsp'">Back To Home</button>

			<form action="login" method="post">
				<h1>Sign in</h1>
				<div class="social-container2">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> 
					<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a> 
					<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your account</span>
				<p class="text-danger" style="color: red;">${message}</p>
				<input name="email" type="email" placeholder="Email" /> 
				<input name="password" type="password" placeholder="Password" /> 
				<a href="#">Forgot your password?</a>
				<button type="submit">Sign In</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Welcome!</h1>
					<p>Enter your personal details and start your journey with us</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container2');

    signUpButton.addEventListener('click', () => {
        container.classList.add('right-panel-active');
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove('right-panel-active');
    });

    // Show alert if alertMessage is present
    <% if (request.getAttribute("alertMessage") != null) { %>
        alert('<%= request.getAttribute("alertMessage") %>');
    <% } %>
    <% if (request.getAttribute("message2") != null) { %>
    alert('<%= request.getAttribute("message2") %>');
<% } %>
</script>
</html>

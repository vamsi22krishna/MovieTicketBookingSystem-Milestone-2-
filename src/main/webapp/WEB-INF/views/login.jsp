
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>User Login</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">

<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-container {
	max-width: 400px;
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.login-header {
	margin-bottom: 20px;
}

.login-header h2 {
	font-size: 1.5em;
	color: #6A9C89;
}

.form-group label {
	font-weight: bold;
}

.form-group input {
	border-radius: 5px;
}

.btn-primary {
	background-color: #6A9C89;
	border-color: #6A9C89;
	transition: background-color 0.3s, transform 0.3s;
}

.btn-primary:hover {
	background-color: #6A9C89;
	transform: scale(1.05);
}

.error-message {
	color: #ff6666;
	font-size: 0.875em;
	text-align: center;
	margin-bottom: 15px;
}

.text-center {
	text-align: center;
}

.text-center a {
	color: #6A9C89;
	text-decoration: none;
	transition: color 0.3s;
}

.text-center a:hover {
	color: #5a8a78;
}
</style>
</head>

<body>
	<div class="container login-container">
		<div class="login-header text-center">
			<h2>CineConnect Login</h2>
		</div>

		<!-- Display server-side error messages if any -->
		<c:if test="${not empty error}">
			<div class="error-message">
				<p>
					<c:out value="${error}" />
				</p>
			</div>
		</c:if>

		<form:form method="post"
			action="${pageContext.request.contextPath}/users/login"
			modelAttribute="user" onsubmit="return validateForm();">
			<div class="form-group">
				<label for="username">Username:</label>
				<form:input path="username" class="form-control" id="username"
					maxlength="40" required="true" onkeyup="validateUsername();" />
				<span id="username-error" class="error-message"></span>
			</div>
			<div class="form-group">
				<label for="password">Password:</label>
				<form:password path="password" class="form-control" id="password"
					maxlength="16" required="true" onkeyup="validatePassword();" />
				<span id="password-error" class="error-message"></span>
			</div>
			<div class="form-group text-center">
				<input class="btn btn-primary btn-block" type="submit" value="Login" />
			</div>
		</form:form>
		<div class="text-center">
			<a href="${pageContext.request.contextPath}/users/forgotpassword">
				Forget Password </a>
		</div>
		<br>
		<div class="text-center">
			<p>
				Need an account? <a href="register">Register here</a>.
			</p>
		</div>
	</div>

	<script type="text/javascript">
		function validateUsername() {
			var username = document.getElementById("username").value;
			var usernameError = document.getElementById("username-error");

			if (username.length < 3) {
				usernameError.textContent = "Username must be at least 3 characters long.";
			} else {
				usernameError.textContent = "";
			}
		}

		function validatePassword() {
			var password = document.getElementById("password").value;
			var passwordError = document.getElementById("password-error");

			if (password.length < 6) {
				passwordError.textContent = "Password must be at least 6 characters long.";
			} else {
				passwordError.textContent = "";
			}
		}

		function validateForm() {
			validateUsername();
			validatePassword();

			var usernameError = document.getElementById("username-error").textContent;
			var passwordError = document.getElementById("password-error").textContent;

			return usernameError === "" && passwordError === "";
		}
	</script>
</body>
</html>

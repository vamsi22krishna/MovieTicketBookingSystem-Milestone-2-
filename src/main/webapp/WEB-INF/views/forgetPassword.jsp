<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
.container {
	max-width: 400px;
	margin-top: 50px;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.form-group {
	position: relative;
}

.form-group input {
	padding-right: 40px;
}

.form-group i {
	position: absolute;
	top: 50%;
	right: 10px;
	transform: translateY(-50%);
	pointer-events: none;
}

.btn-primary {
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="text-center" style="color: #6A9C89">Reset Password</h2>
		<form action="<c:url value='/users/resetpassword'/>" method="post">
			<div class="form-group">
				<label for="email">Enter your email:</label> <input type="email"
					id="email" name="email" class="form-control" maxlength="50"
					required>

			</div>
			<div class="form-group">
				<label for="password">Enter your password:</label> <input
					type="password" id="password" name="password" class="form-control"
					maxlength="20" required>

			</div>
			<div class="text-center">
				<button type="submit" class="btn"
					style="background-color: #6A9C89; color: white;">Reset
					Password</button>
			</div>

		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

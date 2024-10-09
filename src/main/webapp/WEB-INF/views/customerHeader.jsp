<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Panel</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.navbar {
	background-color: #6A9C89;
}

.navbar-brand, .nav-link {
	color: #fff !important;
}

.nav-link:hover {
	background-color: #5a8a78;
	border-radius: 5px;
}

.navbar-toggler-icon {
	color: #fff;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><i class="bi bi-person-circle"></i>
				Customer Panel</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${pageContext.request.contextPath}/users/customerdashboard"><i
							class="bi bi-speedometer2"></i> Dashboard</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/movies"><i
							class="bi bi-film"></i> Movies</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/bookings/view"><i
							class="bi bi-calendar3"></i> View Bookings</a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/users/logout"><i
							class="bi bi-box-arrow-right"></i> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
<style>
.navbar {
	background-color: #6A9C89;
}

.navbar-brand, .nav-link {
	color: #ffffff !important;
	font-size: 16px;
	padding: 8px;
}

.nav-link:hover {
	color: #d4d4d4 !important;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><i class="bi bi-speedometer2"></i>
				Manager Panel</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="${pageContext.request.contextPath}/users/dashboard"><i
							class="bi bi-house-door"></i> Dashboard</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/theatres/viewtheatres"><i
							class="bi bi-building"></i> View Theatres</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/theatres/viewscreens"><i
							class="bi bi-tv"></i> View Screens</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/movies/new"><i
							class="bi bi-film"></i> Add Movies</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/movies"><i
							class="bi bi-collection-play"></i> View Movies</a></li>

					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/shows"><i
							class="bi bi-calendar3"></i> View Shows</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/bookings/all"><i
							class="bi bi-calendar3"></i> View All Bookings</a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/index.jsp"><i
							class="bi bi-box-arrow-right"></i> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>



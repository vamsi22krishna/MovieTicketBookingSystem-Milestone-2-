<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="customerHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movie List</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
<style>
body {
	background-color: #f4f4f4;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.container {
	margin-top: 50px;
}

h2 {
	color: #6A9C89;
	margin-bottom: 30px;
}

.card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
	border: none;
	border-radius: 10px;
}

.card:hover {
	transform: scale(1.05);
}

.card-img-top {
	height: 300px;
	object-fit: cover;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.card-body {
	background-color: #fff;
	padding: 15px;
	border-top: 3px solid #6A9C89;
}

.btn-primary {
	background-color: #6A9C89;
	border-color: #6A9C89;
	transition: background-color 0.3s, transform 0.3s;
}

.btn-primary:hover {
	background-color: #5a8a78;
	transform: scale(1.05);
}
</style>
</head>
<body>
	<!-- Conditionally include header based on user role -->
	<c:choose>
		<c:when test="${userRole == 'admin'}">
			<%@ include file="header.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="customerHeader.jsp"%>
		</c:otherwise>
	</c:choose>

	<div class="container">
		<h2 class="text-center">Available Movies</h2>
		<div class="row">
			<c:forEach var="movie" items="${movies}">
				<div class="col-md-4">
					<div class="card mb-4">
						<img
							src="${pageContext.request.contextPath}/images/${movie.imageUrl}"
							class="card-img-top" alt="${movie.title} Poster">
						<div class="card-body">
							<h5 class="card-title">${movie.title}</h5>
							<p class="card-text">Genre: ${movie.genre}</p>
							<p class="card-text">Duration: ${movie.duration} minutes</p>
							<p class="card-text">Rating: ${movie.rating}</p>
							<a
								href="${pageContext.request.contextPath}/movies/${movie.movieId}"
								class="btn btn-primary">Movie Details</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>

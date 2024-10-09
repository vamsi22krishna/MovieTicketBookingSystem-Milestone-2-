<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movie Details</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f4f4f4;
}

.container {
	margin: 50px;
}

h1 {
	color: #6A9C89;
	margin-bottom: 30px;
}

.card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
}

.card:hover {
	transform: scale(1.02);
}

.card-body {
	background-color: #fff;
	padding: 20px;
	border-top: 3px solid #6A9C89;
}

.btn-custom {
	background-color: #6A9C89;
	border-color: #6A9C89;
	color: white;
}

.btn-custom:hover {
	background-color: #5a8a78;
	border-color: #5a8a78;
}

.movie-details {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.movie-details .details {
	max-width: 50%;
}

.movie-details .image {
	max-width: 45%;
}

.movie-details img {
	width: 200px;
	height: 350px;
	object-fit: fill;
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

	<div class="container" style="width: 600px;">
		<h1 class="text-center">Movie Details</h1>
		<div class="card">
			<div class="card-body">
				<div class="movie-details">
					<div class="details">
						<h5 class="card-title">Title: ${movie.title}</h5>
						<p class="card-text">Director Name: ${movie.directorName}</p>
						<p class="card-text">Description: ${movie.about}</p>
						<p class="card-text">Genre: ${movie.genre}</p>
						<p class="card-text">Duration: ${movie.duration} minutes</p>
						<p class="card-text">Ticket Price: ${movie.ticketPrice}</p>
					</div>
					<div class="image">
						<img src="${movie.imageUrl}" alt="${movie.title} Poster"
							class="img-fluid" />
					</div>
				</div>

				<!-- Conditionally display back button based on user role -->
				<c:choose>
					<c:when test="${userRole == 'admin'}">
						<a href="${pageContext.request.contextPath}/movies"
							class="btn btn-custom mt-3" style="background-color: #6A9C89;">Back
							to Movies</a>
					</c:when>
					<c:when test="${userRole == 'customer'}">
						<form action="${pageContext.request.contextPath}/bookings/select"
							method="get">
							<input type="hidden" name="movieId" value="${movie.movieId}">
							<button type="submit" class="btn btn-custom mt-3"
								style="background-color: #6A9C89;">Book Tickets</button>
						</form>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/movies"
							class="btn btn-custom mt-3" style="background-color: #6A9C89;">Back
							to Movies</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>

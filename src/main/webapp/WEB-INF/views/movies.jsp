<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ include file="header.jsp" %> --%>

<c:choose>
	<c:when test="${userRole == 'admin'}">
		<%@ include file="header.jsp"%>
	</c:when>
	<c:otherwise>
		<%@ include file="customerHeader.jsp"%>
	</c:otherwise>
</c:choose>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<title>Movies</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	background-color: #f4f4f4;
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
}

.card:hover {
	transform: scale(1.05);
}

.card-img-top {
	width: 100%;
	height: 200px;
	object-fit: fill;
}

.card-body {
	background-color: #fff;
	padding: 15px;
	border-top: 3px solid #6A9C89;
}

.btn-primary1 {
	background-color: #6A9C89;
	border-color: #6A9C89;
	color: white;
}

.btn-primary1:hover {
	background-color: #5a8a78;
	border-color: #5a8a78;
}

.hidden {
	display: none;
}

.search-bar {
	max-width: 400px;
	margin: left;
}
</style>
</head>
<body>

	<div class="container">
		<h2 class="text-center">Available Movies</h2>

		<!-- Search Form -->
		<div class="search-bar">
			<input type="text" id="searchInput" class="form-control mb-4"
				placeholder="Search by movie name" onkeyup="filterMovies()">
		</div>

		<!-- Movie Display -->
		<div class="row" id="movieContainer">
			<c:forEach var="movie" items="${movies}">
				<div class="col-md-4 movie-card">
					<div class="card mb-4">
						<img src="${movie.imageUrl}" class="card-img-top"
							alt="${movie.title} Poster">
						<div class="card-body">
							<h5 class="card-title">${movie.title}</h5>
							<p class="card-text">Director Name: ${movie.directorName}</p>
							<p class="card-text">Description: ${movie.about}</p>
							<p class="card-text">Genre: ${movie.genre}</p>
							<p class="card-text">Duration: ${movie.duration} minutes</p>
							<p class="card-text">Release Date: ${movie.releaseDate}</p>
							<a
								href="${pageContext.request.contextPath}/movies/${movie.movieId}"
								class="btn btn-primary1">Movie Details</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- JavaScript for Dynamic Search -->
	<script>
		function filterMovies() {
			var input, filter, movieContainer, movieCards, title, i, txtValue;
			input = document.getElementById('searchInput');
			filter = input.value.toLowerCase();
			movieContainer = document.getElementById('movieContainer');
			movieCards = movieContainer.getElementsByClassName('movie-card');

			for (i = 0; i < movieCards.length; i++) {
				title = movieCards[i].getElementsByClassName('card-title')[0];
				if (title) {
					txtValue = title.textContent || title.innerText;
					if (txtValue.toLowerCase().indexOf(filter) > -1) {
						movieCards[i].style.display = "";
					} else {
						movieCards[i].style.display = "none";
					}
				}
			}
		}
	</script>
</body>
</html>

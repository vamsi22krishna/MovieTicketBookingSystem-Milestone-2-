<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Movie</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style>
body {
	background-color: #f4f4f4;
}

.container {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 50px;
	max-width: 600px; /* Adjust the width as needed */
	margin-left: auto;
	margin-right: auto;
}

h2 {
	color: #6A9C89;
	margin-bottom: 20px;
}

.form-group {
	position: relative;
}

.form-group .bi {
	position: absolute;
	right: 10px;
	top: 35px;
	color: #aaa;
}

.btn-primary1 {
	margin-top: 20px;
	background-color: #6A9C89;
	border-color: #6A9C89;
	color: white;
}

.error {
	color: red;
	font-size: 0.9em;
}
</style>
<script>
	$(document).ready(
			function() {
				var today = new Date().toISOString().split('T')[0];
				$('input[name="releaseDate"]').attr('min', today);

				function validateTitle() {
					var title = $('input[name="title"]').val();
					if (title.length <= 4) {
						$('#titleError').text(
								'Title must be more than 4 characters.');
						return false;
					} else {
						$('#titleError').text('');
						return true;
					}
				}

				function validateGenre() {
					var genre = $('input[name="genre"]').val();
					if (genre.length <= 4) {
						$('#genreError').text(
								'Genre must be more than 4 characters.');
						return false;
					} else {
						$('#genreError').text('');
						return true;
					}
				}

				function validateDuration() {
					var duration = $('input[name="duration"]').val();
					if (duration <= 0) {
						$('#durationError').text(
								'Duration must be a positive number.');
						return false;
					} else {
						$('#durationError').text('');
						return true;
					}
				}

				function validateRating() {
					var rating = $('input[name="rating"]').val();
					if (rating.length <= 0) {
						$('#ratingError').text('Rating is required.');
						return false;
					} else {
						$('#ratingError').text('');
						return true;
					}
				}

				function validatePrice() {
					var price = $('input[name="price"]').val();
					if (price <= 0) {
						$('#priceError').text(
								'Price must be a positive number.');
						return false;
					} else {
						$('#priceError').text('');
						return true;
					}
				}

				$('input[name="title"]').on('keyup', validateTitle);
				$('input[name="genre"]').on('keyup', validateGenre);
				$('input[name="duration"]').on('keyup', validateDuration);
				$('input[name="rating"]').on('keyup', validateRating);
				$('input[name="price"]').on('keyup', validatePrice);

				$('form').submit(
						function(event) {
							var isValid = validateTitle() & validateGenre()
									& validateDuration() & validateRating()
									& validatePrice();
							if (!isValid) {
								event.preventDefault();
							}
						});
			});
</script>
</head>
<body>
	<div class="container">
		<h2 class="text-center">Add Movie</h2>
		<form action="${pageContext.request.contextPath}/movies/add"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">Title</label> <input type="text" name="title"
					class="form-control" maxlength="50" required="required" /> <i
					class="bi bi-film"></i>
				<div id="titleError" class="error"></div>
			</div>
			<!-- <div class="form-group">
                <label for="genre">Genre</label>
                <input type="text" name="genre" class="form-control" required="required" />
                <i class="bi bi-tags"></i>
                <div id="genreError" class="error"></div>
            </div> -->

			<div class="form-group">
				<label for="title">Director Name</label> <input type="text"
					name="director" class="form-control" maxlength="50"
					required="required" /> <i class="bi bi-film"></i>
				<div id="directorError" class="error"></div>
			</div>


			<div class="form-group">
				<label for="genre">Genre</label> <select name="genre"
					class="form-control" required="required">
					<option value="">Select a genre</option>
					<option value="fiction">Drama</option>
					<option value="non-fiction">Action</option>
					<option value="mystery">Mystery</option>
					<option value="fantasy">Fantasy</option>
					<option value="science-fiction">Science Fiction</option>
				</select> <i class="bi bi-tags"></i>
				<div id="genreError" class="error"></div>
			</div>
			<div class="form-group">
				<label for="duration">Duration (minutes)</label> <input
					type="number" name="duration" class="form-control" maxlength="5"
					required="required" /> <i class="bi bi-clock"></i>
				<div id="durationError" class="error"></div>
			</div>
			<div class="form-group">
				<label for="releaseDate">Release Date</label> <input type="date"
					name="releaseDate" class="form-control" required="required" />

			</div>

			<div class="form-group">
				<label for="title">Description</label> <input type="text"
					name="description" maxlength="100" class="form-control"
					required="required" /> <i class="bi bi-film"></i>
				<div id="discriptionError" class="error"></div>
			</div>

			<div class="form-group">
				<label for="price">Ticket Price</label> <input type="number"
					maxlength="10" name="price" class="form-control"
					required="required" /> <i class="bi bi-currency-dollar"></i>
				<div id="priceError" class="error"></div>
			</div>
			<div class="form-group">
				<label for="image">Image URL</label> <input type="url"
					name="imageUrl" class="form-control" required="required" /> <i
					class="bi bi-image"></i>
			</div>
			<button type="submit" class="btn btn-primary1">Add Movie</button>
		</form>
	</div>
</body>
</html>

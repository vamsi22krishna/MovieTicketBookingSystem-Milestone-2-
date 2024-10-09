<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="customerHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Theatre and Screen</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f4f4f4;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.container {
	margin-top: 50px;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #6A9C89;
	margin-bottom: 30px;
}

.form-group label {
	font-weight: bold;
}

.btn-primary1 {
	background-color: #6A9C89;
	border-color: #6A9C89;
	transition: background-color 0.3s, transform 0.3s;
	color: white;
}

.btn-primary:hover {
	background-color: #5a8a78;
	transform: scale(1.05);
}

.form-container {
	max-width: 600px;
}
</style>
</head>
<body>
	<div class="container form-container">
		<h1 class="text-center">Select Show</h1>
		<form action="${pageContext.request.contextPath}/bookings/selectSeats"
			method="post">
			<input type="hidden" name="userId" value="${user.userId}">
			<div class="form-group">
				<label for="theatre">Select Theatre:</label> <select
					class="form-control" id="theatre" name="theatreId">
					<c:forEach var="theatre" items="${theatres}">
						<option value="${theatre.theatreId}">${theatre.name}-
							${theatre.location}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="screen">Select Screen:</label> <select
					class="form-control" id="screen" name="screenId">
					<c:forEach var="screen" items="${screens}">
						<option value="${screen.screenId}">${screen.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="show">Select Show:</label> <select class="form-control"
					id="show" name="showId">
					<c:forEach var="show" items="${shows}">
						<option value="${show.showId}">${show.movie.title}-
							${show.showTime}</option>
						<%-- ${show.showDate} --%>
					</c:forEach>
				</select>


			</div>
			<div class="form-group">
				<label for="showDate">Select Date:</label> <input type="date"
					class="form-control" id="showDate" name="showDate" required>
			</div>
			<button type="submit" class="btn btn-primary1 mt-3">Next</button>
		</form>
	</div>
	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var releaseDate = new Date("${releaseDate}");
			var minDate = new Date(releaseDate);
			minDate.setDate(releaseDate.getDate() - 3);

			var showDateInput = document.getElementById("showDate");
			showDateInput.min = minDate.toISOString().split("T")[0];

		});
	</script>
</body>
</html>

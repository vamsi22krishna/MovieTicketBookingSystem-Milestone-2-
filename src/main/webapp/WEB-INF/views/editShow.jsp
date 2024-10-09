<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Show</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
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
	max-width: 800px;
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

.btn-primary1 {
	margin-top: 20px;
	background-color: #6A9C89;
	border-color: #6A9C89;
}
</style>
<script>
	$(document).ready(function() {
		// Set the minimum date for the date input to today's date
		var today = new Date().toISOString().split('T')[0];
		$('input[type="date"]').attr('min', today);
	});
</script>
</head>
<body>
	<div class="container">
		<h2 class="text-center">Edit Show</h2>
		<form:form
			action="${pageContext.request.contextPath}/shows/edit/${show.showId}"
			method="post" modelAttribute="show">
			<div class="form-group">
				<label for="movie">Select Movie</label>
				<form:select path="movie.movieId" class="form-control">
					<form:options items="${movies}" itemValue="movieId"
						itemLabel="title" />
				</form:select>
			</div>
			<div class="form-group">
				<label for="screen">Select Screen</label>
				<form:select path="screen.screenId" class="form-control">
					<form:options items="${screens}" itemValue="screenId"
						itemLabel="name" />
				</form:select>
			</div>
			<div class="form-group">
				<label for="showDate">Show Date</label>
				<form:input path="showDate" type="date" class="form-control" />
			</div>
			<div class="form-group">
				<label for="showTime">Show Time</label>
				<form:input path="showTime" step="1" type="time"
					class="form-control" />
			</div>
			<button type="submit" style="color: white;" class="btn btn-primary1">Update
				Show</button>
		</form:form>
	</div>
</body>
</html>

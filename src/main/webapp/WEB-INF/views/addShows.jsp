<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Show</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container {
	margin-top: 50px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.form-group label {
	font-weight: bold;
}

.form-control {
	border-radius: 5px;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

.btn {
	background-color: #6A9C89;
	border-color: #6A9C89;
	transition: background-color 0.3s, transform 0.3s;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
	transform: scale(1.05);
}

.text-center {
	text-align: center;
}

.form-container {
	max-width: 600px;
}
</style>
</head>
<body>
	<div class="container form-container">
		<h2 class="text-center">Add Show</h2>
		<form:form action="${pageContext.request.contextPath}/shows/add"
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
				<form:input path="showDate" type="date" class="form-control"
					id="showDate" />
			</div>
			<div class="form-group">
				<label for="showTime">Show Time</label>
				<form:input path="showTime" step="1" type="time"
					class="form-control" />
			</div>
			<button type="submit" class="btn" style="color: white;">
				<i class="fa fa-plus"></i>Add Show
			</button>
		</form:form>
	</div>

	<script type="text/javascript">
		// Set the minimum date to today
		document.addEventListener('DOMContentLoaded', function() {
			var today = new Date().toISOString().split('T')[0];
			document.getElementById('showDate').setAttribute('min', today);
		});
	</script>
</body>
</html>

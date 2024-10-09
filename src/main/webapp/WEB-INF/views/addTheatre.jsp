<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Theatre</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
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

.form-group .fa {
	position: absolute;
	right: 10px;
	top: 35px;
	color: #aaa;
}

.btn {
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
	$(document)
			.ready(
					function() {
						function validateName() {
							var name = $('#name').val();
							if (name.length <= 4) {
								$('#nameError')
										.text(
												'Theatre name must be more than 4 characters.');
								return false;
							} else {
								$('#nameError').text('');
								return true;
							}
						}

						function validateLocation() {
							var location = $('#location').val();
							if (location.length <= 4) {
								$('#locationError')
										.text(
												'Location must be more than 4 characters.');
								return false;
							} else {
								$('#locationError').text('');
								return true;
							}
						}

						function validateTotalScreens() {
							var totalScreens = $('#totalScreens').val();
							if (totalScreens < 0) {
								$('#totalScreensError').text(
										'Total screens cannot be negative.');
								return false;
							} else {
								$('#totalScreensError').text('');
								return true;
							}
						}

						$('#name').on('keyup', validateName);
						$('#location').on('keyup', validateLocation);
						$('#totalScreens').on('keyup', validateTotalScreens);

						$('form').submit(
								function(event) {
									var isValid = validateName()
											& validateLocation()
											& validateTotalScreens();
									if (!isValid) {
										event.preventDefault();
									}
								});
					});
</script>
</head>
<body>
	<div class="container">
		<h2 class="text-center">Add Theatre</h2>
		<form:form
			action="${pageContext.request.contextPath}/theatres/addtheatre"
			method="post" modelAttribute="theatre">
			<div class="form-group">
				<label for="name">Name</label>
				<form:input path="name" class="form-control" id="name"
					maxlength="40" required="required" />
				<i class="fa fa-building"></i>
				<div id="nameError" class="error"></div>
			</div>
			<div class="form-group">
				<label for="location">Location</label>
				<form:input path="location" class="form-control" id="location"
					maxlength="40" required="required" />
				<i class="fa fa-map-marker"></i>
				<div id="locationError" class="error"></div>
			</div>
			<div class="form-group">
				<label for="totalScreens">Total Screens</label>
				<form:input path="totalScreens" class="form-control"
					id="totalScreens" maxlength="2" required="required" />
				<i class="fa fa-tv"></i>
				<div id="totalScreensError" class="error"></div>
			</div>
			<button type="submit" class="btn">
				<i class="fa fa-plus"></i> Add Theatre
			</button>
		</form:form>
	</div>
</body>
</html>

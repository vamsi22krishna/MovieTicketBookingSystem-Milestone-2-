<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show List</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	max-width: 800px; /* Reduced size */
	margin-left: auto;
	margin-right: auto;
}

h2 {
	color: #6A9C89;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 20px;
}

.table thead {
	background-color: #6A9C89;
	color: white;
}

.table tbody tr:nth-child(even) {
	background-color: #f2f2f2;
}

.btn-primary1, .btn-secondary1, .btn-danger1 {
	margin-right: 5px;
	background-color: #6A9C89;
	border-color: #6A9C89;
	color: white;
}

.btn-primary1:hover, .btn-secondary:hover1, .btn-danger:hover1 {
	background-color: #6A9C89;
	border-color: #6A9C89;
	color: white;
}

.dropdown-container {
	max-width: 300px; /* Set a fixed width for the dropdown */
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="text-center">Show List</h2>

		<!-- Dropdown for Show Time -->
		<div class="form-group dropdown-container">
			<label for="showTimeSelect">Select Show Time:</label> <select
				id="showTimeSelect" class="form-control">
				<option value="">All Show Times</option>
			</select>
		</div>

		<a href="${pageContext.request.contextPath}/shows/add"
			class="btn btn-primary1"> <i class="fa fa-plus"></i> Add Show
		</a>
		<table class="table table-bordered mt-3">
			<thead>
				<tr>
					<th>ID</th>
					<th>Movie</th>
					<th>Screen</th>
					<th>Show Time</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody id="showTableBody">
				<c:forEach var="show" items="${shows}">
					<tr data-show-time="${show.showTime}">
						<td>${show.showId}</td>
						<td>${show.movie.title}</td>
						<td>${show.screen.name}</td>
						<td>${show.showTime}</td>
						<td><a
							href="${pageContext.request.contextPath}/shows/edit/${show.showId}"
							class="btn btn-secondary1"> <i class="fa fa-pencil"></i> Edit
						</a> <%--  <a href="${pageContext.request.contextPath}/shows/delete/${show.showId}" class="btn btn-danger">
                            <i class="fa fa-trash"></i> Delete
                        </a> --%></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
		$(document).ready(
				function() {
					// Populate the dropdown with unique show times
					var showTimes = new Set();
					$('#showTableBody tr').each(function() {
						var showTime = $(this).data('show-time');
						showTimes.add(showTime);
					});

					showTimes.forEach(function(showTime) {
						$('#showTimeSelect').append(
								'<option value="' + showTime + '">' + showTime
										+ '</option>');
					});

					// Filter table based on selected show time
					$('#showTimeSelect').change(
							function() {
								var selectedShowTime = $(this).val();
								if (selectedShowTime) {
									$('#showTableBody tr').hide();
									$(
											'#showTableBody tr[data-show-time="'
													+ selectedShowTime + '"]')
											.show();
								} else {
									$('#showTableBody tr').show();
								}
							});
				});
	</script>

</body>
</html>



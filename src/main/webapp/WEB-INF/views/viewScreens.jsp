<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Screen List</title>
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
	margin-top: 20px;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 800px; /* Adjust the width as needed */
	margin-left: auto;
	margin-right: auto;
}

h2 {
	color: #6A9C89;
}

.table thead {
	background-color: #6A9C89;
	color: white;
}

.table tbody tr:nth-child(even) {
	background-color: #f2f2f2;
}

.btn-primary, .btn-secondary, .btn-danger {
	margin-right: 5px;
}

.btn-primary1 {
	background-color: #6A9C89;
	border-color: #6A9C89;
	color: white;
}

.btn-primary:hover {
	background-color: #5e8a78;
	border-color: #5e8a78;
}

.form-group {
	max-width: 300px; /* Adjust the width as needed */
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="text-center">Screen List</h2>

		<!-- Dropdown for Screen List -->
		<div class="form-group">
			<label for="screenSelect">Select Screen:</label> <select
				id="screenSelect" class="form-control">
				<option value="">All Screens</option>
				<c:forEach var="screen" items="${screens}">
					<option value="${screen.screenId}">${screen.name}</option>
				</c:forEach>
			</select>
		</div>

		<a href="${pageContext.request.contextPath}/screens/add"
			class="btn btn-primary1"><i class="fa fa-plus"></i> Add Screen</a>
		<table class="table table-bordered mt-3">
			<thead>
				<tr>
					<th><i class="fa fa-id-badge"></i>ID</th>
					<th><i class="bi bi-person"></i>Name</th>
					<th><i class="bi bi-building"></i>Theatre</th>
					<th><i class="bi bi-people"></i>Total Seats</th>
					<th><i class="bi bi-gear"></i>Actions</th>
				</tr>
			</thead>
			<tbody id="screenTableBody">
				<c:forEach var="screen" items="${screens}">
					<tr data-screen-id="${screen.screenId}">
						<td>${screen.screenId}</td>
						<td>${screen.name}</td>
						<td>${screen.theatre.name}</td>
						<td>${screen.totalSeats}</td>
						<td><a
							href="${pageContext.request.contextPath}/screens/edit/${screen.screenId}"
							class="btn btn-primary1"><i class="fa fa-pencil"></i> Edit</a> <%--  <a href="${pageContext.request.contextPath}/screens/delete/${screen.screenId}" class="btn btn-danger"><i class="fa fa-trash"></i> Delete</a> --%>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
		$(document).ready(
				function() {
					$('#screenSelect').change(
							function() {
								var selectedScreenId = $(this).val();
								if (selectedScreenId) {
									$('#screenTableBody tr').hide();
									$(
											'#screenTableBody tr[data-screen-id="'
													+ selectedScreenId + '"]')
											.show();
								} else {
									$('#screenTableBody tr').show();
								}
							});
				});
	</script>

</body>
</html>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Theatres</title>
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
}

h2 {
	color: #6A9C89;
	margin-bottom: 20px;
}

.table {
	margin-top: 20px;
}

.table thead th {
	background-color: #6A9C89;
	color: white;
}

.table thead th i {
	margin-right: 5px;
}

.btn {
	margin-bottom: 20px;
	background-color: #6A9C89;
	color: white;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="text-center">Theatre List</h2>
		<div class="text-right">
			<a href="${pageContext.request.contextPath}/theatres/addtheatre"
				class="btn"><i class="fa fa-plus"></i> Add Theatre</a>
		</div>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th><i class="fa fa-id-badge"></i> ID</th>
					<th><i class="fa fa-building"></i> Name</th>
					<th><i class="fa fa-map-marker"></i> Location</th>
					<th><i class="fa fa-tv"></i> Total Screens</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="theatre" items="${theatres}">
					<tr>
						<td>${theatre.theatreId}</td>
						<td>${theatre.name}</td>
						<td>${theatre.location}</td>
						<td>${theatre.totalScreens}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>

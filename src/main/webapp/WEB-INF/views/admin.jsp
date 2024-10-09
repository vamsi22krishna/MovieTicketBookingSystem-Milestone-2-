<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Details</title>
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
	margin-top: 20px;
}

.card {
	margin: 20px 0;
	border: none;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #6A9C89;
	color: #fff;
	font-size: 1.5em;
	text-align: center;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.card-body {
	padding: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.icon {
	color: #6A9C89;
	margin-right: 10px;
}

.profile-info {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
}

.profile-info i {
	font-size: 1.5em;
}

.profile-info span {
	font-size: 1.2em;
}

.profile-image {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
}
</style>
</head>
<body>

	<div class="container">
		<div class="card">
			<div class="card-header">Manager Profile</div>
			<div class="card-body">
				<div>
					<div class="profile-info">
						<i class="bi bi-person icon"></i> <span>Username:
							${user.username}</span>
					</div>
					<div class="profile-info">
						<i class="bi bi-person-badge icon"></i> <span>First Name:
							${user.firstName}</span>
					</div>
					<div class="profile-info">
						<i class="bi bi-person-badge-fill icon"></i> <span>Last
							Name: ${user.lastName}</span>
					</div>
					<div class="profile-info">
						<i class="bi bi-envelope icon"></i> <span>Email:
							${user.email}</span>
					</div>
					<div class="profile-info">
						<i class="bi bi-telephone icon"></i> <span>Phone:
							${user.phone}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

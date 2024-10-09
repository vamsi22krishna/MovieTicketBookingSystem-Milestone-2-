<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="customerHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Confirmation</title>
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

.details {
	margin-bottom: 20px;
}

.btn-primary {
	background-color: #6A9C89;
	border-color: #6A9C89;
	transition: background-color 0.3s, transform 0.3s;
}

.btn-primary:hover {
	background-color: #5a8a78;
	transform: scale(1.05);
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="text-center">Booking Confirmation</h1>
		<div class="details">
			<p>
				<strong>Booking ID:</strong> ${booking.bookingId}
			</p>
			<p>
				<strong>User Name:</strong> ${booking.user.firstName}
			</p>
			<p>
				<strong>Movie Name:</strong> ${booking.show.movie.title}
			</p>
			<p>
				<strong>Theatre Name:</strong> ${booking.theatre.name}
			</p>
			<p>
				<strong>Theatre Location:</strong> ${booking.theatre.location}
			</p>
			<p>
				<strong>Screen Name:</strong> ${booking.screen.name}
			</p>
			<p>
				<strong>Show Date:</strong> ${booking.show.showDate}
			</p>
			<p>
				<strong>Show Time:</strong> ${booking.show.showTime}
			</p>
			<p>
				<strong>Seat Number:</strong>
			</p>
			<ul>
				<c:forEach var="seatNumber" items="${seatNumbers}">
					<li>${seatNumber}</li>
				</c:forEach>
			</ul>
			<p>
				<strong>Price Per Seat:</strong> ${booking.totalPrice}
			</p>
			<p>
				<strong>Booking Time:</strong> ${booking.bookingTime}
			</p>
			<p>
				<strong>Payment Method:</strong> ${payment.paymentMethod}
			</p>
			<p>
				<strong>Payment Date:</strong> ${payment.paymentDate}
			</p>
			<p>
				<strong>Amount:</strong> ${payment.amount}
			</p>
		</div>

		<form
			action="${pageContext.request.contextPath}/tickets/downloadTicket"
			method="get">
			<button type="submit" class="btn btn-primary mt-3">Download
				Tickets</button>
		</form>

	</div>
	</div>
	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>



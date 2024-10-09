<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>All Bookings</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Bootstrap Icons CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.booking-card {
	background-color: #ffffff;
	border: 1px solid #dee2e6;
	border-radius: 5px;
	padding: 15px;
	margin-bottom: 15px;
	transition: transform 0.2s, box-shadow 0.2s;
}

.booking-card:hover {
	transform: scale(1.02);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.booking-card p {
	margin: 0;
}

.booking-card hr {
	margin: 10px 0;
}

.card-header {
	font-weight: bold;
	background-color: #6A9C89;
	color: #fff;
	padding: 10px;
	border-bottom: 1px solid #dee2e6;
}

.card-body {
	padding: 10px;
}

.filter-input {
	max-width: 200px; /* Reduce the size of the filter input */
}

.booking-detail {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
}

.booking-detail i {
	color: #fff;
	background-color: #6A9C89;
	padding: 5px;
	border-radius: 50%;
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="my-4">User Bookings</h1>
		<div class="form-group">
			<label for="filterDate">Filter by Date:</label> <input type="date"
				id="filterDate" class="form-control filter-input"
				onchange="filterBookings()">
		</div>

		<div class="row" id="bookingContainer">
			<c:forEach var="booking" items="${bookings}">
				<div class="col-md-4">
					<div class="card booking-card" data-show-date="${booking.showDate}">
						<div class="card-header">
							<i class="bi bi-bookmark-fill"></i> Booking ID:
							${booking.bookingId}
						</div>
						<div class="card-body">
							<div class="booking-detail">
								<span><i class="bi bi-person-fill"></i> User:</span> <span>${booking.user.firstName}</span>
							</div>
							<div class="booking-detail">
								<span><i class="bi bi-building"></i> Theatre:</span> <span>${booking.theatre.name}</span>
							</div>
							<div class="booking-detail">
								<span><i class="bi bi-box-seam"></i> Seat Number:</span> <span>${booking.seatNumber}</span>
							</div>
							<div class="booking-detail">
								<span><i class="bi bi-box-seam"></i> Screen Name:</span> <span>${booking.screen.name}</span>
							</div>
							<%--  <div class="booking-detail">
                                <span><i class="bi bi-clock-fill"></i> Booking Time:</span>
                                <span>${booking.bookingTime}</span>
                            </div> --%>
							<div class="booking-detail">
								<span><i class="bi bi-currency-dollar"></i> Total Price:</span>
								<span>${booking.totalPrice}</span>
							</div>
							<div class="booking-detail">
								<span><i class="bi bi-calendar-event-fill"></i> Show
									Date:</span> <span>${booking.showDate}</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
		function filterBookings() {
			var filterDate = document.getElementById('filterDate').value;
			var bookingCards = document.querySelectorAll('.booking-card');

			bookingCards.forEach(function(card) {
				var showDate = card.getAttribute('data-show-date');
				if (showDate === filterDate || filterDate === '') {
					card.closest('.col-md-4').style.display = 'block';
				} else {
					card.closest('.col-md-4').style.display = 'none';
				}
			});
		}
	</script>
</body>
</html>

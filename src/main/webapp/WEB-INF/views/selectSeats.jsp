<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="customerHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Seats</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css"
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
}

.btn-primary1:hover {
	background-color: #6A9C89;
	transform: scale(1.05);
}

.form-check-label {
	margin-left: 5px;
}

#totalPrice {
	font-weight: bold;
	margin-top: 20px;
}

.seat {
	display: inline-block;
	width: 50px;
	height: 50px;
	margin: 5px;
	text-align: center;
	line-height: 50px;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.seat.available {
	background-color: #fff;
	border: 1px solid #6A9C89;
}

.seat.selected {
	background-color: #6A9C89;
	color: #fff;
}

.seat.booked {
	background-color: #ccc;
	cursor: not-allowed;
}

.legend {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.legend-item {
	display: flex;
	align-items: center;
	margin: 0 10px;
}

.legend-item .seat {
	margin: 0 5px;
}
</style>
<script>
	function calculateTotal() {
		var checkboxes = document
				.querySelectorAll('input[name="seatId"]:checked');
		var totalPrice = 0;
		checkboxes.forEach(function(checkbox) {
			var price = parseFloat(checkbox.getAttribute('data-price'));
			if (!isNaN(price)) {
				totalPrice += price;
			}
		});
		document.getElementById('totalPrice').innerText = "Total Price: "
				+ totalPrice.toFixed(2);
		document.getElementById('totalPriceInput').value = totalPrice
				.toFixed(2);
	}

	function toggleSeat(seat) {
		if (!seat.classList.contains('booked')) {
			seat.classList.toggle('selected');
			var checkbox = seat.querySelector('input[type="checkbox"]');
			checkbox.checked = !checkbox.checked;
			calculateTotal();
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h1 class="text-center">Select Seats</h1>
		<form action="${pageContext.request.contextPath}/bookings/payment"
			method="post">
			<div class="form-group">
				<input type="hidden" name="theatreId" value="${theatreId}">
				<input type="hidden" name="userId" value="${userId}"> <input
					type="hidden" name="screenId" value="${screenId}"> <input
					type="hidden" name="showId" value="${showId}"> <input
					type="hidden" name="showDate" value="${showDate}">
				<div class="form-group">
					<label for="showDate">Show Date:</label> <input type="text"
						class="form-control" name="showDate" value="${showDate}" readonly>
				</div>
				<div class="form-group">
					<label>Select Seats:</label>
					<div class="form-check">
						<c:forEach var="i" begin="1" end="${totalSeats}">
							<div
								class="seat ${bookedSeats.contains(i) ? 'booked' : 'available'}"
								onclick="toggleSeat(this)">
								<input type="checkbox" class="form-check-input" name="seatId"
									value="${i}" data-price="150" style="display: none;"
									${bookedSeats.contains(i) ? 'disabled' : ''}> <i
									class="bi bi-box"></i> ${i}
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="form-group">
					<label for="totalPriceInput">Total Price:</label> <input
						type="text" class="form-control" name="totalPrice"
						id="totalPriceInput" value="0" readonly>
				</div>
				<button type="submit" class="btn btn-primary1 mt-3">Proceed
					to Payment</button>
		</form>
		<p id="totalPrice">Total Price: 0.00</p>

		<!-- Legend -->
		<div class="legend">
			<div class="legend-item">
				<div class="seat available"></div>
				<span>Available</span>
			</div>
			<div class="legend-item">
				<div class="seat selected"></div>
				<span>Selected</span>
			</div>
			<div class="legend-item">
				<div class="seat booked"></div>
				<span>Booked</span>
			</div>
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


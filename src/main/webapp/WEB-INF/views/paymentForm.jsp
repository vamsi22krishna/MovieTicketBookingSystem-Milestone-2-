<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="customerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
    .fluid-container{
       max-width: 600px;
    }
    h1 {
        color: #6A9C89;
        margin-bottom: 30px;
    }
    .form-group label {
        font-weight: bold;
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
    <div class="container fluid-container">
        <h1 class="text-center">Payment</h1>
        <form action="${pageContext.request.contextPath}/bookings/processPayment" method="post">
            <div class="form-group">
                <label for="paymentMethod">Payment Method:</label>
                <select class="form-control" name="paymentMethod" id="paymentMethod" required onchange="showPaymentFields()">
                    <option value="">Select Payment Method</option>
                    <option value="Credit Card">Credit Card</option>
                    <option value="Debit Card">Debit Card</option>
                   </select>
            </div>
            <div id="creditCardFields" style="display:none;">
                <div class="form-group">
                    <label for="creditCardNumber">Credit Card Number:</label>
                    <input type="text" class="form-control" name="creditCardNumber" id="creditCardNumber" pattern="\d{16}" maxlength="16" title="Please enter a valid 16-digit credit card number">
                </div>
                <div class="form-group">
                    <label for="creditCardExpiry">Expiry Date:</label>
                    <input type="text" class="form-control" name="creditCardExpiry" id="creditCardExpiry" placeholder="MM/YY" pattern="\d{2}/\d{2}" title="Please enter a valid expiry date in MM/YY format">
                </div>
                <div class="form-group">
                    <label for="creditCardCVV">CVV:</label>
                    <input type="password" class="form-control" name="creditCardCVV" id="creditCardCVV" pattern="\d{3}" maxlength="3" title="Please enter a valid 3-digit CVV">
                </div>
            </div>
            <div id="debitCardFields" style="display:none;">
                <div class="form-group">
                    <label for="debitCardNumber">Debit Card Number:</label>
                    <input type="text" class="form-control" name="debitCardNumber" id="debitCardNumber" pattern="\d{16}" maxlength="16" title="Please enter a valid 16-digit debit card number">
                </div>
                <div class="form-group">
                    <label for="debitCardExpiry">Expiry Date:</label>
                    <input type="text" class="form-control" name="debitCardExpiry" id="debitCardExpiry" placeholder="MM/YY" pattern="\d{2}/\d{2}" title="Please enter a valid expiry date in MM/YY format">
                </div>
                <div class="form-group">
                    <label for="debitCardCVV">CVV:</label>
                    <input type="password" class="form-control" name="debitCardCVV" id="debitCardCVV" pattern="\d{3}" maxlength="3" title="Please enter a valid 3-digit CVV">
                </div>
            </div>
            <div class="form-group">
                <label for="amount">Amount:</label>
                <input type="text" class="form-control" name="amount" id="amount" value="${totalPrice}" readonly>
            </div>
            <input type="hidden" name="theatreId" value="${theatreId}">
            <input type="hidden" name="userId" value="${userId}">
            <input type="hidden" name="screenId" value="${screenId}">
            <input type="hidden" name="showId" value="${showId}">
            <c:forEach var="seatId" items="${seatId}">
                <input type="hidden" name="seatId" value="${seatId}">
            </c:forEach>
            <input type="hidden" name="showDate" value="${showDate}">
            <button type="submit" class="btn btn-primary mt-3">Make Payment</button>
        </form>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function showPaymentFields() {
            var paymentMethod = document.getElementById("paymentMethod").value;
            document.getElementById("creditCardFields").style.display = paymentMethod === "Credit Card" ? "block" : "none";
            document.getElementById("debitCardFields").style.display = paymentMethod === "Debit Card" ? "block" : "none";
        }
    </script>
</body>
</html>

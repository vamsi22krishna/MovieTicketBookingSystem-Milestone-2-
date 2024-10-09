<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Screen</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
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
    .btn-primary {
        margin-top: 20px;
        background-color: #6A9C89;
        border-color: #6A9C89;
    }
    .btn-primary:hover {
        background-color: #5e8a78;
        border-color: #5e8a78;
    }
    .error {
        color: red;
        font-size: 0.9em;
    }
</style>
<script>
    $(document).ready(function() {
        function validateName() {
            var name = $('#name').val();
            if (name.length <= 4) {
                $('#nameError').text('Screen name must be more than 4 characters.');
                return false;
            } else {
                $('#nameError').text('');
                return true;
            }
        }

        function validateTotalSeats() {
            var totalSeats = $('#totalSeats').val();
            if (totalSeats < 0) {
                $('#totalSeatsError').text('Total seats cannot be negative.');
                return false;
            } else {
                $('#totalSeatsError').text('');
                return true;
            }
        }

        $('#name').on('keyup', validateName);
        $('#totalSeats').on('keyup', validateTotalSeats);

        $('form').submit(function(event) {
            var isValid = validateName() & validateTotalSeats();
            if (!isValid) {
                event.preventDefault();
            }
        });
    });
</script>
</head>
<body>
<div class="container">
    <h2 class="text-center">Add Screen</h2>
    <form:form action="${pageContext.request.contextPath}/screens/add" method="post" modelAttribute="screen">
        <div class="form-group">
            <label for="name">Screen Name</label>
            <form:input path="name" class="form-control" id="name" maxlength="40" required="required"/>
            <i class="fa fa-film"></i>
            <div id="nameError" class="error"></div>
        </div>
        <div class="form-group">
            <label for="theatre">Select Theatre</label>
            <form:select path="theatre.theatreId" class="form-control" id="theatre" required="required">
                <form:options items="${theatres}" itemValue="theatreId" itemLabel="name"/>
            </form:select>
            <i class="fa fa-building"></i>
        </div>
        <div class="form-group">
            <label for="totalSeats">Total Seats</label>
            <form:input path="totalSeats" type="number" class="form-control" id="totalSeats" maxlength="2" required="required"/>
            <i class="fa fa-chair"></i>
            <div id="totalSeatsError" class="error"></div>
        </div>
        <button type="submit" class="btn btn-primary"><i class="fa fa-plus"></i> Add Screen</button>
    </form:form>
</div>
</body>
</html>

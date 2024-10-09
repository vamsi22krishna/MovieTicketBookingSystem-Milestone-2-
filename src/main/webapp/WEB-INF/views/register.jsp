<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>User Registration</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f4f4;
	margin: 200px 100px;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	max-width: 600px;
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

fieldset {
	border: thin solid #ccc;
	border-radius: 4px;
	padding: 20px;
	padding-left: 40px;
	background: #fbfbfb;
}

legend {
	color: #678;
}

.form-control {
	width: 95%;
}

label small {
	color: #678 !important;
}

span.req {
	color: maroon;
	font-size: 112%;
}

.form-group label {
	font-weight: bold;
}

.form-group input {
	border-radius: 5px;
}

.btn-success {
	background-color: #6A9C89;
	border-color: #6A9C89;
	transition: background-color 0.3s, transform 0.3s;
}

.btn-success:hover {
	background-color: #5a8a78;
	transform: scale(1.05);
}

.error-message {
	color: red;
	font-size: 0.875em;
}

.text-center {
	text-align: center;
}

.req {
	color: red;
}

.confirmMessage {
	font-size: 0.875em;
}

.container h5 {
	font-size: 0.9em;
	color: #555;
}

.valid {
	color: #66cc66;
}

.warning {
	color: #ff6666;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<h2 class="text-center">User Registration</h2>
				<!-- Display error message if it exists -->
				<c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
				</c:if>
				<form:form method="post"
					action="${pageContext.request.contextPath}/users/register"
					modelAttribute="user">
					<fieldset>
						<legend class="text-center">
							Valid information is required to register. <span class="req"><small>
									required *</small></span>
						</legend>

						<div class="form-group">
							<label for="phone"><span class="req">* </span> Phone
								Number: </label>
							<form:input path="phone" id="phone" class="form-control"
								maxlength="10" placeholder="not used for marketing"
								required="true" onkeyup="validatePhone(this);" />
							<small id="phoneError" style="color: red; display: none;">Phone
								number must start with 6, 7, 8, or 9.</small>
						</div>

						<div class="form-group">
							<label for="firstName"><span class="req">* </span> First
								Name: </label>
							<form:input path="firstName" class="form-control" id="firstName"
								maxlength="40" placeholder="First Name" required="true"
								onkeyup="validateName(this, 'firstname');" />
							<span id="errFirst" class="warning"></span>
						</div>

						<div class="form-group">
							<label for="lastName"><span class="req">* </span> Last
								Name: </label>
							<form:input path="lastName" class="form-control" id="lastName"
								maxlength="30" placeholder="Last Name" required="true"
								onkeyup="validatelastName(this, 'lastname');" />
							<span id="errLast" class="warning"></span>
						</div>

						<div class="form-group">
							<label for="email"><span class="req">* </span> Email
								Address: </label>
							<form:input path="email" class="form-control" id="email"
								placeholder="Email Address" required="true"
								onkeyup="email_validate(this.value);" />
							<span id="status" class="warning"></span>
						</div>

						<div class="form-group">
							<label for="username"><span class="req">* </span>
								Username: </label>
							<form:input path="username" class="form-control" id="username"
								maxlength="50" placeholder="Username" required="true"
								onkeyup="validateUsername(this);" />
							<span id="errUsername" class="warning"></span>
						</div>

						<div class="form-group">
							<label for="password"><span class="req">* </span>
								Password: </label>
							<form:password path="password" class="form-control" id="pass1"
								minlength="4" maxlength="16" required="true" />
						</div>

						<div class="form-group">
							<label for="passwordConfirm"><span class="req">* </span>
								Confirm Password: </label> <input type="password" class="form-control"
								id="pass2" minlength="4" maxlength="16" required="true"
								onkeyup="checkPass();" /> <span id="confirmMessage"
								class="confirmMessage"></span>
						</div>

						<div class="form-group">
							<input type="hidden" value="0" name="activate" />
							<div class="checkbox">
								<label> <input type="checkbox" required="true"
									name="terms" id="terms"> I agree with the <a
									href="terms.html"
									title="You may read our terms and conditions by clicking on this link">terms
										and conditions</a> for Registration. <span class="req">* </span>
								</label>
							</div>
						</div>

						<div class="form-group text-center">
							<input class="btn btn-success" type="submit" name="submit_reg"
								value="Register" />
						</div>
						<h5 class="text-center">You will receive an email to complete
							the registration and validation process.</h5>
						<h5 class="text-center">Be sure to check your spam folders.</h5>
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function checkPass() {
			var pass1 = document.getElementById('pass1');
			var pass2 = document.getElementById('pass2');
			var message = document.getElementById('confirmMessage');
			var goodColor = "#66cc66";
			var badColor = "#ff6666";
			if (pass1.value == pass2.value) {
				pass2.style.backgroundColor = goodColor;
				message.style.color = goodColor;
				message.innerHTML = "Passwords Match";
			} else {
				pass2.style.backgroundColor = badColor;
				message.style.color = badColor;
				message.innerHTML = "Passwords Do Not Match!";
			}
		}

		function validatePhone(input) {
			var maintainplus = '';
			var numval = input.value;
			if (numval.charAt(0) == '+') {
				maintainplus = '+';
			}
			var curphonevar = numval.replace(
					/[\\A-Za-z!"£$%^&\,*+_={};:'@#~,.Š\/<>?|`¬\]\[]/g, '');
			input.value = maintainplus + curphonevar;

			const phoneError = document.getElementById('phoneError');
			const validStart = /^[6-9]/;

			if (!validStart.test(curphonevar.charAt(0))) {
				phoneError.style.display = 'block';
			} else {
				phoneError.style.display = 'none';
			}
			input.focus();
		}

		function validateName(input, type) {
			var value = input.value;
			var errorElement = document
					.getElementById(type === 'firstname' ? 'errFirst'
							: 'errLast');
			if (value.length <= 3) {
				errorElement.textContent = "The " + type
						+ " must be more than 3 characters.";
			} else {
				errorElement.textContent = "";
			}
		}
		function validatelastName(input, type) {
			var value = input.value;
			var errorElement = document
					.getElementById(type === 'lastname' ? 'errLast' : 'errLast');
			if (value.length <= 1) {
				errorElement.textContent = "The " + type
						+ " must be more than 1 characters.";
			} else {
				errorElement.textContent = "";
			}
		}

		function validateUsername(input) {
			var value = input.value;
			var errorElement = document.getElementById('errUsername');
			var regUsername = /^[a-zA-Z0-9_]+$/;
			if (value.length < 4) {
				errorElement.textContent = "Username must be at least 4 characters long.";
			} else if (!regUsername.test(value)) {
				errorElement.textContent = "Username can only contain letters, numbers, and underscores.";
			} else {
				errorElement.textContent = "";
			}
		}

		function email_validate(email) {
			var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
			if (regMail.test(email) == false) {
				document.getElementById("status").innerHTML = "<span class='warning'>Email address is not valid yet.</span>";
			} else {
				document.getElementById("status").innerHTML = "<span class='valid'>Thanks, you have entered a valid Email address!</span>";
			}
		}

		function dob_validate(dob) {
			var regDOB = /^(\d{1,2})-\/-\/$/;
			if (regDOB.test(dob) == false) {
				document.getElementById("statusDOB").innerHTML = "<span class='warning'>DOB is only used to verify your age.</span>";
			} else {
				document.getElementById("statusDOB").innerHTML = "<span class='valid'>Thanks, you have entered a valid DOB!</span>";
			}
		}

		function add_validate(address) {
			var regAdd = /^(?=.*\d)[a-zA-Z\s\d\/]+$/;
			if (regAdd.test(address) == false) {
				document.getElementById("statusAdd").innerHTML = "<span class='warning'>Address is not valid yet.</span>";
			} else {
				document.getElementById("statusAdd").innerHTML = "<span class='valid'>Thanks, Address looks valid!</span>";
			}
		}
	</script>
</body>
</html>
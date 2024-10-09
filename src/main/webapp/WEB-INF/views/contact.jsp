<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial;
}

.container {
	max-width: 1180px;
	margin: 0 auto;
	line-height: 1.5;
}
/*  header style starts */
.site-banner {
	min-height: 400px;
	background-image:
		url('https://images.pexels.com/photos/7991579/pexels-photo-7991579.jpeg?cs=srgb&dl=pexels-tima-miroshnichenko-7991579.jpg&fm=jpg');
	background-size: cover;
	background-position: center;
	color: #ffffff;
}

.site-banner a {
	color: #ffffff;
	text-decoration: none;
	font-weight: bold;
	padding: 12px;
}

.header-menu {
	padding: 40px 20px;
}

#header-right-menu {
	float: right;
}

.header-active {
	background: rgba(0, 0, 0, 0.5);
	border-radius: 25px;
}

.heading {
	color: #ffffff;
	text-align: center;
	font-family: cursive;
	padding: 40px 0px;
	font-size: 3em;
	margin: 0px;
}
/*  header style ends */
.footer {
	display: flex;
}

.footer-column {
	width: 33.3%;
	float: left;
}

.map-image {
	width: 100%;
}

.contact-form-container {
	background-color: #eaeaea;
}

img {
	vertical-align: middle;
}

.tile-content {
	padding: 20px 40px;
}

.tile-content .contact-row {
	margin-bottom: 20px;
}

.tile-field {
	margin-left: 20px;
}

.form-field {
	width: 100%;
	padding: 10px 8px;
	border-radius: 4px;
	border: #d9d8d8 1px solid;
}

.button {
	color: #ffffff;
	padding: 10px 30px 10px 30px;
	border-radius: 20px;
	background: linear-gradient(to right, #08a9df, #12054a);
	border: 0px;
}

#menu-icon {
	display: none;
	float: right;
}

@media screen and (max-width: 1000px) {
	.footer-column {
		width: 50%;
	}
	.contact-form-container {
		width: 100%;
	}
	.footer {
		display: block;
	}
}

@media screen and (max-width: 540px) {
	#header-right-menu {
		float: none;
		display: none;
	}
	#header-right-menu a {
		display: block;
	}
	.heading {
		padding: 0px;
	}
	.tile-content {
		padding: 0px 20px;
	}
	.footer-column {
		width: 100%;
	}
	#menu-icon {
		display: block;
		float: right;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="site-banner">
			<div class="header-menu"></div>
			<h1 class="heading">Contact Us</h1>
		</div>
		<div class="footer">

			<div class="footer-column">
				<div class="tile-content">
					<h1>Meet Us</h1>
					<div class="contact-row">
						<img src="images/phone.svg"><span class="tile-field">9742789052</span>
					</div>
					<div class="contact-row">
						<img src="images/at-sign.svg"><span class="tile-field">Varun@cineConnect.com</span>
					</div>
					<div class="contact-row">
						<img src="images/map-pin.svg"><span class="tile-field">1784
							MaduraNagar Bangalore, </span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function toggleMenu() {
			var menuElement = document.getElementById("header-right-menu");
			if (menuElement.style.display === "block") {
				menuElement.style.display = "none";
			} else {
				menuElement.style.display = "block";
			}
		}
	</script>
</body>
</html>
</body>
</html>

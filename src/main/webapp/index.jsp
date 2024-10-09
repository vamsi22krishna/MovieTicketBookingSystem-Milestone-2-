<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Multiplex Booking System</title>
<link href="<c:url value='/resources/css/bootstrap.min.css' />"
	rel="stylesheet">
<script src="<c:url value='/resources/js/jquery-1.11.1.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.1/font/bootstrap-icons.min.css">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
	color: #333;
}

header {
	background-color: #6A9C89;
	color: #fff;
	padding: 15px 0;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

nav ul {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: center;
}

nav ul li {
	margin: 0 15px;
	position: relative;
}

nav ul li a {
	color: #fff;
	text-decoration: none;
	padding: 10px 15px;
	display: block;
	transition: background-color 0.3s, color 0.3s;
}

nav ul li a:hover, nav ul li a.active {
	background-color: #5a8a78;
	border-radius: 5px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #5a8a78;
	min-width: 160px;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	z-index: 1;
	border-radius: 5px;
}

.dropdown-content a {
	color: #fff;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	transition: background-color 0.3s;
}

.dropdown-content a:hover {
	background-color: #4e7a6b;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.banner {
	color: #fff;
	width: 1380px;
	height: 280px;
	text-align: center;
	padding: 150px 20px;
	box-shadow: inset 0 0 0 1000px rgba(0, 0, 0, 0.5);
	background-size: cover;
	background-position: center;
	transition: background-image 1s ease-in-out;
	background-image:
		url('https://images.unsplash.com/photo-1478720568477-152d9b164e26?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
}

.banner h1 {
	font-size: 3.5em;
	margin: 0;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.banner h2 {
	font-size: 1.8em;
	margin: 20px 0 0;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
}

.cta-button {
	display: inline-block;
	padding: 15px 30px;
	margin-top: 30px;
	background-color: #ff9800;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s, transform 0.3s;
}

.cta-button:hover {
	background-color: #f57c00;
	transform: scale(1.05);
}

.movie-carousel {
	display: flex;
	overflow-x: auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.movie-carousel img {
	width: 200px;
	height: 300px;
	margin-right: 15px;
	border-radius: 10px;
	transition: transform 0.3s;
}

.movie-carousel img:hover {
	transform: scale(1.1);
}

footer {
	background-color: #6A9C89;
	color: #fff;
	text-align: center;
	padding: 10px 0;
	position: fixed;
	width: 100%;
	bottom: 0;
	box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
}

footer a {
	color: #fff;
	text-decoration: none;
	margin: 0 10px;
}

footer a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<script>
        const images = [
            'https://plus.unsplash.com/premium_photo-1661429119721-044020f198a3?q=80&w=1971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            'https://images.unsplash.com/photo-1526041092449-209d556f7a32?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D,
            'https://plus.unsplash.com/premium_photo-1682089647302-f8c6f6c4a83f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        ];

        let currentIndex = 0;

        function changeBackground() {
            const banner = document.getElementById('banner');
            banner.style.backgroundImage = `url(${images[currentIndex]})`;
            currentIndex = (currentIndex + 1) % images.length;
        }

        setInterval(changeBackground, 5000); // Change image every 5 seconds

        // Initial call to set the first image
        changeBackground();
    </script>
	<header>
		<nav>
			<ul>
				<li><a href="#" class="title"><i class="bi bi-film"></i> <b>CineConnect</b></a></li>
				<li><a href="#" class="active"><i class="bi bi-house-door"></i>
						Home</a></li>
				<li class="dropdown"><a href="#" class="dropbtn"><i
						class="bi bi-ticket-perforated"></i> Features</a>
					<div class="dropdown-content">
						<a href="#feature1"><i class="bi bi-ticket-detailed"></i> Book
							Tickets</a> <a href="#feature4"><i class="bi bi-headset"></i>
							Customer Support</a>
					</div></li>
				<li class="dropdown"><a href="#" class="dropbtn"><i
						class="bi bi-info-circle"></i> How It Works</a>
					<div class="dropdown-content">
						<a href="#"><i class="bi bi-film"></i> New Movies</a>
						<!--  <a href="#step4"><i class="bi bi-graph-up"></i> Generate Reports</a> -->
					</div></li>
				<li><a href="#testimonials"><i
						class="bi bi-chat-left-quote"></i> Testimonials</a></li>
				<li><a href="#contact"><i class="bi bi-envelope"></i>
						Contact Us</a></li>
				<li><a href="users/register"><i class="bi bi-person-plus"></i>
						Register</a></li>
				<li><a href="users/login"><i
						class="bi bi-box-arrow-in-right"></i> Login</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<section class="banner" id="banner">
			<h1>CineConnect</h1>
			<h2>Unlock the world of cinema with CineConnect where every
				story begins with you</h2>
			<a href="users/login" class="cta-button">Book Now</a>
		</section>
	</main>
</body>
</html>

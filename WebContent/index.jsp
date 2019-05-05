<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Chat Home</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<style>
	.navbar{
	padding-top: 20px;
	padding-bottom: 20px;
	border: 0;
	border-radius: 0;
	margin-bottom: 0;
	font-size: 18px;
	letter-spacing: 3px;
	}
	.navbar-brand{
	font-size:50px;
	padding-right: 40px;
	}
	
	.navbar-nav li a:hover{
	color: #1abc9c !important;
	}
	.container-fluid-top{
	padding-top: 140px;
	padding-bottom: 140px;
	}
	.container-fluid{
	padding-top: 70px;
	padding-bottom: 70px;
	}
	
	.bg-1{
	background-color: #474e5d; /* Dark Blue */
	color: #ffffff;
	}
	.bg-2{
	background-color: #ffffff; /* White */
	color: #555555;
	}
	.bg-3{
	background-color: #2f2f2f;
	color: #ffffff;
	}
	.bg-3 a{
	color: white;
	font-size:20px;
	}
	.bg-3 a:hover{
	color: white;
	}
	</style>
</head>
<body>
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">C</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="#">About</a></li>
				<li><a href="#">Chat</a></li>
				<li><a href="#">Board</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">login</a></li>
			</ul>
		</div>
	</div>
</nav>

<div class="container-fluid-top bg-1 text-center">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
	</div>
</div>
<div class="container-fluid bg-2 text-center">
	<h3>Where To Find Me?</h3>
	<p>Lorem ipsum..</p>
</div>

<footer class="container-fluid bg-3 text-center">
	<p>Chat_App page Made By <a href="https://github.com/JongMinLee0">JongMin Lee</a></p>
</footer>

<script type="js/jquery-3.4.1.js"></script>
<script type="js/bootstrap.js"></script>
</body>
</html>

    
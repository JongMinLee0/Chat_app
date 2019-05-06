<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Chat Home</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/index.css"> 
	<style>
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


	<div id="carousel" class="carousel slide" data-ride="carousel" data-interval="4000"><!-- default 5000 -->
            <ol class="carousel-indicators">
                <li data-target="#carousel" data-slide-to="0" class="active"></li>
                <li data-target="#carousel" data-slide-to="1"></li>
                <li data-target="#carousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img src="img/img2.jpg" alt="Slide 2" style="width:100%">
                </div>
                <div class="item">
                    <img src="img/img1.jpg" alt="Slide 1" style="width:100%">
                </div>
                <div class="item">
                    <img src="img/img3.jpg" alt="Slide 3" style="width:100%">
                </div>
            </div>
            <a href="#carousel" class="left carousel-control" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a href="#carousel" class="right carousel-control" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
	

<div class="container-fluid bg-2 text-center">
	<h3>Chat site for Practice</h3>
	<p>Please understand if you have insufficient points.
	<span class="glyphicon glyphicon-sunglasses"></span></p>
</div>

<footer class="container-fluid bg-3 text-center">
	<p>Chat_App page Made By <a href="https://github.com/JongMinLee0" 
	data-toggle="tooltip" data-placement="top" title="GitHub!">JongMin Lee</a></p>
</footer>
<script>
$(function () {
	$('[data-toggle="tooltip"]').tooltip()
})
</script>
</body>
</html>

    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/index.css">
<script>

function checkLogin(){
	alert("로그인이 필요합니다!");
	document.location.href="login.jsp";
}
</script>
</head>
<body>
<!-- Session에 값이 있는지 확인한다 -->
<% 
String nick = (String)session.getAttribute("nick"); 
%>
<c:set var="nick" value="<%=nick%>"/>

<!-- 로그인이 된 경우 -->
<c:if test="${nick!=null}">
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">C</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="about.jsp">About</a></li>
				<li><a href="chat_box.jsp">Chat</a></li>
				<li><a href="board.jsp">Board</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout.jsp">logout</a></li>
			</ul>
		</div>
	</div>
</nav>
</c:if>
<!-- 로그인 하지 않은 경우 -->
<c:if test="${nick==null}">
<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">C</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="#" onclick="checkLogin();">About</a></li>
				<li><a href="#" onclick="checkLogin();">Chat</a></li>
				<li><a href="#" onclick="checkLogin();">Board</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp">login</a></li>
			</ul>
		</div>
	</div>
</nav>
</c:if>
</body>
</html>
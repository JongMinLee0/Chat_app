<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/index.css">
<style>
.login-wrapper{
padding-top: 170px;
padding-bottom: 170px;
padding-left: 40%;
padding-right: 40%
}
</style>
</head>
<body>
<jsp:include page="index_nav.jsp" flush="false"/>
<div class='login-wrapper'>
	<form name="loginInfo" method="post" action="HomeController" onsubmit="return checkValue()">
  <div class="login-group">
    <label for="inputEmail">Email address</label>
    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="login-group">
    <label for="InputPassword1">Password</label>
    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password">
  </div>
  <br />
  <input type="hidden" name="page" value="signin">
  <button type="submit" class="btn btn-primary">Sign in</button>
  <button type="submit" class="btn btn-primary" formaction="signup.jsp">Sign up</button>
</form>	
</div>
<jsp:include page="index_foot.jsp" flush="false"/>
</body>
</html>
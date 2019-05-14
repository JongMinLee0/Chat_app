<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/index.css">
<title>Sign Up</title>
<style>
.form-group{
padding-top: 30px;
padding-bottom: 30px;
padding-left: 35%;
padding-right: 35%
}
.form-wrapper{
padding-top: 100px;
padding-bottom: 100px;
}
</style>
</head>
<body>
<jsp:include page="index_nav.jsp" flush="false"/>

<div class='form-wrapper'>
	<div class="form-group">
    <label class="control-label col-sm-2" for="email">Email:</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="email" placeholder="Enter email">
      <small id="emailHelp" class="form-text text-muted">It automatically checks for duplication.</small><br />
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Password:</label>
    <div class="col-sm-10"> 
      <input type="password" class="form-control" id="pwd" placeholder="Enter password"><br />
    </div>
  </div>
   <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Password Confirm:</label>
    <div class="col-sm-10"> 
      <input type="password" class="form-control" id="pwd" placeholder="Enter password"><br />
    </div>
  </div>
   <div class="form-group">
    <label class="control-label col-sm-2" for="nick">Nick name:</label>
    <div class="col-sm-10"> 
      <input type="text" class="form-control" id="nick" placeholder="Enter nickname"><br />
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Submit</button>
    </div>
  </div>
</form>

</div>


<jsp:include page="index_foot.jsp" flush="false"/>
</body>
</html>
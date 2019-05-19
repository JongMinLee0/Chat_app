<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript">
	function checkValue(){
		inputForm = eval("document.loginInfo");
		if(!inputForm.email.value){
			alert("아이디를 입력하세요");
			inputForm.email.focus();
			return false;
		}
		if(!inputForm.pwd.value){
			alert("비밀번호를 입력하세요");
			inputForm.pwd.focus();
			return false;
		}
		if(!inputForm.nick.value){
			alert("닉네임을 입력하세요");
			inputForm.nick.focus();
			return false;
		}
		if(inputForm.pwd.value!=inputForm.pwdCheck.value){
			alert("비밀번호를 동일하게 입력하세요");
			inputForm.pwd.focus();
			return false;
		}
	}
</script>

<!-- email, nickname 중복확인 추가해야 함. 버튼을 추가해서 해야하는지 모르겠음
     email 중복의 경우 '이미 가입된 사용자 입니다.', nickname의 경우 'nickname은 이미 사용중 입니다.' -->
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>
<jsp:include page="index_nav.jsp" flush="false"/>

<form name = "loginInfo" method="post" action="HomeController" onsubmit="return checkValue()">
<div class='form-wrapper'>
	<div class="form-group">
    <label class="control-label col-sm-2" for="email">Email:</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
      <small id="emailHelp" class="form-text text-muted">It automatically checks for duplication.</small><br />
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Password:</label>
    <div class="col-sm-10"> 
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
      <small id="pwdHelp" class="form-text text-muted">Please write below 16 characters.</small><br />
    </div>
  </div>
   <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Password Confirm:</label>
    <div class="col-sm-10"> 
      <input type="password" class="form-control" id="pwdCheck" name="pwdCheck" placeholder="Enter password"><br />
    </div>
  </div>
   <div class="form-group">
    <label class="control-label col-sm-2" for="nick">Nick name:</label>
    <div class="col-sm-10"> 
      <input type="text" class="form-control" id="nick" name="nick" placeholder="Enter nickname"><br />
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <input type="hidden" name="page" value="signup">
      <button type="submit" class="btn btn-default">Submit</button>
      <button type="button" class="btn btn-default" onclick="location.href='index.jsp';">Cancel</button>
    </div>
  </div>
</div>
</form>
<jsp:include page="index_foot.jsp" flush="false"/>
<jsp:useBean id='member' class="chat.app.ex.model.MemberBean" scope="page"/>
<c:set var="result" value='<%=request.getAttribute("result")%>'/>
<c:choose>
    <c:when test='${result}=="sucess"'>
        <jsp:forward page="index.jsp"/>
    </c:when>
    <c:when test='${result}=="fail"'>
        <jsp:forward page="signup.jsp"/>
    </c:when>
</c:choose>


</body>
</html>
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
	<title>Write page</title>
	<style>
	.wrapper-write{
	width: 85%;
	padding-left: 30%;
	padding-top:60px;
	padding-bottom: 10px;
	}
	#contents{
	width:73%;
	}
	#title{
	height: 25;
	}
	</style>
<script type="text/javascript">
	function checkValue(){
		inputForm = eval("document.writeInfo");
		if(!inputForm.title.value){
			alert("제목을 입력하세요");
			inputForm.title.focus();
			return false;
		}
		if(!inputForm.content.value){
			alert("내용을 입력하세요");
			inputForm.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
<jsp:include page="index_nav.jsp" flush="false"/>


<div class="wrapper-write">
<form name = "writeInfo" method="post" action="HomeController" onsubmit="return checkValue()">
	<input type="text" name="title" size="80px" placeholder="제목을 입력하세요">
	<br /><br />
	<textarea id="contents" name="content" rows=20 placeholder="내용을 입력하세요"></textarea>
	<br />
	<input type="hidden" name="page" value="write"/>
	<button type="submit" class="btn btn-default">작성완료</button>
	<button type="button" class="btn btn-default" onclick="location.href='board.jsp';">취소</button>
</form>
</div>

<jsp:include page="index_foot.jsp" flush="false"/>
</body>
</html>
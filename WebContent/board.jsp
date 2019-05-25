<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Board</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/index.css">
<style type="text/css">
	.wrapper-table{
	width: 85%;
	padding-left: 15%;
	padding-top:20px;
	}
</style>
</head>
<body>
<jsp:include page="index_nav.jsp" flush="false"/>

<div class="wrapper-table">
<table class="table table-hover">
<thead>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>날짜</th>
	<th>조회수</th>
</tr>
</thead>
<tbody>
<c:forEach var="i" begin="0" end="9">
<tr>
	<td>1 </td>
	<td>테스트를 위한 행입니다. </td>
	<td>척</td>
	<td>2019.5.25 </td>
	<td>1 </td>
</tr>
</c:forEach>
</tbody>
</table>
<button type="button" class="btn btn-default pull-right" onclick="location.href='write.jsp';">글쓰기</button>
<div class = "text-center">
	<ul class="pagination">
	 <li><a href="#">1</a></li>
	 <li><a href="#">2</a></li>
	 <li><a href="#">3</a></li>
	 <li><a href="#">4</a></li>
	 <li><a href="#">5</a></li>
	</ul>
</div>
</div>





<jsp:include page="index_foot.jsp" flush="false"/>
</body>
</html>